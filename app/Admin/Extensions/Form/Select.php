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

            $fba_fee  = static::FIELD_CLASS_PREFIX . 'fba_fee';
            $amz_sale_commssion  = static::FIELD_CLASS_PREFIX . 'amz_sale_commssion';
            $latest_transportation_unitfee  = static::FIELD_CLASS_PREFIX . 'latest_transportation_unitfee';

            $profit  = static::FIELD_CLASS_PREFIX . 'profit';
            $profit_rate  = static::FIELD_CLASS_PREFIX . 'profit_rate';
            $exchange  = static::FIELD_CLASS_PREFIX . 'exchange';

            $fba_current_inventory  = static::FIELD_CLASS_PREFIX . 'fba_current_inventory';
            $fba_current_transfer  = static::FIELD_CLASS_PREFIX . 'fba_current_transfer';


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

     var fba_fee = $(this).closest('.fields-group').find(".$fba_fee");
     var amz_sale_commssion = $(this).closest('.fields-group').find(".$amz_sale_commssion");
     var latest_transportation_unitfee = $(this).closest('.fields-group').find(".$latest_transportation_unitfee");

     var profit = $(this).closest('.fields-group').find(".$profit");
     var profit_rate = $(this).closest('.fields-group').find(".$profit_rate");
     var exchange = $(this).closest('.fields-group').find(".$exchange");
     var exchange_data = exchange.val();
     console.log(exchange_data);

     var fba_current_inventory = $(this).closest('.fields-group').find(".$fba_current_inventory");
     var fba_current_transfer = $(this).closest('.fields-group').find(".$fba_current_transfer");



    $.ajax("$sourceUrl?q="+this.value).then(function (data) {
        asin.val(data.data.asin);
        country.val(data.data.country);
        irobot_sku.val(data.data.irobot_sku);
        amz_account.val(data.data.amz_account);
        amz_sku.val(data.data.amz_sku);
        fnsku.val(data.data.fnsku);
        price.val(data.data.price);
        saler.val(data.data.saler);

        fba_fee.val(parseFloat(data.data.fba_fee).toFixed(2));
        amz_sale_commssion.val(parseFloat(data.data.amz_sale_commssion).toFixed(2));
        latest_transportation_unitfee.val(parseFloat(data.data.latest_transportation_unitfee/exchange_data).toFixed(2));

        var profitnumber =  data.data.price - data.data.fba_fee - data.data.amz_sale_commssion - data.data.latest_transportation_unitfee/exchange_data;  
        profit.val(parseFloat(profitnumber).toFixed(2));

        profit_rate.val(parseFloat(profitnumber/data.data.price*100).toFixed(2));

        fba_current_inventory.val(data.data.fba_current_inventory);
        fba_current_transfer.val(data.data.fba_current_transfer);


    });
});
$("{$this->getElementClassSelector()}").trigger('change');
JS;

            Admin::script($script);

            return $this;
        });
    }
}
