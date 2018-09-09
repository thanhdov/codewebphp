<?php

namespace App\Promocodes;

use Illuminate\Support\ServiceProvider;

class PromocodesServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        $this->mergeConfigFrom(
            __DIR__ . '/../../config/promocodes.php', 'promocodes'
        );

        $this->app->singleton('promocodes', function ($app) {
            return new Promocodes();
        });
    }
}
