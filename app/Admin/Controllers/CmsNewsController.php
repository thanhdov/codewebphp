<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\CmsNews;
use Encore\Admin\Controllers\ModelForm;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class CmsNewsController extends Controller
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

            $content->header('Quản lý Blog');
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

            $content->header('Chỉnh sửa Blog');
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

            $content->header('Đăng Blog mới');
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
        return Admin::grid(CmsNews::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->title('Tên bài viết')->sortable();
            $grid->image('Hình ảnh')->image();
            $grid->status('Trạng thái')->switch();
            $grid->created_at('Ngày tạo');
            $grid->updated_at('Lần cuối chỉnh sửa');
            $grid->disableExport();
            $grid->disableRowSelector();
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
        return Admin::form(CmsNews::class, function (Form $form) {
            $form->text('title', 'Tên bài viết')->rules('required', ['required' => 'Bạn chưa nhập tên']);
            $form->image('image', 'Hình ảnh')->uniqueName()->move('cms_content')->removable();
            $form->ckeditor('content', 'Nội dung');
            $form->switch('status', 'Trạng thái');
            $form->number('sort', 'Sắp xếp');
            $form->divide('Hỗ trợ SEO');
            $form->html('<b>Hỗ trợ SEO</b>');
            $form->tags('keyword', 'Từ khóa');
            $form->textarea('description', 'Mô tả')->rules('max:300', ['max' => 'Tối đa 300 kí tự']);

            $form->saved(function (Form $form) {
                $file_path_admin = config('filesystems.disks.admin.root');
                try {
                    if (!file_exists($file_path_admin . '/thumb/' . $form->model()->image)) {
                        \Image::make($file_path_admin . '/' . $form->model()->image)->insert(public_path('watermark.png'), 'bottom-right', 10, 10)->save($file_path_admin . '/' . $form->model()->image);
                        //thumbnail
                        $image_thumb = \Image::make($file_path_admin . '/' . $form->model()->image);
                        $image_thumb->resize(200, null, function ($constraint) {
                            $constraint->aspectRatio();
                        });
                        $image_thumb->save($file_path_admin . '/thumb/' . $form->model()->image);
                        //end thumb
                    }

                } catch (\Exception $e) {
                    echo $e->getMessage();
                }

            });
        });
    }

    public function show($id)
    {
        return Admin::content(function (Content $content) use ($id) {
            $content->header('');
            $content->description('');
            $content->body(Admin::show(CmsNews::findOrFail($id), function (Show $show) {
                $show->id('ID');
            }));
        });
    }
}
