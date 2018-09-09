<?php

namespace App\Models;

use App\Models\Config;
use App\Models\ShopOption;
use App\Models\ShopOptionDetail;
use App\Models\ShopProductType;
use App\Models\ShopSpecialPrice;
use Illuminate\Database\Eloquent\Model;

class ShopProduct extends Model
{
    public $table = 'shop_product';

    public function brand()
    {
        return $this->belongsTo('App\Models\ShopBrand', 'brand_id', 'id');
    }

    public function category()
    {
        return $this->belongsTo('App\Models\ShopCategory', 'category_id', 'id');
    }

    public function images()
    {
        return $this->hasMany('App\Models\ShopImage', 'product_id', 'id');
    }
    public function likes()
    {
        return $this->hasMany('App\Models\ShopProductLike', 'product_id', 'id');
    }
    public function options()
    {
        return $this->hasMany('App\Models\ShopOptionDetail', 'product_id', 'id');
    }
    public function types()
    {
        return $this->hasMany(ShopProductType::class, 'product_id', 'id');
    }
    public function special_price()
    {
        return $this->hasMany('App\Models\ShopSpecialPrice', 'product_id', 'id');
    }
/**
 * [getPrice description]
 * @param  [type] $id      [description]
 * @param  [type] $opt_sku [description]
 * @return [type]          [description]
 */
    public function getPrice($id = null, $opt_sku = null)
    {
        $id = ($id == null) ? $this->id : $id;
//Process product type
        /*
        if product have type, will use price of type
         */
        if ($opt_sku) {
            return ShopProductType::where('product_id', $id)->where('opt_sku', $opt_sku)->first()->opt_price;
        }
//End type

        $special = (new ShopSpecialPrice)
            ->where('product_id', $id)
            ->where('status', 1)
            ->where(function ($query) {
                $query->where('date_end', '>=', date("Y-m-d"))
                    ->orWhereNull('date_end');
            })
            ->where(function ($query) {
                $query->where('date_start', '<=', date("Y-m-d"))
                    ->orWhereNull('date_start');
            })
            ->first();
        if ($special) {
            return $special->price;
        } else {
            return $this->find($id)->price;
        }
    }

    /**
     * [showPrice description]
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function getListPrice($id = null)
    {
        $id      = ($id == null) ? $this->id : $id;
        $special = (new ShopSpecialPrice)
            ->where('product_id', $id)
            ->where('status', 1)
            ->where(function ($query) {
                $query->where('date_end', '>=', date("Y-m-d"))
                    ->orWhereNull('date_end');
            })
            ->where(function ($query) {
                $query->where('date_start', '<=', date("Y-m-d"))
                    ->orWhereNull('date_start');
            })
            ->first();
        $arrPrice = array();
        if ($special) {
            //Show price origin
            if ((int) Config::select('value')->where('key', 'product_display_special')->first()->value == 1) {
                $arrPrice[] = number_format($special->price);
                $arrPrice[] = number_format($this->find($id)->price);
            } else {
                return '<span itemprop="price" class="price_sale">' . number_format($special->price) . ' VNĐ</span>';
            }

        } else {
            $arrPrice[] = number_format($this->find($id)->price);
        }
        return $arrPrice;
    }

    /**
     * [showPrice description]
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function showPrice($id = null)
    {
        $id      = ($id == null) ? $this->id : $id;
        $special = (new ShopSpecialPrice)
            ->where('product_id', $id)
            ->where('status', 1)
            ->where(function ($query) {
                $query->where('date_end', '>=', date("Y-m-d"))
                    ->orWhereNull('date_end');
            })
            ->where(function ($query) {
                $query->where('date_start', '<=', date("Y-m-d"))
                    ->orWhereNull('date_start');
            })
            ->first();
        if ($special) {
            //Show price origin
            if ((int) Config::select('value')->where('key', 'product_display_special')->first()->value == 1) {
                return '<span itemprop="price" class="price_sale">' . number_format($special->price) . ' VNĐ</span><span class="price_origin">' . number_format($this->find($id)->price) . ' VNĐ</span>';
            } else {
                return '<span itemprop="price" class="price_sale">' . number_format($special->price) . ' VNĐ</span>';
            }

        } else {
            if ($this->getPrice($id)) {
                return '<span itemprop="price" class="price_sale">' . number_format($this->find($id)->price) . ' VNĐ</span>';
            } else {
                return '<span class="contact_Price">Vui lòng liên hệ</span>';
            }

        }
    }
    /**
     * [getProducts description]
     * @param  [type] $type  [description]
     * @param  [type] $limit [description]
     * @param  [type] $opt   [description]
     * @return [type]        [description]
     */
    public function getProducts($type = null, $limit = null, $opt = null)
    {
        $query = ShopProduct::where('status', 1);
        if ($type) {
            $query = $query->where('type', $type);
        }

        //Hidden product out of stock
        if ((int) Config::select('value')->where('key', 'product_display_out_of_stock')->first()->value == 0) {
            $query = $query->where('stock', '>', 0);
        }

        if (!(int) $limit) {
            return $query->get();
        } else
        if ($opt == 'paginate') {
            return $query->paginate((int) $limit);
        } else
        if ($opt == 'random') {
            return $query->inRandomOrder()->limit($limit)->get();
        } else {
            return $query->orderBy('id', 'desc')->limit($limit)->get();
        }
    }

