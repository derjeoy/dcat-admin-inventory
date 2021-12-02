<?php

namespace App\Admin\Repositories;

use App\Models\PromotionProduct as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class PromotionProduct extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
