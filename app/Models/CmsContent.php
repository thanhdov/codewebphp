<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CmsContent extends Model
{
    public $table = 'cms_conten';
    public function category()
    {
        return $this->belongsTo('App\Models\CmsCategory', 'category_id', 'id');
    }

    public function images()
    {
        return $this->hasMany('App\Models\CmsImage', 'content_id', 'id');
    }
}
