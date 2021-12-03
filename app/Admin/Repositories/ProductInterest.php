<?php

namespace App\Admin\Repositories;

use App\Models\ProductInterest as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class ProductInterest extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
