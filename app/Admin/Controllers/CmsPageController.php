<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\CmsPage;
use Encore\Admin\Controllers\ModelForm;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class CmsPageController extends Controller
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

            $content->header('Quản lý trang');
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

            $content->header('Chỉnh sửa trang');
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

            $content->header('Tạo trang mới');
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
        return Admin::grid(CmsPage::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->title('Tiêu đề trang')->sortable();
            $grid->status('Trạng thái')->switch();
            $grid->actions(function ($actions) {
                $actions->disableDelete();
                // $actions->disableEdit();
            });
            $grid->disableFilter();
            $grid->disableExport();
            $grid->disableCreation();
            $grid->disableRowSelector();
            // $grid->tools(function ($tools) {
            //     $tools->batch(function ($batch) {
            //         $batch->disableDelete();
            //     });
            // });
            $grid->model()->orderBy('id', 'desc');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(CmsPage::class, function (Form $form) {
            $form->display('title', 'Tiêu đề trang')->rules('required', ['required' => 'Bạn chưa nhập tên']);
            $form->ckeditor('content', 'Nội dung');
            $form->switch('status', 'Trạng thái');
            $form->divide('Hỗ trợ SEO');
            $form->html('<b>Hỗ trợ SEO</b>');
            $form->tags('keyword', 'Từ khóa');
            $form->textarea('description', 'Mô tả')->rules('max:300', ['max' => 'Tối đa 300 kí tự']);
        });
    }
    public function show($id)
    {
        return Admin::content(function (Content $content) use ($id) {
            $content->header('');
            $content->description('');
            $content->body(Admin::show(CmsPage::findOrFail($id), function (Show $show) {
                $show->id('ID');
            }));
        });
    }

}
