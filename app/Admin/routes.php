<?php

use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;
use Dcat\Admin\Admin;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->resource('products', 'ProductController');
    $router->resource('listings', 'TableListingController');
    $router->resource('listingsummary', 'TableListingController');
    $router->get('productsummary', 'HomeController@index');
    $router->resource('fbawarehouse', 'FCWarehouseController');
    $router->resource('currency', 'CurrencyController');
    $router->resource('purchaseorders', 'PurchaseOrderController');
    $router->resource('review', 'TableReviewController');
    $router->resource('overseasinvnetory', 'InventoryOverseaController');
    $router->resource('promotionproducts', 'PromotionProductController');
    $router->resource('promotionorders', 'PromotionOrderController');
    $router->resource('salesummery', 'SalesSummeryController');
    $router->resource('productinterest', 'ProductInterestController');
    $router->resource('websites', 'WebsiteController');

    $router->get('api/product', 'ApiController@getProductInfo')->name('api.product.find');
    $router->get('api/listing', 'ApiController@getListingInfo')->name('api.listing.find');
    $router->get('api/productlisting', 'ApiController@getProductListingInfo')->name('api.productlisting.find');

    
    $router->resource('shipments', 'InventoryOutController');
    $router->resource('purchaseinventory', 'InventoryPurchaseController');


    $router->resource('demands', 'DemandController');
    

    $router->get('/', 'HomeController@index');

    $router->resource('users', 'UserController');



});

    Route::get('admin/auth/register', 'App\Admin\Controllers\AuthController@getRegister');
    Route::post('admin/auth/register', 'App\Admin\Controllers\AuthController@postRegister');




