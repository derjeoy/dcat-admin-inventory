<?php

namespace App\Admin\Repositories;

use App\Models\SalesSummery as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class SalesSummery extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
