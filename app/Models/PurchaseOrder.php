<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class PurchaseOrder extends Model
{
	
    protected $table = 'purchase_order';

    protected $guarded = [];

    public function purchase_products(): HasMany
    {
        return $this->hasMany(PurchaseProduct::class, 'order_id');
    }
    
}
