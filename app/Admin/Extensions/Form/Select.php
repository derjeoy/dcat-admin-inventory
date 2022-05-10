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
            

            $listing_id  = static::FIELD_CLASS_PREFIX . 'listing_id';


            $script = <<<JS
$(document).off('change', "{$this->getElementClassSelector()}");
$(document).on('change', "{$this->getElementClassSelector()}", function () {
     
     var listing_id = $(this).closest('.fields-group').find(".$listing_id");



    $.ajax("$sourceUrl?q="+this.value).then(function (data) {
        
        listing_id.val(data.data.listing_id);
    });
});
$("{$this->getElementClassSelector()}").trigger('change');
JS;

            Admin::script($script);

            return $this;
        });
    }
}
