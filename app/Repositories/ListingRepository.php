<?php

namespace App\Repositories;

use App\Models\ListingModel;
use Yxx\LaravelQuick\Repositories\BaseRepository;


class ListingRepository extends BaseRepository
{
        /**
     * @param int $listing_id
     * @return ListingModel|null
     */
    public function getInfoById(int $listing_id){
        return ListingModel::find($listing_id);
    }
}
