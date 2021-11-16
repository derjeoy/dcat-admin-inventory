<?php

namespace App\Repositories;

use App\Models\ProductModel;
use Yxx\LaravelQuick\Repositories\BaseRepository;


class Product extends BaseRepository
{
        /**
     * @param int $product_id
     * @return ProductModel|null
     */
    public function getInfoById(int $product_id){
        return ProductModel::find($product_id);
    }
}
