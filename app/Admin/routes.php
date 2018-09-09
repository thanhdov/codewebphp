<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'     => config('admin.route.prefix'),
    'namespace'  => config('admin.route.namespace'),
    'middleware' => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    $router->resource('shop_customer', ShopCustomerController::class);
    $router->resource('shop_order', ShopOrderController::class);
    $router->resource('shop_product', ShopProductController::class);
    $router->resource('shop_category', ShopCategoryController::class);
    $router->resource('cms_category', CmsCategoryController::class);
    $router->resource('cms_content', CmsContentController::class);
    $router->resource('cms_news', CmsNewsController::class);
    $router->resource('cms_page', CmsPageController::class);
    $router->resource('banner', BannerController::class);
    $router->resource('shop_brand', ShopBrandController::class);
    $router->resource('shop_order_status', ShopOrderStatusController::class);
    $router->resource('shop_payment_status', ShopPaymentStatusController::class);
    $router->resource('shop_shipping_status', ShopShipingStatusController::class);
    $router->resource('shop_option', ShopOptionController::class);
    $router->resource('shop_special_price', ShopSpecialPriceController::class);
    $router->resource('config_info', ConfigInfoController::class);
    $router->resource('config_mode', ConfigModeController::class);
    $router->resource('shop_promotion', ShopPromotionController::class);
    $router->resource('shop_shipping', ShopShippingController::class);
    $router->get('/getInfoUser', 'ShopOrderController@getInfoUser')->name('getInfoUser');
    $router->get('/getInfoProduct', 'ShopOrderController@getInfoProduct')->name('getInfoProduct');
    $router->get('/shop_order_edit/{id}', 'ShopOrderController@detailOrder')->name('order_edit_get');
    $router->post('/shop_order_edit', 'ShopOrderController@postOrderEdit')->name('order_edit_post');
    $router->any('/shop_order_update', 'ShopOrderController@postOrderUpdate')->name('order_update');
    $router->get('/ckfinder', function () {
        return view('admin.ckfinder');
    });
});
