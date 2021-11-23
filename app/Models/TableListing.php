<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class TableListing extends Model
{
	
    protected $table = 'table_listings';

    //protected $with = ['rew_number'];


    // public function rew_number():HasMany
    // {
    //     return $this->hasMany(TableReview::class,'id');
    // }
    
}
