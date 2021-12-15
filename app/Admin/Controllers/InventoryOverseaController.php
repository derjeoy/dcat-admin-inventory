<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\InventoryOversea;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Layout\Content;

class InventoryOverseaController extends AdminController
{
    public function index(Content $content)
    {
        return $content
            ->header('海外仓库存')
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
        return Grid::make(new InventoryOversea(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('irobot_id');
            $grid->column('country');
            $grid->column('address');
            $grid->column('note');
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });

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
        return Show::make($id, new InventoryOversea(), function (Show $show) {
            $show->field('id');
            $show->field('irobot_id');
            $show->field('country');
            $show->field('address');
            $show->field('number');
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
        return Form::make(new InventoryOversea(), function (Form $form) {
            $form->display('id');
            $form->text('irobot_id');
            $form->text('country');
            $form->text('address');
            $form->text('note');
    
        });
    }
}
