<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Config;
use Encore\Admin\Controllers\ModelForm;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;

class ConfigInfoController extends Controller
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

            $content->header('Thông tin cấu hình');
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
    // public function edit($id)
    // {
    //     return Admin::content(function (Content $content) use ($id) {

    //         $content->header('header');
    //         $content->description('description');

    //         $content->body($this->form()->edit($id));
    //     });
    // }

    /**
     * Create interface.
     *
     * @return Content
     */
    // public function create()
    // {
    //     return Admin::content(function (Content $content) {

    //         $content->header('header');
    //         $content->description('description');

    //         $content->body($this->form());
    //     });
    // }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(Config::class, function (Grid $grid) {

            $grid->id('Thứ tự')->sortable();
            $grid->detail('Thông tin')->sortable();
            $grid->value('Value')->editable('textarea');
            $grid->model()->where('code', 'info');
            $grid->disableCreation();
            $grid->disableExport();
            $grid->disableRowSelector();
            $grid->disableFilter();
            $grid->disableActions();
            $grid->model()->orderBy('sort', 'asc');

        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(Config::class, function (Form $form) {

            $form->display('id', 'ID');
            $form->text('code', 'Code');
            $form->text('key', 'Key');
            $form->text('value', 'Value');

        });
    }
}
