<?php

/*
 * // +----------------------------------------------------------------------
 * // | erp
 * // +----------------------------------------------------------------------
 * // | Copyright (c) 2006~2020 erp All rights reserved.
 * // +----------------------------------------------------------------------
 * // | Licensed ( LICENSE-1.0.0 )
 * // +----------------------------------------------------------------------
 * // | Author: yxx <1365831278@qq.com>
 * // +----------------------------------------------------------------------
 */

namespace App\Admin\Extensions\Form;

use Dcat\Admin\Form;
use Dcat\Admin\Admin;

class Select
{
    public static function macro(): void
    {
        static::loadpku();
    }

    protected static function loadpku(): void
    {
        // 加载pku动态选择
        Form\Field\Select::macro('loadpku', function ($sourceUrl) {
            $sourceUrl  = admin_url($sourceUrl);
            $asin  = static::FIELD_CLASS_PREFIX . 'asin';

            $script = <<<JS
$(document).off('change', "{$this->getElementClassSelector()}");
$(document).on('change', "{$this->getElementClassSelector()}", function () {
     var asin = $(this).closest('.fields-group').find(".$asin");
    console.log(asin);
    console.log(this.value);
    $.ajax("$sourceUrl?q="+this.value).then(function (data) {
        asin.val(data.data.asin);
    });
});
$("{$this->getElementClassSelector()}").trigger('change');
JS;

            Admin::script($script);

            return $this;
        });
    }
}
