<?php

namespace App\Admin\Repositories;

use App\Models\RelInventoryOutListing as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class RelInventoryOutListing extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
