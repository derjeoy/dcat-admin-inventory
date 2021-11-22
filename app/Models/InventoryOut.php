<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class InventoryOut extends Model
{
	
    protected $table = 'inventory_out';

    protected $guarded = [];

    const TYPE_RECEIVED = 1;
    const TYPE_RECEIVING = 2;
    const TYPE_SENDING = 3;

    const SHIPMENT_STATUS = [
        self::TYPE_RECEIVED => '已上架',
        self::TYPE_RECEIVING => '接收中',
        self::TYPE_SENDING =>'已发货',
    ];


    const TYPE_SEA = 1;
    const TYPE_AIR = 2;
    const TYPE_TRAIN = 3;
    const TYPE_TRUCK = 4;

    const SEND_METHOD = [
        self::TYPE_SEA => '海运',
        self::TYPE_AIR => '空运',
        self::TYPE_TRAIN =>'铁运',
        self::TYPE_TRUCK =>'卡运',
    ];
    
}
