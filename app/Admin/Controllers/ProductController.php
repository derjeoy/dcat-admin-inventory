<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Product;
use App\Admin\Actions\Grid\UploadProducts;
use App\Admin\Actions\Grid\DownloadTemplate;
use App\Admin\Renderable\PostTable;
use App\Admin\Renderable\UserTable;
use App\Models\TableListing;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Faker\Factory;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Widgets\Table;
use Dcat\Admin\Layout\Content;


#define DSP_CM2INCH(v) "<span style='color:black'>$v cm</span><br/><span style='color:grey'>".$v/2.54."inch</span>"

class ProductController extends AdminController
{

    public function index(Content $content)
    {
        return $content
            ->header('产品库')
            ->description('列表')
            ->body($this->grid());
    }

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
            $grid->column('name_chinese','产品名')->width(80);
            $grid->column('purchase_cost','采购成本');
            
            //$grid->column('irobot_sku','赛盒SKU');
            $grid->column('unit_length','长度')->display(function ($unit_length) {

                return "<span style='color:black'>$unit_length cm</span><br/><span style='color:grey'>".round($unit_length/2.54,2)."''</span>";

            });//对应的inch
            $grid->column('unit_width','宽度')->display(function ($unit_width) {

                return "<span style='color:black'>$unit_width cm</span><br/><span style='color:grey'>".round($unit_width/2.54,2)."''</span>";

            });;//对应的inch
            $grid->column('unit_height','高度')->display(function ($unit_height) {

                return "<span style='color:black'>$unit_height cm</span><br/><span style='color:grey'>".round($unit_height/2.54,2)."''</span>";

            });;//对应的inch
            $grid->column('unit_weight','重量')->display(function ($unit_weight) {

                return "<span style='color:black'>$unit_weight kg</span><br/><span style='color:grey'>".round($unit_weight*2.2046226,2)."lb</span>";

            });;
            $grid->column('box_length','装箱长度')->display(function ($box_length) {

                return "<span style='color:black'>$box_length cm</span><br/><span style='color:grey'>".round($box_length/2.54,2)."''</span>";

            });;//对应体积
            $grid->column('box_width','装箱宽度')->display(function ($box_width) {

                return "<span style='color:black'>$box_width cm</span><br/><span style='color:grey'>".round($box_width/2.54,2)."''</span>";

            });;//对应体积
            $grid->column('box_height','装箱高度')->display(function ($box_height) {

                return "<span style='color:black'>$box_height cm</span><br/><span style='color:grey'>".round($box_height/2.54,2)."''</span>";

            });;//对应体积
            $grid->column('box_weight','装箱重量')->display(function ($box_weight) {

                return "<span style='color:black'>$box_weight kg</span><br/><span style='color:grey'>".round($box_weight*2.2046226,2)."lb</span>";

            })->width(30);
            $grid->column('box_number','装箱个数');
            
            $grid->column('purchasemethod','采购方式')->width(50);
            
            $grid->column('content','关联销售链接')
                ->display("关联销售链接")
                ->expand(function () {
                    // 返回显示的详情
                    // 这里返回 content 字段内容，并用 Card 包裹起来
                    $sku = $this->id;
                    $listings = TableListing::get()->where('irobot_sku','=',$sku);

                    $data = [];
                    $table_title = ['亚马逊账号','国家','平台SKU','ASIN','FNSKU','UPC','销售','售价'];

                    foreach($listings as $list)
                    {
                        $data[] = [$list->amz_account,$list->country,$list->amz_sku,$list->asin,$list->fnsku,$list->upc,$list->saler,$list->price];
                    }

                    $table = new Table($table_title, $data);

                    return "<div style='padding:10px 10px 0;color:blue;'>$table</div>";
                });

            $grid->column('addbyuser','添加人');
            //$grid->column('amz_listing','参考链接')->width(5);

            $grid->tools(function (Grid\Tools $tools) {
                // excle 导入
                $tools->append(new UploadProducts());

                // 模板下载
                $tools->append(new DownloadTemplate());
            });

        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->like('name_chinese','产品名字');
                $filter->equal('id','产品库ID');
            });
            // 禁止按钮边框
            $grid->toolsWithOutline(false);
            //$grid->fixColumns(3);
            $grid->showQuickEditButton();
            $grid->disableViewButton();

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
        return Show::make($id, new Product(), function (Show $show) {
            // $show->field('id');

            // $show->image('image_column');
            // $show->field('name_chinese');
            // $show->field('name_english');
            // $show->field('irobot_sku');
            // $show->field('addbyuser');
            // $show->field('created_at');
            // $show->field('updated_at');
            // $show->field('purchase_cost','采购成本');
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

            $form->tab('基本信息', function (Form $form) {

                    $form->display('id');
                    // $form->text('irobot_sku','赛合SKU');
                    
                    $form->text('name_chinese','中文名');
                    $form->text('name_english','英文名');
                    $form->text('amz_listing','参考亚马逊链接');
                    $form->text('purchasemethod','采购方式')->default('1688');
                    $form->text('purchase_cost','采购成本');

                    $form->image('image_column','请上传产品主图')->name(function ($file) use ($form){
                        $img_name = $form->model()->name_english;
                        $finename = $img_name.'.'.$file->guessExtension();
                        return $finename;
                        })->autoUpload()->rules('required',['required' =>'请上传产品主图']);
                    
                    $form->text('addbyuser','添加人')->default('csf');


                })->tab('尺寸信息', function (Form $form) {

                    $form->currency('unit_length','长度')->symbol('cm');
                    $form->currency('unit_width','宽度')->symbol('cm');
                    $form->currency('unit_height','高度')->symbol('cm');
                    $form->currency('unit_weight','重量')->symbol('kg');
                    $form->number('box_number','装箱数目(个)');
                    $form->currency('box_length','装箱长度')->symbol('cm');
                    $form->currency('box_width','装箱宽度')->symbol('cm');
                    $form->currency('box_height','装箱高度')->symbol('cm');
                    $form->currency('box_weight','装箱重量')->symbol('kg');


                });
            
            });
    }
}
