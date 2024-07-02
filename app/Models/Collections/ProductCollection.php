<?php

namespace App\Models\Collections;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Categories\Categories;

class ProductCollection extends Model
{
    use HasFactory;
    protected $table='collections';
    protected $fillable=['id','collection','slug','model','position','status','created_at','updated_at'];

    public function category(){
        return $this->hasMany(Categories::class,'id_collection');
    }
}
