<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CmsCategory extends Model
{
    public $timestamps = false;
    public $table      = 'cms_category';

    public function contents()
    {
        return $this->hasMany('App\Models\CmsContent', 'category_id', 'id');
    }

    public function listCate()
    {
        $list   = [];
        $result = $this->select('title', 'id', 'parent')
            ->where('parent', 0)
            ->get()
            ->toArray();
        foreach ($result as $value) {
            $list[$value['id']] = $value['title'];
            if ($this->checkChild($value['id']) > 0) {
                $this->listCateExceptRoot($value['id'], $list);
            }
        }
        return $list;
    }

    public function listCateExceptRoot($id, &$list, $st = '--')
    {
        $result = $this->select('title', 'id', 'parent')
            ->where('parent', $id)
            ->get()
            ->toArray();
        foreach ($result as $value) {
            $list[$value['id']] = $st . ' ' . $value['title'];
            $this->listCateExceptRoot($value['id'], $list, $st . '--');
        }

    }

    public function checkChild($id)
    {
        return $this->where('parent', $id)->count();
    }

    public function arrChild($id)
    {
        return $this->where('parent', $id)->pluck('id')->all();
    }

/**
 * Get category parent
 * @return [type]     [description]
 */
    public function getParent()
    {
        return $this->find($this->parent);

    }
/**
 * Get category child
 * @param  [type] $id [description]
 * @return [type]     [description]
 */
    public function getCateChild($id)
    {
        return $this->with('contens')->where('parent', $id)->get();
    }
/**
 * Get all products in category, include child category
 * @param  [type] $id    [description]
 * @param  [type] $limit [description]
 * @return [type]        [description]
 */
    public function getContentsToCategory($id, $limit = null, $opt = null)
    {
        $arrChild   = $this->arrChild($id);
        $arrChild[] = $id;
        $query      = (new CmsContent)->where('status', 1)->whereIn('category_id', $arrChild)->orderBy('sort', 'desc')->orderBy('id', 'desc');
        if (!(int) $limit) {
            return $query->get();
        } else
        if ($opt == 'paginate') {
            return $query->paginate((int) $limit);
        } else {
            return $query->limit($limit)->get();
        }

    }
/**
 * [getCategories description]
 * @param  [type] $parent [description]
 * @return [type]         [description]
 */
    public static function getCategories($parent)
    {
        return self::where('status', 1)->where('parent', $parent)->orderBy('id', 'desc')->orderBy('sort', 'desc')->get();
    }
}
