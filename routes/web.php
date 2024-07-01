<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Users\PermissionsController;
use App\Http\Controllers\Users\RolesController;
use App\Http\Controllers\Users\UsersController;


Route::prefix('admin')->middleware('auth')->group(function () {
    Route::resource('permissions', PermissionsController::class);
    //================================
    Route::post('/permissions/add-role-permision',[PermissionsController::class,'role_permission']);
    Route::get('/permissions/roles/{id}',[PermissionsController::class,'get_permissions']);

    //===========================================================
    Route::resource('roles', RolesController::class);

    //===========================================================
    Route::resource('users', UsersController::class);
    //==========================================================
});
Route::get('/',[UsersController::class,'login'])->name('login');
Route::post('/checkLogin',[UsersController::class,'checkLogin'])->middleware('web');
Route::get('/logout',[UsersController::class,'logout'])->name('logout');


