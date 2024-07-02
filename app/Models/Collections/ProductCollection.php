<?php

namespace App\Models\Collections;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductCollection extends Model
{
    use HasFactory;
    protected $table='collections';
    protected $fillable=['id','collection','slug','model','position','status','created_at','updated_at'];
}
