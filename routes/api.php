<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Collections\ProductCollection;
use App\Http\Controllers\Files\FolderController;
use App\Http\Controllers\Files\FileController;
use App\Http\Controllers\Products\ProductsController;


Route::get('collections',[ProductCollection::class,'api_collections']);

Route::middleware(['web'])->group(function () {
    Route::get('/folder',[FileController::class,'get_folder']);
    Route::get('/files/{id}',[FileController::class,'get_files']);
    Route::post('/rename-folder/{id}',[FileController::class,'rename_folder']);
});

Route::post('/products-import', [ProductsController::class,'Import']);

Route::post('/product-crawler',[ProductsController::class,'api_import']);
