<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ShopBrand;
use App\Models\ShopCategory;
use App\Models\ShopOption;
use App\Models\ShopOptionDetail;
use App\Models\ShopProduct;
use Encore\Admin\Controllers\ModelForm;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;

class ShopProductController extends Controller
{
    use ModelForm;
    public $arrType = ['0' => 'Mặc định', '1' => 'New', '2' => "Hot"];

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {
            $action = \Request::input('action');
            if ($action == 'report') {
                $content->header('Thống kê sản phẩm');
                $content->body($this->report());
            } else {
                $content->header('Quản lý sản phẩm');
                // $content->description('description');
                $content->body($this->grid());
            }

        });
    }

    /**
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header('Chỉnh sửa sản phẩm');
            // $content->description('description');

            $content->body($this->form($id)->edit($id));
        });
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header('Tạo sản phẩm mới');
            // $content->description('description');

            $content->body($this->form());
        });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(ShopProduct::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->name('Tên sản phẩm')->sortable();
            $grid->category('Chuyên mục')->display(function ($cate) {
                return $cate['name'];
            });
            $grid->image('Hình ảnh')->image();
            $grid->cost('Giá cost')->display(function ($price) {
                return number_format($price);
            });
            $grid->price('Giá bán')->display(function ($price) {
                return number_format($price);
            });
            $arrType = $this->arrType;
            $grid->type('Loại sản phẩm')->display(function ($type) use ($arrType) {
                $style = ($type == 1) ? 'class="label label-success"' : (($type == 2) ? '  class="label label-danger"' : 'class="label label-default"');
                return '<span ' . $style . '>' . $arrType[$type] . '</span>';
            });
            $grid->status('Hiển thị sản phẩm')->switch();
            $grid->created_at('Ngày tạo');
            // $grid->updated_at('Lần cuối chỉnh sửa');
            $grid->model()->orderBy('id', 'desc');
            $grid->disableExport();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form($id = null)
    {

        return Admin::form(ShopProduct::class, function (Form $form) use ($id) {
            $form->tab('Thông tin sản phẩm', function ($form) {

                $arrBrand = ShopBrand::pluck('name', 'id')->all();
                $arrBrand = ['0' => '-- Chọn nhãn hiệu --'] + $arrBrand;
                $form->text('name', 'Tên sản phẩm')->rules('required', [
                    'required' => 'Bạn chưa nhập tên sản phẩm']);
                $arrCate = (new ShopCategory)->listCate();
                $form->select('category_id', 'Danh mục')->options($arrCate)->rules('required', [
                    'required' => 'Bạn chưa chọn danh mục']
                );
                $form->multipleSelect('category_other', 'Thêm vào mục khác')->options($arrCate);
                // $form->image('image', 'Hình ảnh')->uniqueName()->move('product')->removable();
                // Remove image slide will remove image main
                //
                $form->image('image', 'Hình ảnh')->uniqueName()->move('product');
                $form->tags('keyword', 'Từ khóa');
                $form->textarea('description', 'Mô tả')->rules('max:300', ['max' => 'Tối đa 300 kí tự']);
                $form->ckeditor('content', 'Nội dung');
                $form->currency('price', 'Giá bán')->symbol('VND')->options(['digits' => 0]);
                $form->currency('cost', 'Giá cost')->symbol('VND')->options(['digits' => 0]);
                $form->number('stock', 'Số lượng');
                $form->text('sku', 'Mã hàng')->rules(function ($form) {
                    return 'required|unique:shop_product,sku,' . $form->model()->id . ',id';
                }, ['required' => 'Bạn chưa nhập mã hàng', 'unique' => 'Mã hàng này đã có rồi'])->placeholder('Ví dụ: ABKOOT01,ABKOOT02,...')->help('Mã sản phẩm là duy nhất. Viết liền, không dấu');
                $form->select('brand_id', 'Nhãn hiệu')->options($arrBrand)->default('0');

                $form->switch('status', 'Hiển thị sản phẩm');
                $form->number('sort', 'Sắp xếp');
                $form->divide();
                $form->radio('type', 'Loại sản phẩm')->options($this->arrType)->default('0');
                $form->datetime('date_available', 'Ngày bán')->help('Ngày cho khách mua. Mặc định cho phép mua từ ngày đăng bán');

                $form->hasMany('types', 'Phân loại sản phẩm', function (Form\NestedForm $form) {
                    $form->text('opt_name', 'Tên loại sản phẩm')->rules('required', [
                        'required' => 'Bạn chưa nhập tên loại sản phẩm']);
                    $form->text('opt_sku', 'Mã loại sản phẩm')->rules('required', [
                        'required' => 'Bạn chưa nhập mã hàng'])->help('Mã sản phẩm là duy nhất. Viết liền, không dấu');
                    $form->currency('opt_price', 'Giá bán')->symbol('VND')->options(['digits' => 0]);
                    $form->image('opt_image', 'Hình ảnh')->uniqueName()->move('product');
                });

            })->tab('Hình ảnh phụ', function ($form) {
                $form->hasMany('images', 'Hình ảnh phụ', function (Form\NestedForm $form) {
                    $form->image('image', 'Hình ảnh nhỏ')->uniqueName()->move('product_slide');
                });

            })->tab('Thuộc tính sản phẩm', function ($form) use ($id) {
                $options = ShopOption::pluck('name', 'id')->all();
                $html    = '';
                foreach ($options as $key => $value) {
                    ${'option_' . $key} = ShopOptionDetail::where('product_id', $id)->where('option_id', $key)->get();
                    $html .= '
                        <table class="table box  table-bordered table-responsive">
                            <thead>
                              <tr>
                                <th colspan="4">Thuộc tính về ' . $value . '</th>
                              </tr>
                            </thead>
                            <tbody>
                                      <tr>
                                        <td><span>Tên ' . $value . '</span></td>
                                        <td></td>
                                      </tr>';
                    if (count(${'option_' . $key}) == 0) {
                        $html .= '<tr id="no-item-' . $key . '">
                                <td colspan="4" align="center" style="color:#cc2a2a">Không có tùy chọn nào</td>
                              </tr>';
                    } else {

                        foreach (${'option_' . $key} as $key2 => $value2) {
                            $html .= '
                                      <tr>
                                        <td>
                                        <span><div class="input-group"><input  type="text" name="option[' . $key . '][name][]" value="' . $value2['name'] . '" class="form-control" placeholder="Tên thuộc tính"></div></span>
                                        </td>
                                        <td>
                                         <button onclick="removeItemForm(this);" class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal"  data-placement="top" rel="tooltip" data-original-title="" title="Remove item"><span class="glyphicon glyphicon-remove"></span>Xóa bỏ</button>
                                        </td>
                                      </tr>';
                        }
                    }

                    $html .= '
                               <tr id="addnew-' . $key . '">
                                <td colspan="8">  <button type="button" class="btn btn-sm btn-success"  onclick="morItem(' . $key . ');" rel="tooltip" data-original-title="" title="Add new item"><i class="fa fa-plus"></i> Thêm lựa chọn</button>
                        </td>
                              </tr>
                        <tr>
                        </tr>
                            </tbody>
                          </table>';
                }
                $script = <<<SCRIPT
<script>
                function morItem(id){
                        $("#no-item-"+id).remove();
                    $("tr#addnew-"+id).before("<tr><td><span><span class=\"input-group\"><input  type=\"text\" name=\"option["+id+"][name][]\" value=\"\" class=\"form-control\" placeholder=\"Tên thuộc tính\"></span></span></td><td><button onclick=\"removeItemForm(this);\" class=\"btn btn-danger btn-xs\" data-title=\"Delete\" data-toggle=\"modal\"  data-placement=\"top\" rel=\"tooltip\" data-original-title=\"\" title=\"Remove item\"><span class=\"glyphicon glyphicon-remove\"></span>Xóa bỏ</button></td></tr>");
                    }

                    function removeItemForm(elmnt){
                      elmnt.closest("tr").remove();
                    }

                </script>
SCRIPT;
                $form->html($html . $script);

            });

//saved
            $form->saved(function (Form $form) {
                $id              = $form->model()->id;
                $product         = ShopProduct::find($id);
                $file_path_admin = config('filesystems.disks.admin.root');
                try {
                    if (!file_exists($file_path_admin . '/thumb/' . $product->image)) {
                        \Image::make($file_path_admin . '/' . $product->image)->insert(public_path('watermark.png'), 'bottom-right', 10, 10)->save($file_path_admin . '/' . $product->image);
                        //thumbnail
                        $image_thumb = \Image::make($file_path_admin . '/' . $product->image);
                        $image_thumb->resize(200, null, function ($constraint) {
                            $constraint->aspectRatio();
                        });
                        $image_thumb->save($file_path_admin . '/thumb/' . $product->image);
                        //end thumb
                    }
                    if (count($product->images)) {
                        foreach ($product->images as $key => $image) {
                            if (!file_exists($file_path_admin . '/thumb/' . $image->image)) {
                                \Image::make($file_path_admin . '/' . $image->image)->insert(public_path('watermark.png'), 'bottom-right', 10, 10)->save($file_path_admin . '/' . $image->image);
                                //thumbnail
                                $image_thumb = \Image::make($file_path_admin . '/' . $image->image);
                                $image_thumb->resize(200, null, function ($constraint) {
                                    $constraint->aspectRatio();
                                });
                                $image_thumb->save($file_path_admin . '/thumb/' . $image->image);
                                //end thumb
                            }
                        }
                    }

                    if (count($product->types)) {
                        foreach ($product->types as $key => $image) {
                            if (!file_exists($file_path_admin . '/thumb/' . $image->opt_image)) {
                                \Image::make($file_path_admin . '/' . $image->opt_image)->insert(public_path('watermark.png'), 'bottom-right', 10, 10)->save($file_path_admin . '/' . $image->opt_image);
                                //thumbnail
                                $image_thumb = \Image::make($file_path_admin . '/' . $image->opt_image);
                                $image_thumb->resize(200, null, function ($constraint) {
                                    $constraint->aspectRatio();
                                });
                                $image_thumb->save($file_path_admin . '/thumb/' . $image->opt_image);
                                //end thumb
                            }
                        }
                    }

                } catch (\Exception $e) {
                    echo $e->getMessage();
                }

                ShopOptionDetail::where('product_id', $id)->delete();
                //$options = $form->option;
                // if (count($options) > 0) {
                //     foreach ($options as $opt_id => $option) {
                //         foreach ($option['name'] as $key => $value) {
                //             if ($value != '') {
                //                 ShopOptionDetail::insert(['name' => $value, 'add_price' => 0, 'option_id' => $opt_id, 'product_id' => $id]);
                //             }

                //         }
                //     }
                // }
            });

        });

    }

/**
 * Report product
 * @return [type] [description]
 */
    protected function report()
    {
        return Admin::grid(ShopProduct::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->sku('Mã hàng')->sortable();
            $grid->name('Tên sản phẩm')->sortable();
            $grid->category('Chuyên mục')->display(function ($cate) {
                return $cate['name'];
            });
            $grid->cost('Giá cost')->display(function ($price) {
                return number_format($price);
            })->sortable();
            $grid->price('Giá bán')->display(function ($price) {
                return number_format($price);
            })->sortable();
            $grid->stock('Tồn kho')->sortable();
            $grid->sold('Bán ra')->sortable();
            $arrType = $this->arrType;
            $grid->type('Loại sản phẩm')->display(function ($type) use ($arrType) {
                $style = ($type == 1) ? 'class="label label-success"' : (($type == 2) ? '  class="label label-danger"' : 'class="label label-default"');
                return '<span ' . $style . '>' . $arrType[$type] . '</span>';
            });
            $grid->status('Trạng thái')->display(function ($stt) {
                return ($stt) ? 'Actie' : 'Disabled';
            });
            $grid->model()->orderBy('id', 'desc');
            $grid->disableExport();
            $grid->disableCreateButton();
            $grid->disableRowSelector();
            $grid->disableActions();
        });
    }

    // public function show($id)
    // {
    //     return Admin::content(function (Content $content) use ($id) {

    //         $content->header('Post');
    //         $content->description('Detail');
    //         $content->body(Admin::show(ShopProduct::findOrFail($id)));
    //     });

    // }
    public function show($id)
    {
        return Admin::content(function (Content $content) use ($id) {
            $content->header('');
            $content->description('');
            $content->body(Admin::show(ShopProduct::findOrFail($id), function (Show $show) {
                $show->id('ID');
            }));
        });
    }
}
