<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopImage extends Model
{
    public $timestamps  = false;
    public $table       = 'shop_image';
    protected $fillable = ['id', 'image', 'product_id', 'status'];
    public function product()
    {
        return $this->belongsTo('App\Models\ShopProduct', 'product_id', 'id');
    }
}
