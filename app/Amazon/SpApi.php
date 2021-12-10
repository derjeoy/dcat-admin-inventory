<?php
namespace app\common;

class SPAPI
{
    private $clientId       = '需要改';   ## 【卖家后台获取】客户端ID
    private $clientSecret   = '需要改';   ## 【卖家后台获取】客户端秘钥
    private $accessKey      = '需要改';   ## 【AWS后台获取】Access Key of AWS IAM User, for example AKIAABCDJKEHFJDS
    private $secretKey      = '需要改';   ## 【AWS后台获取】Secret Key of AWS IAM User
    private $roleArn        = '需要改';   ## 【AWS后台获取】AWS IAM Role ARN for example: arn:aws:iam::123456789:role/Your-Role-Name
    private $config;
    private $refreshToken;
    private $regionInfo;

    /**
     * 文档https://github.com/amzn/selling-partner-api-docs/blob/main/guides/developer-guide
     * SPAPI constructor.
     * @param   string  $refreshToken           ## 刷新token授,权成功获得
     * @param   string  $sellingPartnerId       ## 店铺唯一标识,授权成功获得
     * @param   string  $countryCode            ## 国家代码，即国家简写
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function __construct($refreshToken, $sellingPartnerId, $countryCode)
    {
        $this->refreshToken        = $refreshToken;
        $this->regionInfo = $this->getRegionInfo($countryCode);
        if (empty($this->regionInfo)) {
            return ret_error('countryCode错误');
        }
        $options = [
            // 'refresh_token' => $refreshToken, // Aztr|...
            // 'client_id' => $client_id, // App ID from Seller Central, amzn1.sellerapps.app.cfbfac4a-......
            // 'client_secret' => $client_secret, // The corresponding Client Secret
            //'region' => \ClouSale\AmazonSellingPartnerAPI\SellingPartnerRegion::$EUROPE, // or NORTH_AMERICA / FAR_EAST
            'region' => $this->regionInfo['region'], // or NORTH_AMERICA / FAR_EAST
            'access_key' => $this->accessKey, // Access Key of AWS IAM User, for example AKIAABCDJKEHFJDS
            'secret_key' => $this->secretKey, // Secret Key of AWS IAM User
            //'endpoint' => \ClouSale\AmazonSellingPartnerAPI\SellingPartnerEndpoint::$EUROPE, // or NORTH_AMERICA / FAR_EAST
            'endpoint' => $this->regionInfo['endpoint'], // or NORTH_AMERICA / FAR_EAST
            'role_arn' => $this->roleArn, // AWS IAM Role ARN for example: arn:aws:iam::123456789:role/Your-Role-Name
        ];
        /*$accessToken = \ClouSale\AmazonSellingPartnerAPI\SellingPartnerOAuth::getAccessTokenFromRefreshToken(
            $options['refresh_token'],
            $options['client_id'],
            $options['client_secret']
        );*/
        $result = $this->getAccessToken($sellingPartnerId);
        if (isset($result['code'])) {
            return $result;
        }
        $accessToken = $result;
        $assumedRole = \ClouSale\AmazonSellingPartnerAPI\AssumeRole::assume(
            $options['region'],
            $options['access_key'],
            $options['secret_key'],
            $options['role_arn']
        );
        $config = \ClouSale\AmazonSellingPartnerAPI\Configuration::getDefaultConfiguration();
        $config->setHost($options['endpoint']);
        $config->setAccessToken($accessToken);
        $config->setAccessKey($assumedRole->getAccessKeyId());
        $config->setSecretKey($assumedRole->getSecretAccessKey());
        $config->setRegion($options['region']);
        $config->setSecurityToken($assumedRole->getSessionToken());
        $this->config = $config;

    }
     /**
     * 获取accessToken
     * @return array|mixed
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    private function getAccessToken($sellingPartnerId)
    {
        /*POST /auth/o2/token HTTP/l.l
        Host: api.amazon.com
        Content-Type: application/x-www-form-urlencoded;charset=UTF-8
        grant_type=refresh_token
        &refresh_token=Aztr|...
        &client_id=foodev
        &client_secret=Y76SDl2F*/
        $tokenKey = 'access_token'.$sellingPartnerId;
        if (cache($tokenKey)) {
            return cache($tokenKey);
        }
        $url = 'https://api.amazon.com/auth/o2/token';
        $data['grant_type'] = 'refresh_token';
        $data['refresh_token'] = $this->refreshToken;
        $data['client_id'] = $this->clientId;
        $data['client_secret'] = $this->clientSecret;

        $res = \app\facade\MyRequest::post($url, [
            'form_params'   => $data,
            'Content-Type'  => 'application/x-www-form-urlencoded;charset=UTF-8'
        ]);
        if ($res['code'] != 200) {
            return $res;
        }
        // 设置缓存
        cache($tokenKey, $res['data']['access_token'], $res['data']['expires_in']);
        return $res['data']['access_token'];
    }
    /**
     * 获取亚马逊订单信息
     *
     * @param string $orderId   ## 亚马逊订单ID
     * @return array
     */
    public function getOrder($orderId)
    {
        try {
            $productClient = new \ClouSale\AmazonSellingPartnerAPI\Api\OrdersApi($this->config);
            // 訂單信息
            $result = $productClient->getOrder($orderId);
            // 获取购买者信息
            $buyerInfo = $productClient->getOrderBuyerInfo($orderId);
            $result = \GuzzleHttp\json_decode($result,true);
            $buyerInfo = \GuzzleHttp\json_decode($buyerInfo,true);
            $ret = ret_success('ok', [
                'order_info'  =>  isset($result['payload'])?$result['payload']:$result,
                'buyer_info'  =>  isset($buyerInfo['payload'])?$buyerInfo['payload']:$buyerInfo,
            ]);
        } catch (\Exception $exception) {
            $ret = ret_error('error', $exception->getMessage());
        }
        return $ret;
    }

    /**
     * 获取商品名称
     * @param $asin
     * @return array
     */
    public function cataLogItems($asin)
    {
        $marketplaceId = $this->regionInfo['marketplaceId'];
        try {
            $apiInstance = new \ClouSale\AmazonSellingPartnerAPI\Api\CatalogApi($this->config);
            //Check the catalog info for B074Z9QH5F ASIN
            $result = $apiInstance->getCatalogItem($marketplaceId, $asin);
            //echo ($result);
            $result = \GuzzleHttp\json_decode($result,true);
            //dump($result->getPayload()->getAttributeSets()[0]->getTitle());

            $ret = ret_success('ok', isset($result['payload'])?$result['payload']:$result);
        } catch (\Exception $exception) {
            $ret = ret_error('error', $exception->getMessage());
        }
        return $ret;

    }

    /**
     * 获取店铺所在地区的参数信息
     * @param $countryCode
     * @return array|bool
     */
    public function getRegionInfo($countryCode)
    {
        $marketplaceIds = [
            // North America
            'CA'    =>  ['NorthAmerica','A2EUQ1WTGCTBG2'],    //'Canada'
            'US'    =>  ['NorthAmerica','ATVPDKIKX0DER'],     //'United States of America'
            'MX'    =>  ['NorthAmerica','A1AM78C64UM0Y8'],    //'Mexico'
            'BR'    =>  ['NorthAmerica','A2Q3Y263D00KWC'],    //'Brazil'
            //Europe
            'ES'    =>  ['Europe','A1RKKUPIHCS9HS'],    //'Spain'
            'GB'    =>  ['Europe','A1F83G8C2ARO7P'],    //'United Kingdom'
            'FR'    =>  ['Europe','A13V1IB3VIYZZH'],    //'France'
            'NL'    =>  ['Europe','A1805IZSGTT6HS'],    //'Netherlands'
            'DE'    =>  ['Europe','A1PA6795UKMFR9'],    //'Germany'
            'IT'    =>  ['Europe','	APJ6JRA9NG5V4'],    //'Italy '
            'SE'    =>  ['Europe','A2NODRKZP88ZB9'],    //'Sweden'
            'TR'    =>  ['Europe','A33AVAJ2PDY3EV'],    //'Turkey'
            'AE'    =>  ['Europe','A2VIGQ35RCS4UG'],    //'United Arab Emirates 	'
            'IN'    =>  ['Europe','	A21TJRUUN4KGV'],    //'India'
            //Far East
            'SG'    =>  ['FarEast','A19VAU5U5O7RUS'], //'Singapore'
            'AU'    =>  ['FarEast','A39IBJ37TRP1C6'], //'Australia'
            'JP'    =>  ['FarEast','A1VC38T7YXB528'], //'Japan'
        ];
        $endpoints = [
            'NorthAmerica'  =>  ['https://sellingpartnerapi-na.amazon.com','us-east-1'],
            'Europe'        =>  ['https://sellingpartnerapi-eu.amazon.com','eu-west-1'],
            'FarEast'       =>  ['https://sellingpartnerapi-fe.amazon.com','us-west-2']
        ];
        if (!isset($marketplaceIds[$countryCode])) {
            return false;
        }
        $marketplaceId = $marketplaceIds[$countryCode][1];
        $endpoint = $endpoints[$marketplaceIds[$countryCode][0]];
        return [
            'marketplaceId' =>  $marketplaceId,
            'region' =>  $endpoint[1],
            'endpoint' =>  $endpoint[0],
        ];
    }



}
