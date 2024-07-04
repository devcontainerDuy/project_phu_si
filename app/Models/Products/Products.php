<?php

namespace App\Models\Products;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    use HasFactory;
    protected $table='products';
    protected $fillable=['id','name','slug','sku','price','compare_price','discount','description','content','id_brand','in_stock','created_at','updated_at'];
}
