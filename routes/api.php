<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Collections\ProductCollection;
use App\Http\Controllers\Files\FolderController;
use App\Http\Controllers\Files\FileController;
use App\Http\Controllers\Products\ProductsController;
use App\Http\Controllers\Slide\SlidesController;
use App\Http\Controllers\Bills\BillsController;


Route::get('collections',[ProductCollection::class,'api_collections']);
Route::get('collections/{id}',[ProductCollection::class,'api_children_collections']);

//======================================================================
Route::get('products',[ProductsController::class,'api_products']);
Route::get('products/{id}',[ProductsController::class,'api_single']);

//======================================================================
Route::get('slides/{id}',[SlidesController::class,'api_slides']);

Route::middleware(['web'])->group(function () {
    Route::get('/folder',[FileController::class,'get_folder']);
    Route::get('/files/{id}',[FileController::class,'get_files']);
    Route::post('/rename-folder/{id}',[FileController::class,'rename_folder']);
});

Route::post('/products-import', [ProductsController::class,'Import']);

Route::post('/product-crawler',[ProductsController::class,'api_import']);

Route::post('/loadCart',[ProductsController::class,'api_load_cart_product']);

Route::post('/',[BillsController::class,'store']);