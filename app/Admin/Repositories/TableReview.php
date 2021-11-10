<?php

namespace App\Admin\Repositories;

use App\Models\TableReview as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class TableReview extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
