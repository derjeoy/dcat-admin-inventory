<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\SalesSummery;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use App\Admin\Metrics\Examples\TotalUsers;

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

            $grid->combine('today_sales', ['taday_order_number', 'taday_order_ammount', 'today_average_price'],'今日销售数据')->help('销售数据');
            $grid->combine('Yestdays_sales', ['yesterday_order_number', 'yesterday_order_ammount', 'yesterday_order_price'],'昨日销售数据')->responsive();//->style('color:#1867c0');
            $grid->combine('YestdaysLastWeek_sales', ['lastweekday_order_number', 'lastweekday_order_ammount', 'lastweekday_order_price'],'上周今日销售数据');

            $grid->column('id')->sortable();
            $grid->column('picture','产品图片')->image('',50,50);
            $grid->column('asin');
            $grid->column('name_local');
            $grid->column('sku');
            $grid->column('taday_order_number')->setHeaderAttributes(['style' => 'color:#5b69bc'])->sortable();
            $grid->column('taday_order_ammount')->sortable();
            $grid->column('today_average_price')->sortable();
            $grid->column('yesterday_order_number')->sortable();
            $grid->column('yesterday_order_ammount')->sortable();
            $grid->column('yesterday_order_price')->sortable();
            $grid->column('lastweekday_order_number')->sortable();
            $grid->column('lastweekday_order_ammount')->sortable();
            $grid->column('lastweekday_order_price')->sortable();
            $grid->column('inventory_salable')->sortable();
            $grid->column('inventory_receivable')->sortable();
            $grid->column('inventory_movable')->sortable();
            $grid->column('note');
        
            $grid->rowSelector()
                ->style('success')
                ->click();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });

            $grid->header(function ($collection) use ($grid) {
                $query = \App\Models\SalesSummery::query();

                // 拿到表格筛选 where 条件数组进行遍历
                $grid->model()->getQueries()->unique()->each(function ($value) use (&$query) {
                    if (in_array($value['method'], ['paginate', 'get', 'orderBy', 'orderByDesc'], true)) {
                        return;
                    }

                    $query = call_user_func_array([$query, $value['method']], $value['arguments'] ?? []);
                });

                // 查出统计数据
                $data = $query->get();

                // 自定义组件
                return new TotalUsers($data);
            });

            $grid->footer(function ($collection) use ($grid) {
                $query = \App\Models\SalesSummery::query();

                // 拿到表格筛选 where 条件数组进行遍历
                $grid->model()->getQueries()->unique()->each(function ($value) use (&$query) {
                    if (in_array($value['method'], ['paginate', 'get', 'orderBy', 'orderByDesc'], true)) {
                        return;
                    }

                    $query = call_user_func_array([$query, $value['method']], $value['arguments'] ?? []);
                });

                // 查出统计数据
                $data = $query->get();

                return "<div style='padding: 10px;'>总收入 ： $data</div>";
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
