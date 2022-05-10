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

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ListingResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'           => $this->id,
            'asin'           => $this->asin,
            'country'           => $this->country,
            'irobot_sku'  => $this->irobot_sku,
            'amz_account'           => $this->amz_account,
            'amz_sku'           => $this->amz_sku,
            'fnsku'           => $this->fnsku,
            'price'           => $this->price,
            'saler'           => $this->saler,
            'fba_fee'           => $this->fba_fee,
            'amz_sale_commssion'           => $this->amz_sale_commssion,
            'latest_transportation_unitfee'           => $this->latest_transportation_unitfee,
            'fba_current_inventory'           => $this->fba_current_inventory,
            'fba_current_transfer'           => $this->fba_current_transfer,

        ];
    }
}
