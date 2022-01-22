<?php

namespace App\Admin\Repositories;

use App\Models\Website as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Website extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
