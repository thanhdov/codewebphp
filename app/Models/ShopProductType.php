<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopProductType extends Model
{
    public $table       = 'shop_product_type';
    protected $fillable = ['opt_name', 'product_id', 'opt_price', 'opt_sku', 'opt_image'];
    public $timestamps  = false;
    public function product()
    {
        return $this->belongsTo('App\Models\ShopProduct', 'product_id', 'id');
    }

}
