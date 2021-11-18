<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\TableListing;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Widgets\Table;
use App\Admin\Renderable\ListingTable;
use App\Models\ProductModel;

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
            $grid->column('id','链接ID')->sortable();
            $grid->column('irobot_sku','赛合SKU');
            $grid->column('country','国家');
            $grid->column('amz_account','账号名字');
            $grid->column('amz_sku','平台SKU');
            $grid->column('asin','ASIN');
            $grid->column('fnsku','FNSKU');
            $grid->column('local_name','产品名称');            
            $grid->column('price','产品售价')->help('这里是产品售价，点开有利润')->display(function () {
                 return ' <a data-title="PRICE" class="td-top-copy btn-white btn ">' . $this->price . '</a> &nbsp;&nbsp;&nbsp;';
             });
            $grid->column('saler','所属销售');
            $grid->column('链接详情')
               ->display('链接详情')->modal('链接详情', ListingTable::make());
            // $grid->column('库存信息')
            //    ->display('库存详情')->modal('库存详情', ListingTable::make());
            $grid->column('库存详情')
                ->display(Factory::create()->name)
                ->expand(PostTable::make());

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('country','国家');
                $filter->equal('irobot_sku','赛合SKU');
                $filter->equal('asin','ASIN');
        
            });
            // ->help('这里是产品售价，点开有利润')->display(function () {
            //     return ' <a data-title="PRICE" class="td-top-copy btn-white btn ">' . $this->price . '</a> &nbsp;&nbsp;&nbsp;';
            // });;
        
            // $grid->column('irobot_sku','赛盒SKU')->help('点开有产品详情')->display(function () {
            //     Form::dialog('编辑角色')
            //         ->click('.edit-form')
            //             ->success('Dcat.reload()'); // 编辑成功后刷新页面

            //     // 当需要在同个“class”的按钮中绑定不同的链接时，把链接放到按钮的“data-url”属性中即可
            //     // $editPage = admin_base_path('/admin/form/layout/block');

            //     return ' <span class="btn btn-primary edit-form" data-url="/admin/form/layout/block"> 编辑表单弹窗</span> ';
            // });;

            
            $grid->toolsWithOutline(false);
            //$grid->fixColumns(3);

            //$grid->showQuickEditButton();

            //$grid->disableActions();
            
            $grid->disableRowSelector();

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
            $this->setForm($form);
            if ($form->isCreating()) {
                $this->creating($form);
            } 
            // elseif ($form->isEditing()) {
            //     $this->editing($form);
            // }
        });
    }


    protected function setForm(Form &$form): void
    {
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
    }

    protected function creating(Form &$form): void
    {
        $form->row(function (Form\Row $row) {
            $row->hasMany('items', '', function (Form\NestedForm $table) {
                //pluck(value, key) : 返回指定value,key的值组成的集合
                $table->select('selected_product_id', '名称')->options(ProductModel::pluck('name_chinese', 'id'))->loadpku(route('dcat.admin.api.product.find'))->required();
                $table->ipt('asin', 'asin')->rem(6)->default('-')->disable();
            })->useTable()->width(12);


        });
    }
}
