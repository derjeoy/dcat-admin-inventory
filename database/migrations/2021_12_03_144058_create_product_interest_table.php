<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductInterestTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_interest', function (Blueprint $table) {
            $table->increments('id');
            $table->string('image')->default('')->comment('产品主图');
            $table->string('asin')->default('')->comment('产品SKU');
            $table->string('store')->default('')->comment('店铺');
            $table->string('bs_category')->default('')->comment('类目');
            $table->string('amz_price')->default('')->comment('产品售价');
            $table->string('country')->default('')->comment('国家');
            $table->string('keyword')->default('')->comment('关键词');
            $table->string('name')->default('')->comment('名字');
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
        Schema::dropIfExists('product_interest');
    }
}
