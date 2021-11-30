<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\FCWarehouse;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use App\Admin\Actions\Grid\UploadFCWarehouse;

class FCWarehouseController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new FCWarehouse(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('COUNTRY');
            $grid->column('COMPANY_NAME');
            $grid->column('FC');
            $grid->column('POSTAL_CODE');
            $grid->column('STATES');
            $grid->column('CITY');
            $grid->column('ADDRESS');
            $grid->column('TYPE');
            $grid->column('POD');
            $grid->column('note');
            $grid->tools(function (Grid\Tools $tools) {
                // excle 导入
                $tools->append(new UploadFCWarehouse());
            });
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('FC');
                $filter->equal('COUNTRY');
        
            });

            $grid->fixColumns(3);
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
        return Show::make($id, new FCWarehouse(), function (Show $show) {
            $show->field('id');
            $show->field('COUNTRY');
            $show->field('COMPANY_NAME');
            $show->field('FC');
            $show->field('POSTAL_CODE');
            $show->field('STATES');
            $show->field('CITY');
            $show->field('ADDRESS');
            $show->field('TYPE');
            $show->field('POD');
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
        return Form::make(new FCWarehouse(), function (Form $form) {
            $form->display('id');
            $form->text('COUNTRY');
            $form->text('COMPANY_NAME');
            $form->text('FC');
            $form->text('POSTAL_CODE');
            $form->text('STATES');
            $form->text('CITY');
            $form->text('ADDRESS');
            $form->text('TYPE');
            $form->text('POD');
            $form->text('note');
        });
    }
}
