<?php

namespace App\Admin\Actions\Grid;

use Dcat\Admin\Grid;
use Dcat\Admin\Grid\Tools\AbstractTool;
use Illuminate\Http\Request;

class DownloadInventoryOutTemplate extends AbstractTool
{
    /**
     * @return string
     */
    protected $title = '下载导入模板';

    public function handle(Request $request)
    {
        $filepath = env('APP_URL').'/uploads/template/inventory_out_template.xlsx';
        return $this->response()->download($filepath)->success("下载成功: [{$filepath}]");;
    }

    

    protected function html()
    {
        return <<<HTML
            <a {$this->formatHtmlAttributes()}><button class="btn btn-success"><i class="feather icon-star"></i> {$this->title()}</button></a>
            HTML;
    }
}
