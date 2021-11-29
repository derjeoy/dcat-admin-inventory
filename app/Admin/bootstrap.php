<?php

use App\Admin\Grid\Tools\SwitchGridMode;
use Dcat\Admin\Admin;
use Dcat\Admin\Grid;
use Dcat\Admin\Form;
use Dcat\Admin\Grid\Filter;
use Dcat\Admin\Layout\Navbar;
use Dcat\Admin\Show;
use Dcat\Admin\Repositories\Repository;
use Carbon\Carbon;
/**
 * Dcat-admin - admin builder based on Laravel.
 * @author jqhph <https://github.com/jqhph>
 *
 * Bootstraper for Admin.
 *
 * Here you can remove builtin form field:
 *
 * extend custom field:
 * Dcat\Admin\Form::extend('php', PHPEditor::class);
 * Dcat\Admin\Grid\Column::extend('php', PHPEditor::class);
 * Dcat\Admin\Grid\Filter::extend('php', PHPEditor::class);
 *
 * Or require js and css assets:
 * Admin::css('/packages/prettydocs/css/styles.css');
 * Admin::js('/packages/prettydocs/js/main.js');
 *
 */

// 覆盖默认配置
config(['admin' => user_admin_config()]);
config(['app.locale' => config('admin.lang') ?: config('app.locale')]);

Admin::style('.main-sidebar .nav-sidebar .nav-item>.nav-link {
    border-radius: .1rem;
}');

// 扩展Column
Grid\Column::extend('code', function ($v) {
    return "<code>$v</code>";
});

Grid::resolving(function (Grid $grid) {
    if (! request('_row_')) {
        $grid->tableCollapse();


//        $grid->tools(new App\Admin\Grid\Tools\SwitchGridMode());
    }
});

// 追加菜单
Admin::menu()->add(include __DIR__.'/menu.php', 0);

Admin::navbar(function (Navbar $navbar) {
    // 切换主题
//    $navbar->right(view('admin.switch-theme', [
//        'map' => [
//            'indigo'    => Dcat\Admin\Admin::color()->indigo(),
//            'blue'      => '#5686d4',
//            'blue-dark' => '#5686d4',
//        ],
//    ]));
    $method = config('admin.layout.horizontal_menu') ? 'left' : 'right';


    $datetime_china = Carbon::now();
    $datetime_london = Carbon::now('Europe/London');
    $datetime_wengehua = Carbon::now('America/Vancouver');
    $datetime_duolunduo = Carbon::now('America/Toronto');
    $datetime_la = Carbon::now('America/Los_Angeles');
    $datetime_utc = Carbon::now('UTC');
    $datetime_es = Carbon::now('Europe/Madrid');
    $navbar->$method(

          <<<HTML
<ul class="nav navbar-nav">
    <li class="nav-item">
        <a><i style="font-size: 1.5rem"></i> 北  京:$datetime_china &nbsp;|| &nbsp;</a>
        <a><i style="font-size: 1.5rem"></i> 伦  敦:$datetime_london &nbsp;|| &nbsp;</a>
        <a><i style="font-size: 1.5rem"></i> 多伦多:$datetime_duolunduo &nbsp;|| &nbsp;</a>
        <a><i style="font-size: 1.5rem"></i> 温哥华:$datetime_wengehua &nbsp;|| &nbsp;</a>
        <a><i style="font-size: 1.5rem"></i> 洛杉矶:$datetime_la &nbsp;|| &nbsp;</a>
        <a><i style="font-size: 1.5rem"></i> 马德里:$datetime_es &nbsp;|| &nbsp;</a>
        <a><i style="font-size: 1.5rem"></i> 太平洋:$datetime_utc</a>
        &nbsp; &nbsp; 
    </li>
</ul> 
HTML

//         <<<HTML
// <ul class="nav navbar-nav">
//     <li class="nav-item">
//         &nbsp;
//         <a style="cursor: pointer" onclick="window.open('https://github.com/jqhph/dcat-admin-demo')">
//             <i class="feather icon-github" style="font-size: 1.5rem"></i> DEMO源码下载
//         </a> 
//         &nbsp; &nbsp; 
//     </li>
// </ul> 
// HTML

    );

    // ajax请求不执行
    if (! Dcat\Admin\Support\Helper::isAjaxRequest()) {
        $navbar->$method(App\Admin\Actions\AdminSetting::make()->render());
    }

    // 下拉菜单
    //$navbar->right(view('admin.navbar-2'));

    // 搜索框
    $navbar->right(
        <<<HTML
HTML
    );

    // 下拉面板
    $navbar->right(view('admin.navbar-1'));
});


//过滤初始化
Filter::resolving(function (Filter $filter) {
    $filter->panel();
    $filter->expand();
});

//表格全局初始化
Grid::resolving(function (Grid $grid) {
    $grid->setActionClass(\Dcat\Admin\Grid\Displayers\Actions::class);
    $grid->model()->orderBy("id", "asc");
    $grid->disableViewButton();
    $grid->showQuickEditButton();
    $grid->enableDialogCreate();
    $grid->disableBatchDelete();
    $grid->actions(function (\Dcat\Admin\Grid\Displayers\Actions $actions) {
        $actions->disableView();
        $actions->disableDelete();
        $actions->disableEdit();
    });
    $grid->option("dialog_form_area", ["70%", "80%"]);
});


\App\Admin\Extensions\Form\Select::macro();


Dcat\Admin\Form::extend('ipt', \App\Admin\Extensions\Form\Input::class);
