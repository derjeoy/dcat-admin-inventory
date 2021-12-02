<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSalesSummeryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sales_summery', function (Blueprint $table) {
            $table->increments('id');
            $table->string('picture')->default('')->comment('商品图片');
            $table->string('asin')->default('')->comment('ASIN');
            $table->string('name_local')->default('')->comment('商品名称');
            $table->string('sku')->default('')->comment('SKU');
            $table->string('taday_order_number')->default('')->comment('今日销量');
            $table->string('taday_order_ammount')->default('')->comment('今日销售额');
            $table->string('today_average_price')->default('')->comment('今日单价');
            $table->string('yesterday_order_number')->default('')->comment('昨日销量');
            $table->string('yesterday_order_ammount')->default('')->comment('昨日销售额');
            $table->string('yesterday_order_price')->default('')->comment('昨日单价');
            $table->string('lastweekday_order_number')->default('')->comment('昨日销售额销量');
            $table->string('lastweekday_order_ammount')->default('')->comment('昨日销售额销售额');
            $table->string('lastweekday_order_price')->default('')->comment('昨日销售额单价');
            $table->string('inventory_salable')->default('')->comment('可售库存');
            $table->string('inventory_receivable')->default('')->comment('待收货库存');
            $table->string('inventory_movable')->default('')->comment('转库中库存');
            $table->string('note')->default('')->comment('备注');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sales_summery');
    }
}
