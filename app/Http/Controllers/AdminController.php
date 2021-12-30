<?php

namespace App\Http\Controllers;

use App\Models\Requests;
use Illuminate\Http\Request;

class AdminController extends BasicController
{
    public function showActions(){

        $this->data['logovi'] = Requests::paginate(5);
       return view('admin.showRequest', $this->data);
    }
}
