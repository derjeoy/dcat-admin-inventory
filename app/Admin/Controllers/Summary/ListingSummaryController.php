<?php

namespace App\Admin\Controllers\Summary;

use App\Admin\Repositories\NullRepository;
use Dcat\Admin\Form;
use Dcat\Admin\Layout\Content;
use App\Models\TableListing;

class ListingSummaryController
{
    public function create(Content $content)
    {
        return $content
            ->title('Listing详情')
            ->description('展现listing各个维度信息')
            ->body($this->form());
    }

    protected $options = [
            1 => '显示文本框',
            2 => '显示编辑器',
            3 => '显示文件上传',
            4 => '还是显示文本框',
            ];

    protected function form()
    {
        $listing_id = 1;
        //dd(TableListing::find($listing_id));
        $listings = TableListing::get();
        foreach($listings as $v){
            $options[] = $v->asin;
        }
        
        return Form::make(new TableListing(), function (Form $form) {

            $form->block(8, function (Form\BlockForm $form) {
                
                // 设置标题
                $form->title('产品基本信息');
                // 设置字段宽度
                $form->width(6, 4);

                $form->column(4, function (Form\BlockForm $form) {
                    $form->select('Listing列表')->options(function ($id) {
                        $listing = TableListing::find($id);

                        if ($listing) {
                            return [$listing->asin => $listing->asin];
                        }
                    });//->ajax('api/listing');
                });
                
                    

                $form->column(4, function (Form\BlockForm $form) {
                    $form->image('');
                });

                $form->column(4, function (Form\BlockForm $form) {
                    //$form->amz_account;
                    $form->display('country');
                    $form->display('amz_sku');
                    $form->display('asin');
                    $form->display('fnsku');
                });
            });

            $form->block(8, function (Form\BlockForm $form) {
                // 设置标题
                $form->title('基本设置');

                // 显示底部提交按钮
                $form->showFooter();

                // 设置字段宽度
                $form->width(9, 2);

                $form->column(6, function (Form\BlockForm $form) {
                    $form->display('id');
                    $form->text('name');
                    $form->email('email');
                    $form->image('avatar');
                    $form->password('password');
                });

                $form->column(6, function (Form\BlockForm $form) {
                    $form->text('username');
                    $form->email('mobile');
                    $form->textarea('description');
                });
            });
            $form->block(4, function (Form\BlockForm $form) {
                $form->title('分块2');

                $form->text('nickname');
                $form->number('age');
                $form->radio('status')->options(['1' => '默认', 2 => '冻结'])->default(1);

                $form->next(function (Form\BlockForm $form) {
                    $form->title('分块3');

                    $form->date('birthday');
                    $form->date('created_at');
                });
            });


        });
    }
}
