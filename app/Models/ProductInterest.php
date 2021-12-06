<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class ProductInterest extends Model
{
	
    protected $table = 'product_interest';

    const COUNTRY_USA = 0;
    const COUNTRY_CA = 1;
    const COUNTRY_MX = 2;
    const COUNTRY_JP = 3;
    const COUNTRY_AU = 4;
    const COUNTRY_UK = 5;
    const COUNTRY_DE = 6;
    const COUNTRY_FR = 7;
    const COUNTRY_IT = 8;
    const COUNTRY_ES = 9;

    const COUNTRY_CODE = [
        self::COUNTRY_USA => '美国',
        self::COUNTRY_CA => '加拿大',
        self::COUNTRY_MX => '墨西哥',
        self::COUNTRY_JP => '日本',
        self::COUNTRY_AU => '澳洲',
        self::COUNTRY_UK => '英国',
        self::COUNTRY_DE => '德国',
        self::COUNTRY_FR => '法国',
        self::COUNTRY_IT => '意大利',
        self::COUNTRY_ES => '西班牙',
    ];
    
}
