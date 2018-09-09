<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ShopProduct;
use App\Models\ShopSpecialPrice;
use Encore\Admin\Controllers\ModelForm;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class ShopSpecialPriceController extends Controller
{
    use ModelForm;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('Quản lý giá khuyến mãi');
            // $content->description('description');

            $content->body($this->grid());
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

            $content->header('Sửa giá khuyến mãi');
            // $content->description('description');

            $content->body($this->form()->edit($id));
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

            $content->header('Tạo giá khuyến mãi');
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
        return Admin::grid(ShopSpecialPrice::class, function (Grid $grid) {

            $grid->id('Thứ tự')->sortable();
            $grid->product('Sản phẩm')->display(function ($product) {
                return $product['name'] . " - Mã: <b>" . $product['sku'] . "</b>";
            });
            $grid->price('Giá khuyến mãi')->display(function ($price) {
                return number_format($price) . ' VNĐ';
            });
            $grid->date_start('Ngày bắt đầu')->display(function ($date) {
                return ($date) ? $date : '<span style="color:red">Chưa chọn</span>';
            })->sortable();
            $grid->date_end('Ngày kết thúc')->display(function ($date) {
                return ($date) ? $date : '<span style="color:red">Chưa chọn</span>';
            })->sortable();
            $grid->comment('Ghi chú');
            $grid->status('Trạng thái')->switch();
            $grid->created_at('Ngày tạo');
            $grid->updated_at('Ngày cuối cập nhật');
            $grid->model()->orderBy('id', 'desc');
            $grid->disableExport();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        Admin::script($this->jsProcess());
        return Admin::form(ShopSpecialPrice::class, function (Form $form) {
            $products = ShopProduct::pluck('name', 'id')->all();
            $form->select('product_id', 'Sản phẩm')->options($products)->rules(function ($form) {
                return 'required|unique:shop_special_price,product_id,' . $form->model()->id . ',id';
            }, ['required' => 'Bạn chưa chọn sản phẩm', 'unique' => 'Sản phẩm này đã có rồi']);

            $form->html('
        <div class="input-group">
        <span class="input-group-addon">VNĐ</span><input disabled style="width: 120px; text-align: right;" type="text" id="price-old"  value="0" class="form-control price">
        </div>', 'Giá gốc');

            $form->currency('off', 'Giá khuyến mãi')->symbol('%')->options(['digits' => 0])->default(0);
            $form->currency('price', 'Giá khuyến mãi')->symbol('VND')->options(['digits' => 0])->default(0);
            $form->switch('status', 'Trạng thái');
            $form->datetime('date_start', 'Ngày bắt đầu');
            $form->datetime('date_end', 'Ngày kết thúc');
            $form->textarea('comment', 'Ghi chú');
            // $form->display('created_at', 'Created At');
            // $form->display('updated_at', 'Updated At');
        });
    }

    public function jsProcess()
    {
        $urlgetInfoProduct = route('getInfoProduct');
        return <<<JS
        $(document).ready(function(){
            var id = $('select[name*="product_id"]').val();
            $.ajax({
                url : '$urlgetInfoProduct',
                type : "get",
                datatype : "json",
                dateType:"application/json; charset=utf-8",
                data : {
                     id : id
                },
                success: function(result){
                    console.log(result);
                    var returnedData = JSON.parse(result);
                    $('#price-old').val(returnedData.price);
                }
            });
        });

        $('[name*="product_id"]').change(function(){
            var id = $(this).val();
                $.ajax({
                    url : '$urlgetInfoProduct',
                    type : "get",
                    datatype : "json",
                    dateType:"application/json; charset=utf-8",
                    data : {
                         id : id
                    },
                    success: function(result){
                        var returnedData = JSON.parse(result);
                        $('#price-old').val(returnedData.price);
                        var newPrice = returnedData.price * (100 - parseInt($('#off').val())) /100;
                        $('#price').val(newPrice);
                    }
                });
        });

    $('#off').change(function(){
    var newPrice = $('#price-old').val().replace(',','') * (100 - parseInt($('#off').val())) /100;
    $('#price').val(newPrice);
    });


  function formatNumber (num) {
      return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
  }


JS;
    }

    public function getInfoProduct(Request $request)
    {
        $id = $request->input('id');
        return ShopProduct::find($id)->toJson();

    }

    public function show($id)
    {
        return Admin::content(function (Content $content) use ($id) {
            $content->header('');
            $content->description('');
            $content->body(Admin::show(ShopSpecialPrice::findOrFail($id), function (Show $show) {
                $show->id('ID');
            }));
        });
    }

}
