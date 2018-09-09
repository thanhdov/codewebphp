<?php

namespace App\Models;

use App\Models\ShopOrder;
use App\Models\ShopShipping;
use Cart;
use Illuminate\Database\Eloquent\Model;
use Promocodes;
use Session;

class ShopOrderTotal extends Model
{
    public $table = 'shop_order_total';

/**
 * Calculator value item total
 * Re-sort item tottal
 * @param  [array] $objects  [description]
 * @param  [int] $subtotal [description]
 * @return [array]           [description]
 */
    public static function processDataTotal($objects = null, $subtotal = null)
    {
        $subtotal = ($subtotal == null) ? Cart::subtotal() : $subtotal;
        $objects  = is_array($objects) ? $objects : [];
        //Set subtotal
        $objects[] = [
            'title' => 'Tổng tiền hàng',
            'code'  => 'subtotal',
            'value' => $subtotal,
            'sort'  => 1,
        ];
        // set total
        $total = 0;
        foreach ($objects as $key => $value) {
            if ($value['code'] != 'received') {
                $total += $value['value'];
            }
        }
        $arrayTotal = array(
            'title' => 'Tổng tiền cần thanh toán',
            'code'  => 'total',
            'value' => $total,
            'sort'  => 100,
        );

        $objects[] = $arrayTotal;

        //re-sort item total
        usort($objects, function ($a, $b) {
            return $a['sort'] > $b['sort'];
        });
        return $objects;
    }

/**
 * Insert item order total
 * @param  [type] $data     [description]
 * @param  [type] $order_id [description]
 * @return [type]           [description]
 */
    public static function insertTotal($data, $order_id)
    {
        for ($i = 0; $i < count($data); $i++) {
            $data[$i]['order_id']   = $order_id;
            $data[$i]['created_at'] = date('Y-m-d H:i:s');
        }
        return self::insert($data);
    }

/**
 * [updateField description]
 * @param  [type] $field [description]
 * @return [type]        [description]
 */
    public static function updateField($field)
    {
        //Udate field
        $upField = self::find($field['id']);
        // $upField->title      = $field['title'];
        $upField->value      = $field['value'];
        $upField->updated_at = date('Y-m-d H:i:s');
        $upField->save();
        $order_id = $upField->order_id;

        //Sum value item order total
        $totalData = self::where('order_id', $order_id)->get();
        $total     = $discount     = $shipping     = $received     = 0;
        foreach ($totalData as $key => $value) {
            if ($value['code'] === 'subtotal') {
                $total += $value['value'];
            }
            if ($value['code'] === 'discount') {
                $discount += $value['value'];
                $total += $value['value'];
            }
            if ($value['code'] === 'shipping') {
                $shipping += $value['value'];
                $total += $value['value'];
            }
            if ($value['code'] === 'received') {
                $received += $value['value'];
            }
        }

        //Update total
        $updateTotal        = self::where('order_id', $order_id)->where('code', 'total')->first();
        $updateTotal->value = $total;
        $updateTotal->save();

        //Update Order
        $order           = ShopOrder::find($order_id);
        $order->discount = $discount;
        $order->shipping = $shipping;
        $order->received = $received;
        $order->balance  = $total + $received;
        $order->total    = $total;
        $order->save();

        return $order_id;
    }

    /**
     * Get sum value in order total
     * @param  string $code      [description]
     * @param  arra $dataTotal [description]
     * @return int            [description]
     */
    public function sumValueTotal($code, $dataTotal)
    {
        $keys  = array_keys(array_column($dataTotal, 'code'), $code);
        $value = 0;
        foreach ($keys as $key => $object) {
            $value += $dataTotal[$object]['value'];
        }
        return $value;
    }

    public function getShipping()
    {
        $subtotal = Cart::subtotal();
        $shipping = ShopShipping::find(1);
        if ($subtotal >= $shipping->free || $shipping->status == 0) {
            $arrShipping = [
                'title' => 'Phí giao hàng',
                'code'  => 'shipping',
                'value' => 0,
                'sort'  => 10,
            ];
        } else {
            $arrShipping = [
                'title' => 'Phí giao hàng',
                'code'  => 'shipping',
                'value' => $shipping->value,
                'sort'  => 10,
            ];
        }
        return $arrShipping;
    }

    public function getDiscount()
    {
        $coupon = session('coupon');
        $check  = json_decode(Promocodes::check($coupon), true);
        if (empty($coupon) || $check['error'] == 1) {
            $arrDiscount = array(
                'title' => 'Giảm giá',
                'code'  => 'discount',
                'value' => 0,
                'sort'  => 20,
            );
        } else {
            $arrType = [
                '0' => 'VNĐ',
                '1' => 'Point',
                '2' => '%',
            ];
            $subtotal    = Cart::subtotal();
            $value       = ($check['content']['type'] == '2') ? floor($subtotal * $check['content']['reward'] / 100) : $check['content']['reward'];
            $arrDiscount = array(
                'title' => 'Giảm tối đa ' . number_format($check['content']['reward']) . $arrType[$check['content']['type']] . ' (<b>Code:</b> ' . $coupon . ')',
                'code'  => 'discount',
                'value' => ($value > $subtotal) ? -$subtotal : -$value,
                'sort'  => 20,
            );
        }
        return $arrDiscount;
    }

    public function getReceived()
    {
        return array(
            'title' => 'Đã thanh toán',
            'code'  => 'received',
            'value' => 0,
            'sort'  => 200,
        );
    }

/**
 * Get item order total, then re-sort
 * @param  [int] $order_id [description]
 * @return [array]           [description]
 */
    public static function getTotal($order_id)
    {
        $objects = self::where('order_id', $order_id)->get()->toArray();
        usort($objects, function ($a, $b) {
            return $a['sort'] > $b['sort'];
        });
        return $objects;
    }

/**
 * [updateSubTotal description]
 * @param  [type] $order_id [description]
 * @param  [type] $subtotal_value    [description]
 * @return [type]           [description]
 */
    public static function updateSubTotal($order_id, $subtotal_value)
    {

        try {
            $order           = ShopOrder::find($order_id);
            $order->subtotal = $subtotal_value;
            $total           = $subtotal_value + $order->discount + $order->shipping;
            $balance         = $total + $order->received;
            $payment_status  = 0;
            if ($balance == $total) {
                $payment_status = 0; //Chưa thanh toán
            } elseif ($balance < 0) {
                $payment_status = 3; //Khách hàng còn dư tiền
            } elseif ($balance == 0) {
                $payment_status = 2; //Đã thanh toán xong
            } else {
                $payment_status = 1; //Đã thanh toán 1 phần
            }
            $order->payment_status = $payment_status;
            $order->total          = $total;
            $order->balance        = $balance;
            $order->save();

            //Update total
            $updateTotal        = self::where('order_id', $order_id)->where('code', 'total')->first();
            $updateTotal->value = $total;
            $updateTotal->save();
            //Update Subtotal
            $updateSubTotal        = self::where('order_id', $order_id)->where('code', 'subtotal')->first();
            $updateSubTotal->value = $subtotal_value;
            $updateSubTotal->save();

            return 1;
        } catch (\Exception $e) {
            return $e->getMessage();
        }

    }

}
