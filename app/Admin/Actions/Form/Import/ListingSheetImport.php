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
            $row['asin'] && $query->where('asin', '=', $row['asin']);
            $row['fnsku'] && $query->where('fnsku', '=', $row['fnsku']);
            $row['amz_sku'] &&$query->where('asin', '=', $row['amz_sku']);
        })->first();
        
        //dd($products);
        if ($products) {
            // 存在返回 null
            return null;
        }
        // 数据库对应的字段
        return new DataModel([
            'amz_account' => $row['amz_account'],
            'country' => $row['country'],
            'amz_sku' => $row['amz_sku'],
            'asin' => $row['asin'],
            'fnsku' => $row['fnsku'],
            'local_name' => $row['local_name'],
            'upc' => $row['upc'],
            'irobot_sku' => $row['irobot_sku'],
            'saler' => $row['saler'],
            'price' => $row['price'],
            'fba_fee' => $row['fba_fee'],
            'amz_sale_commssion' => $row['amz_sale_commssion'],
            'fba_current_inventory' => $row['fba_current_inventory'],
            'fba_current_transfer' => $row['fba_current_transfer'],
            'latest_transportation_unitfee' => $row['latest_transportation_unitfee'],
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
