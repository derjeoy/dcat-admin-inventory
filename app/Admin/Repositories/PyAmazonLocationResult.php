<?php

namespace App\Admin\Repositories;

use App\Models\PyAmazonLocationResult as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class PyAmazonLocationResult extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
