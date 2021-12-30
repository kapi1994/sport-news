<?php

namespace App\Http\Controllers;

use App\Http\Requests\PostRequestInsert;
use App\Models\Category;
use App\Models\Heading;
use App\Models\Image;
use App\Models\Post;
use App\Models\Tag;
use App\Models\User;
use Carbon\Carbon;
use http\Url;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Requests;

class PostController extends BasicController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request  $request)
    {
        $postovi = [];
        if($request->session()->has('korisnik')){
            $korisnik = $request->session()->get('korisnik');
           $korisnik_post = User::findOrFail($korisnik->id);
           $postovi = $korisnik_post->post;
        }
        //dd($postovi);
        $this->data['postovi'] = $postovi;
        return view('admin.posts.index', $this->data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->data['kategorije'] = Category::where('status', '!=', 0)->get();
        $this->data['rubrike'] = Heading::where('status', '!=', 0)->get();
        $this->data['tagovi'] = Tag::where('status','!=',0)->get();
        return view('admin.posts.create', $this->data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(PostRequestInsert $request)
    {      // dd(\url()->current());
             //dd($request->all());
            $slika = $request->file('slikaPosta');
            $postSlika= uniqid() . "_" . time() . '.' . $slika->extension();
            $slika->storeAs('public/posts',$postSlika);
        try {
            //dd($request->all());
            $image= new Image();

            $image->putanja_slike = $postSlika;
            $image->alt = $request->get('nazivPosta');
            $image->save();

            $post = new Post();
            $post->naziv_posta = $request->get('nazivPosta');
            $post->opis_posta = $request->get('opisPosta');
            $post->category_id = $request->get('kategorije');
            $post->heading_id = $request->get('rubrika');
            $post->image_id = $image->id;
            if($request->session()->has('korisnik')){
                $korisnik_id = $request->session()->get('korisnik');
                $post->user_id = $korisnik_id->id;
            }
            $post->save();
            $post->tags()->attach($request->get('tag_id'));
            if($request->session()->has('korisnik')){
                $user = $request->session()->get('korisnik');
                $poruka = 'Korisnik sa emailom: '.$user->email.' je kreirao novi post'. $post->nazivPosta;
                $noviUnos = new Requests();
                $url = url()->current();
                $noviUnos->url = $url;
                $noviUnos->poruka =$poruka;
                $noviUnos->email = $user->email;
                $noviUnos->datum_kreiranja = Carbon::now();
                $noviUnos->save();
            }
            return redirect()->route('posts.index');

        }catch(\Exception $exception){
            dd($exception->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $this->data['post'] = Post::findOrFail($id);
        return view('admin.posts.show',$this->data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $this->data['post'] = Post::findOrFail($id);
        $this->data['kategorije'] = Category::where('status', '!=', 0)->get();
        $this->data['rubrike'] = Heading::where('status', '!=', 0)->get();
        $this->data['tagovi'] = Tag::where('status','!=',0)->get();
        return view('admin.posts.edit', $this->data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //dd($request->all());
        $post = Post::findOrFail($id);
        if($request->has('status')){
            $status = $request->get('status');
            switch ($status){
                case 0:
                    $post->status = 1;
                    $post->datum_azuriranja = Carbon::now();
                    $post->save();
                    if($request->session()->has('korisnik')){
                        $user = $request->session()->get('korisnik');
                        $poruka = 'Korisnik sa emailom: '.$user->email.' je promenuo status posta'. $post->naziv_posta;
                        $noviUnos = new Requests();
                        $url = url()->current();
                        $noviUnos->url = $url;
                        $noviUnos->poruka =$poruka;
                        $noviUnos->email = $user->email;
                        $noviUnos->datum_kreiranja = Carbon::now();
                        $noviUnos->save();
                    }
                    return redirect()->route('posts.index');
                case 1:
                    $post->status = 0;
                    $post->datum_azuriranja = Carbon::now();
                    if($request->session()->has('korisnik')){
                        $user = $request->session()->get('korisnik');
                        $poruka = 'Korisnik sa emailom: '.$user->email.' je promenuo status posta'. $post->naziv_posta;
                        $noviUnos = new Requests();
                        $url = url()->current();
                        $noviUnos->url = $url;
                        $noviUnos->poruka =$poruka;
                        $noviUnos->email = $user->email;
                        $noviUnos->datum_kreiranja = Carbon::now();
                        $noviUnos->save();
                    }
                    $post->save();
                    return redirect()->route('posts.index');

            }
        }

        //dd($request->all());


        $request->validate([
            'nazivPosta' => "bail|required|unique:posts,naziv_posta,$id",
            'opisPosta' => 'bail|required',
            'kategorije' => "bail|required|exists:categories,id",
            'rubrika' => 'bail|required|exists:headings,id',
            'slikaPosta' => 'bail|sometimes|image|mimes:jpg,jpeg,png',
            'tag_id' => 'bail|required|min:1'
        ],[
            'nazivPosta.required' => 'Naziv posta je obavezan',
            'nazivPosta.regex' => 'Naziv posta nije u odgovarajucem formatu!',
            'nazivPosta.unique' => 'Naziv posta je obavezan',
            'opisPosta.required' => 'Opis posta je obavezan',
            'kategorija.required' => 'Kategorija posta je obavezna',
            'kategorija.exists' => 'Izabrana kategorija nepostoji',
            'rubrika.required' => 'Rubrika posta je obavezna',
            'rubrika.exists' => 'Izabrana rubrika nepostoji',

            'slikaPosta.image' => 'Mora da bude slika',
            'slikaPota.mimes' => "Izabrani fajl nije podrzanog formata",
            'tag_id' => 'Morate izabrati barem jedan tag'
        ]);

        if($request->has('slikaPosta')){
            $trenutna_slika_posta = $post->image->putanja_slike;
             if(Storage::path('storeage/posts/'.$trenutna_slika_posta)) {
                 //dd('slika je obrisana');
                 $slika = $request->file('slikaPosta');
                 $nova_s = uniqid() . "_" . time() . '.' . $slika->extension();
                 $slika->storeAs('public/posts', $nova_s);

                 $nova_slika= new Image();
                 $nova_slika->putanja_slike = $nova_s;
                 $nova_slika->alt = $request->nazivPosta;
                 $nova_slika->save();

                 }
             }
        //dd('slika_je_dodata');
        try {
           // dd($nova_slika);
            $post->naziv_posta = $request->nazivPosta;
            $post->opis_posta = $request->opisPosta;
            $post->category_id = $request->kategorije;
            $post->heading_id = $request->rubrika;
            if($request->has('slikaPosta')){
                $post->image_id = $nova_slika->id;
            }
            $post->datum_azuriranja = Carbon::now();
            $post->save();
            $post->tags()->sync($request->tag_id);

            if($request->session()->has('korisnik')){
                $user = $request->session()->get('korisnik');
                $poruka = 'Korisnik sa emailom: '.$user->email.' je azurirao posta'. $post->naziv_posta;
                $noviUnos = new Requests();
                $url = url()->current();
                $noviUnos->url = $url;
                $noviUnos->poruka =$poruka;
                $noviUnos->email = $user->email;
                $noviUnos->datum_kreiranja = Carbon::now();
                $noviUnos->save();
            }
            return redirect()->route('posts.index');
            //dd("uspesan update");
        }catch (\Exception $exception){
            dd($exception->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id,Request $request)
    {
        $post = Post::findOrFail($id);
        $post->status = 0;
        $post->datum_azuriranja = Carbon::now() ;
        $post->save();
        if($request->session()->has('korisnik')){
            $user= $request->session()->get('korisnik');
            $poruka = 'Korisnik sa : '. $user->email.' je izmenio status posta'. $post->naziv_posta;
            $noviUnos = new Requests();
            $url = url()->current();
            $noviUnos->url = $url;
            $noviUnos->poruka =$poruka;
            $noviUnos->email = $user->email;
            $noviUnos->datum_kreiranja = Carbon::now();
            $noviUnos->save();
        }
    }
}
