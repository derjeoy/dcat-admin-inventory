<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\TableListing;
use App\Admin\Actions\Grid\UploadListing;
use App\Admin\Actions\Grid\DownloadListingTemplate;
use App\Models\InventoryOut;
use App\Models\Currency;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Widgets\Table;
use App\Admin\Renderable\ListingTable;
use App\Models\ProductModel;
use Dcat\Admin\Widgets\Card;
use App\Admin\Forms\InventorySummary;
use Dcat\Admin\Layout\Content;
//use AmrShawky\LaravelCurrency\Facade\Currency;

class TableListingController extends AdminController
{
            public function index(Content $content)
    {
        return $content
            ->header('亚马逊链接')
            ->description('列表')
            ->body($this->grid());
    }
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new TableListing(['latest_review','purchase_cost','shipment','product']), function (Grid $grid) {
            //$grid->title('listing列表');
            $grid->column('id','链接ID')->sortable()->copyable();
            $grid->column('product.image_column','产品图片')->image('',50,50);
            $grid->column('irobot_sku','赛合SKU')->copyable();
            $grid->column('country','国家')->setAttributes(['style' => 'color:blue;font-size:14px']);
            $grid->column('amz_account','账号名字')->label('danger');
            $grid->column('amz_sku','平台SKU')->badge('#222');;
            $grid->column('asin','ASIN');
            $grid->column('fnsku','FNSKU');
            $grid->column('local_name','产品名称');
            $grid->column('latest_review.rew_number','评论');//关联字段解决
            $grid->column('latest_review.rew_rate','评分')->display(function () {
                if($this->latest_review)
                    if($this->latest_review->rew_rate < 4.3)
                    {
                        return ' <a data-title="rate" class="td-top-copy btn-danger btn ">' . $this->latest_review->rew_rate . '</a> &nbsp;&nbsp;&nbsp;';//关联字段解决
                    }
                    elseif ($this->latest_review->rew_rate == 4.3)
                    {
                        return ' <a data-title="rate" class="td-top-copy btn-warning btn ">' . $this->latest_review->rew_rate . '</a> &nbsp;&nbsp;&nbsp;';//关联字段解决
                    }
                    else
                    {
                        return ' <a data-title="rate" class="td-top-copy btn-success btn ">' . $this->latest_review->rew_rate . '</a> &nbsp;&nbsp;&nbsp;';//关联字段解决
                    }
                 
            });
            $grid->column('price','产品售价')->help('这里是产品售价，点开有利润')->editable();
            // ->display(function () {
            //      return ' <a data-title="PRICE" class="td-top-copy btn-white btn ">' . $this->price . '</a> &nbsp;&nbsp;&nbsp;';
            //  });
            $grid->column('saler','所属销售');
            $grid->column('利润率')
               ->display('详情')
               ->expand(function () {
                        $currency_model = Currency::get()->where('country','=', $this->country)->first();
                        $currency = 1.0;
                        //dd($currency_model);
                        if ($currency_model)
                            $currency = $currency_model->currency;

                        //使用laravelCurrency库 刷新listing页面会比较慢
                        // if ($this->country == 'FR' || $this->country == 'DE' ||$this->country == 'ES'||$this->country == 'IT')
                        //     $currency =  round( Currency::convert()->from('EUR')->to('CNY')->amount(1)->get() , 2);
                        // if ($this->country == 'US')
                        //     $currency = round( Currency::convert()->from('USD')->to('CNY')->amount(1)->get() ,2);
                        // if ($this->country == 'JP')
                        //     $currency = round(Currency::convert()->from('JP')->to('CNY')->amount(100)->get(),2);

                        $purchase_cost_cny = $this->purchase_cost->purchase_cost;
                        $purchase_cost_foreign =  round( $purchase_cost_cny/$currency , 2 );

                        $first_trans_fee = round( ($this->shipment) ? ($this->shipment->transportation_fee/$this->shipment->send_number) : 0 , 2);
                        $first_trans_fee_foreign = round( $first_trans_fee/$currency , 2);

                        $profit = round($this->price - $this->amz_sale_commssion - $this->fba_fee - $first_trans_fee_foreign - $purchase_cost_foreign , 2);
                        $profit_rate = round(($this->price - $profit)/$this->price * 100, 2);

                        $table_title = ['国家','实时汇率','采购成本CNY','采购成本外币','头程运费','平台佣金','FBA费用','产品售价','毛利','毛利率'];
                        $data[] = [$this->country,$currency,$purchase_cost_cny,$purchase_cost_foreign,$first_trans_fee_foreign,round($this->amz_sale_commssion,2),round($this->fba_fee,2),round($this->price,2),$profit,$profit_rate.'%'];

                        $table = new Table($table_title, $data);

                        return "<div style='padding:10px 10px 0;color:green;'>$table</div>";
                    });
            // $grid->column('库存信息')
            //    ->display('库存详情')->modal('库存详情', ListingTable::make());
            $grid->column('库存')
                ->display(function () {
                    return "<div style='padding:10px 10px 0;color:green;'>$this->price</div>";
                })
                ->expand(function () {
                        $shipments = InventoryOut::get()->where('listing_id','=', $this->id);

                        $data = [];
                        $table_title = ['国家','发货ID','发货个数','运输方式','承运商','跟踪号','发货日期','期望到达日期','货件状态'];
                        
                        foreach($shipments as $ship)
                        {
                            $data[] = [$ship->to_country,$ship->fbaid,$ship->send_number,$ship->send_method,$ship->carrier_name,$ship->tracking_num,$ship->date_create_ship,$ship->hope_arrive_date,$ship->status];
                        }

                        $table = new Table($table_title, $data);

                        return "<div style='padding:10px 10px 0;color:grey;'>$table</div>";
                    });
                // ->expand(function (Grid\Displayers\Expand $expand) {
                //     // 设置按钮名称
                //     $expand->button('库存详情');

                //     return InventorySummary::make()->payload(['id' => $this->id,'price'=>$this->price]);
                // });

            $grid->tools(function (Grid\Tools $tools) {
                // excle 导入
                $tools->append(new UploadListing());

                // 模板下载
                $tools->append(new DownloadListingTemplate());
            });

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('country','国家');
                $filter->equal('irobot_sku','赛合SKU');
                $filter->equal('asin','ASIN');
        
            });
            // ->help('这里是产品售价，点开有利润')->display(function () {
            //     return ' <a data-title="PRICE" class="td-top-copy btn-white btn ">' . $this->price . '</a> &nbsp;&nbsp;&nbsp;';
            // });;
        
            // $grid->column('irobot_sku','赛盒SKU')->help('点开有产品详情')->display(function () {
            //     Form::dialog('编辑角色')
            //         ->click('.edit-form')
            //             ->success('Dcat.reload()'); // 编辑成功后刷新页面

            //     // 当需要在同个“class”的按钮中绑定不同的链接时，把链接放到按钮的“data-url”属性中即可
            //     // $editPage = admin_base_path('/admin/form/layout/block');

            //     return ' <span class="btn btn-primary edit-form" data-url="/admin/form/layout/block"> 编辑表单弹窗</span> ';
            // });;

    

            //$grid->showQuickEditButton();

            //$grid->disableActions();
            
            //$grid->disableRowSelector();

            // 禁止按钮边框
            $grid->toolsWithOutline(false);
            $grid->fixColumns(1);
            $grid->showQuickEditButton();
            $grid->disableViewButton();

            //启用导出功能
            $grid->export()->xlsx();

        });
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        return Show::make($id, new TableListing(['latest_review','purchase_cost','shipment']), function (Show $show) {
            // $show->field('id');
            // $show->field('amz_account');
            // $show->field('country');
            // $show->field('amz_sku');
            // $show->field('asin');
            // $show->field('fnsku');
            // $show->field('local_name');
            // $show->field('upc');
            // $show->field('irobot_sku');
            // $show->field('saler');
            // $show->field('price','售价');
            // $show->field('fba_fee','FBA费用');
            // $show->field('amz_sale_commssion');
            // $show->field('latest_review.rew_number','评论');//关联字段解决
            // $show->field('latest_review.rew_rate','评分');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new TableListing(), function (Form $form) {
            $this->setForm($form);
            if ($form->isCreating()) {
                //$this->creating($form);
            } 

            // elseif ($form->isEditing()) {
            //     $this->editing($form);
            // }
        });
    }


    protected function setForm(Form &$form): void
    {
        $form->display('id');
        $form->text('amz_account');
        $form->text('country');
        $form->text('amz_sku');
        $form->text('asin');
        $form->text('fnsku');
        $form->text('local_name');
        $form->text('upc');
        $form->text('irobot_sku');
        $form->text('saler');
        $form->text('price','售价');
        $form->currency('fba_fee','FBA费用');
        $form->rate('amz_sale_commssion','FBA佣金费率');
    }

    protected function creating(Form &$form): void
    {
        $form->row(function (Form\Row $row) {
            $row->hasMany('items', '', function (Form\NestedForm $table) {
                //pluck(value, key) : 返回指定value,key的值组成的集合
                $table->select('selected_product_id', '名称')->options(ProductModel::pluck('name_chinese', 'id'))->loadpku(route('dcat.admin.api.product.find'))->required();
                $table->ipt('asin', 'asin')->rem(6)->default('-')->disable();
            })->useTable()->width(12);


        });
    }
}
