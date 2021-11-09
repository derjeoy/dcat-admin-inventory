<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableListingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('table_listings', function (Blueprint $table) {
            $table->increments('id');
            $table->string('amz_account')->default('')->comment('亚马逊账号名称');
            $table->string('country')->default('')->comment('国家');
            $table->string('amz_sku')->default('')->comment('亚马逊SKU');
            $table->string('asin')->default('')->comment('亚马逊ASIN');
            $table->string('fnsku')->default('')->comment('FNSKU');
            $table->string('local_name')->default('')->comment('本土语言产品名称');
            $table->string('upc')->nullable();
            $table->string('irobot_sku')->default('')->comment('赛盒SKU');
            $table->string('saler')->default('')->comment('所属销售');
            $table->string('price')->default('')->comment('产品售价');
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
        Schema::dropIfExists('table_listings');
    }
}
