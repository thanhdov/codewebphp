<?php

namespace App\Models;

use App\Models\Config;
use App\Models\ShopProduct;
use Illuminate\Database\Eloquent\Model;

class ShopCategory extends Model
{
    public $timestamps = false;
    public $table      = 'shop_category';
    public function products()
    {
        return $this->hasMany('App\Models\ShopProduct', 'category_id', 'id');
    }

    public function listCate()
    {
        $list   = [];
        $result = $this->select('name', 'id', 'parent')
            ->where('parent', 0)
            ->get()
            ->toArray();
        foreach ($result as $value) {
            $list[$value['id']] = $value['name'];
            if ($this->getChildrens($value['id'])->count() > 0) {
                $this->listCateExceptRoot($value['id'], $list);
            }
        }
        return $list;
    }

    public function listCateExceptRoot($id, &$list, $st = '--')
    {
        $result = $this->select('name', 'id', 'parent')
            ->where('parent', $id)
            ->get()
            ->toArray();
        foreach ($result as $value) {
            $list[$value['id']] = $st . ' ' . $value['name'];
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
        return $this->with('products')->where('parent', $id)->get();
    }
/**
 * Get all products in category, include child category
 * @param  [type] $id    [description]
 * @param  [type] $limit [description]
 * @return [type]        [description]
 */
    public function getProductsToCategory($id, $limit = null, $opt = null)
    {
        $arrChild   = $this->arrChild($id);
        $arrChild[] = $id;
        $query      = (new ShopProduct)->where('status', 1)->whereIn('category_id', $arrChild)
            ->orWhereRaw('category_other like "' . $id . ',%" or category_other like "%,' . $id . '" or category_other like "%,' . $id . ',%"')
            ->orderBy('sort', 'desc')->orderBy('id', 'desc');
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
        return self::where('status', 1)->where('parent', $parent)->orderBy('sort', 'desc')->orderBy('id', 'desc')->get();
    }

/**
 * Get category child
 * @param  [type] $id [description]
 * @return [type]     [description]
 */
    public function getChildrens($id)
    {
        return $this->with('products')->where('parent', $id)->get();
    }

}
