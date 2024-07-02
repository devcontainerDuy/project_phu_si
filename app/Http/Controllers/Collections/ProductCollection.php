<?php

namespace App\Http\Controllers\Collections;

use App\Http\Controllers\Controller;
use App\Models\Collections\ProductCollection as ProductCollectionModel;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Inertia\Inertia;
use App\Traits\HasCrud;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class ProductCollection extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = ProductCollectionModel::all();
        return Inertia::render('Collections/Index',['collection'=>$data]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data = ProductCollectionModel::all();
        return Inertia::render('Collections/Create',['collections'=> $data]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'collection' => 'required',
            'position'=>'numeric'
        ], [
            'collection.required'=>'Nhóm loại sản phẩm bắt buộc',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $data= $request->all();
        $data['slug']=Str::slug($request->collection);
        $data['model']='ProductCollection';
        $data['created_at']=now();
        ProductCollectionModel::create($data);
        return response()->json(['check'=>true]);
    }

    /**
     * Display the specified resource.
     */
    public function show(ProductCollectionModel $ProductCollectionModel)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ProductCollectionModel $ProductCollectionModel,$id)
    {

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ProductCollectionModel $ProductCollectionModel,$id)
    {
        $data=$request->all();
        if($request->has('collection')){
            $data['slug']=Str::slug($request->collection);
        }
        $collection=ProductCollectionModel::find($id);
        if(!$collection){
            return response()->json(['check'=>false,'msg'=>'Không tìm thấy collection']);
        }
        ProductCollectionModel::where('id',$id)->update($data);
        $result = ProductCollectionModel::all();
        return response()->json(['check'=>true,'data'=>$result]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ProductCollectionModel $ProductCollectionModel)
    {
        //
    }
}