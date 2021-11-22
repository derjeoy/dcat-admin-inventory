<?php

namespace App\Admin\Actions\Form\Import;

use App\Models\InventoryOut;
use App\Models\InventoryOut as DataModel;
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

class ShipmentSheetImport implements ToCollection, WithBatchInserts, WithChunkReading, WithHeadingRow, ToModel
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
        $fc = InventoryOut::where('fbaid', '=', $row['fbaid'])->first();
        //dd($products);
        if ($fc) {
            // 存在返回 null
            return null;
        }

        //console.log($row['date_create_ship']);
        // 数据库对应的字段
        return new DataModel([
            'listing_id' => $row['listing_id'],
            'irobot_shipment_id' => $row['irobot_shipment_id'],
            'fbaid' => $row['fbaid'],
            'fba_reference_id' => $row['fba_reference_id'],
            'send_number' => $row['send_number'],
            'from_address' => $row['from_address'],
            'to_country' => $row['to_country'],
            'fba_code' => $row['fba_code'],
            'postcode' => $row['postcode'],
            
            'carrier_name' => $row['carrier_name'],
            'send_method' => $row['send_method'],
            'tracking_num' => $row['tracking_num'],
            'status' => $row['status'],
            'note' => $row['note'],

            'date_create_ship' => \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row['date_create_ship'])->format('Y-m-d'),
            'hope_arrive_date' => \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row['hope_arrive_date'])->format('Y-m-d'),
            'actural_arrive_date' => \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row['actural_arrive_date'])->format('Y-m-d'),
            //'hope_arrive_date' => date('Y-m-d', ($row['hope_arrive_date']–25569) * 24*60*60),
            //'actural_arrive_date' => date('Y-m-d', ($row['actural_arrive_date']–25569) * 24*60*60),
            
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
