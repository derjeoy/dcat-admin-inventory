<style>
    .row {
        margin: 0;
    }
    .col-md-12,
    .col-md-3 {
        padding: 0;
    }
    @media screen and (min-width: 1000px) and (max-width: 1150px) {
        .col-lg-3,
        .col-lg-9 {
            flex: 0 0 50%;
            max-width: 50%;
        }
    }
    @media screen and (min-width: 1151px) and (max-width: 1300px) {
        .col-lg-3 {
            flex: 0 0 40%;
            max-width: 40%;
        }
        .col-lg-9 {
            flex: 0 0 60%;
            max-width: 60%;
        }
    }
    @media screen and (min-width: 1301px) and (max-width: 1700px) {
        .col-lg-3 {
            flex: 0 0 35%;
            max-width: 35%;
        }
        .col-lg-9 {
            flex: 0 0 65%;
            max-width: 65%;
        }
    }

    .login-page {
        height: auto;
    }
    .login-main {
        position: relative;
        display: flex;
        min-height: 100vh;
        flex-direction: row;
        align-items: stretch;
        margin: 0;
    }

    .login-main .login-page {
        background-color: #fff;
    }

    .login-main .card {
        box-shadow: none;
    }

    .login-main .auth-brand {
        margin: 4rem 0 4rem;
        font-size: 26px;
        width: 325px;
    }

    @media (max-width: 576px) {
        .login-main .auth-brand {
            width: 90%;
            margin-left: 24px
        }
    }

    .login-main .login-logo {
        font-size: 2.1rem;
        font-weight: 300;
        margin-bottom: 0.9rem;
        text-align: left;
        margin-left: 20px;
    }

    .login-main .login-box-msg {
        margin: 0;
        padding: 0 0 20px;
        font-size: 0.9rem;
        font-weight: 400;
        text-align: left;
    }

    .login-main .btn {
        width: 100%;
    }

    .login-page-right {
        padding: 6rem 3rem;
        flex: 1;
        position: relative;
        color: #fff;
        background-color: rgba(0, 0, 0, 0.3);
        text-align: center !important;
        background: url(/vendor/dcat-admin/images/pages/login/bg.jpg) center;
        background-size: cover;
    }

    .login-description {
        position: absolute;
        margin: 0 auto;
        padding: 0 1.75rem;
        bottom: 3rem;
        left: 0;
        right: 0;
    }

    .content-front {
        position: absolute;
        left: 0;
        right: 0;
        height: 100vh;
        background: rgba(0,0,0,.1);
        margin-top: -6rem;
    }

    body.dark-mode .content-front {
        background: rgba(0,0,0,.3);
    }

    body.dark-mode .auth-brand {
        color: #cacbd6
    }
