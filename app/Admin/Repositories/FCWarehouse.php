<?php

namespace App\Admin\Repositories;

use App\Models\FCWarehouse as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class FCWarehouse extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
