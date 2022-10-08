<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\PyAmazonInput;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Layout\Content;

class PyAmazonInputController extends AdminController
{
    public function index(Content $content)
    {
        return $content
            ->header('亚马逊ASIN关键词监控表')
            ->description('是否监控(Y/N)')
            ->body($this->grid());
    }
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new PyAmazonInput(), function (Grid $grid) {
            $grid->column('id','ID')->sortable();
            $grid->column('country','国家');
            $grid->column('asin','ASIN')->sortable();
            $grid->column('keyword','关键词');
            $grid->column('moniter_flag','是否继续监控');
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('country','国家');
                $filter->equal('asin','产品ASIN');
                $filter->like('keyword','关键词(模糊匹配)');
        
            });
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
        return Show::make($id, new PyAmazonInput(), function (Show $show) {
            $show->field('id');
            $show->field('country');
            $show->field('asin');
            $show->field('keyword');
            $show->field('moniter_flag');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new PyAmazonInput(), function (Form $form) {
            $form->text('country','国家')->default('CA');
            $form->text('asin','亚马逊ASIN');
            $form->text('keyword','关键词');
            $form->text('moniter_flag','是否继续监控')->default('Y');
        });
    }
}
