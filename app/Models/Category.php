<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    public $timestamps = false;
    public function headings(){
        return $this->hasMany(Heading::class);
    }

    public function posts(){
        return $this->hasMany(Post::class);
    }
}
