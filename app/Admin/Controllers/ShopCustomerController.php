<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\ExcelExpoter;
use App\Http\Controllers\Controller;
use App\User;
use Encore\Admin\Controllers\ModelForm;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class ShopCustomerController extends Controller
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

            // $content->description('description');
            $action = \Request::input('action');
            if ($action == 'report') {
                $content->header('Thống kê khách hàng');
                $content->body($this->report());
            } else {
                $content->header('Danh sách khách hàng');
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
        return Admin::grid(User::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->email('Email')->sortable();
            $grid->name('Name')->sortable();

            $grid->created_at('Ngày tạo');
            $grid->updated_at('Lần cuối chỉnh sửa');
            $grid->model()->orderBy('id', 'desc');
            $grid->exporter(new ExcelExpoter('dataCustomer', 'Danh sach khach hang'));
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(User::class, function (Form $form) {

            $form->display('id', 'ID');
            $form->text('name', 'Tên');
            $form->email('email', 'Email');
            $form->password('password', 'Password');
            $form->text('address1', 'Address 1');
            $form->text('address2', 'Address 2');
            $form->text('phone', 'Phone');
            $form->saving(function (Form $form) {
                if ($form->password) {
                    $form->password = bcrypt($form->password);
                } else {
                    $form->password = $form->model()->password;
                }
            });
        });
    }

/**
 * Report product
 * @return [type] [description]
 */
    protected function report()
    {
        return Admin::grid(User::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->name('Tên khách hàng')->sortable();
            $grid->email('Email')->sortable();
            $grid->address2('Địa chỉ')->sortable();
            $grid->orders('Tổng đơn hàng')->display(function ($orders) {
                $total_order = count($orders);
                return $total_order;
            });
            $grid->html('Tổng giá trị')->display(function () {
                return number_format(User::find($this->id)->orders_amount());
            });
            $grid->created_at('Ngày đăng ký')->sortable();
            $grid->model()->orderBy('id', 'desc');
            // $grid->disableExport();
            $grid->disableCreateButton();
            $grid->disableRowSelector();
            $grid->disableActions();
            $grid->exporter(new ExcelExpoter('dataCustomer_report', 'Report khach hang'));
        });
    }
    public function show($id)
    {
        return Admin::content(function (Content $content) use ($id) {
            $content->header('');
            $content->description('');
            $content->body(Admin::show(ShopCategory::findOrFail($id), function (Show $show) {
                $show->id('ID');
            }));
        });
    }
}
