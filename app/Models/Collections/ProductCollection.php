<?php

namespace App\Models\Collections;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Categories\Categories;
use Illuminate\Database\Eloquent\Builder;

class ProductCollection extends Model
{
    use HasFactory;
    protected $table='collections';
    protected $fillable=['id','collection','slug','model','position','status','created_at','updated_at'];

    public function category(){
        return $this->hasMany(Categories::class,'id_collection');
    }

    public function scopeActive(Builder $query){
        return $query->where('status', 1);
    }

    public function scopeSort(Builder $query,$param){
        return $query->where('status',1)->orderBy('asc',$param);
    }
}
