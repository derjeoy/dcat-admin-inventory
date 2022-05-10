<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class FbaListing extends Model
{
	
    protected $table = 'fba_listing';

    protected $with = ['listing'];

    protected $fillable = ['listing_id','send_number','name_chinese'];

    public function listing(): BelongsTo
    {
        return $this->belongsTo(TableListing::class, 'listing_id','id');
    }
    
}
