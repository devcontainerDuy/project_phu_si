<?php

namespace App\Http\Controllers\Slide;

use Inertia\Inertia;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Slide\Slide;
use Illuminate\Support\Facades\Validator;

class SlidesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Slide::all();
        return Inertia::render('Slides/Slides', ['slides' => $data]);
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
            'name' => 'required',
            'desktop' => 'required|image',
            'mobile' => 'required|image',
        ]);

        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }

        if ($request->hasFile('desktop') && $request->hasFile('mobile')) {
            $desktop = $request->file('desktop');
            $mobile = $request->file('mobile');
            $file_desktop = $desktop->getClientOriginalName();
            $file_mobile = $mobile->getClientOriginalName();
            $desktop->storeAs('/public/slides', $file_desktop);
            $mobile->storeAs('/public/slides', $file_mobile);
        }

        $data = [
            'name' => $request->name,
            'slug' => Str::slug($request->name),
            'url' => $request->url,
            'path' => `/slides/` . $request->name,
            'desktop' => $file_desktop,
            'mobile' => $file_mobile,
            'status' => 0,
            'created_at' => now(),
            'updated_at' => now(),
        ];

        $created = Slide::create($data);

        if ($created) {
            $data = Slide::all();
            return response()->json(['check' => true, 'msg' => 'Thêm slide thành công', 'data' => $data]);
        } else {
            return response()->json(['check' => false, 'msg' => 'Thêm slide thất bại']);
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
