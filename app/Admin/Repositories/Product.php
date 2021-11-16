<?php

namespace App\Admin\Repositories;

use App\Models\ProductModel as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Product extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
