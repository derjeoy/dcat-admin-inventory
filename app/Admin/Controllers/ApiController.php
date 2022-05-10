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
use App\Repositories\Product;
use App\Http\Resources\ProductResource;
use Illuminate\Http\Request;
use App\Models\ListingModel;

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
        $id = $request->get('q');
        return ListingResource::make($repository->getInfoById($id));
    }

    public function getProductListingInfo(Request $request, Product $repository)
    {
        // 获取产品SKU
        $product_id = $request->get('q');
        // 获取链接列表
        return ListingModel::where('irobot_sku',$product_id)->get(['id','fnsku as text'])->toarray();
    }

}
