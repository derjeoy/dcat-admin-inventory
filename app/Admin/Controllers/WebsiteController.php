<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Website;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Layout\Content;
class WebsiteController extends AdminController
{

    public function index(Content $content)
    {
        return $content
            ->header('网址导航')
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
        return Grid::make(new Website(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('category','分类')->sortable();
            $grid->column('name_en','网址英文名');
            $grid->column('name_cn','网址中文名');
            $grid->column('url','网址')->link();
            $grid->column('icon','网站图标')->image('',50,50);;
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('category','分类');
        
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
        return Show::make($id, new Website(), function (Show $show) {
            $show->field('id');
            $show->field('name_en');
            $show->field('name_cn');
            $show->field('url');
            $show->field('icon');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Website(), function (Form $form) {
            $form->display('id');
            $form->text('category','分类');
            $form->text('name_en');
            $form->text('name_cn');
            $form->text('url');
            $form->image('icon','请上传网站LOGO');
        });
    }
}
