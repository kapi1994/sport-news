<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;
    public $timestamps = false;
    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function heading(){
        return $this->belongsTo(Heading::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function image(){
        return $this->belongsTo(Image::class);
    }

    public function tags(){
        return $this->belongsToMany(Tag::class);
    }

    public function comments(){
        return $this->hasMany(Comments::class);
    }
}
