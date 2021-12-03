<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\ProductInterest;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class ProductInterestController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new ProductInterest(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('image');
            $grid->column('image','产品图片')->image('',50,50);
            $grid->column('country');
            $grid->column('asin');
            $grid->column('keyword');
            $grid->column('name');
            $grid->column('store');
            $grid->column('bs_category');
            $grid->column('amz_price');
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });
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
        return Show::make($id, new ProductInterest(), function (Show $show) {
            $show->field('id');
            $show->image('image');
            $show->field('asin');
            $show->field('store');
            $show->field('bs_category');
            $show->field('amz_price');
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
        return Form::make(new ProductInterest(), function (Form $form) {
            $form->display('id');
            $form->image('image')->autoUpload();
            $form->text('country');
            $form->text('keyword');
            $form->text('name');
            $form->text('asin');

            $form->text('store');
            $form->text('bs_category');
            $form->text('amz_price');
        
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
