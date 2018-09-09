<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Promocodes\Models\Promocode;
use Encore\Admin\Controllers\ModelForm;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class ShopPromotionController extends Controller
{
    use ModelForm;

    /**
     * Index interface.
     *
     * @return Content
     */
    public $arrType = [
        '0' => 'VNĐ',
        '1' => 'Point',
        '2' => '%',
    ];
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('Quản lý Promotion');
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

            $content->header('Chỉnh sửa');
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

            $content->header('Tạo mới');
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
        return Admin::grid(Promocode::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->code('Coupon code');
            $grid->reward('Giá trị')->display(function ($reward) {
                return number_format($reward);
            });
            $arrType = $this->arrType;
            $grid->type('Loại')->display(function ($type) use ($arrType) {
                if ($type == 0) {
                    return "<span class='label label-success'>$arrType[$type]</span>";
                } elseif ($type == 1) {
                    return "<span class='label label-warning'>$arrType[$type]</span>";
                } elseif ($type == 2) {
                    return "<span class='label label-info'>$arrType[$type]</span>";
                }

            });
            $grid->data('Mô tả');
            $grid->number_uses('Được dùng');
            $grid->used('Đã dùng');
            $grid->users('History')->expand(function () {
                $dataPromo = Promocode::find($this->id);
                $html      = '<br>';
                foreach ($dataPromo->users as $key => $value) {
                    $html .= '<span style="padding-left:20px;"><i class="fa fa-angle-double-right"></i> Khách hàng ID' . $value->pivot->user_id . ' dùng lúc ' . $value->pivot->used_at . '.  Nội dung: ' . $value->pivot->log . '</span><br>';
                }
                return $html . "<br>";
            }, 'Lịch sử sử dụng');
            $grid->status('Bật/tắt')->switch();
            $grid->expires_at('Ngày hết hạn');
            $grid->disableExport();
            // $grid->disableActions();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(Promocode::class, function (Form $form) {
            $form->text('code', 'Mã coupon')->rules(function ($form) {
                return 'required|unique:promocodes,code,' . $form->model()->id . ',id';
            }, ['required' => 'Bạn chưa nhập mã coupon', 'unique' => 'Mã coupon này đã có rồi'])->placeholder('Ví dụ: SAVEOFF2018,SAVE50,...')->help('Mã coupon là duy nhất. Viết liền, không dấu');

            $form->number('reward', 'Giá trị');
            $form->select('type', 'Loại')->options($this->arrType);
            $form->text('data', 'Mô tả');
            $form->number('number_uses', 'Số lần sử dụng')->default(1);
            $form->datetime('expires_at', 'Ngày hết hạn');
            // $form->number('used', 'Đã sử dụng');
            $form->switch('status', 'Trạng thái');
        });
    }

    public function show($id)
    {
        return Admin::content(function (Content $content) use ($id) {
            $content->header('');
            $content->description('');
            $content->body(Admin::show(Promocode::findOrFail($id), function (Show $show) {
                $show->id('ID');
            }));
        });
    }
}
