<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;

class BasicController extends Controller
{
    protected  $data = [];
    public function __construct(){
        $this->data['meni'] = Category::where('status','=',1)->get();
    }
}
