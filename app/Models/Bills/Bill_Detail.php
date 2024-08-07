<?php

namespace App\Models\Bills;

use App\Models\Products\Products;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bill_Detail extends Model
{
    use HasFactory;
    protected $table='hoa_don_chi_tiet';
    protected $fillable=['id','id_hoa_don','id_product','quantity','created_at','updated_at'];

    public function product()
    {
        return $this->belongsTo(Products::class, 'id_product');
    }

    public function bill()
    {
        return $this->belongsTo(Bills::class, 'id_hoa_don');
    }
}
