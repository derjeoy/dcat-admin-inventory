<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\TableReview;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use App\Models\TableListing;

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
            $grid->date('date');
            $grid->column('note');
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id','产品库ID');
                $filter->equal('listing_id','链接ID');
        
            });

            // 禁止按钮边框
            $grid->toolsWithOutline(false);
            //$grid->fixColumns(1);
            //$grid->disableQuickEditButton();
            $grid->disableViewButton();
            $grid->disableEditButton();

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
        return Show::make($id, new TableReview(), function (Show $show) {
            // $show->field('id');
            // $show->field('listing_id');
            // $show->field('rew_number');
            // $show->field('rew_rate');
            // $show->field('date');
            // $show->field('note');
            // $show->field('created_at');
            // $show->field('updated_at');
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
            $form->select('listing_id')->options(TableListing::pluck('asin', 'id'))->required();
            $form->text('rew_number');
            $form->text('rew_rate');
            $form->date('date');
            $form->text('note');
        });
    }
}
