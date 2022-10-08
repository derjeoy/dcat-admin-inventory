<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PurchaseProduct extends Model
{
	
    protected $table = 'purchase_products';

    protected $with = ['product'];

    protected $fillable = ['order_id','product_id','purchase_number'];

    public function product(): BelongsTo
    {
        return $this->belongsTo(ProductModel::class, 'product_id','id');
    }
    
}
