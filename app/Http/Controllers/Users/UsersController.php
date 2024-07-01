<?php

namespace App\Http\Controllers\Users;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Roles;
use Illuminate\Support\Facades\Hash;
use Inertia\Inertia;
use Illuminate\Support\Facades\Validator;
use App\Mail\Users\Create;
use Illuminate\Support\Facades\Mail;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $roles=Roles::all();
        
        return Inertia::render('Users/Users',['roles'=>$roles]);

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
            'name' => 'required|unique:users,name',
            'fullName' => 'required',
            'email' => 'required|email|unique:users,email',
            'idRole'=>'required|exists:roles,id',
        ],[
            'name.required' => 'Tên tài khoản là bắt buộc.',
            'name.unique' => 'Loại tài khoản bị trùng.',
            'fullName.required' => 'Họ và tên là bắt buộc.',
            'email.required' => 'Email là bắt buộc.',
            'email.email' => 'Email không đúng định dạng.',
            'email.unique' => 'Email đã được sử dụng.',
            'idRole.required' => 'Vai trò là bắt buộc.',
            'idRole.exists' => 'Vai trò không hợp lệ.',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $password=random_int(100000,999999);
        $data=$request->all();
        $data['password']=Hash::make($password);
        $data['created_at']= now();
        User::create($data);
        $data=[
            'email'=>$request->email,
            'name'=>$request->name,
            'password'=>$password,
        ];
        Mail::to($request->email)->send(new Create($data));
        return response()->json(['check' => true]);
    }

    /**
     * Display the specified resource.
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $user)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $user)
    {
        //
    }
}