</style>
<div class="row login-main">
    <div class="col-lg-3 col-12 bg-white">
        <div class="login-page">
            <div class="auth-brand text-lg-left">
                {!! config('admin.logo') !!}
            </div>

            <div class="login-box">
                <div class="login-logo mb-2">
                    <h4 class="mt-0">注册新用户</h4>
                    <p class="login-box-msg mt-1 mb-1">请输入您的注册信息</p>
                </div>
                <div class="card">
                    <div class="card-body login-card-body">

                        <form id="register-form" method="POST" action="{{ admin_url('auth/register') }}">

                            <input type="hidden" name="_token" value="{{ csrf_token() }}"/>

                            <fieldset class="form-label-group form-group position-relative has-icon-left">
                                <input
                                        type="text"
                                        class="form-control {{ $errors->has('username') ? 'is-invalid' : '' }}"
                                        name="username"
                                        placeholder="{{ trans('admin.username') }}"
                                        value=""
                                        required
                                        autofocus
                                >

                                <div class="form-control-position">
                                    <i class="feather icon-user"></i>
                                </div>

                                <label for="email">登录用户名(用户邮箱)</label>

                                <div class="help-block with-errors"></div>
                                @if($errors->has('username'))
                                    <span class="invalid-feedback text-danger" role="alert">
                                                    @foreach($errors->get('username') as $message)
                                            <span class="control-label" for="inputError"><i class="feather icon-x-circle"></i> {{$message}}</span><br>
                                        @endforeach
                                                </span>
                                @endif
                            </fieldset>

                            <fieldset class="form-label-group form-group position-relative has-icon-left">
                                <input
                                        type="text"
                                        class="form-control {{ $errors->has('chinese_name') ? 'is-invalid' : '' }}"
                                        name="chinese_name"
                                        placeholder="中文姓名"
                                        value=""
                                        required
                                        autofocus
                                >

                                <div class="form-control-position">
                                    <i class="feather icon-user"></i>
                                </div>

                                <label>中文姓名</label>
                            </fieldset>

                            <fieldset class="form-label-group form-group position-relative has-icon-left">
                                <input
                                        type="text"
                                        class="form-control {{ $errors->has('phone') ? 'is-invalid' : '' }}"
                                        name="phone"
                                        placeholder="手机号"
                                        value=""
                                        required
                                        autofocus
                                >

                                <div class="form-control-position">
                                    <i class="feather icon-user"></i>
                                </div>

                                <label>手机号</label>
                            </fieldset>


                            <fieldset class="form-label-group form-group position-relative has-icon-left">
                                <input
                                        minlength="5"
                                        maxlength="20"
                                        id="password"
                                        type="password"
                                        class="form-control {{ $errors->has('password') ? 'is-invalid' : '' }}"
                                        name="password"
                                        placeholder="{{ trans('admin.password') }}"
                                        required
                                        value=""
                                        autocomplete="current-password"
                                >

                                <div class="form-control-position">
                                    <i class="feather icon-lock"></i>
                                </div>
                                <label for="password">{{ trans('admin.password') }}</label>

                                <div class="help-block with-errors"></div>
                                @if($errors->has('password'))
                                    <span class="invalid-feedback text-danger" role="alert">
                                                    @foreach($errors->get('password') as $message)
                                            <span class="control-label" for="inputError"><i class="feather icon-x-circle"></i> {{$message}}</span><br>
                                        @endforeach
                                                    </span>
                                @endif

                            </fieldset>

                            <fieldset class="form-label-group form-group position-relative has-icon-left">
                                <input
                                        minlength="5"
                                        maxlength="20"
                                        id="password"
                                        type="password"
                                        class="form-control {{ $errors->has('re_password') ? 'is-invalid' : '' }}"
                                        name="re_password"
                                        placeholder="再次输入密码"
                                        required
                                        value=""
                                        autocomplete="current-password"
                                >

                                <div class="form-control-position">
                                    <i class="feather icon-lock"></i>
                                </div>
                                <label for="password">再次输入密码</label>

                                <div class="help-block with-errors"></div>
                                @if($errors->has('re_password'))
                                    <span class="invalid-feedback text-danger" role="alert">
                                                    @foreach($errors->get('re_password') as $message)
                                            <span class="control-label" for="inputError"><i class="feather icon-x-circle"></i> {{$message}}</span><br>
                                        @endforeach
                                                    </span>
                                @endif

                            </fieldset>


                            <div class="form-group d-flex justify-content-between align-items-center">
                                <button type="submit" class="btn btn-primary float-right login-btn">
                                    注册&nbsp;
                                    <i class="feather icon-arrow-right"></i>
                                </button>
                            </div>

                            <div class="help-block with-errors"></div>
                                @if($errors->has('register'))
                                    <span class="invalid-feedback text-danger" role="alert">
                                        @foreach($errors->get('register') as $message)
                                            <span class="control-label" for="inputError"><i class="feather icon-x-circle"></i> {{$message}}</span><br>
                                        @endforeach
                                            </span>
                                @endif

                                @if($success->has('registerinfo'))
                                    <span class="invalid-feedback text-danger" role="alert">
                                        @foreach($success->get('registerinfo') as $message)
                                            <span class="control-label" for="inputError"><i class="feather icon-x-circle"></i> {{$message}}</span><br>
                                        @endforeach
                                            </span>
                                @endif

                        </form>
                        <form id="login-form" method="GET" action="{{ admin_url('auth/login') }}">
                                <input type="hidden" name="_token" value="{{ csrf_token() }}"/>
                                <button  type="submit" class="btn btn-primary float-left login-btn">
                                    <i class="feather icon-arrow-left"></i>
                                    &nbsp;登录
                                </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="col-lg-9 col-12 login-page-right">
        <div class="content-front"></div>
        <div class="login-description">
            <p class="lead">
                一个由亚马逊5年精品运营开发的亚马逊后台管理系统。
            </p>
            <p>
                超凡ERP - 一个懂你的ERP系统
            </p>
        </div>
    </div>
</div>

<script>
    Dcat.ready(function () {
        // ajax表单提交
        $('#register-form').form({
                validate: true,
        });
    });
    
</script>