<?php

namespace App\Http\Controllers;

use App\Http\Requests\CategoryInsertRequest;
use App\Models\Category;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\Requests;
class CategoryController extends BasicController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request  $request)
    {
//        $kategorije = null;
//        if($request->has('pretraga')){
//           $kategorije = Category::where('naziv_kategorije','LIKE','%'.$request->get('pretraga').'%')->paginate(2);
//
//        }else{
//           $kategorije = Category::paginate(2);
//
//        }
//        $this->data['kategorije'] = $kategorije->withQueryString();
        $this->data['kategorije'] = Category::all();
        return view('admin.categories.index',$this->data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.categories.create', $this->data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CategoryInsertRequest $request)
    {
        try {
            $category = new Category();
            $category->naziv_kategorije = $request->kategorijaNaziv;
            if( $category->save()){
              if($request->session()->has('korisnik')){
                  if($request->session()->has('korisnik')){
                      $user = $request->session()->get('korisnik');
                      $poruka = 'Korisnik sa emailom: '.$user->email.' je kreirao novu kategoriju'. $request->naziv_posta;
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
            return redirect()->route('categories.index');
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
        $this->data['kategorija'] = Category::findOrFail($id);
        return view('admin.categories.edit',$this->data);
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
        $category = Category::findOrFail($id);
        if($request->has('status')){
            $status = $request->get('status');
            switch ($status){
                case 0:
                    try {
                        $category->status = 1;
                        $category->datum_azuriranja = Carbon::now();
                        $category->save();
                        if($request->session()->has('korisnik')){
                            $user = $request->session()->get('korisnik');
                            $poruka = 'Korisnik sa emailom: '.$user->email.' je azurirao status kategorije'. $category->naziv_kategorije;
                            $noviUnos = new Requests();
                            $url = url()->current();
                            $noviUnos->url = $url;
                            $noviUnos->poruka =$poruka;
                            $noviUnos->email = $user->email;
                            $noviUnos->datum_kreiranja = Carbon::now();
                            $noviUnos->save();
                        }
                        return redirect()->route('categories.index');
                    }catch (\Exception $exception){
                        dd($exception->getMessage());
                    }
                case 1:
                    try {
                        $category->status = 0;
                        $category->datum_azuriranja = Carbon::now();
                        $category->save();
                        if($request->session()->has('korisnik')){
                            $user = $request->session()->get('korisnik');
                            $poruka = 'Korisnik sa emailom: '.$user->email.' je azurirao status kategorije'. $category->naziv_kategorije;
                            $noviUnos = new Requests();
                            $url = url()->current();
                            $noviUnos->url = $url;
                            $noviUnos->poruka =$poruka;
                            $noviUnos->email = $user->email;
                            $noviUnos->datum_kreiranja = Carbon::now();
                            $noviUnos->save();
                        }
                        return redirect()->route('categories.index');
                    }catch (\Exception $exception){
                        dd($exception->getMessage());
                    }

            }

        }
         $request->validate([
             'kategorijaNaziv' => "bail|required|regex:/^[A-Z][a-z]{3,15}$/|unique:categories,naziv_kategorije, $id"
         ],[
             'kategorijaNaziv.required' => 'Naziv kategorije je obavezan',
             'kategorijaNaziv.regex' => "Naziv kategorije nije u redu! Kategorija mora pocinjati sa velikim slovom i mora sadrzati mala slova",
             'kategorijaNaziv.unique' => "Naziv kategorija mora da bude jedinstven"
         ]);
        try {
            $category->naziv_kategorije = $request->kategorijaNaziv;
            $category->datum_azuriranja = Carbon::now();
            $category->save();
            if($request->session()->has('korisnik')){
                $user = $request->session()->get('korisnik');
                $poruka = 'Korisnik sa emailom: '.$user->email.' je azurirao kateogriju'. $category->naziv_posta;
                $noviUnos = new Requests();
                $url = url()->current();
                $noviUnos->url = $url;
                $noviUnos->poruka =$poruka;
                $noviUnos->email = $user->email;
                $noviUnos->datum_kreiranja = Carbon::now();
                $noviUnos->save();
            }
            return redirect()->route('categories.index');
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
    public function destroy($id)
    {
        try {
            $category = Category::findOrFail($id);
            $category->status = 0;
            $category->save();
            return redirect()->route('categories.index');
        }catch (\Exception $ex){
            dd($ex->getMessage());
        }
    }
}
