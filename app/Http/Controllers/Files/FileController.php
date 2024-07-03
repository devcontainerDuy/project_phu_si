<?php

namespace App\Http\Controllers\Files;

use App\Http\Controllers\Controller;
use App\Models\Files\Folders;
use App\Models\Files\Files;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
class FileController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $folders= Folders::all();
        return Inertia::render('Files/File',['folders'=>$folders]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'files' => 'required|array',
            'files.*' => 'required|image|mimes:jpeg,png,jpg,gif,webp|max:2048',
            'folder_id' => 'exists:folders,id',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $folder='';
        $folder_id=$request->folder_id;
        if($request->has('folder_id')){
            $folder=Folders::where('id',$request->folder_id)->value('name');
        }
        foreach ($request->file('files') as $file) {
            $imageName = $file->getClientOriginalName();
            $extractTo = storage_path('app/public/'+$folder);
            $file->move($extractTo, $imageName);
            Files::create([
                'id_parent' => $id,
                'image' => $imageName,
                'status' => 0,
                'folder_id'=>$folder_id
            ]);
            $result[] = Storage::url($folder.'/' . $imageName);
        }
        return response()->json(['check'=>true,'data'=> $result]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Files $files,$id)
    {
        $files= Files::with('folder')->where('folder_id',$id)->get();
        return response()->json(['data'=>$files]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Folders $folders)
    {

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Folders $folders,$id)
    {
        $folder=Folders::find($id);
        if(!$folder){
            return response()->json(['check'=>false,'msg'=>'Không tìm thấy mã thư mục']);
        }
        $data=$request->all();
        $data['updated_at']= now();
        Folders::where('id',$id)->update($data);
        $folders= Folders::all();
        return response()->json(['check'=>true,'data'=>$folders]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Folders $folders,$id)
    {
        $folder=Folders::find($id);
        if(!$folder){
            return response()->json(['check'=>false,'msg'=>'Không tìm thấy mã thư mục']);
        }
        $check=Files::where('folder_id',$id)->first();
        if($check){
            return response()->json(['check'=>false,'msg'=>'Còn hình trong thư mục này']);
        }
    }
}
