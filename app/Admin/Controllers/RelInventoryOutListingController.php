<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\RelInventoryOutListing;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class RelInventoryOutListingController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new RelInventoryOutListing(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('listing_id');
            $grid->column('fbaid');
            $grid->column('send_number');
        
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
        return Show::make($id, new RelInventoryOutListing(), function (Show $show) {
            $show->field('id');
            $show->field('listing_id');
            $show->field('fbaid');
            $show->field('send_number');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new RelInventoryOutListing(), function (Form $form) {
            $form->display('id');
            $form->text('listing_id');
            $form->text('fbaid');
            $form->text('send_number');
        });
    }
}
