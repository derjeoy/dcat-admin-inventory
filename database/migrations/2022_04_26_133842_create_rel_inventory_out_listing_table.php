<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRelInventoryOutListingTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rel_inventory_out_listing', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('listing_id')->comment('评论数目');
            $table->string('fbaid')->default('')->comment('发货Shipment ID');
            $table->integer('send_number')->comment('发货数目');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('rel_inventory_out_listing');
    }
}
