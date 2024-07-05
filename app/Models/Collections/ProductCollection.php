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
    protected $fillable=['id','collection','slug','model','position','status','highlighted','created_at','updated_at'];

    public function scopeActive(Builder $query){
        return $query->where('status', 1);
    }

    public function scopeSort(Builder $query,$param){
        return $query->where('status',1)->orderBy('position',$param);
    }
}
