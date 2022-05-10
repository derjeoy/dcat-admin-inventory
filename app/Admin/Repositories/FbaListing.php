<?php

namespace App\Admin\Repositories;

use App\Models\FbaListing as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class FbaListing extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
