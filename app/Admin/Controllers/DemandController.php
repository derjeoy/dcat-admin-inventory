<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Demand;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Layout\Content;

class DemandController extends AdminController
{

    public function index(Content $content)
    {
        return $content
            ->header('系统需求')
            ->description('or Bug')
            ->body($this->grid());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Demand(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('title');
            $grid->column('status')->using(\App\Models\Demand::STATUS)->label(\App\Models\Demand::STATUS_COLOR);
            $grid->column('type')->using(\App\Models\Demand::TYPE)->label(\App\Models\Demand::TYPE_COLOR);
            $grid->column('created_at');

            $grid->toolsWithOutline(false);
            
            //$grid->disableActions();
            $grid->showQuickEditButton();
            $grid->actions(function (Grid\Displayers\Actions $actions) {
                $actions->disableView();
                $actions->disableDelete();
                $actions->disableEdit();
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
        return Show::make($id, new Demand(), function (Show $show) {
            $show->field('id');
            $show->field('content');
            $show->field('type');
            $show->field('status');
            $show->field('reply');
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
        return Form::make(new Demand(), function (Form $form) {
            $form->text('title');
            $form->markdown('content');
            $form->radio('type')->options(\App\Models\Demand::TYPE)->default(0);
            $form->markdown('reply');
            $form->select('status')->options(\App\Models\Demand::STATUS)->default(0);
        });
    }
}
