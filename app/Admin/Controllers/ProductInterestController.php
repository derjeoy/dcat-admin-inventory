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
            $grid->column('image','产品图片')->image('',50,50);
            $grid->column('label','标记')->select(\App\Models\ProductInterest::LABEL_STATUS)->sortable()->help('0-有兴趣；1-没有兴趣');//->label(\App\Models\ProductInterest::STATUS_COLOR);
            $grid->column('country')->select(\App\Models\ProductInterest::COUNTRY_CODE);
            $grid->column('asin')->limit(30);
            $grid->column('keyword')->limit(30);
            $grid->column('name')->limit(30);
            $grid->column('store')->limit(30);
            $grid->column('bs_category');
            $grid->column('amz_price')->editable(true);
            $grid->column('created_at');
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });


            // 禁止按钮边框
            $grid->toolsWithOutline(false);
            //$grid->fixColumns(3);
            $grid->showQuickEditButton();

            //启用导出功能
            $grid->export()->xlsx();

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
            $form->select('label','标记')->options(\App\Models\ProductInterest::LABEL_STATUS);;
            $form->text('asin');
            $form->text('bs_category');
            $form->text('name');
            $form->image('image')->autoUpload();
            $form->select('country','国家')->options(\App\Models\ProductInterest::COUNTRY_CODE);
            $form->text('keyword');
            
            
            $form->text('store');
            
            $form->text('amz_price');
        
        });
    }
}
