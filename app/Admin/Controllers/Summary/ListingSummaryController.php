<?php

namespace App\Admin\Controllers\Summary;

use App\Admin\Repositories\NullRepository;
use Dcat\Admin\Form;
use Dcat\Admin\Layout\Content;
use App\Models\ListingModel;

class ListingSummaryController
{
    public function create(Content $content)
    {
        return $content
            ->title('Listing详情')
            ->description('展现listing各个维度信息')
            ->body($this->form());
    }

    protected function form()
    {
        return Form::make(new NullRepository(), function (Form $form) {

            $form->disableListButton();
            $form->disableViewButton();
            $form->disableDeleteButton();

            // 第一列占据1/3的页面宽度
            $form->column(3, function (Form $form) {
                $form->display('')->default('产品基本信息');
                $form->divider();
                $form->select('selected_listing_id', '选择链接')->options(ListingModel::pluck('irobot_sku', 'id'))->loadpku(route('dcat.admin.api.listing.find'))->default('1')->required();
                $form->ipt('country', '国家')->default('-')->disable();
                $form->ipt('asin', 'ASIN')->default('-')->disable();
                $form->ipt('irobot_sku', '赛盒ID')->default('-')->disable();
                $form->ipt('amz_account', '账号名')->default('-')->disable();
                $form->ipt('amz_sku', '平台SKU')->default('-')->disable();
                $form->ipt('fnsku', 'FNSKU')->default('-')->disable();
                $form->ipt('saler', '负责人')->default('-')->disable();
            });
            // 第二列占据1/3的页面宽度
            $form->column(3, function (Form $form) {
                $form->display('')->default('利润率');
                $form->divider();
                $form->ipt('exchange', '汇率')->default('7.6');
                $form->ipt('price', '售价$')->default('-');
                $form->ipt('fba_fee', 'FBA运费$')->default('-');
                $form->ipt('amz_sale_commssion', '销售佣金$')->default('-');
                $form->ipt('latest_transportation_unitfee', '单个运费$')->default('-');
                $form->ipt('profit', '利润$')->default('-')->disable();
                $form->ipt('profit_rate', '利润率%')->default('-')->disable();
            });

            // 第二列占据1/3的页面宽度
            $form->column(6, function (Form $form) {
                $form->display('库存情况');
                $form->divider();
                $form->tags('库存情况','1,2,3');
                $form->ipt('fba_current_inventory', 'FBA实时库存')->default('-')->disable();
                $form->ipt('fba_current_transfer', 'FBA转运库存')->default('-')->disable();
                $form->ipt('fba_carrier', 'FBA在途库存')->default('-')->disable();
                $form->ipt('inv_overseas', '海外仓实时库存')->default('-')->disable();
                $form->ipt('inv_overseas_carrier', '海外仓在途库存')->default('-')->disable();
                $form->ipt('inv_order', '国内库存')->default('-')->disable();
                //$form->row();
            });
        });

        
    }
}
