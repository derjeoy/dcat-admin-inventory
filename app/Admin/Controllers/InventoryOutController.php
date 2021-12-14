<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\InventoryOut;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Admin;
use Dcat\Admin\Http\Controllers\AdminController;
use App\Models\ListingModel;
use App\Models\InventotyOut;
use App\Admin\Actions\Grid\UploadShipmeent;
use App\Admin\RowActions\DownloadAction;
use App\Admin\RowActions\DownloadCarrierExcel;
use App\Admin\RowActions\DownloadCarrierPDF;

class InventoryOutController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new InventoryOut(), function (Grid $grid) {
            // $grid->column('id')->sortable();
            $grid->column('listing_id','链接ID')->sortable();
            $grid->column('fbaid','SHIPMENT ID');
            $grid->column('send_number','发货数目');
            $grid->column('to_country','发货国家');
            $grid->column('fba_code','目的地址编号');
            $grid->column('address','目的地详细地址');
            $grid->column('postcode','目的国邮编');
            $grid->column('date_create_ship','货件发货日期');
            $grid->column('carrier_name','承运商');
            $grid->column('tracking_num','物流跟踪号');
            $grid->column('send_method','发货方式')->using(\App\Models\InventoryOut::SEND_METHOD);
            $grid->column('status','发货计划状态')->using(\App\Models\InventoryOut::SHIPMENT_STATUS);
            $grid->column('note','备注');
            $grid->column('from_address','发货地址');
            $grid->column('fba_reference_id','FBA参考号');
            $grid->column('irobot_shipment_id','赛盒发货编号');

            $grid->tools(function (Grid\Tools $tools) {
                // excle 导入
                $tools->append(new UploadShipmeent());
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
            $grid->fixColumns(3);

            $grid->showQuickEditButton();
            $grid->model()->orderBy("id", "asc");
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
        return Show::make($id, new InventoryOut(), function (Show $show) {
            // $show->field('id');
            $show->field('listing_id');
            $show->field('irobot_shipment_id');
            $show->field('fbaid');
            $show->field('fba_reference_id');
            $show->field('send_number');
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
        return Form::make(new InventoryOut(), function (Form $form) {
            $form->select('listing_id', '选择Listing')->options(ListingModel::pluck('irobot_sku', 'id'))->loadpku(route('dcat.admin.api.listing.find'))->default('1')->required();
            $form->text('irobot_shipment_id');
            $form->text('fbaid');
            $form->text('fba_reference_id');
            $form->text('send_number');
            $form->text('from_address');
            $form->text('to_country');
            $form->text('fba_code');
            $form->text('address');
            $form->text('postcode');
            $form->date('date_create_ship');
            $form->text('carrier_name');
            $form->text('tracking_num','物流跟踪号');
            $form->select('send_method','发货方式')->options(\App\Models\InventoryOut::SEND_METHOD);
            $form->select('status','货件状态')->options(\App\Models\InventoryOut::SHIPMENT_STATUS);
            $form->textarea('note');
            $form->file('carrier_file','物流形式发票')->autoUpload()->downloadable()->maxSize(3069)->accept('xls,xlsx');;//3M
            $form->file('carrier_pdf','箱麦')->autoUpload()->downloadable()->maxSize(3069)->accept('pdf');//3M
            // $form->mediaSelector('avatar1', '头像2')->rules('required', [
            //             'required' => '请输上传或选择封面'
            //         ])->options([
            //             'length' => 20,
            //             'type' => 'blend',
            //             'sortable' => true,
            //             'move' => json_encode(['dir' => 'upload_files', 'fileNameIsEncrypt' => true]),
            //         ])->help('混合多媒体选择，拖动排序。限制上传或选择20个媒体');
            // $form->photo('photo','图片')
            //     ->nametype('datetime')
            //     ->remove(true)
            //     ->help('单图，可删除');
        });
    }
}
