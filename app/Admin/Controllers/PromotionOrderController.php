<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\PromotionOrder;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Layout\Content;

class PromotionOrderController extends AdminController
{
    public function index(Content $content)
    {
        return $content
            ->header('推广订单')
            ->description('')
            ->body($this->grid());
    }
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new PromotionOrder(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('promotion_product_id');
            $grid->column('promotion_type');
            $grid->column('refund_method');
            $grid->column('order_number');
            $grid->column('order_price');
            $grid->column('order_screenshot');
            $grid->column('review_screenshot');
            $grid->column('review_link');
            $grid->column('review_submit_date');
            $grid->column('review_show_date');
            $grid->column('review_type');
            $grid->column('refund_status');
            $grid->column('refund_date');
            $grid->column('refund_money');
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
        return Show::make($id, new PromotionOrder(), function (Show $show) {
            $show->field('id');
            $show->field('promotion_product_id');
            $show->field('promotion_type');
            $show->field('refund_method');
            $show->field('order_number');
            $show->field('order_price');
            $show->field('order_screenshot');
            $show->field('review_screenshot');
            $show->field('review_link');
            $show->field('review_submit_date');
            $show->field('review_show_date');
            $show->field('review_type');
            $show->field('refund_status');
            $show->field('refund_date');
            $show->field('refund_money');
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
        return Form::make(new PromotionOrder(), function (Form $form) {
            $form->display('id');
            $form->text('promotion_product_id');
            $form->text('promotion_type');
            $form->text('refund_method');
            $form->text('order_number');
            $form->text('order_price');
            $form->text('order_screenshot');
            $form->text('review_screenshot');
            $form->text('review_link');
            $form->text('review_submit_date');
            $form->text('review_show_date');
            $form->text('review_type');
            $form->text('refund_status');
            $form->text('refund_date');
            $form->text('refund_money');
            $form->text('note');
        });
    }
}
