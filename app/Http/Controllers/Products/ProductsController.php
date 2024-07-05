<?php

namespace App\Http\Controllers\Products;

use App\Http\Controllers\Controller;
use App\Models\Products\Products;
use Illuminate\Http\Request;
use App\Models\Collections\ProductCollection;
use Inertia\Inertia;
use App\Models\Categories\Categories;
use App\Models\Brands\Brands;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Models\Products\Gallery;
use App\Models\Links;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\ProductExample;
use App\Imports\ProductsImport;

class ProductsController extends Controller
{


    /**
     * Display a listing of the resource.
     */

     public function index (){
        $products = Products::all();
        $brands = Brands::select('id','name')->get();
        return Inertia::render('Products/Index',['products'=>$products,'brands'=>$brands]);

     }
    /**
     * Display a listing of the resource.
     */
    public function import(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'file' => 'required|mimes:xlsx',

        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        Excel::import(new ProductsImport, $request->file);
        return response()->json(['check'=>true]);
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
            'images'=>'required|array',
            'collections'=>'required|array'
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $data['name']=$request->name;
        $data['slug']=Str::slug($request->name);
        $data['sku']=$request->sku;
        $data['price']=$request->price;
        $data['compare_price']=$request->compare_price;
        $data['attributes']=$request->get('attributes');
        $data['discount']=$request->discount;
        $data['description']=$request->description;
        $data['content']=$request->content;
        $data['id_brand']=$request->id_brand;
        $data['in_stock']=$request->instock;
        $data['created_at']=now();
        $id=Products::insertGetId($data);
        $images=$request->images;
        $collections = $request->collections;
        foreach ($images as $key => $value) {
            Gallery::create(['model'=>'PRODUCT','image'=>$value,'id_parent'=>$id,'status'=>0,'created_at'=>now()]);
        }
        foreach ($collections as $value) {
            Links::create(['id_link'=>$id,'id_parent'=>$value,'model1'=>'PRODUCTS','model2'=>'COLLECTIONS','created_at'=>now()]);
        }
        return response()->json(['check'=>true]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Products $products,$id)
    {
        $brands=Brands::active()->select('id','name')->get();
        $categories=Categories::active()->select('id','name')->get();
        $product=Products::find($id)->first();
        $gallery=Gallery::where('model','PRODUCT')->where('id_parent',$id)->select('id','image')->get();
        $collections=ProductCollection::active()->where('model','ProductCollection')->select('id','collection')->get();
        $idCollections = Links::where('model1', 'PRODUCTS')
            ->where('model2', 'COLLECTIONS')
            ->where('id_link', $id)
            ->pluck('id_parent');
        $allCollecions=ProductCollection::active()->select('id','collection')->get();
        return Inertia::render('Products/Edit',['dataidCollections'=>$idCollections,'id'=>$id,'product'=>$product,'gallery'=>$gallery,'categories'=>$categories,'brands'=>$brands,'collections'=>$collections,'allCollecions'=>$allCollecions,'datacontent'=>$product->content,'datadescription'=>$product->description]);
    }
    /**
     * Display the specified resource.
     */
    public function exportExample(Products $products)
    {
        return Excel::download(new ProductExample, 'products.xlsx');
    }
    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Products $products,$id)
    {

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Products $products,$id)
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
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }

        $product=Products::find($id)->first();
        if(!$product){
            return response()->json(['check'=>false,'msg'=>'Không tim thấy mã sản phẩm']);
        }
        $data['name']=$request->name;
        $data['slug']=Str::slug($request->name);
        $data['sku']=$request->sku;
        $data['price']=$request->price;
        $data['compare_price']=$request->compare_price;
        $data['attributes']=$request->get('attributes');
        $data['discount']=$request->discount;
        $data['description']=$request->description;
        $data['content']=$request->content;
        $data['id_brand']=$request->id_brand;
        $data['in_stock']=$request->instock;
        $data['updated_at']=now();
        Products::where('id',$id)->update($data);
        if($request->has('collections')){
            $collections = $request->collections;
            Links::where('id_link',$id)->delete();
            foreach ($collections as $value) {
                Links::create(['id_link'=>$id,'id_parent'=>$value,'model1'=>'PRODUCTS','model2'=>'COLLECTIONS','created_at'=>now()]);
            }
        }
        return response()->json(['check'=>true]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Products $products)
    {
        //
    }
}
