<?php

namespace App\Admin\Renderable;

use Dcat\Admin\Grid;
use Dcat\Admin\Grid\LazyRenderable;
use App\Models\FCWarehouse;

class FCWarehouseTable extends LazyRenderable
{
    public function grid(): Grid
    {
        return Grid::make(new FCWarehouse(), function (Grid $grid) {
            $grid->column('id', 'ID')->sortable();
            $grid->column('COUNTRY');
            $grid->column('FC');
            $grid->column('STATES');
            $grid->column('CITY');
            $grid->column('ADDRESS');
            $grid->column('POSTAL_CODE');
            

            $grid->quickSearch(['id', 'FC', 'COUNTRY']);

            $grid->paginate(10);
            $grid->disableActions();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->like('FC')->width(4);
                $filter->like('COUNTRY')->width(4);
            });
        });
    }
}
