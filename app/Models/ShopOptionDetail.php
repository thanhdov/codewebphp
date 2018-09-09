<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopOptionDetail extends Model
{
    public $timestamps  = false;
    public $table       = 'shop_option_detail';
    protected $fillable = ['id', 'name', 'option_id', 'product_id', 'add_price', 'status', 'sort'];
    public function option()
    {
        return $this->belongsTo('App\Models\ShopOption', 'option_id', 'id');
    }
    public function product()
    {
        return $this->belongsTo('App\Models\ShopProduct', 'product_id', 'id');
    }

}
