<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\TableListing;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Widgets\Table;

class TableListingController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new TableListing(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('amz_account');
            $grid->column('country');
            $grid->column('amz_sku');
            $grid->column('asin');
            $grid->column('fnsku');
            $grid->column('local_name');
            //$grid->column('upc');
            $grid->column('irobot_sku');
            $grid->column('saler');
            $grid->column('price'); 
            // ->help('这里是产品售价，点开有利润')->display(function () {
            //     return ' <a data-title="PRICE" class="td-top-copy btn-white btn ">' . $this->price . '</a> &nbsp;&nbsp;&nbsp;';
            // });;
            //$grid->column('created_at');
            //$grid->column('updated_at')->sortable();
        
            // $grid->column('irobot_sku','赛盒SKU')->help('点开有产品详情')->display(function () {
            //     Form::dialog('编辑角色')
            //         ->click('.edit-form')
            //             ->success('Dcat.reload()'); // 编辑成功后刷新页面

            //     // 当需要在同个“class”的按钮中绑定不同的链接时，把链接放到按钮的“data-url”属性中即可
            //     // $editPage = admin_base_path('/admin/form/layout/block');

            //     return ' <span class="btn btn-primary edit-form" data-url="/admin/form/layout/block"> 编辑表单弹窗</span> ';
            // });;

            $grid->column('irobot_sku')
                ->display("关联销售链接")
                ->expand(function () {
                    $table = new Table();

                    return "<div style='padding:10px 10px 0;color:blue;'>$table</div>";
                });



            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });

            // 禁止按钮边框
            $grid->toolsWithOutline(false);
            $grid->fixColumns(3);

            $grid->showQuickEditButton();

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
        return Show::make($id, new TableListing(), function (Show $show) {
            $show->field('id');
            $show->field('amz_account');
            $show->field('country');
            $show->field('amz_sku');
            $show->field('asin');
            $show->field('fnsku');
            $show->field('local_name');
            $show->field('upc');
            $show->field('irobot_sku');
            $show->field('saler');
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
        return Form::make(new TableListing(), function (Form $form) {
            $form->display('id');
            $form->text('amz_account');
            $form->text('country');
            $form->text('amz_sku');
            $form->text('asin');
            $form->text('fnsku');
            $form->text('local_name');
            $form->text('upc');
            $form->text('irobot_sku');
            $form->text('saler');
        
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
