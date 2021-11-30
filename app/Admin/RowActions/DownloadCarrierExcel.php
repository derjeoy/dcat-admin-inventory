<?php

namespace App\Admin\RowActions;

use Dcat\Admin\Actions\Response;
use Dcat\Admin\Grid\RowAction;
use Dcat\Admin\Traits\HasPermissions;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class DownloadCarrierExcel extends RowAction
{
    /**
     * @return string
     */
	protected $title = '下载';
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

        //dd($this);

        // // dump($this->getKey());

        // return $this->response()
        //     ->success('Processed successfully: '.$this->getKey())
        //     ->redirect('/');
        // 获取当前行ID
        $id = $this->getKey();

        // $model = $request->get('model');

        //dd($name);

        // 复制数据
        // $model::find($id)->replicate()->save();

                $headers = array(
                      'Content-Type: application/pdf',
                      'Content-Disposition: attachment',
                    );

        // 获取 parameters 方法传递的参数
        $filepath = env('APP_URL').'/uploads/'.$request->get('carrier_file');

        return $this->response()->download($filepath);

        //return response()->download(public_path('/uploads/' . $request->get('carrier_file')), 'test1.pdf',$headers);

        //return $this->response()->download($filepath)->success("下载成功: [{$filepath}]");
    }

 //    /**
	//  * @return string|array|void
	//  */
	// public function confirm()
	// {
	// 	return [
 //            // 确认弹窗 title
 //            "您确定要下载这个箱唛吗？",
 //            // 确认弹窗 content
 //            $this->row->to_country.'-'.$this->row->fbaid.'-'.$this->row->carrier_file,
 //        ];
	// }

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
        // return [];
        return [
            // 发送当前行 name 字段数据到接口
            'fbaid' => $this->row->fbaid,
            'carrier_file' => $this->row->carrier_file,
            'to_country' => $this->row->to_country,
            // 把模型类名传递到接口
            'model' => $this->model,
        ];
    }

    /**
     * 修改按钮样式
     */
//     protected function html()
//     {
//         $str = $this->formatHtmlAttributes();
//         $reg = "/act\-\w+/";
//         preg_match($reg,$str,$out);

//     return <<<HTML
// <span  class="{$out[0]}">{$this->title()}</span>
// HTML;
//     }
}
