<?php

namespace App\Admin\Actions\Form\Import;

use App\Models\Product;
use App\Models\Product as DataModel;
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
        $products = Product::where('irobot_sku', '=', $row['irobot_sku'])->first();
        dd($products);
        if ($products) {
            // 存在返回 null
            return null;
        }
        // 数据库对应的字段
        return new DataModel([
            'name_chinese' => $row['name_chinese'],
            'name_english' => $row['name_english'],
            'asin' => $row['asin'],
            'upc' => $row['upc'],
            'irobot_sku' => $row['irobot_sku'],
            'addbyuser' => $row['addbyuser'],
            'image_column' => $row['image_column'],
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
