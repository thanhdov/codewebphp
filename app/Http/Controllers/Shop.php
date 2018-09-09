<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use App\Models\CmsNews;
use App\Models\CmsPage;
use App\Models\Config;
use App\Models\ShopBrand;
use App\Models\ShopCategory;
use App\Models\ShopOrder;
use App\Models\ShopOrderDetail;
use App\Models\ShopOrderHistory;
use App\Models\ShopOrderTotal;
use App\Models\ShopProduct;
use App\Models\ShopProductType;
use App\User;
// use Illuminate\Support\Facades\Request;
use Cart;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Promocodes;
use Session;
use View;

//use Illuminate\Http\Request;
class shop extends Controller
{
    ////
    public $banners;
    public $news;
    public $notice;
    //////
    public $brands;
    public $categories;
    public $configs;
    public $theme       = "247";
    public $theme_asset = "247";

    public function __construct()
    {
        $host = request()->getHost();
        config(['app.url' => 'http://' . $host]);
        //End demo multihost
        $this->banners = Banner::where('status', 1)->orderBy('sort', 'desc')->orderBy('id', 'desc')->get();
        $this->news    = (new CmsNews)->getItemsNews($limit = 8, $opt = 'paginate');
        $this->notice  = (new CmsPage)->where('uniquekey', 'notice')->where('status', 1)->first();
        //////

        $this->brands     = ShopBrand::getBrands();
        $this->categories = ShopCategory::getCategories(0);
        $this->configs    = Config::pluck('value', 'key')->all();
//Config for  SMTP
        config(['app.name' => $this->configs['site_title']]);
        config(['mail.driver' => ($this->configs['smtp_mode']) ? 'smtp' : 'sendmail']);
        config(['mail.host' => empty($this->configs['smtp_host']) ? env('MAIL_HOST', '') : $this->configs['smtp_host']]);
        config(['mail.port' => empty($this->configs['smtp_port']) ? env('MAIL_PORT', '') : $this->configs['smtp_port']]);
        config(['mail.encryption' => empty($this->configs['smtp_security']) ? env('MAIL_ENCRYPTION', '') : $this->configs['smtp_security']]);
        config(['mail.username' => empty($this->configs['smtp_user']) ? env('MAIL_USERNAME', '') : $this->configs['smtp_user']]);
        config(['mail.password' => empty($this->configs['smtp_password']) ? env('MAIL_PASSWORD', '') : $this->configs['smtp_password']]);
        config(['mail.from' =>
            ['address' => $this->configs['site_email'], 'name' => $this->configs['site_title']]]
        );
//
        View::share('categories', $this->categories);
        View::share('brands', $this->brands);
        View::share('banners', $this->banners);
        View::share('configs', $this->configs);
        View::share('theme_asset', $this->theme_asset);
        View::share('theme', $this->theme);
        View::share('products_hot', (new ShopProduct)->getProducts($type = 1, $limit = 4, $opt = 'random'));
        View::share('logo', Banner::where('status', 1)->where('type', 0)->orderBy('sort', 'desc')->orderBy('id', 'desc')->first());

    }
/**
 * [index description]
 * @return [type] [description]
 */
    public function index(Request $request)
    {
        $banner = ['0' => 'Logo', '1' => 'Banner lớn', '2' => 'Banner nhỏ', '3' => 'Banner khác'];
        return view($this->theme . '.shop_home',
            array(
                'title'         => $this->configs['site_title'],
                'title_h1'      => 'Sản phẩm mới',
                'description'   => $this->configs['site_description'],
                'keyword'       => $this->configs['site_keyword'],
                'banners_top'   => Banner::where('status', 1)->where('type', 1)->orderBy('sort', 'desc')->orderBy('id', 'desc')->get(),
                'banners_left'  => Banner::where('status', 1)->where('type', 2)->orderBy('sort', 'desc')->orderBy('id', 'desc')->first(),
                'banners_right' => Banner::where('status', 1)->where('type', 3)->orderBy('sort', 'desc')->orderBy('id', 'desc')->limit(2)->get(),
                'banners'       => Banner::where('status', 1)->orderBy('sort', 'desc')->orderBy('id', 'desc')->get(),
                'notice'        => $this->getPage('notice'),
                'products_new'  => (new ShopProduct)->getProducts($type = null, $limit = 20, $opt = null),
                'home_page'     => 1,
                'blogs'         => (new CmsNews)->getItemsNews($limit = 6),
            )
        );
    }

/**
 * [productToCategory description]
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
    public function productToCategory($name, $id)
    {
        $category = (new ShopCategory)->find($id);
        if ($category) {
            $products = $category->getProductsToCategory($id = $category->id, $limit = 20, $opt = 'paginate');
            return view($this->theme . '.shop_products',
                array(
                    'title_h1'     => $category->name,
                    'title'        => $category->name,
                    'description'  => $category->description,
                    'keyword'      => $this->configs['site_keyword'],
                    'categorySelf' => $category,
                    'products'     => $products,
                    'og_image'     => url('/') . '/documents/website/' . $category->image,
                )
            );
        } else {
            return view($this->theme . '.notfound',
                array(
                    'title'       => 'Not found',
                    'description' => '',
                    'keyword'     => $this->configs['site_keyword'],
                )
            );
        }

    }

/**
 * All products
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
    public function allProducts()
    {
        $products = ShopProduct::where('status', 1)
            ->orderBy('id', 'desc')->paginate(20);
        if ($products) {
            return view($this->theme . '.shop_products',
                array(
                    'title_h1'    => 'Sản phẩm -' . $this->configs['site_title'],
                    'title'       => 'Sản phẩm -' . $this->configs['site_title'],
                    'description' => $this->configs['site_description'],
                    'keyword'     => $this->configs['site_keyword'],
                    'products'    => $products,
                )
            );
        } else {
            return view($this->theme . '.notfound',
                array(
                    'title'       => 'Not found',
                    'description' => '',
                    'keyword'     => $this->configs['site_keyword'],
                )
            );
        }

    }

/**
 * [productDetail description]
 * @param  [type] $name [description]
 * @param  [type] $id   [description]
 * @return [type]       [description]
 */
    public function productDetail($name, $id)
    {
        $product = ShopProduct::find($id);
        if ($product && $product->status && ($this->configs['product_display_out_of_stock'] || $product->stock > 0)) {
            //Update last view
            $product->view += 1;
            $product->date_lastview = date('Y-m-d H:i:s');
            $product->save();
            $arrlastView      = empty(\Cookie::get('productsLastView')) ? array() : json_decode(\Cookie::get('productsLastView'), true);
            $arrlastView[$id] = date('Y-m-d H:i:s');
            arsort($arrlastView);
            \Cookie::queue('productsLastView', json_encode($arrlastView), (86400 * 30));
            //End last viewed

            //Check product available
            return view($this->theme . '.shop_product_detail',
                array(
                    'title_h1'           => $product->name,
                    'title'              => $product->name,
                    'description'        => $product->description,
                    'keyword'            => $this->configs['site_keyword'],
                    'product'            => $product,
                    'productsToCategory' => (new ShopCategory)->getProductsToCategory($id = $product->category_id, $limit = 8, $opt = 'random'),
                    'og_image'           => url('/') . '/documents/website/' . $product->image,
                )
            );
        } else {
            return view($this->theme . '.notfound',
                array(
                    'title'       => 'Not found',
                    'description' => '',
                    'keyword'     => $this->configs['site_keyword'],
                )
            );
        }

    }
    /**
     * [profile description]
     * @return [type] [description]
     */
    public function profile()
    {
        $id          = Auth::user()->id;
        $user        = User::find($id);
        $orders      = ShopOrder::with('orderTotal')->where('user_id', $id)->orderBy('id', 'desc')->get();
        $statusOrder = ['0' => 'Mới', '1' => 'Đang xử lý', '2' => 'Tạm giữ', '3' => 'Hủy bỏ', '4' => 'Hoàn thành'];
        return view($this->theme . '.shop_profile')->with(array(
            'title_h1'    => 'Trang khách hàng',
            'title'       => 'Trang khách hàng - ' . $this->configs['site_title'],
            'description' => '',
            'keyword'     => $this->configs['site_keyword'],
            'user'        => $user,
            'orders'      => $orders,
            'statusOrder' => $statusOrder,
        ));
    }

/**
 * Get list product follow brands
 * @param  int $id brand
 * @return view
 */
    public function product_brands($name, $id, $category = null)
    {
        $brand = ShopBrand::find($id);
        return view($this->theme . '.shop_products',
            array(
                'title'       => $brand->name,
                'description' => '',
                'page'        => 'products',
                'products'    => ShopProduct::where('status', 1)
                    ->orderBy('id', 'desc')->where('brand', $id)->paginate(9),
            )
        );
    }