    public static function resultSearch($keyword)
    {
        return self::where('status', 1)
            ->where(function ($sql) use ($keyword) {
                $sql->where('name', 'like', '%' . $keyword . '%')
                    ->orWhere('sku', 'like', '%' . $keyword . '%');
            })
            ->orderBy('id', 'desc')
            ->paginate(12);
    }

    public function getProductsSpecial($limit = null, $random = true)
    {

        $special = (new ShopSpecialPrice)
            ->where('status', 1)
            ->where(function ($query) {
                $query->where('date_end', '>=', date("Y-m-d"))
                    ->orWhereNull('date_end');
            })
            ->where(function ($query) {
                $query->where('date_start', '<=', date("Y-m-d"))
                    ->orWhereNull('date_start');
            })
        ;
        if ($random) {
            $special = $special->inRandomOrder();
        }
        if ($limit) {
            $special = $special->limit($limit);
        }
        return $special->get();
    }

    public function addLike($pId, $uId)
    {
        $check = $this->checkCanLike($pId, $uId);
        if ($check === 2) {
            return $this->likes()->insert(['product_id' => $pId, 'users_id' => $uId]);
        } else {
            return false;
        }
    }

    public function checkCanLike($pId, $uId)
    {
        if (empty($pId) || empty($uId)) {
            return 0; // no exist
        } else {
            $check = $this->likes()->where('product_id', $pId)->where('users_id', $uId)->first();
            if ($check) {
                return 1; // liked
            } else {
                return 2; // can like
            }
        }

    }

    protected static function boot()
    {
        parent::boot();
        // before delete() method call this
        static::deleting(function ($product) {
            $product->options()->delete();
            $product->likes()->delete();
            $product->types()->delete();
        });
    }

/**
 * Get value field category_order same array
 * @param  [type] $category_other [description]
 * @return [type]                 [description]
 */
    public function getCategoryOtherAttribute($category_other)
    {
        if (is_string($category_other)) {
            return explode(',', $category_other);
        } else {
            return $category_other;
        }

    }

/**
 * Set value for field category_order
 * @param [type] $category_other [description]
 */
    public function setCategoryOtherAttribute($category_other)
    {
        if (is_array($category_other)) {
            $this->attributes['category_other'] = implode(',', $category_other);
        }

    }

/**
 * Get option of product from table option_detail
 * @return [type] [description]
 */
    public function getOptions()
    {
        $optionsType = ShopOption::where('status', 1)->pluck('name', 'id');
        $arrOptions  = array();
        foreach ($optionsType as $key => $value) {
            $check = ShopOptionDetail::where('option_id', $key)->where('product_id', $this->id)->pluck('name');
            if (count($check)) {
                $arrOptions[$value] = $check;
            }

        }
        return $arrOptions;

    }

}
