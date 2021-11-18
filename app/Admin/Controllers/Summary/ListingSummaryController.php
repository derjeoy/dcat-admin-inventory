<?php

namespace App\Admin\Controllers\Summary;

use App\Admin\Repositories\NullRepository;
use Dcat\Admin\Form;
use Dcat\Admin\Layout\Content;
use App\Models\ListingModel;
use Dcat\Admin\Widgets\Tab;


class ListingSummaryController
{
    public function create(Content $content)
    {
        $tab = Tab::make();

        return $content
            ->title('Listing详情')
            ->description('展现listing各个维度信息')
            // ->body($this->form());
            //->body($this->form_row())
            ->body($this->form());
            //->body($this->table());

    }

    protected function form_row()
    {
        return Form::make(new NullRepository(), function (Form $form) {
            $form->disableListButton();
            $form->disableViewButton();
            $form->disableDeleteButton();

            $form->row(function ($form) {
                $form->width(12)->display('')->default('产品基本信息');
                $form->width(2)->select('selected_listing_id', '选择链接')->options(ListingModel::pluck('irobot_sku', 'id'))->loadpku(route('dcat.admin.api.listing.find'))->default('1')->required();
                $form->width(2)->ipt('country', '国家')->default('-')->disable();
                $form->width(2)->ipt('asin', 'ASIN')->default('-')->disable();
                $form->width(2)->ipt('irobot_sku', '赛盒ID')->default('-')->disable();
                $form->width(2)->ipt('amz_account', '账号名')->default('-')->disable();
                $form->width(2)->ipt('amz_sku', '平台SKU')->default('-')->disable();
                $form->width(2)->ipt('fnsku', 'FNSKU')->default('-')->disable();
                $form->width(2)->ipt('saler', '负责人')->default('-')->disable();
            });
            
            $form->row(function ($form) {
                $form->width(12)->divider();
            });

            $form->row(function ($form) {
                $form->width(12)->display('')->default('利润率');
                $form->width(2)->ipt('exchange', '汇率')->default('7.6');
                $form->width(2)->ipt('price', '售价$')->default('-');
                $form->width(2)->ipt('fba_fee', 'FBA运费$')->default('-');
                $form->width(2)->ipt('amz_sale_commssion', '销售佣金$')->default('-');
                $form->width(2)->ipt('latest_transportation_unitfee', '单个运费$')->default('-');
                $form->width(3)->ipt('profit', '利润$')->default('-')->disable();
                $form->width(3)->ipt('profit_rate', '利润率%')->default('-')->disable();
            });
            $form->row(function ($form) {
                $form->width(12)->divider();
            });
            $form->row(function ($form) {
                $form->width(12)->display('')->default('库存信息');
            });
        });
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
                $form->display('')->default('库存数据');
                $form->divider();
                $form->ipt('fba_current_inventory', 'FBA实时库存')->default('-')->disable();
                $form->ipt('fba_current_transfer', 'FBA转运库存')->default('-')->disable();
                $form->ipt('fba_carrier', 'FBA在途库存')->default('-')->disable();
                $form->ipt('inv_overseas', '海外仓实时库存')->default('-')->disable();
                $form->ipt('inv_overseas_carrier', '海外仓在途库存')->default('-')->disable();
                $form->ipt('inv_order', '国内库存')->default('-')->disable();

                $form->hasMany('address', '在途库存', function (Form\NestedForm $form) {
                        $form->display('address', '类型');
                        $form->ipt('address', '货件ID')->disable();
                        $form->ipt('address', '预计到达日期')->disable();
                        $form->ipt('address', '跟踪号')->disable();
                        $form->ipt('address', '物流商')->disable();
                        $form->ipt('address', '备注')->disable();
                        })->useTable();

            });
        });

        
    }
}
