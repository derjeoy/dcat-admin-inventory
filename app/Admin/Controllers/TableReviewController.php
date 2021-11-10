<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\TableReview;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class TableReviewController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new TableReview(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('listing_id');
            $grid->column('rew_number');
            $grid->column('rew_rate');
            $grid->column('date');
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
        return Show::make($id, new TableReview(), function (Show $show) {
            $show->field('id');
            $show->field('listing_id');
            $show->field('rew_number');
            $show->field('rew_rate');
            $show->field('date');
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
        return Form::make(new TableReview(), function (Form $form) {
            $form->display('id');
            $form->text('listing_id');
            $form->text('rew_number');
            $form->text('rew_rate');
            $form->text('date');
            $form->text('note');
        
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
