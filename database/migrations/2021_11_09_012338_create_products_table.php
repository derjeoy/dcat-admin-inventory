<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name_chinese')->default('')->comment('中文产品名称');
            $table->string('name_english')->default('')->comment('英文产品名称');
            $table->timestamp('asin')->comment('亚马逊ASIN');
            $table->string('upc')->nullable();
            $table->string('irobot_sku')->default('');
            $table->string('addbyuser')->default('')->comment('添加产品用户');
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
        Schema::dropIfExists('products');
    }
}
