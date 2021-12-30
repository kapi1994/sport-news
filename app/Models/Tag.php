<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    use HasFactory;
    public $timestamps = false;
    public function headings(){
        return $this->belongsToMany(Heading::class);
    }

    public function posts(){
        return $this->belongsToMany(Post::class);
    }
}
