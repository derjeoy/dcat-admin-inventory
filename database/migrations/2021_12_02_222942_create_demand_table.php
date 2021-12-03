<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDemandTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('demand', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title')->comment('需求标题');
            $table->string('content')->nullable()->comment('需求描述');
            $table->unsignedTinyInteger('type')->default('0')->comment('需求类型');
            $table->unsignedTinyInteger('status')->default('0')->nullable()->comment('状态');
            $table->string('reply')->default('')->nullable()->comment('开发回复');
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
        Schema::dropIfExists('demand');
    }
}
