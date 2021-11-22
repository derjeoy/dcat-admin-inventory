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
            $table->string('asin')->comment('亚马逊ASIN');
            $table->string('upc')->nullable();
            $table->string('irobot_sku')->default('');
            $table->string('addbyuser')->default('')->comment('添加产品用户');
            $table->string('unit_size')->default('')->comment('产品尺寸');
            $table->string('unit_weight')->default('')->comment('产品重量');
            $table->string('box_size')->default('')->comment('装箱尺寸');
            $table->string('box_weight')->default('')->comment('装箱重量');
            $table->string('numberperbox')->default('')->comment('装箱个数');
            $table->string('amz_listing')->default('')->comment('参考亚马逊链接');
            $table->string('purchasemethod')->default('')->comment('采购链接');
            $table->string('image_column')->default('')->comment('产品图片');
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
