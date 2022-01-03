<?php

namespace App\Admin\Actions\Form\Import;

use App\Models\ProductModel;
use App\Models\ProductModel as DataModel;
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

class FirstSheetImport implements ToCollection, WithBatchInserts, WithChunkReading, WithHeadingRow, ToModel
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
        $products = ProductModel::where('irobot_sku', '=', $row['赛盒SKU'])->first();
        //dd($products);
        if ($products) {
            // 存在返回 null
            return null;
        }
        // 数据库对应的字段
        return new DataModel([
            'name_chinese' => $row['中文名字'],
            'purchase_cost' => $row['采购成本'],
            'irobot_sku' => $row['赛盒SKU'],
            'amz_listing' => $row['参考亚马逊链接'],
            'addbyuser' => $row['添加人'],
            'unit_height' => $row['高度'],
            'unit_width' => $row['宽度'],
            'unit_length' => $row['长度'],
            'unit_weight' => $row['重量'],
            'box_height' => $row['装箱高度'],
            'box_width' => $row['装箱宽度'],
            'box_length' => $row['装箱长度'],
            'box_weight' => $row['装箱重量'],
            'box_number' => $row['装箱个数'],
            'purchasemethod' => $row['采购链接'],
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
