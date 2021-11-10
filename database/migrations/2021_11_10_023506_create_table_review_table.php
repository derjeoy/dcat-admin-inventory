<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableReviewTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('table_review', function (Blueprint $table) {
            $table->increments('id');
            $table->string('listing_id')->default('')->comment('listing ID');
            $table->string('rew_number')->default('')->comment('评论数目');
            $table->string('rew_rate')->default('')->comment('评论星级');
            $table->string('date')->default('')->comment('评论统计日期');
            $table->string('note')->nullable()->comment('备注:记录意外状况等');
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
        Schema::dropIfExists('table_review');
    }
}
