<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\TableListing;
use App\Admin\Actions\Grid\UploadListing;
use App\Admin\Actions\Grid\DownloadListingTemplate;
use App\Models\InventoryOut;
use App\Models\Currency;
use App\Models\FbaListing;
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
        return Grid::make(new TableListing(['latest_review','purchase_cost','product']), function (Grid $grid) {
            //$grid->title('listing列表');
            $grid->column('id','链接ID')->sortable()->copyable();
            $grid->column('product.id','产品库ID')->copyable();
            $grid->column('product.image_column','产品图片')->image('',50,50);
            $grid->column('product.name_chinese','产品名称')->limit(30, '...');
            //$grid->column('irobot_sku','产品SKU')->copyable();
            $grid->column('country','国家')->setAttributes(['style' => 'color:blue;font-size:14px']);
            $grid->column('amz_account','账号名字')->label('danger');
            //$grid->column('amz_sku','平台SKU')->badge('#222');;
            $grid->column('asin','ASIN')->link(function() {
                return 'http://www.amazon.'.$this->country.'/dp/'.$this->asin;
            });
            $grid->column('fnsku','FNSKU');

            
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
                        //dd($this->purchase_cost);
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
                        $fbalistings = FbaListing::get()->where('listing_id','=', $this->id);

                        
                        $table_title = ['国家','发货ID','发货个数','运输方式','承运商','跟踪号','发货日期','期望到达日期','实际上架日期','货件状态'];
                        $data = [];

                        foreach($fbalistings as $fbalisting){
                            $fbashipments = InventoryOut::get()->where('id','=',$fbalisting->fbaid);
                            if (!$fbashipments){
                                return ;    
                            }
                            foreach($fbashipments as $fbashipment ){
                                if (!$fbashipment)
                                {
                                    return ;
                                }
                                $data[] = [$fbashipment->to_country,$fbashipment->fbaid,$fbalisting->send_number,$fbashipment->send_method,$fbashipment->carrier_name,$fbashipment->tracking_num,$fbashipment->date_create_ship,$fbashipment->hope_arrive_date,$fbashipment->actural_arrive_date,$fbashipment->status];
                            }
                        }


                        $table = new Table($table_title, $data);

                        return "<div style='padding:10px 10px 0;color:grey;'>$table</div>";
                    });

            $grid->tools(function (Grid\Tools $tools) {
                // excle 导入
                $tools->append(new UploadListing());

                // 模板下载
                $tools->append(new DownloadListingTemplate());
            });

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('country','国家');
                // $filter->equal('irobot_sku','赛合SKU');
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
            //$this->setForm($form);
            if ($form->isCreating()) {
                $this->editing($form);
            } 

            elseif ($form->isEditing()) {
                 $this->editing($form);
            }
        });
    }


    protected function editing(Form &$form): void
    {            
        $form->display('id','链接ID');

        $form->select('irobot_sku','关联产品SKU')->options(ProductModel::pluck('name_chinese', 'id'))->required();

        $form->text('amz_account')->required()->default('YSWQ');
        $form->text('country')->required()->default('CA');
        // $form->text('amz_sku');
        $form->text('asin')->required();
        $form->text('fnsku');

        // $form->text('upc');

        $form->text('saler')->required()->default('csf');
        $form->text('price','售价')->required()->default('19.99');
        $form->currency('fba_fee','FBA费用')->required()->default('5.68');
        $form->rate('amz_sale_commssion','FBA佣金费率')->required()->default('0.15');
        
    }

    protected function creating(Form &$form): void
    {
        // $form->row(function (Form\Row $row) {
        //     $row->hasMany('items', '', function (Form\NestedForm $table) {
        //         $table->select('selected_product_id', '名称')->options(ProductModel::pluck('name_chinese', 'id'))->loadpku(route('dcat.admin.api.product.find'))->required();
        //         $table->ipt('asin', 'asin')->rem(6)->default('-')->disable();
        //     })->useTable()->width(12);


        // });
    }
}
