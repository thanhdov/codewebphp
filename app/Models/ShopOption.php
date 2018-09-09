<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShopOption extends Model
{
    public $timestamps = false;
    public $table      = 'shop_option';
    public function details()
    {
        return $this->hasMany('App\Models\ShopOptionDetail', 'option_id', 'id');
    }
}
