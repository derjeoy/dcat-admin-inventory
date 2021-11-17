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
            // 第一列占据1/3的页面宽度
            $form->column(4, function (Form $form) {
                $form->select('selected_listing_id', '选择Listing')->options(ListingModel::pluck('irobot_sku', 'id'))->loadpku(route('dcat.admin.api.listing.find'))->default('1')->required();
                $form->ipt('country', '国家')->default('-')->disable();
                $form->ipt('asin', 'ASIN')->default('-')->disable();
                $form->ipt('irobot_sku', '赛盒ID')->default('-')->disable();
                $form->ipt('amz_account', '账号名')->default('-')->disable();
                $form->ipt('amz_sku', '平台SKU')->default('-')->disable();
                $form->ipt('fnsku', 'FNSKU')->default('-')->disable();
                $form->ipt('price', '售价')->default('-')->disable();
                $form->ipt('saler', '负责人')->default('-')->disable();
            });
            // 第二列占据1/3的页面宽度
            $form->column(4, function (Form $form) {
                $form->image('avatar');
                $form->decimal('wages');
                $form->decimal('fund');
                $form->decimal('pension');
                $form->decimal('fee');
                $form->decimal('business');
                $form->decimal('other');
                $form->text('area')->default(0);
                $form->textarea('illness');
                $form->textarea('comment');
            });

            // 第二列占据1/3的页面宽度
            $form->column(4, function (Form $form) {
                $form->image('avatar');
                $form->decimal('wages');
                $form->decimal('fund');
                $form->decimal('pension');
                $form->decimal('fee');
                $form->decimal('business');
                $form->decimal('other');
                $form->text('area')->default(0);
                $form->textarea('illness');
                $form->textarea('comment');
            });



        });

        
    }
}
