<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CmsImage extends Model
{
    public $timestamps  = false;
    public $table       = 'cms_image';
    protected $fillable = ['id', 'image', 'content_id', 'status'];
    public function content()
    {
        return $this->belongsTo('App\Models\CmsContent', 'content_id', 'id');
    }
}
