<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ProductModel extends Model
{
	//1.关联数据表
    public $table = 'products';//实际是blog_user  config/database.php


	protected $guarded = [];

    protected $with = ['listings'];

    /**
     * @return HasMany
     */
    public function listings(): HasMany
    {
        return $this->hasMany(TableListing::class, 'irobot_sku','id');
    }

}
