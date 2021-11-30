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
	protected $title = '复制';
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
        // // dump($this->getKey());

        // return $this->response()
        //     ->success('Processed successfully: '.$this->getKey())
        //     ->redirect('/');
        // 获取当前行ID
        $id = $this->getKey();

        // 获取 parameters 方法传递的参数
        $name = $request->get('name');
        $model = $request->get('model');

        // 复制数据
        $model::find($id)->replicate()->save();

        // 返回响应结果并刷新页面
        return $this->response()->success("复制成功: [{$name}]")->refresh();
    }

    /**
	 * @return string|array|void
	 */
	public function confirm()
	{
		return [
            // 确认弹窗 title
            "您确定要复制这行数据吗？",
            // 确认弹窗 content
            $this->row->name.'-'.$this->row->function,
        ];
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
        // return [];
        return [
            // 发送当前行 name 字段数据到接口
            'name' => $this->row->name,
            // 把模型类名传递到接口
            'model' => $this->model,
        ];
    }

    /**
     * 修改按钮样式
     */
    protected function html()
    {
        $str = $this->formatHtmlAttributes();
        $reg = "/act\-\w+/";
        preg_match($reg,$str,$out);
     
        return <<<HTML
    <span  class="{$out[0]}">{$this->title()}</span>
    HTML;
    }
}
