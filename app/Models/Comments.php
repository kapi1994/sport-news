<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comments extends Model
{
    use HasFactory;
    public $timestamps = false;

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function parent(){
        return $this->belongsTo(Comments::class);
    }
    public function child(){
        return $this->belongsTo(Comments::class,'parent_id');
    }
}
