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

use Modules\Article\Http\Controllers\PagesController;
use Modules\Article\Http\Controllers\CategoriesController;
use Modules\Article\Http\Controllers\AdvertisementsController;

Route::group(['prefix' => 'admin', 'as' => 'admin.'], function () {
    /**
     * Category Management Routes
     */
    Route::group(['prefix' => ''], function () {
        Route::resource('categories', CategoriesController::class);
        Route::get('categories/trashed/view', [CategoriesController::class, 'trashed'])->name('categories.trashed');
        Route::delete('categories/trashed/destroy/{id}', [CategoriesController::class, 'destroyTrash'])->name('categories.trashed.destroy');
        Route::put('categories/trashed/revert/{id}', [CategoriesController::class, 'revertFromTrash'])->name('categories.trashed.revert');
    });

    /**
     * Page Management Routes
     */
    Route::group(['prefix' => ''], function () {
        Route::resource('pages', PagesController::class);
        Route::get('pages/trashed/view', [PagesController::class, 'trashed'])->name('pages.trashed');
        Route::delete('pages/trashed/destroy/{id}', [PagesController::class, 'destroyTrash'])->name('pages.trashed.destroy');
        Route::put('pages/trashed/revert/{id}', [PagesController::class, 'revertFromTrash'])->name('pages.trashed.revert');
    });

    Route::group(['prefix' => ''], function () {
        Route::resource('advertisements', AdvertisementsController::class);
        Route::get('advertisements/trashed/view', [AdvertisementsController::class, 'trashed'])->name('advertisements.trashed');
        Route::delete('advertisements/trashed/destroy/{id}', [AdvertisementsController::class, 'destroyTrash'])->name('advertisements.trashed.destroy');
        Route::put('advertisements/trashed/revert/{id}', [AdvertisementsController::class, 'revertFromTrash'])->name('advertisements.trashed.revert');
    });
});
