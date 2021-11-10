<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInventoryOverseasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inventory_overseas', function (Blueprint $table) {
            $table->increments('id');
            $table->string('irobot_id')->default('')->comment('赛盒SKU');
            $table->string('country')->default('')->comment('仓库国家');
            $table->string('address')->default('')->comment('仓库地址');
            $table->string('note')->nullable()->comment('备注');
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
        Schema::dropIfExists('inventory_overseas');
    }
}
