<?php

namespace App\Admin\Repositories;

use App\Models\InventoryOversea as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class InventoryOversea extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
