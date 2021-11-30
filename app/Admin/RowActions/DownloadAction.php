<?php

namespace App\Admin\RowActions;

use Dcat\Admin\Grid\RowAction;
use Dcat\Admin\Admin;

class DownloadAction extends RowAction

{

  	public function title()
	{
	    return '下载表格';
	}

  	public function html()
	{

	    $this->setHtmlAttribute(['data-excel' => $this->row->listing_id,'class'=>'download-btn fa fa-download']);

	    // 获取当前行的字段值
        $username = $this->row->listing_id;

        // 转化为数组
        $rowArray = $this->row->toArray();


	    return parent::html();

	}

}
