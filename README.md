# Dcat Admin

本项目是[Dcat Admin](https://github.com/jqhph/dcat-admin)的DEMO源码，在线预览[点击这里](http://103.39.211.179:8080/admin)。


仓库地址

- Github [https://github.com/jqhph/dcat-admin-demo](https://github.com/jqhph/dcat-admin-demo) 
- Gitee  [https://gitee.com/jqhph/dcat-admin-demo](https://gitee.com/jqhph/dcat-admin-demo) 

## 安装

运行
```shell
composer install
```

安装完之后，复制一份`.env.example`文件并命名为`.env`，然后运行
```shell
php artisan key:generate
```

然后配置好数据库连接信息运行以下命令

> 这里会提示文件夹已存在，忽略即可。

```php
php artisan admin:install
```

最后运行`php artisan serve`。然后打开`http://localhost:8000/admin`即可访问，账号`admin`，密码`admin`。



## 亚马逊反爬
https://www.sohu.com/a/285133490_759197

## Laravel 表单
https://blog.csdn.net/hualaoshuan/article/details/98481204?ops_request_misc=&request_id=&biz_id=&utm_medium=distribute.pc_search_result.none-task-blog-2~all~es_rank~default-20-98481204.pc_search_all_es&utm_term=laravel&spm=1018.2226.3001.4187

## Laravel8开荒~正确安装前端Bootstrap CSS库
https://learnku.com/articles/49892

## python3爬虫实战之selenium爬取亚马逊商品  - 改邮编
https://blog.csdn.net/weixin_39020133/article/details/105966388


## PHP调用Python和PHP向Python发送数据
https://blog.csdn.net/qq_37035946/article/details/91492379



## 基于 Laravel 构建的适用于小公司和自由职业者的免费在线财务会计系统 —— Akaunting
https://laravelacademy.org/post/9483.html


## 基于 Laravel 构建的免费、开源 CRM 平台 —— Flarepoint
https://laravelacademy.org/post/5305.html

## laravel-admin / Dcat admin 上传Excel并导入数据到数据库
https://blog.csdn.net/qq_42468039/article/details/108277599

## Laragon工具
git config --global http.sslVerify "false"
Github
derjoey2010@163.com
302019csf
githun token:githun123  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

php artisan key:generate

php -S 127.0.0.1:8000 -t ./ -f serve.php

php artisan sample-data:seed

php artisan install --db-host=localhost --db-name=akaunting --db-username=root --db-password= --company-name=Stephen

php artisan migrate

详情看
vendor
------dcat
----------laravel-admin
------------------------redame.md




## 遇到问题
、、、
1.不能RUI访问本地图片或文件
执行命令：php artisan storage:link
命令执行完毕后，就会在项目里多出一个 public/storage，
这个 storage 就是一个软链接，它指向 storage/app/public 目录。
public/storage（软连接） → storage/app/public
然后就可以用地址直接访问public里面的照片了
、、、
2.php artisan admin:install执行这一步命令可能会报以下错误 Specified key was too long ... 767 bytes，如果出现这个报错。
请在 app/Providers/AppServiceProvider.php 文件的 boot方法中加上代码 
\Schema::defaultStringLength(191);，
然后删除掉数据库中的所有数据表，再重新运行一遍 php artisan admin:install 命令即可。
、、、


数据库table操作
http://new.xiaosongit.com/article/805.html


内网穿透
https://natapp.cn/

Discover ERP DEMO
http://erp.you-tang.com/admin/products

Dcat Admin Demo
http://103.39.211.179:8080/admin


laravel Admin
https://laravel-admin.org/docs/en/model-grid-quick-create#Select


Laravel Currency
https://github.com/amrshawky/laravel-currency

Dcat 图片插件
https://github.com/de-memory/dcat-media-selector

Laravel 视频教程
https://github.com/johnlui/Learn-Laravel-5


3D 头像 Meta 元宇宙
https://readyplayer.me/avatar
https://docs.readyplayer.me/integration-guides/web
https://github.com/readyplayerme/Example-iframe
https://github.com/readyplayerme

世界时间
https://carbon.nesbot.com/docs/
https://www.jb51.net/article/124259.htm
时区对照表：https://learnku.com/articles/39628


1.选中列导出按钮
2.添加文件上传按钮、添加文件下载按钮
3.单位换算

分页条件记忆
https://gitee.com/jqhph/dcat-admin/issues/I3H2KO