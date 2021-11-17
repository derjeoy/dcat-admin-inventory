<?php

/*
 * // +----------------------------------------------------------------------
 * // | erp
 * // +----------------------------------------------------------------------
 * // | Copyright (c) 2006~2020 erp All rights reserved.
 * // +----------------------------------------------------------------------
 * // | Licensed ( LICENSE-1.0.0 )
 * // +----------------------------------------------------------------------
 * // | Author: yxx <1365831278@qq.com>
 * // +----------------------------------------------------------------------
 */

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Resources\ListingResource;
use App\Repositories\ListingRepository;
use Illuminate\Http\Request;

class ApiController extends Controller
{
    /**
     * @param Request $request
     * @param ProductRepository $repository
     * @return ProductResource
     */
    public function getProductInfo(Request $request, Product $repository): ProductResource
    {
        $product_id = $request->get('q');
        return ProductResource::make($repository->getInfoById($product_id));
    }

    public function getListingInfo(Request $request, ListingRepository $repository): ListingResource
    {
        $listing_id = $request->get('q');
        return ListingResource::make($repository->getInfoById($listing_id));
    }

}