    public function logout()
    {
        Auth::logout();
        return Redirect::away('login');
    }

/**
 * Remove item from cart
 * @author lanhktc
 */
    public function removeItem($id = null)
    {
        if ($id === null) {
            return redirect('gio-hang.html');
        }

        if (array_key_exists($id, Cart::content()->toArray())) {
            Cart::remove($id);
        }

        return redirect('gio-hang.html');
    }
/**
 * Remove item from cart
 * @author lanhktc
 */
    public function removeItemFromWl($id = null)
    {
        if ($id === null) {
            return redirect('wishlist.html');
        }

        if (array_key_exists($id, Cart::instance('wishlist')->content()->toArray())) {
            Cart::instance('wishlist')->remove($id);
        }

        return redirect('wishlist.html');
    }
/**
 * Store card
 * @author lanhktc
 * @return boolean
 */
    public function storecart(Request $request)
    {
        if (Cart::count() == 0) {
            return redirect('/');
        }
        if (!$this->configs['shop_allow_guest'] && !Auth::user()) {
            return redirect('login');
        }
        $messages = [
            'max'               => 'Chiều dài tối đa :max.',
            'toname.required'   => 'Bạn chưa nhập tên.',
            'address1.required' => 'Bạn chưa nhập địa chỉ nhà.',
            'address2.required' => 'Bạn chưa nhập quận huyện.',
            'phone.required'    => 'Bạn chưa nhập số điện thoại.',
            'phone.regex'       => 'Số điện thoại chưa đúng.',
        ];
        $v = Validator::make($request->all(), [
            'toname'   => 'required|max:100',
            'address1' => 'required|max:100',
            'address2' => 'required|max:100',
            'phone'    => 'required|regex:/^0[^0][0-9\-]{7,13}$/',
        ], $messages);
        if ($v->fails()) {
            return redirect()->back()->withInput()->withErrors($v->errors());
        }
        try {
            DB::connection('mysql')->beginTransaction();
            $objects                     = array();
            $objects[]                   = (new ShopOrderTotal)->getShipping(); //module shipping
            $objects[]                   = (new ShopOrderTotal)->getDiscount(); //module discount
            $objects[]                   = (new ShopOrderTotal)->getReceived(); //module reveived
            $dataTotal                   = ShopOrderTotal::processDataTotal($objects); //sumtotal and re-sort item total
            $subtotal                    = (new ShopOrderTotal)->sumValueTotal('subtotal', $dataTotal);
            $shipping                    = (new ShopOrderTotal)->sumValueTotal('shipping', $dataTotal); //sum shipping
            $discount                    = (new ShopOrderTotal)->sumValueTotal('discount', $dataTotal); //sum discount
            $received                    = (new ShopOrderTotal)->sumValueTotal('received', $dataTotal); //sum received
            $total                       = (new ShopOrderTotal)->sumValueTotal('total', $dataTotal);
            $arrOrder['user_id']         = empty(Auth::user()->id) ? 0 : Auth::user()->id;
            $arrOrder['subtotal']        = $subtotal;
            $arrOrder['shipping']        = $shipping;
            $arrOrder['discount']        = $discount;
            $arrOrder['received']        = $received;
            $arrOrder['payment_status']  = 0;
            $arrOrder['shipping_status'] = 0;
            $arrOrder['status']          = 0;
            $arrOrder['total']           = $total;
            $arrOrder['balance']         = $total + $received;
            $arrOrder['toname']          = $request->get('toname');
            $arrOrder['address1']        = $request->get('address1');
            $arrOrder['address2']        = $request->get('address2');
            $arrOrder['phone']           = $request->get('phone');
            $arrOrder['comment']         = $request->get('comment');
            $arrOrder['created_at']      = date('Y-m-d H:i:s');

            //Insert to Order
            $orderId = ShopOrder::insertGetId($arrOrder);
            //

            //Insert order total
            ShopOrderTotal::insertTotal($dataTotal, $orderId);
            //End order total

            foreach (Cart::content() as $value) {
                $product                  = ShopProduct::find($value->id);
                $arrDetail['order_id']    = $orderId;
                $arrDetail['product_id']  = $value->id;
                $arrDetail['name']        = $value->name;
                $arrDetail['price']       = $value->price;
                $arrDetail['qty']         = $value->qty;
                $arrDetail['type']        = $value->options->toJson();
                $arrDetail['sku']         = $product->sku;
                $arrDetail['total_price'] = $value->price * $value->qty;
                $arrDetail['created_at']  = date('Y-m-d H:i:s');
                ShopOrderDetail::insert($arrDetail);
                //If product out of stock
                if (!$this->configs['product_buy_out_of_stock'] && $product->stock < $value->qty) {
                    return redirect('/')->with('error', 'Mã hàng ' . $product->sku . ' vượt quá số lượng cho phép');
                } //
                $product->stock -= $value->qty;
                $product->sold += $value->qty;
                $product->save();

            }

            Cart::destroy(); // destroy cart

            if (!empty(session('coupon'))) {
                Promocodes::apply(session('coupon'), $uID = null, $msg = 'Order #' . $orderId); // apply coupon
                $request->session()->forget('coupon'); //destroy coupon
            }

            //Add history
            $dataHistory = [
                'order_id' => $orderId,
                'content'  => 'New order',
                'user_id'  => empty(Auth::user()->id) ? 0 : Auth::user()->id,
                'add_date' => date('Y-m-d H:i:s'),
            ];
            ShopOrderHistory::insert($dataHistory);

            DB::connection('mysql')->commit();

            //Send email
            try {
                $data = ShopOrder::with('details')->find($orderId)->toArray();
                Mail::send('vendor.mail.order_new', $data, function ($message) use ($orderId) {
                    $message->to($this->configs['site_email'], $this->configs['site_title']);
                    $message->replyTo($this->configs['site_email'], $this->configs['site_title']);
                    $message->subject('[#' . $orderId . '] Đơn hàng mới!');
                });
            } catch (\Exception $e) {
                //
            } //

            return redirect('gio-hang.html')->with('message', 'ĐƠN HÀNG THÀNH CÔNG');
        } catch (\Exception $e) {
            DB::connection('mysql')->rollBack();
            echo 'Caught exception: ', $e->getMessage(), "\n";

        }

    }

/**
 * [addToCart description]
 * @param Request $request [description]
 */
    public function addToCart(Request $request)
    {
        if (!$request->ajax()) {
            return redirect('/gio-hang.html');
        }
        $instance = empty($request->get('instance')) ? 'default' : $request->get('instance');
        $id       = $request->get('id');
        $product  = ShopProduct::find($id);
        if ($instance == 'default') {
            //Cart
            //Condition:
            //1. Instock
            //2. Active
            //3. Date availabe
            if ($product->status != 0 and ($this->configs['product_preorder'] == 1 || $product->date_available == null || date('Y-m-d H:i:s') >= $product->date_available) and ($this->configs['product_buy_out_of_stock'] || $product->stock)) {
                Cart::add(
                    array(
                        'id'    => $id,
                        'name'  => $product->name,
                        'qty'   => 1,
                        'price' => $product->getPrice($id),

                    )
                );
            }

            $htmlCart = '';
            $cart     = Cart::content();
            foreach ($cart as $key => $item) {
                $product = ShopProduct::find($item->id);
                $htmlCart .= '<li class="item odd"> <a href="' . url('san-pham/' . ktc_str_convert($item->name) . '_' . $item->id . '.html') . '" title="' . $item->name . '" class="product-image"><img src="' . asset('documents/website/thumb/' . $product->image) . '" alt="' . $item->name . '" width="65"></a>
                              <div class="product-details"> <a href="' . url("removeItem/$item->rowId") . '" title="Xóa" class="remove-cart"><i class="pe-7s-trash"></i></a>
                                <p class="product-name"><a href="' . url('san-pham/' . ktc_str_convert($item->name) . '_' . $item->id . '.html') . '">' . $item->name . '</a> </p>
                                <strong>' . $item->qty . '</strong> x <span class="price">' . number_format($item->price) . '</span> </div>
                            </li>';
            }

        } else {
            //Wishlist or Compare...
            ${'arrID' . $instance} = array_keys(Cart::instance($instance)->content()->groupBy('id')->toArray());
            if (!in_array($id, ${'arrID' . $instance})) {
                Cart::instance($instance)->add(
                    array(
                        'id'    => $id,
                        'name'  => $product->name,
                        'qty'   => 1,
                        'price' => $product->getPrice($id),
                    )
                );
            } else {
                return response()->json(
                    [
                        'flg'   => 0,
                        'error' => 'Sản phẩm đã có sẵn trong ' . $instance,
                    ]
                );
            }
            $htmlCart = '';
        }

        return response()->json(
            [
                'flg'        => 1,
                'subtotal'   => number_format(Cart::instance($instance)->subtotal()),
                'count_cart' => Cart::instance($instance)->count(),
                'htmlCart'   => $htmlCart,
                'instance'   => $instance,
            ]
        );

    }

/**
 * [addToCart description]
 * @param Request $request [description]
 */
    public function updateToCart(Request $request)
    {
        if (!$request->ajax()) {
            return redirect('/gio-hang.html');
        }
        $id      = $request->get('id');
        $rowId   = $request->get('rowId');
        $product = ShopProduct::find($id);
        $new_qty = $request->get('new_qty');
        if ($product->stock < $new_qty && !$this->configs['product_buy_out_of_stock']) {
            return response()->json(
                ['flg' => 0,
                    'msg'  => 'Vượt quá số lượng cho phép.',
                ]);
        } else {
            Cart::update($rowId, ($new_qty) ? $new_qty : 0);
            return response()->json(
                ['flg' => 1,
                ]);
        }

    }
/**
 * [cart description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function cart(Request $request)
    {
//===update/ add new item to cart
        if ($request->isMethod('post')) {
            $product_id = $request->get('product_id');
            $opt_sku    = empty($request->get('opt_sku')) ? null : $request->get('opt_sku');
            $qty        = $request->get('qty');
            $product    = ShopProduct::find($product_id);
            //Condition:
            //In of stock
            //Active
            //Date availabe
            if ($product->status != 0 and ($this->configs['product_preorder'] == 1 || $product->date_available == null || date('Y-m-d H:i:s') >= $product->date_available) && ($this->configs['product_display_out_of_stock'] || $product->stock > 0)) {
                $options = array();
                if ($opt_sku != $product->sku && $opt_sku) {
                    $options[] = $opt_sku;
                }
                Cart::add(
                    array(
                        'id'      => $product_id,
                        'name'    => $product->name,
                        'qty'     => $qty,
                        'price'   => (new ShopProduct)->getPrice($product_id, $opt_sku),
                        'options' => $options,
                    )
                );
            }

        }
//====================================================
        $objects   = array();
        $objects[] = (new ShopOrderTotal)->getShipping();
        $objects[] = (new ShopOrderTotal)->getDiscount();
        $objects[] = (new ShopOrderTotal)->getReceived();
        if (!empty(session('coupon'))) {
            $hasCoupon = true;
        } else {
            $hasCoupon = false;
        }
        return view($this->theme . '.shop_cart',
            array(

                'title_h1'    => 'Giỏ hàng',
                'title'       => 'Giỏ hàng' . ' - ' . $this->configs['site_title'],
                'description' => '',
                'keyword'     => '',
                'cart'        => Cart::content(),
                'dataTotal'   => ShopOrderTotal::processDataTotal($objects),
                'hasCoupon'   => $hasCoupon,
            )
        );
    }
/**
 * [cart description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function wishlist(Request $request)
    {

        $wishlist = Cart::instance('wishlist')->content();
        return view($this->theme . '.shop_wishlist',
            array(

                'title_h1'    => 'Danh sách wishlist',
                'title'       => 'Danh sách wishlist',
                'description' => '',
                'keyword'     => '',
                'wishlist'    => $wishlist,
            )
        );
    }
/**
 * [product_type description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function product_type(Request $request)
    {
        $data         = $request->all();
        $product_type = ShopProductType::where('opt_sku', $data['sku'])->first();
        if ($product_type) {
            $response = array('error' => 0, 'name' => $product_type->opt_name, 'price' => $product_type->opt_price, 'sku' => $product_type->opt_sku, 'image' => $product_type->opt_image);
        } else {
            $response = array('error' => 1, 'msg' => 'Not found');
        }
        return response()->json(
            $response
        );
    }

/**
 * [clear_cart description]
 * @return [type] [description]
 */
    public function clear_cart()
    {
        Cart::destroy();
        return redirect('/gio-hang.html');
    }

/**
 * [usePromotion description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function usePromotion(Request $request)
    {
        if ($this->configs['promotion_mode'] != 1) {
            return false;
        }
        $html   = '';
        $code   = $request->get('code');
        $action = $request->get('action');
        if ($action === 'remove') {
            $request->session()->forget('coupon'); //destroy coupon
            $objects   = array();
            $objects[] = (new ShopOrderTotal)->getShipping();
            $objects[] = (new ShopOrderTotal)->getDiscount();
            $objects[] = (new ShopOrderTotal)->getReceived();
            $dataTotal = ShopOrderTotal::processDataTotal($objects);
            foreach ($dataTotal as $key => $element) {
                if ($element['value'] != 0) {
                    $html .= "<tr class='showTotal'>
                         <th>" . $element['title'] . "</th>
                        <td style='text-align: right' id='" . $element['code'] . "'>" . number_format($element['value']) . " VNĐ</td>
                    </tr>";
                }

            }
            return json_encode(['html' => $html]);
        }

        $check = json_decode(Promocodes::check($code), true);
        if ($check['error'] == 1) {
            $error = 1;
            if ($check['msg'] == 'error_code_not_exist') {
                $msg = "Mã giảm giá không hợp lệ!";
            } elseif ($check['msg'] == 'error_code_cant_use') {
                $msg = "Mã vượt quá số lần sử dụng!";
            } elseif ($check['msg'] == 'error_code_expired_disabled') {
                $msg = "Mã hết hạn sử dụng!";
            } elseif ($check['msg'] == 'error_user_used') {
                $msg = "Bạn đã dùng mã này rồi!";
            } else {
                $msg = "Lỗi không xác định!";
            }

        } else {
            $content = $check['content'];
            if ($content['type'] === 1) {
                $error = 1;
                $msg   = "Bạn không thể dụng mã Point trực tiếp!";
            } else {
                $arrType = [
                    '0' => 'VNĐ',
                    '1' => 'Point',
                    '2' => '%',
                ];
                $error = 0;
                $msg   = "Mã giảm giá có giá trị " . number_format($content['reward']) . $arrType[$content['type']] . " cho đơn hàng này.";
                $request->session()->put('coupon', $code);

                $objects   = array();
                $objects[] = (new ShopOrderTotal)->getShipping();
                $objects[] = (new ShopOrderTotal)->getDiscount();
                $objects[] = (new ShopOrderTotal)->getReceived();
                $dataTotal = ShopOrderTotal::processDataTotal($objects);
                foreach ($dataTotal as $key => $element) {
                    if ($element['value'] != 0) {
                        if ($element['code'] == 'total') {
                            $html .= "<tr class='showTotal'  style='background:#f5f3f3;font-weight: bold;'>";
                        } else {
                            $html .= "<tr class='showTotal'>";
                        }

                        $html .= "<th>" . $element['title'] . "</th>
                        <td style='text-align: right' id='" . $element['code'] . "'>" . number_format($element['value']) . " VNĐ</td>
                    </tr>";
                    }

                }
            }

        }
        return json_encode(['error' => $error, 'msg' => $msg, 'html' => $html]);

    }

/**
 * [search description]
 * @param  Request $request [description]
 * @return [type]           [description]
 */
    public function search(Request $request)
    {
        $keyword = $request->get('keyword');
        return view($this->theme . '.shop_products',
            array(
                'title'         => 'Tìm kiếm: ' . $keyword,
                'title_h1'      => 'Kết quả từ khóa: <span style="color:red;font-style:italic">' . $keyword . '</span>',
                'description'   => '',
                'keyword'       => $this->configs['site_keyword'],
                'products'      => ShopProduct::resultSearch($keyword),
                'products_left' => (new ShopProduct)->getProducts($type = null, $limit = 2, $opt = 'random'),
            ));
    }

