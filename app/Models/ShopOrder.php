<?php

namespace App\Models;

use App\Models\ShopProduct;
use Illuminate\Database\Eloquent\Model;

class ShopOrder extends Model
{
    protected $table = 'shop_order';
    public function details()
    {
        return $this->hasMany('App\Models\ShopOrderDetail', 'order_id', 'id');
    }
    public function orderTotal()
    {
        return $this->hasMany('App\Models\ShopOrderTotal', 'order_id', 'id');
    }

    public function customer()
    {
        return $this->belongsTo('App\User', 'user_id', 'id');
    }
    public function orderStatus()
    {
        return $this->hasOne('App\Models\ShopOrderStatus', 'status', 'id');
    }
    public function paymentStatus()
    {
        return $this->hasOne('App\Models\ShopPaymentStatus', 'payment_status', 'id');
    }
    public function history()
    {
        return $this->hasMany('App\Models\ShopOrderHistory', 'order_id', 'id');
    }
    protected static function boot()
    {
        parent::boot();
        // before delete() method call this
        static::deleting(function ($order) {
            foreach ($order->details as $key => $value) {
                $item = ShopProduct::find($value->product_id);
                if ($item) {
                    $item->stock = $item->stock + $value->qty; // Restore stock
                    $item->sold  = $item->sold - $value->qty; // Subtract sold
                    $item->save();
                }
            }
            $order->details()->delete();
            $order->orderTotal()->delete();
            $order->history()->delete();

        });
    }

/**
 * [updateInfo description]
 * Don't apply for fields discount, shiping, received, cause
 * @param  [type] $order_id  [description]
 * @param  [type] $arrFields [description]
 * @return [type]            [description]
 */
    public static function updateInfo($order_id, $arrFields)
    {
        return self::where('id', $order_id)->update($arrFields);
    }

}
