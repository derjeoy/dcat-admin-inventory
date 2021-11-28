<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\PurchaseOrder;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class PurchaseOrderController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new PurchaseOrder(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('irobot_id');
            $grid->column('number');
            $grid->column('date');
            $grid->column('person');
            $grid->column('note');
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
        return Show::make($id, new PurchaseOrder(), function (Show $show) {
            $show->field('id');
            $show->field('irobot_id');
            $show->field('number');
            $show->field('date');
            $show->field('person');
            $show->field('note');
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
        return Form::make(new PurchaseOrder(), function (Form $form) {
            $form->display('id');
            $form->text('irobot_id');
            $form->text('number');
            $form->text('date');
            $form->text('person');
            $form->text('note');
        
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
