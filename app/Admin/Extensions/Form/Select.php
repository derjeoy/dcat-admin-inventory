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
            $country  = static::FIELD_CLASS_PREFIX . 'country';
            $irobot_sku  = static::FIELD_CLASS_PREFIX . 'irobot_sku';
            $amz_account  = static::FIELD_CLASS_PREFIX . 'amz_account';
            $amz_sku  = static::FIELD_CLASS_PREFIX . 'amz_sku';
            $fnsku  = static::FIELD_CLASS_PREFIX . 'fnsku';
            $price  = static::FIELD_CLASS_PREFIX . 'price';
            $saler  = static::FIELD_CLASS_PREFIX . 'saler';

            $script = <<<JS
$(document).off('change', "{$this->getElementClassSelector()}");
$(document).on('change', "{$this->getElementClassSelector()}", function () {
     var asin = $(this).closest('.fields-group').find(".$asin");
     var country = $(this).closest('.fields-group').find(".$country");
     var irobot_sku = $(this).closest('.fields-group').find(".$irobot_sku");
     var amz_account = $(this).closest('.fields-group').find(".$amz_account");
     var amz_sku = $(this).closest('.fields-group').find(".$amz_sku");
     var fnsku = $(this).closest('.fields-group').find(".$fnsku");
     var price = $(this).closest('.fields-group').find(".$price");
     var saler = $(this).closest('.fields-group').find(".$saler");

    console.log(asin);
    console.log(this.value);
    $.ajax("$sourceUrl?q="+this.value).then(function (data) {
        asin.val(data.data.asin);
        country.val(data.data.country);
        irobot_sku.val(data.data.irobot_sku);
        amz_account.val(data.data.amz_account);
        amz_sku.val(data.data.amz_sku);
        fnsku.val(data.data.fnsku);
        price.val(data.data.price);
        saler.val(data.data.saler);
    });
});
$("{$this->getElementClassSelector()}").trigger('change');
JS;

            Admin::script($script);

            return $this;
        });
    }
}
