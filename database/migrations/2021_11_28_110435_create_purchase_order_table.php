<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePurchaseOrderTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchase_order', function (Blueprint $table) {
            $table->increments('id');
            $table->string('irobot_id')->nullable()->comment('产品SKU');
            $table->integer('number')->nullable()->comment('采购数目');
            $table->date('date')->nullable()->comment('采购单日期');
            $table->string('person')->nullable()->comment('采购人员');
            $table->string('note')->default('')->comment('采购备注');
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
        Schema::dropIfExists('purchase_order');
    }
}
