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
use AmrShawky\LaravelCurrency\Facade\Currency;

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

    $currency_list = App\Models\Currency::get();
    if (!$currency_list){
        $currency_eur = $currency =  round( Currency::convert()->from('EUR')->to('CNY')->amount(1)->get() , 2);
        $currency_usd = $currency =  round( Currency::convert()->from('USD')->to('CNY')->amount(1)->get() , 2);
        $currency_jp = $currency =  round( Currency::convert()->from('JP')->to('CNY')->amount(1)->get() , 2);
        $currency_uk = $currency =  round( Currency::convert()->from('UK')->to('CNY')->amount(1)->get() , 2);
        $currency_cad = $currency =  round( Currency::convert()->from('CAD')->to('CNY')->amount(1)->get() , 2);
        $currency_au = $currency =  round( Currency::convert()->from('AU')->to('CNY')->amount(1)->get() , 2);
    }
    else {
        $currency_eur = App\Models\Currency::get()->where('country','=', 'DE')->first()->currency;
        $currency_usd = App\Models\Currency::get()->where('country','=', 'US')->first()->currency;
        $currency_jp = App\Models\Currency::get()->where('country','=', 'JP')->first()->currency;
        $currency_uk = App\Models\Currency::get()->where('country','=', 'UK')->first()->currency;
        $currency_cad = App\Models\Currency::get()->where('country','=', 'CA')->first()->currency;
        $currency_au = App\Models\Currency::get()->where('country','=', 'AU')->first()->currency;
    }
    
// <li class="nav-item">
//         <a><i style="font-size: 1rem"></i>世界时间：北  京:$datetime_china ||伦  敦:$datetime_london ||多伦多:$datetime_duolunduo ||温哥华:$datetime_wengehua ||洛杉矶:$datetime_la &nbsp; ||马德里:$datetime_es</a>
//     </li>
    //     <li>
    //     <a style="font-size: 1rem">常用邮编：US-90001; CA-V5K V6Z; ES-35600; IT-00185; FR-75020; DE-10115; UK-SE1 1XJ; AU-1001; JP-190 0155;</a>
    // </li>

    $navbar->$method(

          <<<HTML
<ul class="nav navbar-nav">

    <li>
        <a style="font-size: 1rem">系统汇率：EUR-CNY:$currency_eur; USD-CNY:$currency_usd; CAD-CNY:$currency_cad; JP-CNY:$currency_jp; UK-CNY:$currency_uk; AU-CNY:$currency_au;&nbsp; &nbsp;&nbsp; &nbsp;</a>
    </li>
</ul> 
HTML

//         <<<HTML
// <ul class="nav navbar-nav">
//     <li class="nav-item">
//         &nbsp;
//         <a style="cursor: pointer" onclick="window.open('https://github.com/jqhph/dcat-admin-demo')">
//             <i class="feather icon-github" style="font-size: 1rem"></i> DEMO源码下载
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

// //表格全局初始化
// Grid::resolving(function (Grid $grid) {
//     $grid->setActionClass(\Dcat\Admin\Grid\Displayers\Actions::class);
//     $grid->model()->orderBy("id", "asc");
//     $grid->disableViewButton();
//     $grid->showQuickEditButton();
//     $grid->enableDialogCreate();
//     //$grid->disableBatchDelete();
    // $grid->actions(function (\Dcat\Admin\Grid\Displayers\Actions $actions) {
    //     $actions->disableView();
    //     $actions->disableDelete();
    //     $actions->disableEdit();
//     });
//     $grid->option("dialog_form_area", ["70%", "80%"]);
// });


\App\Admin\Extensions\Form\Select::macro();


Dcat\Admin\Form::extend('ipt', \App\Admin\Extensions\Form\Input::class);
