<?php

namespace App\Http\Controllers;

use App\Http\Requests\HeadingRequestInsert;
use App\Models\Category;
use App\Models\Heading;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\Requests;
class HeadingController extends BasicController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request  $request)
    {
//
        $this->data['rubrike'] = Heading::paginate(5);
        return view('admin.headings.index',$this->data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->data['kategorije'] = Category::where('status','!=', 0)->get();
        return view('admin.headings.create', $this->data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(HeadingRequestInsert $request)
    {
        try {
            $rubrika = new Heading();
            $rubrika->naziv_rubrike = $request->nazivRubrike;
            $rubrika->category_id = $request->kategorijaRubrike;
            if(!$rubrika->save()){
                dd("greska");
            }
            if($request->session()->has('korisnik')){
                $user = $request->session()->get('korisnik');
                $poruka = 'Korisnik sa emailom: '.$user->email.' je dodao novu rubriku:'. $request->naziv_posta;
                $noviUnos = new Requests();
                $url = url()->current();
                $noviUnos->url = $url;
                $noviUnos->poruka =$poruka;
                $noviUnos->email = $user->email;
                $noviUnos->datum_kreiranja = Carbon::now();
                $noviUnos->save();
            }
            return redirect()->route('headings.index');
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
        $this->data['rubrika'] = Heading::findOrFail($id);
        $this->data['kategorije'] = Category::where('status', '!=', 0)->get();
        return view('admin.headings.edit', $this->data);
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
        $rubrika = Heading::findOrFail($id);
        if($request->has('status')){
            $status = $request->get('status');
           switch ($status){
               case 0:
                   $rubrika->status = 1;
                   $rubrika->datum_azuriranje = Carbon::now();
                   $rubrika->save();
                    if($request->session()->has('korisnik')){
                        $user = $request->session()->get('korisnik');
                        $poruka = 'Korisnik sa emailom: '.$user->email.' je promenuo status rubrike'. $rubrika->naziv_rubrike;
                        $noviUnos = new Requests();
                        $url = url()->current();
                        $noviUnos->url = $url;
                        $noviUnos->poruka =$poruka;
                        $noviUnos->email = $user->email;
                        $noviUnos->datum_kreiranja = Carbon::now();
                        $noviUnos->save();
                    }
                   return redirect()->route('headings.index');
               case 1:
                   $rubrika->status = 0;
                   $rubrika->datum_azuriranje = Carbon::now();
                   $rubrika->save();
                    if($request->session()->has('korisnik')){
                        $user = $request->session()->get('korisnik');
                        $poruka = 'Korisnik sa emailom: '.$user->email.' je promenuo status rubrike'. $rubrika->naziv_rubrike;
                        $noviUnos = new Requests();
                        $url = url()->current();
                        $noviUnos->url = $url;
                        $noviUnos->poruka =$poruka;
                        $noviUnos->email = $user->email;
                        $noviUnos->datum_kreiranja = Carbon::now();
                        $noviUnos->save();
                    }
                   return redirect()->route('headings.index');
           }
        }

        $request->validate([
            'nazivRubrike' => "bail|sometimes|regex:/^[A-Z][a-z]{1,15}(\s[\w\d]{1,15})*/|unique:headings,naziv_rubrike,$id",
            'kategorijaRubrike' => 'bail|required'
        ],[
            'e.regex' => 'Naziv rubrike nije u redu',
            'nazivRubrike.unique' => 'Naziv rubrike mora da bude jednistven',
        ]);
        try {
            $rubrika->naziv_rubrike = $request->nazivRubrike;
            $rubrika->category_id = $request->kategorijaRubrike;
            $rubrika->datum_azuriranje  = Carbon::now();
            $rubrika->save();
            if($request->session()->has('korisnik')){
                $user = $request->session()->get('korisnik');
                $poruka = 'Korisnik sa emailom: '.$user->email.' je azurirao rubriku'. $rubrika->naziv_rubrike;
                $noviUnos = new Requests();
                $url = url()->current();
                $noviUnos->url = $url;
                $noviUnos->poruka =$poruka;
                $noviUnos->email = $user->email;
                $noviUnos->datum_kreiranja = Carbon::now();
                $noviUnos->save();
            }
            return redirect()->route('headings.index');
        }catch(\Exception $e){
            dd($e->getMessage());
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $rubrika = Heading::findOrFail($id);
        try {
            $rubrika->status = 0;
            $rubrika->datum_azuriranje	 = Carbon::now();
            $rubrika->save();
            return redirect()->route('headings.index');
        }catch(\Exception $exception){
            dd($exception->getMessage());
        }
    }
}
