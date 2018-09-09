<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopProductLastView extends Model
{
    const UPDATED_AT      = null;
    protected $primaryKey = null;
    public $incrementing  = false;
    protected $fillable   = ['user_id', 'product_id', 'created_at'];
    public $table         = 'shop_product_recent_view';
    public function getLastView($uId)
    {
        return $this->where('user_id', $uId)->pluck('created_at', 'product_id');
    }
}
