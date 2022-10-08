<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\PurchaseOrder;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Layout\Content;
use App\Models\PurchaseProduct;
use App\Models\ProductModel;
use Dcat\Admin\Widgets\Table;

class PurchaseOrderController extends AdminController
{
        public function index(Content $content)
    {
        return $content
            ->header('采购单')
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
        return Grid::make(new PurchaseOrder(['purchase_products']), function (Grid $grid) {
            $grid->column('order_id','订单编号')->sortable();
            $grid->column('date','订单日期');
            $grid->column('person','采购人员');
            $grid->column('note','采购备注');
            $grid->column('采购产品')
                ->expand(function () {
                    $table_title = ['产品库ID','产品名称','采购数目','原始采购单价','实际采购总额'];
                    $data = [];

                    foreach ($this->purchase_products as $purchase_product){
                        $products = ProductModel::get()->where('id','=',$purchase_product->product_id);
                        foreach ($products as $product){
                            $data[] = [$product->id, $product->pluck('name_chinese')[0], $purchase_product->purchase_number,$product->purchase_cost,$purchase_product->total_cost];
                        }
                    }

                    $table = new Table($table_title, $data);

                    return "<div style='padding:10px 10px 0;color:green;'>$table</div>";
                });
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });

            $grid->toolsWithOutline(false);

            $grid->showQuickEditButton();
            $grid->model()->orderBy("id", "asc");
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
        return Show::make($id, new PurchaseOrder(), function (Show $show) {
            $show->field('order_id');
            $show->field('date');
            $show->field('person');
            $show->field('note');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        // return Form::make(new PurchaseOrder(), function (Form $form) {
        //     $form->display('id');
        //     $form->text('date');
        //     $form->text('person');
        //     $form->text('note');
        
        // });

        return Form::make(new PurchaseOrder(['purchase_products']), function (Form $form) {
            if ($form->isCreating()) {
                $this->creating($form);
            } elseif ($form->isEditing()) {
                $this->editing($form);
            }
        });
    }

    /**
     * @param Form $form
     */
    protected function creating(Form &$form): void
    {
        $form->disableListButton();
        $form->row(function ($form) {
            $form->width(4)->text('order_id','采购单号')->default(build_order_no('CG'))->required()->readOnly();;
            $form->width(4)->text('date','采购日期')->default(now())->required()->readOnly();;
            $form->width(4)->text('person','采购人员');
            
        });

        $form->row(function ($form) {
            $form->hasMany('purchase_products', '', function (Form\NestedForm $table) {
                $table->select('product_id', '产品库ID')->options(\App\Models\ProductModel::pluck('name_chinese', 'id'))->loads(['purchasemethod','purchase_cost'], [route('dcat.admin.api.product.find.purchasemethod'),route('dcat.admin.api.product.find.purchasecost')])->required();
                $table->select('purchasemethod', '采购链接')->options()->required();
                $table->select('purchase_cost', '原始采购价格')->options()->required();
                $table->text('purchase_number', '采购数目')->required();
                $table->text('total_cost','实际采购总金额')->required();
            })->useTable();
        });

        $form->row(function ($form) {
            $form->width(6)->textarea('note','采购备注');
        }); 

    }


    protected function editing(Form &$form): void
    {
        $form->disableListButton();
        $form->row(function ($form) {
            $form->width(4)->text('order_id','采购单号')->default(build_order_no('CG'))->required()->readOnly();;
            $form->width(4)->text('date','采购日期')->default(now())->required()->readOnly();;
            $form->width(4)->text('person','采购人员');
            
        });

        $form->row(function ($form) {
            $form->hasMany('purchase_products', '', function (Form\NestedForm $table) {
                $table->width(3)->select('product_id', '产品库ID')->options(\App\Models\ProductModel::pluck('name_chinese', 'id'))->loads(['purchasemethod','purchase_cost'], [route('dcat.admin.api.product.find.purchasemethod'),route('dcat.admin.api.product.find.purchasecost')])->required();
                $table->width(3)->select('purchasemethod', '采购链接')->options()->required();
                $table->width(3)->select('purchase_cost', '采购价格')->options()->required();
                $table->width(3)->text('purchase_number', '采购数目')->required();
                $table->width(3)->text('total_cost','采购总金额')->required();
            })->useTable();
        });

        $form->row(function ($form) {
            $form->width(6)->textarea('note','采购备注');
        }); 
    }
}
