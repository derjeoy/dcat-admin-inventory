<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePyAmazonInputTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('py_amazon_input', function (Blueprint $table) {
            $table->increments('id');
            $table->string('country')->default('CA');
            $table->string('asin')->default('');
            $table->string('keyword')->default('');
            $table->string('moniter_flag')->default('Y');
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
        Schema::dropIfExists('py_amazon_input');
    }
}
