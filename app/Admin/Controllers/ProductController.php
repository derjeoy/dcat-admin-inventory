<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Product;
use App\Admin\Actions\Grid\UploadProducts;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class ProductController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Product(), function (Grid $grid) {

            $grid->column('id')->sortable();
            $grid->column('image_column')->image('',50,50);
            $grid->column('name_chinese');
            $grid->column('name_english');
            $grid->column('asin');
            $grid->column('upc');
            $grid->column('irobot_sku');
            $grid->column('addbyuser');
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();
            $grid->tools(function (Grid\Tools $tools) {
                // excle 导入
                $tools->append(new UploadProducts());
            });

        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });
            // 禁止按钮边框
            $grid->toolsWithOutline(false);
            $grid->fixColumns(3);

        });
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        return Show::make($id, new Product(), function (Show $show) {
            $show->field('id');

            $show->image('image_column');
            $show->field('name_chinese');
            $show->field('name_english');
            $show->field('asin');
            $show->field('upc');
            $show->field('irobot_sku');
            $show->field('addbyuser');
            $show->field('created_at');
            $show->field('updated_at');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Product(), function (Form $form) {
            $form->display('id');

            

            // $form->image('image_column')->name(function ($file) use ($form){
            //     $img_name = $form->model()->name_english;
            //     $finename = $img_name.'.'.$file->guessExtension();
            //     return $finename;
            // })->autoUpload();
            $form->image('image_column')->uniqueName();
            $form->text('name_chinese');
            $form->text('name_english');
            $form->text('asin');
            $form->text('upc');
            $form->text('irobot_sku');
            $form->text('addbyuser');
            $form->display('created_at');
            $form->display('updated_at');
            
        });
    }
}
