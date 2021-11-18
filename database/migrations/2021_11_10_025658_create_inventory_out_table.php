<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInventoryOutTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inventory_out', function (Blueprint $table) {
            $table->increments('id');
            $table->string('listing_id')->default('')->comment('评论数目');
            $table->string('irobot_shipment_id')->default('');
            $table->string('fbaid')->default('')->comment('发货Shipment ID');
            $table->string('fba_reference_id')->default('')->comment('FBA参考ID');
            $table->string('from_address')->default('')->comment('发货地址');
            $table->string('to_country')->default('')->comment('目的国家');
            $table->string('fba_code')->default('')->comment('FBA仓库代码');
            $table->string('address')->default('')->comment('FBA仓库代码详细地址');
            $table->string('postcode')->default('')->comment('目的仓库邮编');
            $table->date('date_create_ship')->default('')->comment('提交发货计划日期');
            $table->string('carrier_name')->default('')->comment('承运商');
            $table->string('send_method')->default('')->comment('发货方式');
            $table->string('status')->default('')->comment('出库单状态');
            $table->string('note')->default('')->comment('备注');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('inventory_out');
    }
}
