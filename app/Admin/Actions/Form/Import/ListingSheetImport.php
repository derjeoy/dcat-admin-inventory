<?php

namespace App\Admin\Actions\Form\Import;

use App\Models\ListingModel;
use App\Models\ListingModel as DataModel;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;

HeadingRowFormatter::
    default('none');

class ListingSheetImport implements ToCollection, WithBatchInserts, WithChunkReading, WithHeadingRow, ToModel
{
    private $round;

    public function __construct(int $round)
    {
        $this->round = $round;
    }

    /**
     * @param array $row
     *
     * @return Model|Model[]|null
     */
    public function model(array $row)
    {
        // 断数据是否
        $products = ListingModel::where(function($query) use ($row){
            $row['ASIN'] && $query->where('asin', '=', $row['ASIN']);
            $row['FNSKU'] && $query->where('fnsku', '=', $row['FNSKU']);
            $row['平台SKU'] &&$query->where('asin', '=', $row['平台SKU']);
            $row['国家'] &&$query->where('country', '=', $row['国家']);
            $row['账号名字'] &&$query->where('amz_account', '=', $row['账号名字']);
        })->first();
        
        //dd($products);
        if ($products) {
            // 存在返回 null
            return null;
        }
        // 数据库对应的字段
        return new DataModel([
            'amz_account' => $row['账号名字'],
            'country' => $row['国家'],
            'amz_sku' => $row['平台SKU'],
            'asin' => $row['ASIN'],
            'fnsku' => $row['FNSKU'],
            'upc' => $row['UPC'],
            'local_name' => $row['标题缩写'],
            'irobot_sku' => $row['赛合SKU'],
            'saler' => $row['销售人员'],
            'price' => $row['售价'],
            'fba_fee' => $row['FBA运费'],
            'amz_sale_commssion' => $row['平台佣金'],
            'fba_current_inventory' => $row['FBA实时库存'],
            'fba_current_transfer' => $row['FBA转运库存'],
            'latest_transportation_unitfee' => $row['单个运输费用(最近)'],
        ]);
    }

    public function collection(Collection $rows)
    {
        //
    }

    //批量导入1000条
    public function batchSize(): int
    {
        return 1000;
    }

    //以1000条数据基准切割数据
    public function chunkSize(): int
    {
        return 1000;
    }
}
