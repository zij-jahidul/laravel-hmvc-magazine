<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Modules\Package\Http\Controllers\AdsController;
use Modules\Package\Http\Controllers\PackagesController;

Route::group(['prefix' => 'admin', 'as' => 'admin.'], function () {
    /**
     * Category Management Routes
     */
    Route::group(['prefix' => ''], function () {
        Route::resource('packages', PackagesController::class);
        Route::get('packages/trashed/view', [PackagesController::class, 'trashed'])->name('packages.trashed');
        Route::delete('packages/trashed/destroy/{id}', [PackagesController::class, 'destroyTrash'])->name('packages.trashed.destroy');
        Route::put('packages/trashed/revert/{id}', [PackagesController::class, 'revertFromTrash'])->name('packages.trashed.revert');
    });

    Route::group(['prefix' => ''], function () {
        Route::resource('ads', AdsController::class);
        Route::get('ads/trashed/view', [AdsController::class, 'trashed'])->name('ads.trashed');
        Route::delete('ads/trashed/destroy/{id}', [AdsController::class, 'destroyTrash'])->name('ads.trashed.destroy');
        Route::put('ads/trashed/revert/{id}', [AdsController::class, 'revertFromTrash'])->name('ads.trashed.revert');
    });
});
