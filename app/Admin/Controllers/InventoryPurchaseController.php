<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\InventoryPurchase;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Layout\Content;
class InventoryPurchaseController extends AdminController
{
    public function index(Content $content)
    {
        return $content
            ->header('入库')
            ->description('or 采购中')
            ->body($this->grid());
    }
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new InventoryPurchase(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('listing_id');
            $grid->column('date');
            $grid->column('units_number');
            $grid->column('unit_price');
            $grid->column('already_send');
            $grid->column('status');
            $grid->column('备注');
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });

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
        return Show::make($id, new InventoryPurchase(), function (Show $show) {
            $show->field('id');
            $show->field('listing_id');
            $show->field('date');
            $show->field('units_number');
            $show->field('unit_price');
            $show->field('already_send');
            $show->field('status');
            $show->field('备注');
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
        return Form::make(new InventoryPurchase(), function (Form $form) {
            $form->display('id');
            $form->text('listing_id');
            $form->text('date');
            $form->text('units_number');
            $form->text('unit_price');
            $form->text('already_send');
            $form->text('status');
            $form->text('备注');
        
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
