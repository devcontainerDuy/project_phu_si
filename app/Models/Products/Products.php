<?php

namespace App\Models\Products;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    use HasFactory;
    protected $table='products';
    protected $fillable=['id','name','slug','sku','price','id_category','compare_price','attributes','discount','description','content','id_brand','status','highlighted','in_stock','created_at','updated_at'];
}
