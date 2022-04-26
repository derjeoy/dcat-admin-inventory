<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class RelInventoryOutListing extends Model
{
	
    protected $table = 'rel_inventory_out_listing';
    public $timestamps = false;

    //protected $fillable = ["listing_id","fbdid","send_number"];
    protected $guarded = [];

}
