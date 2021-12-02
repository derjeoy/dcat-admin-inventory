<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePromotionProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('promotion_products', function (Blueprint $table) {
            $table->increments('id');
            $table->string('listing_id')->default('')->comment('产品listing');
            $table->string('brand')->nullable();
            $table->string('keyword_location')->nullable()->comment('关键词位置');
            $table->string('agent_contact')->nullable()->comment('中介联系方式');
            $table->string('store_name')->nullable();
            $table->string('asin')->nullable()->comment('ASIN');
            $table->string('name_chinese')->nullable()->comment('中文产品名称');
            $table->string('name_english')->default('')->comment('英文产品名称');
            $table->string('note')->nullable()->comment('下单备注');
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
        Schema::dropIfExists('promotion_products');
    }
}
