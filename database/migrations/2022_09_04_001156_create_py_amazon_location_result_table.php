<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePyAmazonLocationResultTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('py_amazon_location_result', function (Blueprint $table) {
            $table->increments('id');
            $table->string('scrapy_time')->default('');
            $table->string('country')->default('');
            $table->string('asin')->default('');
            $table->string('keyword')->default('');
            $table->string('location')->default('');
            $table->string('ads_location')->default('');
            $table->string('price')->default('');
            $table->string('image')->default('');
            $table->string('review')->default('');
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
        Schema::dropIfExists('py_amazon_location_result');
    }
}
