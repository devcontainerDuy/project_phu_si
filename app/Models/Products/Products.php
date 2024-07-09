<?php

namespace App\Models\Products;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Collections\ProductCollection;
class Products extends Model
{
    use HasFactory;
    protected $table='products';
    protected $fillable=['id','name','slug','sku','price','id_category','compare_price','attributes','discount','description','content','id_brand','status','highlighted','in_stock','created_at','updated_at'];
    public function image()
    {
        return $this->hasOne(Gallery::class, 'id_parent')->where('status', 1);
    }
    public function collections()
    {
        return $this->belongsToMany(ProductCollection::class, 'links', 'id_link', 'id_parent');
    }

    public function comments(){
        return $this->hasMany(Comments::class);
    }
}
