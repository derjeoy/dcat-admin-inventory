<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\InventoryOut;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Admin;
use Dcat\Admin\Widgets\Table;
use Dcat\Admin\Http\Controllers\AdminController;
use App\Models\ListingModel;
use App\Models\InventotyOut;
use App\Models\FCWarehouse;
use App\Models\ProductModel;
use App\Admin\Actions\Grid\UploadShipmeent;
use App\Admin\Actions\Grid\DownloadInventoryOutTemplate;
use App\Admin\RowActions\DownloadAction;
use App\Admin\RowActions\DownloadCarrierExcel;
use App\Admin\RowActions\DownloadCarrierPDF;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Form\NestedForm;
use App\Admin\Renderable\FCWarehouseTable;


class InventoryOutController extends AdminController
{

    public function index(Content $content)
    {
        return $content
            ->header('出库单')
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
        return Grid::make(new InventoryOut(['fba_listings']), function (Grid $grid) {
            $grid->column('fbaid','SHIPMENT_ID')->display(function(){
                    return $this->fbaid;
            });
            $grid->column('fba_reference_id','FBA参考号');

            $grid->column('from_address','发货地址')->width(20);

            $grid->column('address','目的地址')->display(function(){
                $fcaddress = FCWarehouse::get()->where('FC','==',$this->fba_code);
                return $this->fba_code.'<br>'.$fcaddress->pluck('COMPANY_NAME')[0].'<br>'.$fcaddress->pluck('ADDRESS')[0].'<br>'.$fcaddress->pluck('CITY')[0].', '.$fcaddress->pluck('STATES')[0].' '.$fcaddress->pluck('POSTAL_CODE')[0].'<br>'.$fcaddress->pluck('COUNTRY')[0];
            })->width(200);

            $grid->column('fba_code','FBA仓库编号');

            $grid->column('FBA链接')
                ->expand(function () {
                    $table_title = ['链接ID','产品名称','FNSKU','发货数目'];                    
                    $data = [];

                    foreach ($this->fba_listings as $listing){
                        $product = ProductModel::get()->where('id','==',$listing->name_chinese);
                        $listing_model = ListingModel::get()->where('id','==',$listing->listing_id);
                        $data[] = [$listing->listing_id, $product->pluck('name_chinese')[0], $listing_model->pluck('fnsku')[0],$listing->send_number];
                    }

                    $table = new Table($table_title, $data);

                    return "<div style='padding:10px 10px 0;color:green;'>$table</div>";
                });
            
            $grid->column('date_create_ship','货件发货日期')->sortable();
            $grid->column('hope_arrive_date','期望上架日期');
            $grid->column('actural_arrive_date','实际上架日期');
            $grid->column('carrier_name','承运商');
            $grid->column('tracking_num','物流跟踪号');
            $grid->column('carrier_fee','物流费用');
            $grid->column('send_method','发货方式')->using(\App\Models\InventoryOut::SEND_METHOD);
            $grid->column('status','发货计划状态')->using(\App\Models\InventoryOut::SHIPMENT_STATUS);
            $grid->column('note','备注');

            $grid->tools(function (Grid\Tools $tools) {
                // excle 导入
                $tools->append(new UploadShipmeent());
                // 模板下载
                $tools->append(new DownloadInventoryOutTemplate());
            });

            $grid->actions(function (Grid\Displayers\Actions $actions) {
                //$actions->append( new DownloadAction());
                $actions->append( new DownloadCarrierExcel('App\Models\InventoryOut'));
                $actions->append( new DownloadCarrierPDF('App\Models\InventoryOut'));

                $actions->disableView();
                $actions->disableDelete();
                $actions->disableEdit();
            });
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('fbaid');
                $filter->equal('to_country');
                $filter->equal('tracking_num');
            });

            $grid->toolsWithOutline(false);
            //$grid->fixColumns(3);

            $grid->showQuickEditButton();
            $grid->model()->orderBy("id", "asc");
            //$grid->withBorder();
            // $grid->disableViewButton();

            //$grid->disableActions();
            
            //$grid->disableRowSelector();

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
        return Show::make($id, new InventoryOut(['fba_listings']), function (Show $show) {
            $show->field('listing_id');
            $show->field('fbaid');
            $show->field('fba_reference_id');
            $show->field('from_address');
            $show->field('to_country');
            $show->field('fba_code');
            $show->field('address');
            $show->field('postcode');
            $show->field('date_create_ship');
            $show->field('carrier_name');
            $show->field('tracking_num','物流跟踪号');
            $show->field('send_method');
            $show->field('status');
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
        return Form::make(new InventoryOut(['fba_listings']), function (Form $form) {
            //$this->setForm($form);
            if ($form->isCreating()) {
                $this->creating($form);
            } elseif ($form->isEditing()) {
                $this->editing($form);
            }
        });
    }

    /**
     * @param Form $form
     */
    protected function creating(Form &$form): void
    {
        $form->disableListButton();
        $form->row(function ($form) {
            $form->width(4)->text('fbaid');
            $form->width(4)->text('fba_reference_id');
            $form->width(4)->text('from_address');
        });
        $form->row(function ($form) {
            $form->width(4)->select('to_country')->options(\App\Models\InventoryOut::COUNTRY_CODE);
            $form->width(4)->selectTable('fba_code', '选择亚马逊仓库')
                ->title('请选择FBA仓库')
                ->dialogWidth('50%') // 弹窗宽度，默认 800px
                ->from(FCWarehouseTable::make(['FC' => $form->getKey()])) // 设置渲染类实例，并传递自定义参数
                ->model(FCWarehouse::class, 'FC', 'FC'); // 第一个参数为选中后将保存到表单的字段，第二个参数为显示的字段
        });

        $form->row(function ($form) {
            $form->width(2)->date('date_create_ship','发货日期');
            $form->width(2)->date('hope_arrive_date','期望上架日期');
            $form->width(2)->date('actural_arrive_date','实际上架日期');
        });


        $form->row(function ($form) {
            $form->hasMany('fba_listings', '', function (Form\NestedForm $table) {
                $table->width(4)->select('name_chinese', '名称')->options(\App\Models\ProductModel::pluck('name_chinese', 'id'))->load('listing_id', route('dcat.admin.api.productlisting.find'))->required();
                $table->width(4)->select('listing_id', '选择链接')->options()->required();
                $table->width(4)->text('send_number', '发货数目')->required();
            })->useTable();
        });


        $form->row(function ($form) {
            $form->width(2)->select('status','货件状态')->options(\App\Models\InventoryOut::SHIPMENT_STATUS);
            $form->width(2)->select('send_method','发货方式')->options(\App\Models\InventoryOut::SEND_METHOD);
            $form->width(2)->text('carrier_name');
            $form->width(2)->text('tracking_num','物流跟踪号');

            $form->width(2)->text('carrier_fee','物流费用');

            $form->width(2)->textarea('note');
        });

        $form->row(function ($form) {
            $form->width(6)->file('carrier_file','物流形式发票')->autoUpload()->downloadable()->maxSize(3069)->accept('xls,xlsx');;//3M
            $form->width(6)->file('carrier_pdf','箱唛')->autoUpload()->downloadable()->maxSize(3069)->accept('pdf,xls,xlsx');//3M
        });   

    }


    protected function editing(Form &$form): void
    {
        $form->disableListButton();
        $form->row(function ($form) {
            $form->width(4)->text('fbaid');
            $form->width(4)->text('fba_reference_id');
            $form->width(4)->text('from_address');
        });
        $form->row(function ($form) {
            $form->width(4)->select('to_country')->options(\App\Models\InventoryOut::COUNTRY_CODE);
            $form->width(4)->selectTable('fba_code', '选择亚马逊仓库')
                ->title('请选择FBA仓库')
                ->dialogWidth('50%') // 弹窗宽度，默认 800px
                ->from(FCWarehouseTable::make(['FC' => $form->getKey()])) // 设置渲染类实例，并传递自定义参数
                ->model(FCWarehouse::class, 'FC', 'FC'); // 第一个参数为选中后将保存到表单的字段，第二个参数为显示的字段
        });

        $form->row(function ($form) {
            $form->width(4)->date('date_create_ship','发货日期');
            $form->width(4)->date('hope_arrive_date','期望上架日期');
            $form->width(4)->date('actural_arrive_date','实际上架日期');
        });

        $form->row(function ($form) {
            $form->hasMany('fba_listings', '发货链接', function (Form\NestedForm $table) {
                //dd($this->fba_listings);
                $table->width(4)->select('name_chinese', '名称')->options(\App\Models\ProductModel::pluck('name_chinese', 'id'))->load('listing_id', route('dcat.admin.api.productlisting.find'))->required();
                $table->width(4)->select('listing_id', '选择链接')->options()->required();
                $table->width(4)->text('send_number', '发货数目')->required();
            });//->useTable();
        });


        $form->row(function ($form) {
            $form->width(4)->select('status','货件状态')->options(\App\Models\InventoryOut::SHIPMENT_STATUS);
            $form->width(4)->select('send_method','发货方式')->options(\App\Models\InventoryOut::SEND_METHOD);
            $form->width(4)->text('carrier_name');
        });

        $form->row(function ($form) {
            $form->width(4)->text('tracking_num','物流跟踪号');
            $form->width(4)->text('carrier_fee','物流费用');
            $form->width(4)->textarea('note');
        });

        $form->row(function ($form) {
            $form->width(6)->file('carrier_file','物流形式发票')->autoUpload()->downloadable()->maxSize(3069)->accept('xls,xlsx');;//3M
            $form->width(6)->file('carrier_pdf','箱唛')->autoUpload()->downloadable()->maxSize(3069)->accept('pdf,xls,xlsx');//3M
        });
    }

}
