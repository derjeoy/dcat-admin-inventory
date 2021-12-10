<?php
namespace app\common;

/**
 * 文档 https://guzzle-cn.readthedocs.io/zh_CN/latest/overview.html
 * Class MyRequest
 * @package app\common
 */
class MyRequest
{
    public $client;
    public function __construct()
    {
        $this->client = new \GuzzleHttp\Client();

    }

    /**
     * @param $url
     * @param array $option
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function get($url, $option=[], $jsonParse=true)
    {
        try {
            $response = $this->client->get($url, $option);
            //echo $response->getBody();
            $body = $response->getBody();
            if ($response->getStatusCode() == 200) {
                if ($jsonParse) {
                    $body = \GuzzleHttp\json_decode($body, true);
                }
                return ret_success('success', $body);
            } else {
                return ret_code($response->getStatusCode(), 'fail', $body);
            }
        } catch (\Exception $e) {
            return ret_code(404,$e->getMessage());
        }

    }

    /**
     * @param $url
     * @param array $option
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function post($url, $option=[], $jsonParse=true)
    {
        $response = $this->client->post($url, $option);
        $body = $response->getBody();
        if ($response->getStatusCode() == 200) {
            if ($jsonParse) {
                $body = \GuzzleHttp\json_decode($body, true);
            }
            return ret_success('success', $body);
        } else {
            return ret_code($response->getStatusCode(), 'fail', $body);
        }
    }


}
