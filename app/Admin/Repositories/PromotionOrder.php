<?php

namespace App\Admin\Repositories;

use App\Models\PromotionOrder as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class PromotionOrder extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
