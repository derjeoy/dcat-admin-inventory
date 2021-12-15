<?php

namespace App\Admin\Controllers;

use Dcat\Admin\Http\Controllers\AuthController as BaseAuthController;
use Dcat\Admin\Layout\Content;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Dcat\Admin\Models\Administrator;

class AuthController extends BaseAuthController
{
    protected $view = 'admin.login';


     /**
     * Show the register page.
     *
     * @return Content|\Illuminate\Http\RedirectResponse
     */
    public function getRegister(Content $content)
    {
        if ($this->guard()->check()) {
            return redirect($this->getRedirectPath());
        }

        return $content->full()->body(view('admin.register'));
    }

    /**
     * Handle a register request.
     *
     * @param  Request  $request
     * @return mixed
     */
    public function postRegister(Request $request)
    {
        $credentials = $request->only(['username', 'chinese_name','phone','password','re_password']);

        $password = \request('password');
        $re_password = \request('re_password');

        if ($re_password != $password)
        {
            return $this->validationErrorsResponse([
                        'username' => '密码不匹配.'+$password,
                    ]);
        }

        /** @var \Illuminate\Validation\Validator $validator */
        $validator = Validator::make($credentials, [
            'username' => 'required',//['required', 'string', 'email', 'max:255', 'unique:users'],
            'chinese_name'  => 'required',
            'phone'  => 'required',
            'password' => 'required',//['required', 'string', 'min:5', 'confirmed'],
            're_password' => 'required',//['required', 'string', 'min:5', 'confirmed'],
        ]);

        if ($validator->fails()) {
            return $this->validationErrorsResponse($validator);
        }
        
        $ret = Administrator::get()->where('username',$credentials['username'])->first();
        if ($ret)
        {
            return $this->validationErrorsResponse([
                        'error' => '用户已存在',
                    ]);
        }

        $ret = Administrator::create([
            'username' => $credentials['username'],
            'name' => '西摩',
            'password' => Hash::make($credentials['password']),
        ]);
        if (!$ret)
        {
            return $this->validationErrorsResponse([
                'error' => '创建失败.']);
        }

        return $this->validationErrorsResponse([
            'error' => '注册成功,返回登录页面',
        ]);

        //$path = admin_url('auth/login');

        // if ($request->pjax()) 
        // {
        //     return "<script>location.href = '$path';</script>";
        // }
        // }

        // return redirect($path);


        
    }
}
