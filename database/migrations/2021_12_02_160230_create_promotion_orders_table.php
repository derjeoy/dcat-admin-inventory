<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePromotionOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('promotion_orders', function (Blueprint $table) {
            $table->increments('id');
            $table->string('promotion_product_id')->default('')->comment('推广产品ID');
            $table->enum('promotion_type', ['免评','留评','Feedback','Rating','Video'])->comment('订单类型');
            $table->enum('refund_method', ['支付宝','微信','PP'])->comment('返款方式(RMBorPP)');
            $table->string('order_number')->default('')->comment('订单编号');
            $table->float('order_price')->comment('订单价格');
            $table->string('order_screenshot')->default('')->comment('订单截图');
            $table->string('review_screenshot')->default('')->comment('评论截图');
            $table->string('review_link')->default('')->comment('评论链接');
            $table->date('review_submit_date')->comment('评论提交日期');
            $table->date('review_show_date')->comment('评论显示日期');
            $table->enum('review_type', ['文字','图片','视频'])->comment('评论类型');
            $table->enum('refund_status', ['已返款','已下单','未返款'])->comment('返款状态');
            $table->date('refund_date')->comment('返款日期');
            $table->string('refund_money')->default('')->comment('返款金额');
            $table->string('note')->default('')->comment('备注要求');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('promotion_orders');
    }
}
