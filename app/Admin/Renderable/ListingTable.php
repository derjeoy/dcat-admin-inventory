<?php

namespace App\Admin\Renderable;

use Dcat\Admin\Grid;
use Dcat\Admin\Grid\LazyRenderable;
use Dcat\Admin\Models\Administrator;

class ListingTable extends LazyRenderable
{
    public function grid(): Grid
    {
        return Grid::make(new Administrator(), function (Grid $grid) {
            $grid->column('id', 'ID')->sortable();
            $grid->column('username');
            $grid->column('name');

            $grid->disableActions();
            $grid->disableRowSelector();
            $grid->showQuickEditButton();
            $grid->disableRefreshButton();
            $grid->disableToolbar();
        });
    }
}
