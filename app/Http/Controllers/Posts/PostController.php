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
        $categorys = PostsCategory::where('status', 1)->get();
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
            // 'id_collection' => 'required',
            'id_category' => 'required',
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
        try {
            $created = Posts::create($data);
            if ($created) {
                $posts = Posts::with('category')->get();
                return response()->json(['check' => true, 'msg' => 'Tạo bài viết thành công', 'data' => $posts]);
            } else {
                return response()->json(['check' => false, 'msg' => 'Tạo bài viết thất bại']);
            }
        } catch (\Exception $e) {
            return response()->json(['check' => false, 'msg' => $e->getMessage()]);
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
        $validator = Validator::make($request->all(), [
            'title' => 'min:3|string|max:255|unique:posts,title',
            'summary' => 'min:10|string|max:255',
            // 'id_collection' => 'required',
            'id_category' => 'exists:post_categories,id|numeric',
            'position' => 'min:0|numeric|max:255',
            'content' => 'min:10|string|max:255|nullable',
            'status' => 'boolean|in:0,1',
            'highlighted' => 'boolean|in:0,1',
        ]);

        if ($validator->fails()) {
            return response()->json(['check' => false, 'data' => $validator->errors()->first()]);
        }

        $data = $request->all();
        $request->has('title') ? $data['slug'] = Str::slug($request->title) : '';
        $data['updated_at'] = now();
        try {
            $updated = Posts::findOrFail($id)->update($data);
            if ($updated) {
                $posts = Posts::with('category')->get();
                return response()->json(['check' => true, 'msg' => 'Cập nhật bài viết thành công', 'data' => $posts]);
            } else {
                return response()->json(['check' => false, 'msg' => 'Cập nhật thất bại']);
            }
        } catch (\Exception $e) {
            return response()->json(['check' => false, 'msg' => $e->getMessage()]);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
