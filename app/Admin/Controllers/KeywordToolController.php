<?php

namespace App\Admin\Controllers;

use App\Admin\Renderable\KeywordPage;
use App\Http\Controllers\Controller;
use Dcat\Admin\Layout\Content;
use Illuminate\Http\Request;
use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;

class KeywordToolController extends Controller
{
    public function index(Content $content)
    {
        return $content->body(new KeywordPage());
    }

    public function input(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        $process = new Process(["python", "amazon.py", $data["country"],$data["keyword"],$data["asin"]]);//
        //$process->run(); // 同步进程
        $process->setTimeout(400); // 单位s，默认是60s
        $process->start(); //启动异步进程
        
        $process->wait(function ($type, $buffer) {
                if (Process::ERR === $type) 
                {
                    echo 'ERR > '.$buffer;
                } 
                else 
                {
                    echo 'OUT > '.$buffer;
                }
            });

        // 获取脚本输出 
        $msg = $process->getOutput();

        $result = ["code"=>200,"msg"=>$msg];

        return json_encode($result,JSON_UNESCAPED_UNICODE);
    }
}
