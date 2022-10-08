<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\PurchaseProduct;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class PurchaseProductController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new PurchaseProduct(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('product_id');
            $grid->column('order_id');
            $grid->column('purchase_number');
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
        return Show::make($id, new PurchaseProduct(), function (Show $show) {
            $show->field('id');
            $show->field('product_id');
            $show->field('order_id');
            $show->field('purchase_number');
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
        return Form::make(new PurchaseProduct(), function (Form $form) {
            $form->display('id');
            $form->text('product_id');
            $form->text('order_id');
            $form->text('purchase_number');
        
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
