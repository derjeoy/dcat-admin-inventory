<?php
// 应用公共文件

function ret_success($msg,$data='')
{
    $ret = [
        'code'  =>  200,
        'msg'  =>  $msg,
        'time'  =>  time(),
    ];
    if (is_cli()) {
        $ret['time'] = date('Y-m-d H:i:s',time());
    }
    if (!empty($data)) {
        $ret['data'] = $data;
    }
    return $ret;
}

function ret_error($msg, $data=[])
{
    $ret = [
        'code'  =>  400,
        'msg'   =>  $msg,
        'time'  =>  time(),
    ];
    if (is_cli()) {
        $ret['time'] = date('Y-m-d H:i:s',time());
    }
    if (!empty($data)) {
        $ret['data'] = $data;
    }
    return $ret;
}

function ret_code($code, $msg, $data=[])
{
    $ret = [
        'code'  =>  $code,
        'msg'   =>  $msg,
        'time'  =>  time(),
    ];
    if (!empty($data)) {
        $ret['data'] = $data;
    }
    return $ret;

}

