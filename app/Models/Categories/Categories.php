<?php

namespace App\Models\Categories;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Collections\ProductCollection;

class Categories extends Model
{
    use HasFactory;

    protected $table = 'categories';
    protected $fillable = [
        'id',
        'name',
        'slug',
        'status',
        'position',
        'id_parent',
        'id_collection',
        'created_at',
        'updated_at'
    ];

    // Relationship to ProductCollection
    public function collection()
    {
        return $this->belongsTo(ProductCollection::class, 'id_collection');
    }

    // If you want to have a self-referencing relationship for parent categories
    public function parent()
    {
        return $this->belongsTo(Categories::class, 'id_parent');
    }

    public function children()
    {
        return $this->hasMany(Categories::class, 'id_parent');
    }
}

