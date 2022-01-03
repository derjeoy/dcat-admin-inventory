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
        $fc = InventoryOut::where('fbaid', '=', $row['FBA发货计划ID'])->first();
        //dd($products);
        if ($fc) {
            // 存在返回 null
            return null;
        }
        //$row['FBA仓库编号'] = str_replace(array("\r\n", "\r", "\n"), "", $row['FBA仓库编号']);
        //dd($row['FBA仓库编号']);
        // 数据库对应的字段
        return new DataModel([
            'listing_id' => $row['链接ID'],
            'irobot_shipment_id' => $row['赛合发货计划ID'],
            'fbaid' => $row['FBA发货计划ID'],
            'fba_reference_id' => $row['FBA发货计划参考ID'],
            'send_number' => $row['发货数目'],
            'from_address' => $row['发货地址'],
            'to_country' => $row['目的国家'],
            'fba_code' => $row['FBA仓库编号'],
            'postcode' => $row['FBA仓库邮编'],
            
            'carrier_name' => $row['承运商'],
            'send_method' => $row['发货方式'],
            'tracking_num' => $row['物流跟踪号'],
            'address' => str_replace(array("\r\n", "\r", "\n"), "", $row['目的地址']),
            'status' => $row['发货计划状态'],
            'note' => $row['备注'],

            'date_create_ship' => \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row['货件发货日期'])->format('Y-m-d'),
            'hope_arrive_date' => \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row['期望上架日期'])->format('Y-m-d'),
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
