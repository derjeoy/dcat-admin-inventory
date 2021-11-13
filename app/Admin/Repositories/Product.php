<?php

namespace App\Admin\Repositories;

use App\Models\Product as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Product extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;

        /**
     * @param int $product_id
     * @return ProductModel|null
     */
    public function getInfoById(int $product_id): ?Product
    {
        return Product::find($product_id);
    }
}
