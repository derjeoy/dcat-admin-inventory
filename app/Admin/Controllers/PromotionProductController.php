<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\PromotionProduct;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class PromotionProductController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new PromotionProduct(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('listing_id');
            $grid->column('brand');
            $grid->column('keyword_location');
            $grid->column('agent_contact');
            $grid->column('store_name');
            $grid->column('asin');
            $grid->column('name_chinese');
            $grid->column('name_english');
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
        return Show::make($id, new PromotionProduct(), function (Show $show) {
            $show->field('id');
            $show->field('listing_id');
            $show->field('brand');
            $show->field('keyword_location');
            $show->field('agent_contact');
            $show->field('store_name');
            $show->field('asin');
            $show->field('name_chinese');
            $show->field('name_english');
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
        return Form::make(new PromotionProduct(), function (Form $form) {
            $form->display('id');
            $form->text('listing_id');
            $form->text('brand');
            $form->text('keyword_location');
            $form->text('agent_contact');
            $form->text('store_name');
            $form->text('asin');
            $form->text('name_chinese');
            $form->text('name_english');
            $form->text('note');
        
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
