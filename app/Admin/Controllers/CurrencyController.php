<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Currency;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class CurrencyController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Currency(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('country');
            $grid->column('currency');
            $grid->date('date');
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
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
        return Show::make($id, new Currency(), function (Show $show) {
            $show->field('id');
            $show->field('country');
            $show->field('currency');
            $show->field('date');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Currency(), function (Form $form) {
            $form->display('id');
            $form->text('country');
            $form->text('currency');
            $form->date('date');
        });
    }
}