    //=======================CMS================================================================
    /**
     * [pages description]
     * @param  [type] $key [description]
     * @return [type]      [description]
     */
    public function pages($key = null)
    {

        $page = $this->getPage($key);
        if ($page) {
            return view($this->theme . '.cms_page',
                array(
                    'title'         => $page->title,
                    'title_h1'      => $page->title,
                    'description'   => '',
                    'keyword'       => $this->configs['site_keyword'],
                    'page'          => $page,
                    'products_left' => (new ShopProduct)->getProducts($type = null, $limit = 2, $opt = 'random'),

                ));
        } else {
            return view($this->theme . '.notfound',
                array(
                    'title'       => 'Không tìm thấy dữ liệu',
                    'description' => '',
                    'keyword'     => $this->configs['site_keyword'],

                )
            );
        }

    }
/**
 * [login description]
 * @return [type] [description]
 */
    public function login()
    {
        if (Auth::user()) {
            return Redirect::away('/');
        }
        return view($this->theme . '.shop_login',
            array(
                'title'       => 'Trang đăng nhập',
                'title_h1'    => '',
                'description' => '',
                'keyword'     => $this->configs['site_keyword'],
            )
        );
    }

/**
 * [login description]
 * @return [type] [description]
 */
    public function forgot()
    {
        if (Auth::user()) {
            return Redirect::away('/');
        }
        return view($this->theme . '.shop_forgot',
            array(
                'title'       => 'Quên mật khẩu',
                'title_h1'    => '',
                'description' => '',
                'keyword'     => $this->configs['site_keyword'],
            )
        );
    }

/**
 * [getPage description]
 * @param  [type] $key [description]
 * @return [type]      [description]
 */
    public function getPage($key = null)
    {
        $key = ($key == null || $key == '') ? 'trang-chu' : $key;
        return CmsPage::where('uniquekey', $key)->where('status', 1)->first();
    }

