<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\ProductInterest;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Admin;

class ProductInterestController extends AdminController
{
    public function index(Content $content)
    {
        return $content
            ->header('产品调研')
            ->description('')
            ->body($this->grid());
    }
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new ProductInterest(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('image','产品图片')->image('',50,50);
            // $grid->column('label','标记')->select(\App\Models\ProductInterest::LABEL_STATUS)->sortable()->help('0-有兴趣；1-没有兴趣');//->label(\App\Models\ProductInterest::STATUS_COLOR);
            // $grid->column('chooseornot','调研与否')->select(\App\Models\ProductInterest::LABEL_STATUS)->sortable()->help('0-未调研；1-已调研');
            $grid->column('country','国家')->select(\App\Models\ProductInterest::COUNTRY_CODE)->sortable();;
            $grid->column('asin','链接')->limit(30)->link(function() {
                if (strlen($this->asin) > 10)
                    return $this->asin;
                else
                    if ($this->country == 1)
                        return 'https://www.amazon.ca/dp/'.$this->asin;
                    else if ($this->country == 0)
                        return 'https://www.amazon.com/dp/'.$this->asin;
                    else
                        return ;
            });
            $grid->column('keyword','关键词')->limit(30);
            $grid->column('name','产品名称')->limit(30);
            $grid->column('store','卖家店铺')->limit(30)->link(function() {
                if (strlen($this->store) > 0)
                    return $this->store;

            });
            $grid->column('bs_category','分类')->limit(30)->sortable();;
            $grid->column('amz_price','亚马逊售价')->editable(true);
            $grid->column('created_at','添加时间')->sortable();//orderBy('created_at', 'desc');
            $grid->column('owner','添加人')->sortable();;
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('country','国家');
                $filter->equal('bs_category','分类');
        
            });


            // 禁止按钮边框
            $grid->toolsWithOutline(false);
            //$grid->fixColumns(3);
            $grid->showQuickEditButton();

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
        return Show::make($id, new ProductInterest(), function (Show $show) {
            $show->field('id');
            $show->image('image');
            $show->field('asin');
            $show->field('store');
            $show->field('bs_category');
            $show->field('amz_price');
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
        return Form::make(new ProductInterest(), function (Form $form) {
            $form->display('id');
            $form->select('label','有兴趣吗？')->options(\App\Models\ProductInterest::LABEL_STATUS)->default(0, true);
            $form->select('country','国家')->default(1, true)->options(\App\Models\ProductInterest::COUNTRY_CODE);
            $form->text('asin','产品链接');
            $form->text('name','产品名字');
            $form->text('keyword','关键词');
            $form->text('bs_category','分类')->default('万圣节', true);
            $form->image('image','产品图片')->autoUpload();
        
            $form->text('owner','添加人')->default(Admin::user()->name, true);
            
            $form->text('store');
            
            $form->text('amz_price');
        
        });
    }
}
