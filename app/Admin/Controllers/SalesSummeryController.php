<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\SalesSummery;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class SalesSummeryController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new SalesSummery(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('picture','产品图片')->image('',50,50);
            $grid->column('asin');
            $grid->column('name_local');
            $grid->column('sku');
            $grid->column('taday_order_number');
            $grid->column('taday_order_ammount');
            $grid->column('today_average_price');
            $grid->column('yesterday_order_number');
            $grid->column('yesterday_order_ammount');
            $grid->column('yesterday_order_price');
            $grid->column('lastweekday_order_number');
            $grid->column('lastweekday_order_ammount');
            $grid->column('lastweekday_order_price');
            $grid->column('inventory_salable');
            $grid->column('inventory_receivable');
            $grid->column('inventory_movable');
            $grid->column('note');
        
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
        return Show::make($id, new SalesSummery(), function (Show $show) {
            $show->field('id');
            $show->field('picture');
            $show->field('asin');
            $show->field('name_local');
            $show->field('sku');
            $show->field('taday_order_number');
            $show->field('taday_order_ammount');
            $show->field('today_average_price');
            $show->field('yesterday_order_number');
            $show->field('yesterday_order_ammount');
            $show->field('yesterday_order_price');
            $show->field('lastweekday_order_number');
            $show->field('lastweekday_order_ammount');
            $show->field('lastweekday_order_price');
            $show->field('inventory_salable');
            $show->field('inventory_receivable');
            $show->field('inventory_movable');
            $show->field('note');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new SalesSummery(), function (Form $form) {
            $form->display('id');
            $form->text('picture');
            $form->text('asin');
            $form->text('name_local');
            $form->text('sku');
            $form->text('taday_order_number');
            $form->text('taday_order_ammount');
            $form->text('today_average_price');
            $form->text('yesterday_order_number');
            $form->text('yesterday_order_ammount');
            $form->text('yesterday_order_price');
            $form->text('lastweekday_order_number');
            $form->text('lastweekday_order_ammount');
            $form->text('lastweekday_order_price');
            $form->text('inventory_salable');
            $form->text('inventory_receivable');
            $form->text('inventory_movable');
            $form->text('note');
        });
    }
}
