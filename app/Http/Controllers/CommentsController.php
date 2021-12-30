<?php

namespace App\Http\Controllers;

use App\Models\Comments;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Models\Requests;

class CommentsController extends Controller
{
    public function addNew(Request  $request){
        if($request->has('comment_id')){
           // dd($request->all());
            try {
                $comment = new Comments();
                $comment->post_id = $request->post_id;
                if($request->session()->has('korisnik')){
                    $user = $request->session()->get('korisnik');
                    $comment->user_id = $user->id;
                }
                $comment->tekst_komentara = $request->comment;
                $comment->parent_id = $request->comment_id;
                $comment->save();
                if($request->session()->has('korisnik')){
                    $user = $request->session()->get('korisnik');
                    $poruka = 'Korisnik sa emailom: '.$user->email.' je kreirao novi post'. $request->post_id;
                    $noviUnos = new Requests();
                    $url = url()->current();
                    $noviUnos->url = $url;
                    $noviUnos->poruka =$poruka;
                    $noviUnos->email = $user->email;
                    $noviUnos->datum_kreiranja = Carbon::now();
                    $noviUnos->save();
                }
                return redirect()->route('postovi.show', $request->post_id);
            }catch (\Exception $exception){
                dd($exception->getMessage());
            }
        }else{
            try {
                $comment = new Comments();
                $comment->post_id = $request->post_id;
                if($request->session()->has('korisnik')){
                    $user = $request->session()->get('korisnik');
                    $comment->user_id = $user->id;
                }
                $comment->tekst_komentara = $request->comment;
                $comment->save();
                if($request->session()->has('korisnik')){
                    $user = $request->session()->get('korisnik');
                    $poruka = 'Korisnik sa emailom: '.$user->email.' je kreirao novi post'. $request->post_id;
                    $noviUnos = new Requests();
                    $url = url()->current();
                    $noviUnos->url = $url;
                    $noviUnos->poruka =$poruka;
                    $noviUnos->email = $user->email;
                    $noviUnos->datum_kreiranja = Carbon::now();
                    $noviUnos->save();
                }

                return redirect()->route('postovi.show', $request->post_id);
            }catch (\Exception $exception){
                dd($exception->getMessage());
            }
        }



    }


}
