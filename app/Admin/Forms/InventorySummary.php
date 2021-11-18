<?php

namespace App\Admin\Forms;

use Dcat\Admin\Contracts\LazyRenderable;
use Dcat\Admin\Traits\LazyWidget;
use Dcat\Admin\Widgets\Form;

class InventorySummary extends Form implements LazyRenderable
{
    use LazyWidget;

    public function form()
    {
        $this->column(3, function (Form $form) {
                $form->display('')->default('产品基本信息');
                $form->divider();
            });

        $this->column(3, function (Form $form) {
                $form->display('')->default($this->payload['id']);
                $form->divider();
            });
        $this->column(6, function (Form $form) {
                $form->display('')->default('利润表');
                $form->divider();
                $form->text('price', '售价$')->default($this->payload['price'])->disable();
            });
    }
}
