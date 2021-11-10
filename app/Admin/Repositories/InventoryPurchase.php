<?php

namespace App\Admin\Repositories;

use App\Models\InventoryPurchase as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class InventoryPurchase extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
