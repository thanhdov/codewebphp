<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ShopOption;
use Encore\Admin\Controllers\ModelForm;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class ShopOptionController extends Controller
{
    use ModelForm;

    /**
     * Index interface.
     *
     * @return Content
     */
    public $arrType = ['1' => 'Radio', '2' => 'Select', '3' => 'Text'];
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('header');
            $content->description('description');

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

            $content->header('Chỉnh sửa thuộc tính');
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

            $content->header('Thêm mới thuộc tính');
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
        return Admin::grid(ShopOption::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->name('Tên thuộc tính')->sortable();
            $grid->status('Hoạt động')->switch();

        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(ShopOption::class, function (Form $form) {
            $form->text('name', 'Loại thuộc tính')->help('Ví dụ: Màu sắc, Size...');
            $form->switch('status', 'Hoạt động');
            $form->number('sort', 'Sắp xếp');
            $form->select('type', 'Cách hiển thị')->options($this->arrType)->default('1');
        });
    }

    public function show($id)
    {
        return Admin::content(function (Content $content) use ($id) {
            $content->header('');
            $content->description('');
            $content->body(Admin::show(ShopOption::findOrFail($id), function (Show $show) {
                $show->id('ID');
            }));
        });
    }
}
