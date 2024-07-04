<?php

namespace App\Models\Post;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PostsCategory extends Model
{
    use HasFactory;

    protected $table = 'post_categories';
    protected $fillable = ['title', 'slug', 'summary', 'status', 'created_at', 'updated_at'];
}
