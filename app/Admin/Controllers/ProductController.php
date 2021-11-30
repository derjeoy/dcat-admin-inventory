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

            $grid->column('id','产品库ID')->sortable();
            $grid->column('image_column','产品图片')->image('',50,50);
            $grid->column('name_chinese','产品中文名字');
            $grid->column('name_english','产品英文名字');
            //$grid->column('asin');
            $grid->column('content','关联销售链接')
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
            $grid->column('upc','UPC');
            $grid->column('irobot_sku','赛盒SKU');
            $grid->column('unit_size','产品尺寸');//对应的inch
            $grid->column('unit_weight','产品重量');
            $grid->column('box_size','装箱尺寸');//对应体积
            $grid->column('box_weight','装箱重量');
            $grid->column('numberperbox','装箱个数');
            $grid->column('amz_listing','参考亚马逊链接');
            $grid->column('purchasemethod','采购链接');
            $grid->column('','添加人');

            $grid->tools(function (Grid\Tools $tools) {
                // excle 导入
                $tools->append(new UploadProducts());
            });

        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('irobot_sku','赛盒SKU');
        
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
            //$form->image('image_column')
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
