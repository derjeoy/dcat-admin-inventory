<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFbaListingTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fba_listing', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('listing_id')->comment('评论数目');
            $table->string('fbaid')->default('')->comment('发货Shipment ID');
            $table->string('send_number')->default('');
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
        Schema::dropIfExists('fba_listing');
    }
}
