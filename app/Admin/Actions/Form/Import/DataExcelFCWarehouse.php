<?php

namespace App\Admin\Actions\Form\Import;

use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class DataExcelFCWarehouse implements WithMultipleSheets
{
    private $round;

    public function __construct(int $round)
    {
        $this->round = $round;
    }

    public function sheets(): array
    {
        return [
            new FCWarehouseSheetImport($this->round),
        ];
    }
}
