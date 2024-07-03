<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Users\PermissionsController;
use App\Http\Controllers\Users\RolesController;
use App\Http\Controllers\Users\UsersController;
use App\Http\Controllers\Collections\ProductCollection;
use App\Http\Controllers\Categories\CategoriesController;
use App\Http\Controllers\Brands\BrandController;
use App\Http\Controllers\Slide\SlidesController;

Route::prefix('admin')->middleware('auth')->group(function () {
    Route::resource('permissions', PermissionsController::class);
    //================================
    Route::post('/permissions/add-role-permision', [PermissionsController::class, 'role_permission']);
    Route::get('/permissions/roles/{id}', [PermissionsController::class, 'get_permissions']);
    //===========================================================
    Route::resource('roles', RolesController::class);
    //===========================================================
    Route::resource('users', UsersController::class);
    //==========================================================
    Route::resource('collections', ProductCollection::class);
    //==========================================================
    Route::resource('categories', CategoriesController::class);
    //==========================================================
    Route::resource('brands', BrandController::class);
    //==========================================================
    Route::resource('slides', SlidesController::class);
    //==========================================================
});
Route::get('/', [UsersController::class, 'login'])->name('login');
Route::post('/checkLogin', [UsersController::class, 'checkLogin'])->middleware('web');
Route::get('/logout', [UsersController::class, 'logout'])->name('logout');
