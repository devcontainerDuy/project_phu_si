<?php

namespace App\Models\Customers;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use App\Models\Comments\Comments;

class Customers extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table='customers';
    protected $fillable=['id','name','address','password','phone','email','status','email_verified_at','created_at','updated_at'];

    public function cart(){
        return $this->hasMany(Customers::class);
    }

    public function comment(){
        return $this->hasMany(Comments::class);
    }
}
