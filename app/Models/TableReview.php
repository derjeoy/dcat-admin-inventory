<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TableReview extends Model
{
	
    protected $table = 'table_review';

    //protected $with = ['rew_number'];


    // public function rew_number()
    // {
    //     return $this->belongsTo(TableListing::class,'listing_id');
    // }
    
}
