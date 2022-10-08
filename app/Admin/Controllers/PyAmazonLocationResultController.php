<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\PyAmazonLocationResult;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Layout\Content;

class PyAmazonLocationResultController extends AdminController
{
    public function index(Content $content)
    {
        return $content
            ->header('亚马逊ASIN关键词位置报告')
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
        return Grid::make(new PyAmazonLocationResult(), function (Grid $grid) {
            $grid->column('id','序号')->sortable()->width(50);
            $grid->column('scrapy_time','爬取时间')->sortable()->width(200);
            $grid->column('image','首图')->image(function() {
                return $this->image;
            },50,50)->sortable();
            $grid->column('country','国家')->sortable();
            $grid->column('asin','ASIN')->sortable()->width(50);
            $grid->column('review','评分')->width(100)->sortable();
            $grid->column('price','价格')->width(100)->sortable();
            $grid->column('location','自然搜索排名')->sortable()->width(100);
            $grid->column('ads_location','广告位位置')->sortable()->width(100);
            $grid->column('keyword','关键词');
         
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('country','国家');
                $filter->equal('asin','ASIN');
                $filter->like('keyword','关键词(模糊匹配)');
                $filter->between('created_at')->datetime();
            });
            $grid->paginate(100); //分页默认一页10条
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
        return Show::make($id, new PyAmazonLocationResult(), function (Show $show) {
            $show->field('id');
            $show->field('scrapy_time');
            $show->field('country');
            $show->field('asin');
            $show->field('keyword');
            $show->field('location');
            $show->field('ads_location');
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
        return Form::make(new PyAmazonLocationResult(), function (Form $form) {
            $form->display('id');
            $form->text('scrapy_time');
            $form->text('country');
            $form->text('asin');
            $form->text('keyword');
            $form->text('location');
            $form->text('ads_location');
        
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
