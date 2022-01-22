<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class ProductModel extends Model
{
	//1.关联数据表
    public $table = 'products';//实际是blog_user  config/database.php


	protected $guarded = [];


    // public function listings():HasMany
    // {
    //     return $this->hasMany(TableListing::class,'irobot_sku');
    // }

	// // 定义一个public方法访问图片或文件
 //    public function getImage()
 //    {
 //        if (Str::contains($this->image_column, '//')) {
 //            return $this->image_column;
 //        }

 //        return Storage::disk('admin')->url($this->image_column);
 //    }

}
