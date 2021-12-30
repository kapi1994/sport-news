<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Heading extends Model
{
    use HasFactory;
    public $timestamps  = false;

    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function tags(){
        return $this->belongsTo(Tag::class);
    }

    public function posts(){
        return view(Post::class);
    }
}