    public function updatePromotion($code, $action = "apply")
    {

    }

/**
 * [login description]
 * @return [type] [description]
 */
    public function getContact()
    {
        $page = $this->getPage('lien-he');
        return view($this->theme . '.shop_contact',
            array(
                'title'       => 'Liên hệ',
                'title_h1'    => '',
                'description' => '',
                'page'        => $page,
                'keyword'     => $this->configs['site_keyword'],
                'og_image'    => url('/') . 'logo.png',
            )
        );
    }

    public function postContact(Request $request)
    {
        $validator = $request->validate([
            'name'    => 'required',
            'title'   => 'required',
            'content' => 'required',
            'email'   => 'required|email',
            'phone'   => 'required|regex:/^0[^0][0-9\-]{7,13}$/',
        ], [
            'name.required'    => 'Bạn chưa nhập tên',
            'content.required' => 'Bạn chưa nhập nội dung',
            'title.required'   => 'Bạn chưa nhập tiêu đề',
            'email.required'   => 'Bạn chưa nhập email',
            'email.email'      => 'Email chưa đúng định dạng',
            'phone.required'   => 'Bạn chưa nhập số điện thoại',
            'phone.regex'      => 'Số điện thoại chưa đúng',
        ]);
        //Send email
        try {
            $data            = $request->all();
            $data['content'] = str_replace("\n", "<br>", $data['content']);
            Mail::send('vendor.mail.contact', $data, function ($message) use ($data) {
                $message->to($this->configs['site_email'], $this->configs['site_title']);
                $message->replyTo($data['email'], $data['name']);
                $message->subject($data['title']);
            });
            return redirect('lien-he.html')->with('message', 'Cảm ơn bạn. Chúng tôi sẽ liên hệ sớm nhất có thể!');

        } catch (\Exception $e) {
            echo $e->getMessage();
        } //

        // dd($data);
    }

    public function news()
    {
        return view($this->theme . '.cms_news',
            array(
                'title'       => 'Blog Alo Chip',
                'description' => $this->configs['site_description'],
                'keyword'     => $this->configs['site_keyword'],
                'news'        => $this->news,
                'og_image'    => url('/') . '/logo.png',
            )
        );
    }

    public function news_detail($name, $id)
    {
        $news_currently = CmsNews::find($id);
        if ($news_currently) {
            $title = ($news_currently) ? $news_currently->title : 'Không tìm thấy dữ liệu';
            return view($this->theme . '.cms_news_detail',
                array(
                    'title'          => $title,
                    'news_currently' => $news_currently,
                    'description'    => $this->configs['site_description'],
                    'keyword'        => $this->configs['site_keyword'],
                    'blogs'          => (new CmsNews)->getItemsNews($limit = 4),
                    'og_image'       => url('/') . '/documents/website/' . $news_currently->image,
                )
            );
        } else {
            return view($this->theme . '.notfound',
                array(
                    'title'       => 'Không tìm thấy dữ liệu',
                    'description' => '',
                    'keyword'     => $this->configs['site_keyword'],
                )
            );
        }

    }

}
