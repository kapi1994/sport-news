<?php

namespace App\Http\Controllers;

use App\Mail\ContactMail;
use App\Models\Category;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class FrontController extends BasicController
{
   public function contact(){
       return view('users.contact', $this->data);
   }

   public function submitContact(Request $request){
      //dd($request->all());
       $request->validate([
           'email' => 'required|email',
           'imePrezime' => 'required',
           'poruka' => 'required'
       ]);
       $valueArray = [
           'name' => $request->imePrezime,
           'email' =>  $request->email,
           'poruka' => $request->poruka
       ];
       Mail::to('example@gmail.com')->send(new ContactMail($valueArray));
      return redirect()->route('contact')->with(['poruka'=>'Hvala sto ste nas kontaktirali']);
   }

   public function postovi(Request  $request){
      // dd(url()->current());
       $postovi = [];
       if($request->has('category_id')){
           $category = $request->get('category_id');
           $category_id = Category::findOrFail($category);
            $postovi= $category_id->posts->where('status','=','1');
           //dd($this->data['postovi']);
       }else if($request->has('tag_id')){
           $tag = $request->get('tag_id');
           $tag_id = Tag::findOrFail($tag);
           $postovi=  $tag_id->posts->where('status','=','1');
           //dd($this->data['postovi']);
       }

      $this->data['postovi']= $postovi;
      return view('users.posts',$this->data);
   }

   public function post($id){
       $post = Post::findOrFail($id);
       $post_category = $post->category_id;
       $this->data['category_posts'] = Post::where('category_id','=',$post_category)->where('status','=',1)->take(3)->get();
       $this->data['post'] = Post::findOrFail($id);
       return view('users.post',$this->data);
   }

   public function index(){
       $this->data['postovi_glavni'] = Post::where('status', '=', 1)->limit(2)->get();
       $this->data['postovi'] = Post::where('status','=',1)->take(8)->get();
       return view('users.index', $this->data);
   }

   public function autor(){
       return view('userS.autor', $this->data);
   }
}
