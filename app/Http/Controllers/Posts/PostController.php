<?php

namespace App\Http\Controllers\Posts;

use Inertia\Inertia;
use App\Models\Post\Posts;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\Post\PostsCategory;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $posts = Posts::with('category')->get();
        $categorys = PostsCategory::all();
        return Inertia::render('Post/Post', ['posts' => $posts, 'categorys' => $categorys]);
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
            'title' => 'required',
            'summary' => 'required',
            // 'collection' => 'required',
            'category' => 'required',
            'position' => 'required',
            'content' => 'required',
            'status' => 'boolean',
            'highlighted' => 'boolean',
        ]);

        if ($validator->fails()) {
            return response()->json(['check' => false, 'data' => $validator->errors()->first()]);
        }

        $data = $request->all();
        $data['slug'] = Str::slug($request->title);
        $data['view'] = 0;
        $data['created_at'] = now();
        $data['updated_at'] = now();

        $created = Posts::create($data);
        if ($created) {
            $posts = Posts::with('category')->get();
            return response()->json(['check' => true, 'msg' => 'Tạo bài viết thành công', 'data' => $posts]);
        } else {
            return response()->json(['check' => false, 'msg' => 'Tạo bài viết thất bại']);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
