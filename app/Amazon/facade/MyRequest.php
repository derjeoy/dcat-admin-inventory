<?php
namespace app\facade;

use think\Facade;

class MyRequest extends Facade
{
    /**
     * @see \app\common\MyRequest
     * @package think\facade
     * @mixin \app\common\MyRequest
     *
     * @method static array get($url,$option) get请求
     * @method static array post($url,$option) post请求
     */
    protected static function getFacadeClass()
    {
        return 'app\common\MyRequest';
    }

}
