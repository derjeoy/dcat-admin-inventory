<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TableListing extends Model
{
	
    protected $table = 'table_listings';

    public function review():HasMany
    {
        return $this->hasMany(TableReview::class,'listing_id');//->orderBy('date','desc')->latest();
    }

    public function latest_review()
    {
        return $this->hasOne(TableReview::class, 'listing_id', 'id')->orderByDesc('date');
    }

    public function purchase_cost()
    {
        return $this->belongsTo(ProductModel::class, 'irobot_sku', 'irobot_sku');
    }

    public function shipment()
    {
        return $this->hasOne(InventoryOut::class, 'listing_id', 'listing_id')->orderByDesc('date_create_ship');
    }
}
