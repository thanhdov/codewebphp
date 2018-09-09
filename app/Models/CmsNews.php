<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CmsNews extends Model
{
    public $table = 'cms_news';

    public function getItemsNews($limit = null, $opt = null)
    {
        $query = (new CmsNews)->where('status', 1)->orderBy('sort', 'desc')->orderBy('id', 'desc');
        if (!(int) $limit) {
            return $query->get();
        } else
        if ($opt == 'paginate') {
            return $query->paginate((int) $limit);
        } else {
            return $query->limit($limit)->get();
        }

    }
}
