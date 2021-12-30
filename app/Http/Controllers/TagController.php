<?php

namespace App\Http\Controllers;

use App\Http\Requests\TagRequestInsert;
use App\Models\Heading;
use App\Models\Tag;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Models\Requests;
class TagController extends BasicController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $tagovi = null;
        if($request->has('keyword')){
           $tagovi = Tag::where('naziv_taga','LIKE','%'.$request->get('keyword').'%')->paginate(10);

        }else{
           $tagovi = Tag::paginate(10);

        }
        $this->data['tagovi'] = $tagovi->withQueryString();
        $this->data['key'] = $request->keyword;
        return view('admin.tags.index', $this->data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->data['rubrike'] = Heading::where('status','!=', 0)->get();
        return view('admin.tags.create', $this->data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(TagRequestInsert $request)
    {
        try {
            $tag = new Tag();
            $tag->naziv_taga = $request->nazivTaga;
            $tag->save();
            $tag->headings()->attach($request->get('rubrike_id'));
            if($request->session()->has('korisnik')){
                $user = $request->session()->get('korisnik');
                $poruka = 'Korisnik sa emailom: '.$user->email.' je dodao novi tag'. $request->nazivTaga;
                $noviUnos = new Requests();
                $url = url()->current();
                $noviUnos->url = $url;
                $noviUnos->poruka =$poruka;
                $noviUnos->email = $user->email;
                $noviUnos->datum_kreiranja = Carbon::now();
                $noviUnos->save();
            }
            return redirect()->route('tags.index');
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
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $this->data['tag'] = Tag::findOrFail($id);
        $this->data['rubrike'] = Heading::where('status','!=',0)->get();
        return view('admin.tags.edit', $this->data);
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
        $tag = Tag::findOrFail($id);
        if($request->has('status')){
           $status = $request->get('status');
           switch ($status){
               case 0:
                   try {
                       $tag->status = 1;
                       $tag->datum_azuriranja = Carbon::now();
                       $tag->save();
                       if($request->session()->has('korisnik')){
                           $user = $request->session()->get('korisnik');
                           $poruka = 'Korisnik sa emailom: '.$user->email.' je promenuo status tagu'. $tag->naziv_taga;
                           $noviUnos = new Requests();
                           $url = url()->current();
                           $noviUnos->url = $url;
                           $noviUnos->poruka =$poruka;
                           $noviUnos->email = $user->email;
                           $noviUnos->datum_kreiranja = Carbon::now();
                           $noviUnos->save();
                       }
                       return redirect()->route('tags.index');
                   }catch (\Exception $exception){
                       dd($exception->getMessage());
                   }

               case 1:
                   try {
                       $tag->status = 0;
                       $tag->datum_azuriranja = Carbon::now();
                       $tag->save();
                       if($request->session()->has('korisnik')){
                           $user = $request->session()->get('korisnik');
                           $poruka = 'Korisnik sa emailom: '.$user->email.' je promenuo status tagu'. $tag->naziv_taga;
                           $noviUnos = new Requests();
                           $url = url()->current();
                           $noviUnos->url = $url;
                           $noviUnos->poruka =$poruka;
                           $noviUnos->email = $user->email;
                           $noviUnos->datum_kreiranja = Carbon::now();
                           $noviUnos->save();
                       }
                       return redirect()->route('tags.index');
                   }catch (\Exception $exception){
                       dd($exception->getMessage());
                   }
           }
        }
        $request->validate([
            'nazivTaga' => "bail|required|regex:/^[A-Z][a-z]{1,15}(\s[A-z]{1,15})*$/|unique:tags,naziv_taga, $id",
            'rubrike_id' => 'bail|required|min:1'
        ],[
            "naziv_taga.required" => 'Naziv taga je obavezan',
            'naziv_taga.regex' => 'Naziv taga nije u odgovarajucem formatu',
            'naziv_taga.unique' => 'Naziv taga mora da bude jedinstven',
            'rubrike_id.required'  => 'Morate odabrati barem jednu rubriku'
        ]);

        $tag->naziv_taga = $request->nazivTaga;
        $tag->datum_azuriranja = Carbon::now();
        $tag->save();
        if($request->session()->has('korisnik')){
            $user = $request->session()->get('korisnik');
            $poruka = 'Korisnik sa emailom: '.$user->email.' je azurirao tag '. $tag->naziv_taga;
            $noviUnos = new Requests();
            $url = url()->current();
            $noviUnos->url = $url;
            $noviUnos->poruka =$poruka;
            $noviUnos->email = $user->email;
            $noviUnos->datum_kreiranja = Carbon::now();
            $noviUnos->save();
        }
        $tag->headings()->sync($request->rubrike_id);
        return  redirect()->route('tags.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request  $request)
    {
        try {
            $tag= Tag::findOrFail($id);
            $tag->status =0;
            $tag->datum_azuriranja= Carbon::now();
            $tag->save();
            if($request->has('korisnik')){
                $user = $request->session()->get('korisnik');
                $poruka = 'Korisnik sa : '. $user->email.' je izmenio status taga';
                $noviUnos = new Requests();
                $url = url()->current();
                $noviUnos->url = $url;
                $noviUnos->poruka =$poruka;
                $noviUnos->email = $user->email;
                $noviUnos->datum_kreiranja = Carbon::now();
                $noviUnos->save();
            }
        }catch (\Exception $exception){
            dd($exception->getMessage());
        }
    }
}
