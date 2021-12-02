<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\FCWarehouse;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use App\Admin\Actions\Grid\UploadFCWarehouse;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Layout\Row;
use App\Admin\Metrics\Examples\NewDevices;
use App\Admin\Metrics\Examples\NewUsers;
use App\Admin\Metrics\Examples\TotalUsers;

class FCWarehouseController extends AdminController
{

    public function index(Content $content)
    {
        return $content
            ->header('亚马逊仓库')
            ->description('列表')
            ->body(function (Row $row) {
                $row->column(4, new TotalUsers());
                $row->column(4, new NewUsers());
                $row->column(4, new NewDevices());
            })
            ->body($this->grid());
    }

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
            $grid->column('FC');
            $grid->column('POSTAL_CODE');
            $grid->column('STATES');
            $grid->column('CITY');
            $grid->column('ADDRESS');
            $grid->column('COMPANY_NAME');
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

            $grid->toolsWithOutline(false);
            $grid->fixColumns(1);

            //$grid->showQuickEditButton();

            //$grid->disableActions();
            
            $grid->disableRowSelector();
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
