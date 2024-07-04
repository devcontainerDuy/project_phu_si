<?php

namespace App\Http\Controllers\Products;

use App\Http\Controllers\Controller;
use App\Models\Products\Products;
use Illuminate\Http\Request;
use App\Models\Collections\ProductCollection;
use Inertia\Inertia;
use App\Models\Categories\Categories;
use App\Models\Brands\Brands;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Models\Products\Gallery;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $brands=Brands::active()->select('id','name')->get();
        $categories=Categories::active()->select('id','name')->get();
        $collections=ProductCollection::active()->where('model','ProductCollection')->select('id','collection')->get();
        $allCollecions=ProductCollection::active()->select('id','collection')->get();
        return Inertia::render('Products/Create',['categories'=>$categories,'brands'=>$brands,'collections'=>$collections,'allCollecions'=>$allCollecions]);

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'sku' => 'required',
            'price' => 'required',
            'compare_price' => 'required',
            'attributes' => 'required',
            'discount' => 'required',
            'description'=>'required',
            'content'=>'required',
            'id_brand'=>'required|exists:brands,id',
            'instock'=>'required|numeric',
            'id_category'=>'required|exists:categories,id',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $data['name']=$request->name;
        $data['sku']=$request->sku;
        $data['price']=$request->price;
        $data['compare_price']=$request->compare_price;
        $data['attributes']=$request->attributes;
        $data['discount']=$request->discount;
        $data['description']=$request->description;
        $data['content']=$request->content;
        $data['id_brand']=$request->id_brand;
        $data['in_stock']=$request->instock;
        $data['id_category']=$request->id_category;
        $data['created_at']=now();
        $id=Products::insertGetId($data);
        $images=$request->images;
        foreach ($images as $key => $value) {
            Gallery::create(['model'=>'PRODUCT','image'=>$value,'id_parent'=>$value,'status'=>0,'created_at'=>now()]);
        }
        return response()->json(['check'=>true]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Products $products)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Products $products)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Products $products)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Products $products)
    {
        //
    }
}
