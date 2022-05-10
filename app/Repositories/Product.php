<?php

namespace App\Repositories;

use App\Models\ProductModel;
use Yxx\LaravelQuick\Repositories\BaseRepository;
use App\Models\ListingModel;



class Product extends BaseRepository
{
        /**
     * @param int $product_id
     * @return ProductModel|null
     */
    public function getInfoById(int $product_id):?ProductModel
    {
        return ProductModel::find($product_id);
    }

    public function getListingListById(int $product_id):?ListingModel
    {
        return ListingModel::where('irobot_sku',$product_id)->get(['id']);
    }
}
