<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Collections\ProductCollection;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

Route::get('collections',[ProductCollection::class,'api_collections']);

Route::middleware(['web'])->group(function () {

});
