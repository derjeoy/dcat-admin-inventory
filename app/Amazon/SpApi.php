<?php
namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use app\facade\MyRequest;
use think\facade\Log;
use think\route\Domain;

class SpApi extends BaseController
{
    public function identify()
    {
        // Log::write('identify:'.\GuzzleHttp\json_encode($this->request->param()));
        dump($this->request->param());

    }

    //https://sellercentral.amazon.com/apps/authorize/consent?application_id=amzn1.sp.solution.144889cf-4992-4b3c-bff3-301be38e74a4&state=17&version=beta
    // 进行授权
    public function identifyJump()
    {
        // 接收参数示例
        //        ^ array:3 [▼
        //  "spapi_oauth_code" => "ANozfWVllWNqbERcODQh"
        //  "state" => "heidou"
        //  "selling_partner_id" => "A3FC1S9HX7ZHY6"
        //]
        $params = $this->request->param();
//        if (!isset($params['spapi_oauth_code'])) {
//            return;
//        }
        $url = 'https://api.amazon.com/auth/o2/token';
        //grant_type=authorization_code&code=SplxlOexamplebYS6WxSbIA&client_id=foodev&client_secret=Y76SDl2F
        $data['grant_type'] = 'authorization_code';
        $data['code'] = $params['spapi_oauth_code'];
        $data['client_id'] = '需要改';         ## 在卖家后台
        $data['client_secret'] = '需要改';     ## 在卖家后台
        $res = MyRequest::post($url, [
            'form_params'   => $data,
            'Content-Type'  => 'application/x-www-form-urlencoded;charset=UTF-8'
        ]);
        // 返回结果示例
        //         array:4 [▼
        //  "code" => 200
        //  "msg" => "success"
        //  "time" => 1613024603
        //  "data" => array:4 [▼
        //    "access_token" => "Atza|IwEBIErDeGnckwGv66pgX7FwNQrliDmG2mEOdBr9jLSPVtWeumgzXkwzcOiyMFw0e59LYJInESwpXOcL7kSNW7KxzRcLpm0vlAfRbHeAiOj8aBvOvF8gpb9DsRr_c-GPHAzLBTevkJVfsvRVZLB2mhq1u4B ▶"
        //    "refresh_token" => "Atzr|IwEBID2fWkiuplGNZnif9nAwcn6rjQ-gIwmDXwXjn64SdCzx-iVRI8Ju6s6XO2wzOs9-Jz3ZhVP7GsyIPz4HnJ9gLe9G7LaWqA4pB5tIeVACRJmjqisNYIN6SqSsZ8VnM3tF24zd6H3OkL9Du6okAjXXtFs ▶"
        //    "token_type" => "bearer"
        //    "expires_in" => 3600
        //  ]
        //]
        if ($res['code'] != 200) {
            return json($res);
        }
        $params['state'] = explode('||',$params['state']);
        // 永久存储refresh_token,存数据库都可以, selling_partner_id这个也存起来
        // 用这个值代替sdk里的refresh_token即可
        if ($params['state'][1] == 1) {
            // 正式
            $url = 'http://dev4.eyu.com/api/authorize_callback.html';
        } else {
            // 測試 一般为 open.heidou.store
            $url = 'http://k.dev4.eyu.com/api/authorize_callback.html';
        }

        $ret = MyRequest::post($url,[
            'form_params'   =>  [
                'refresh_token'  =>  $res['data']['refresh_token'],
                'selling_partner_id'  =>  $params['selling_partner_id'],
                'shop_id'  =>  $params['state'][0],
            ]
        ]);
        // 缓存accessToken
        // cache('access_token'.$params['selling_partner_id'], $res['data']['access_token'], $res['data']['expires_in']);
        if ($ret['code'] == 200 && $ret['data']['code'] == 200) {
            return json(ret_success('授权成功'));
        } else {
            return json($ret);
        }

    }

    // 获取亚马逊商品属性
    public function getCataLogItem()
    {
        // 表单验证 自行验证
        // $validate = my_validate($this->request->param(), 'amz_getCataLogItem');
        // if ($validate !== true) {
        //     return json($validate);
        // }
        /*$spApi = new \app\common\SPAPI(
            'Atzr|IwEBICG6JIdq2nUS4QmqXxL4CETfICMDdynSvYU8grxCtHGuonW6IDz1ZqGuI6TyPXljnaO11LFseknT7WKPfY28V6-z6vgLH1Q2oJXIWzM5dqoOgtajx3utBYR6D1LsvfDPBVJlr1lHia2I1LzLTQ0bqXtTq7tWYQsS8l_zK4dlUIsYL5zuNemxe1b7DjtdkF9OOwid6SndWhbW2SJeo3AU9nKSheCZkTIuEt9WHZbl_uIAKe1KwcYMmE-UXglGlDuR78dGjCxYCethZXORSuSYqaLOklh9RJxcREwcjfppbHVME5RSDBXeNcqe94wxyfr7BQs',
            'A3FC1S9HX7ZHY6','CA');*/
        $spApi = new \app\common\SPAPI(
            $this->request->param('refresh_token'),
            $this->request->param('selling_partner_id'),
            $this->request->param('country_code')
        );
        //$asin, $marketplaceId
        $ret = $spApi->cataLogItems($this->request->param('asin'));
        return json($ret);
    }

     // 获取亚马逊订单信息,包括买家信息
    public function getOrderInfo()
    {
        // 表单验证 自行验证
        // $validate = my_validate($this->request->param(), 'amz_getOrderInfo');
        // if ($validate !== true) {
        //     return json($validate);
        // }
        $m = new \app\common\SPAPI(
            $this->request->param('refresh_token'),
            $this->request->param('selling_partner_id'),
            $this->request->param('country_code')
        );
        $ret = $m->getOrder($this->request->param('order_id'));
        return json($ret);
    }


}
