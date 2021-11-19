<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFCWarehouseTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('f_c_warehouse', function (Blueprint $table) {
            $table->increments('id');
            $table->enum('COUNTRY', ['USA', 'CA', 'JP', 'UK', 'ES', 'DE', 'FR', 'IT', 'AU'])->default('USA')->comment('国家');
            $table->string('COMPANY_NAME')->default('')->comment('收货人公司名');
            $table->string('FC')->default('')->comment('FBA仓库代码');
            $table->string('POSTAL_CODE')->default('')->comment('邮编');
            $table->string('STATES')->comment('州');
            $table->string('CITY')->default('')->comment('城市');
            $table->string('ADDRESS')->default('')->comment('地址');
            $table->string('TYPE')->default('')->comment('仓库类型');
            $table->string('POD')->nullable()->comment('对应港口');
            $table->string('note')->nullable()->comment('备注');
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
        Schema::dropIfExists('f_c_warehouse');
    }
}
