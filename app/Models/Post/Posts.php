<?php

namespace App\Models\Post;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Posts extends Model
{
    use HasFactory;

    protected $table = 'posts';

    protected $fillable = ['title', 'slug', 'summary', 'content', 'status', 'highlighted', 'position', 'created_at', 'updated_at'];
}
