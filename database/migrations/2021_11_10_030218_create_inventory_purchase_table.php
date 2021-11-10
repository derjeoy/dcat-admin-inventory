<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInventoryPurchaseTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inventory_purchase', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('listing_id')->comment('listing ID');
            $table->dateTime('date')->comment('采购日期');
            $table->integer('units_number')->comment('采购数目');
            $table->string('unit_price')->default('')->comment('采购单价');
            $table->integer('already_send')->comment('已发货数目');
            $table->string('status')->default('')->comment('订单状态');
            $table->string('备注')->nullable()->comment('备注');
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
        Schema::dropIfExists('inventory_purchase');
    }
}
