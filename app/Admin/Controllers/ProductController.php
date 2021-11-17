<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Product;
use App\Admin\Actions\Grid\UploadProducts;
use App\Admin\Renderable\PostTable;
use App\Admin\Renderable\UserTable;
use App\Models\TableListing;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Faker\Factory;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Widgets\Table;
class ProductController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Product(), function (Grid $grid) {

            $grid->column('id')->sortable();
            $grid->column('image_column')->image('',50,50);
            $grid->column('name_chinese');
            $grid->column('name_english');
            //$grid->column('asin');
            $grid->column('content')
                ->display("关联销售链接")
                ->expand(function () {
                    // 返回显示的详情
                    // 这里返回 content 字段内容，并用 Card 包裹起来
                    $sku = $this->irobot_sku;
                    $listings = TableListing::get()->where('irobot_sku','=',$sku);

                    $data = [];
                    $table_title = ['亚马逊账号','国家','赛盒SKU','平台SKU','ASIN','FNSKU','产品名','UPC','销售','售价'];

                    foreach($listings as $list)
                    {
                        $data[] = [$list->amz_account,$list->country,$list->irobot_sku,$list->amz_sku,$list->asin,$list->fnsku,$list->local_name,$list->upc,$list->saler,$list->price];
                    }

                    $table = new Table($table_title, $data);

                    return "<div style='padding:10px 10px 0;color:blue;'>$table</div>";
                });
            $grid->column('upc');
            $grid->column('irobot_sku');
            $grid->column('addbyuser');
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();
            $grid->tools(function (Grid\Tools $tools) {
                // excle 导入
                $tools->append(new UploadProducts());
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
        return Show::make($id, new Product(), function (Show $show) {
            $show->field('id');

            $show->image('image_column');
            $show->field('name_chinese');
            $show->field('name_english');
            $show->field('asin');
            $show->field('upc');
            $show->field('irobot_sku');
            $show->field('addbyuser');
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
        return Form::make(new Product(), function (Form $form) {
            $form->display('id');

            

            $form->image('image_column')->name(function ($file) use ($form){
                $img_name = $form->model()->name_english;
                $finename = $img_name.'.'.$file->guessExtension();
                return $finename;
            })->autoUpload();
            $form->image('image_column')->uniqueName();
            $form->text('name_chinese');
            $form->text('name_english');
            $form->text('asin');
            $form->text('upc');
            $form->text('irobot_sku');
            $form->text('addbyuser');
            $form->display('created_at');
            $form->display('updated_at');
            
        });
    }
}
