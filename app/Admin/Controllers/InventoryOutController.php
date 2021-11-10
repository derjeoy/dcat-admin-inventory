<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\InventoryOut;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class InventoryOutController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new InventoryOut(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('listing_id');
            $grid->column('irobot_shipment_id');
            $grid->column('fbaid');
            $grid->column('fba_reference_id');
            $grid->column('from_address');
            $grid->column('to_country');
            $grid->column('fba_code');
            $grid->column('address');
            $grid->column('postcode');
            $grid->column('date_create_ship');
            $grid->column('carrier_name');
            $grid->column('send_method');
            $grid->column('status');
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
        return Show::make($id, new InventoryOut(), function (Show $show) {
            $show->field('id');
            $show->field('listing_id');
            $show->field('irobot_shipment_id');
            $show->field('fbaid');
            $show->field('fba_reference_id');
            $show->field('from_address');
            $show->field('to_country');
            $show->field('fba_code');
            $show->field('address');
            $show->field('postcode');
            $show->field('date_create_ship');
            $show->field('carrier_name');
            $show->field('send_method');
            $show->field('status');
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
        return Form::make(new InventoryOut(), function (Form $form) {
            $form->display('id');
            $form->text('listing_id');
            $form->text('irobot_shipment_id');
            $form->text('fbaid');
            $form->text('fba_reference_id');
            $form->text('from_address');
            $form->text('to_country');
            $form->text('fba_code');
            $form->text('address');
            $form->text('postcode');
            $form->text('date_create_ship');
            $form->text('carrier_name');
            $form->text('send_method');
            $form->text('status');
            $form->text('note');
        
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
