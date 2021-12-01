<?php

namespace App\Admin\RowActions;

use Dcat\Admin\Actions\Response;
use Dcat\Admin\Grid\RowAction;
use Dcat\Admin\Traits\HasPermissions;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class DownloadCarrierPDF extends RowAction
{
    /**
     * @return string
     */
	protected $title = '下载箱唛';
    protected $model;

    public function __construct(string $model = null)
    {
        $this->model = $model;
    }

    /**
     * Handle the action request.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function handle(Request $request)
    {
        // 获取当前行ID
        $id = $this->getKey();

        // 获取 parameters 方法传递的参数
        $filepath = env('APP_URL').'/uploads/'.$request->get('carrier_pdf');

        return $this->response()->download($filepath)->success("下载成功: [{$filepath}]");;
    }

    /**
     * @param Model|Authenticatable|HasPermissions|null $user
     *
     * @return bool
     */
    protected function authorize($user): bool
    {
        return true;
    }

    /**
     * @return array
     */
    protected function parameters()
    {
        return [
            // 发送当前行 name 字段数据到接口
            'fbaid' => $this->row->fbaid,
            'carrier_file' => $this->row->carrier_file,
            'carrier_pdf' => $this->row->carrier_pdf,
            'to_country' => $this->row->to_country,
            // 把模型类名传递到接口
            'model' => $this->model,
        ];
    }
}
