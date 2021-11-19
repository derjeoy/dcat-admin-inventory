<?php

namespace App\Admin\Actions\Form\Import;

use App\Models\FCWarehouse;
use App\Models\FCWarehouse as DataModel;
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

class FCWarehouseSheetImport implements ToCollection, WithBatchInserts, WithChunkReading, WithHeadingRow, ToModel
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
        $fc = FCWarehouse::where('FC', '=', $row['FC'])->first();
        //dd($products);
        if ($fc) {
            // 存在返回 null
            return null;
        }
        // 数据库对应的字段
        return new DataModel([
            'FC' => $row['FC'],
            'COMPANY_NAME' => $row['COMPANY_NAME'],
            'POD' => $row['POD'],
            'TYPE' => $row['TYPE'],
            'ADDRESS' => $row['ADDRESS'],
            'CITY' => $row['CITY'],
            'STATES' => $row['STATES'],
            'POSTAL_CODE' => $row['POSTAL_CODE'],
            'COUNTRY' => $row['COUNTRY'],
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
