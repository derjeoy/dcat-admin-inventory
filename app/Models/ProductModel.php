<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class ProductModel extends Model
{
	//1.关联数据表
    public $table = 'products';//实际是blog_user  config/database.php


	protected $guarded = [];
}
