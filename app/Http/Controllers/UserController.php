<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserInsertRequest;
use App\Models\Role;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Models\Requests;
class UserController extends BasicController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->data['korisnici'] = User::all();
        return view('admin.users.index', $this->data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->data['uloge'] = Role::all();
        return view('admin.users.create', $this->data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(UserInsertRequest $request)
    {
        //dd($request->all());

        try {
            $korisnik = new User();
            $korisnik->ime = $request->imeKorisnika;
            $korisnik->prezime = $request->prezimeKorisnika;
            $korisnik->email = $request->emailKorisnika;
            $korisnik->lozinka = md5($request->lozinkaKorisnika);
            $korisnik->save();
            $korisnik->roles()->attach($request->role_id);

            $poruka = 'Kreiran je novi nalog sa: '.$request->emailKorisnika;
            $noviUnos = new Requests();
            $url = url()->current();
            $noviUnos->url = $url;
            $noviUnos->poruka =$poruka;
            $noviUnos->email = $korisnik->email;

            $noviUnos->datum_kreiranja = Carbon::now();
            $noviUnos->save();

            return redirect()->route('users.index');
        }catch(\Exception $e){
            dd($e->getMessage());
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
        $this->data['korisnik'] = User::findOrFail($id);
        $this->data['uloge'] = Role::all();
        return view('admin.users.edit', $this->data);
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
        $user = User::findOrFail($id);
        if($request->has('status')){
            $status = $request->get('status');
            switch ($status){
                case 0:
                    try {
                        $user->status = 1;
                        $user->datum_azuriranja = Carbon::now();
                        $user->save();
                        $poruka = 'Koririsniku je promenjen status: '. $user->email;
                        $noviUnos = new Requests();
                        $url = url()->current();
                        $noviUnos->url = $url;
                        $noviUnos->poruka =$poruka;
                        $noviUnos->email = $user->email;
                        $noviUnos->datum_kreiranja = Carbon::now();
                        $noviUnos->save();
                        return redirect()->route('users.index');
                    }catch (\Exception $exception){
                        dd($exception->getMessage());
                    }
                case 1:
                    try {
                        $user->status = 0;
                        $user->datum_azuriranja = Carbon::now();
                        $user->save();
                        $poruka = 'Koririsniku je promenjen status: '. $user->email;
                        $noviUnos = new Requests();
                        $url = url()->current();
                        $noviUnos->url = $url;
                        $noviUnos->poruka =$poruka;
                        $noviUnos->email = $user->email;
                        $noviUnos->datum_kreiranja = Carbon::now();
                        $noviUnos->save();
                        return redirect()->route('users.index');
                    }catch (\Exception $exception){
                        dd($exception->getMessage());
                    }
            }

        }

        //dd($request->all());
        $request->validate([
            'imeKorisnika' => 'bail|required|regex:/^[A-Z][a-z]{2,15}(\s[A-Z][a-z]{3,15})*$/',
            'prezimeKorisnika' => 'bail|required|regex:/^[A-Z][a-z]{2,15}(\s[A-Z][a-z]{3,15})*$/',
            'emailKorisnika' => "bail|required|email|unique:users,email,$id",
            'lozinkaKorisnika' => 'bail|sometimes',
            'uloge_id' => 'bail|required|exists:roles,id'
        ],[
            'imeKorisnika.required' => 'Ime je obavezno',
            'imeKorisnika.regex' => "Uneto ime nije u odgovarajucem formatu",
            'prezimeKorisnika.required' => "Prezime korisnika je obavezno",
            'prezimeKorisnika.regex' => 'Uneto prezime nije u odgovarajucem formatu',
            'emailKorisnika.required' => 'Email korisnika je obavezno polje',
            'emailKorisnika.email' => 'Uneti email nije u odgovarajucem formatu',
            'emailKorisnika.unique' => 'Email mora da bude jedinstven',
            //'lozinkaKorisnika.required' => "Lozinka korisnika je obavezna",
            //'lozinkaKorisnika.regex ' => 'Lozinka korisnika nije u odgovrajucem formatu',
            'uloge_id.required' => "Uloga je obavezna",
            'uloge_id.exists' => 'Izabrana uloga je nevezeca'
        ]);

        try {
            $user->ime = $request->imeKorisnika;
            $user->prezime = $request->prezimeKorisnika;
            $user->email = $request->emailKorisnika;
            $lozinka = null;
            if($request->has('lozinkaKorisnika') || $request->get('lozinkaKorisnika') != ""){
                $request->validate([
                    'lozinkaKorisnika' => 'bail|required|regex:/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/',
                ],['lozinkaKorisnika.regex ' => 'Lozinka korisnika nije u odgovrajucem formatu',]);
                $lozinka= $request->lozinkaKorisnika;
            }
            $user->lozinka = md5($lozinka);
            $user->datum_azuriranja = Carbon::now();
            $user->save();
            $user->roles()->sync($request->uloge_id);

            $poruka = 'Koririsniku su izvrsena azuriranja naloga: '. $request->emailKorisnika;
            $noviUnos = new Requests();
            $url = url()->current();
            $noviUnos->url = $url;
            $noviUnos->poruka =$poruka;
            $noviUnos->email = $user->email;
            $noviUnos->datum_kreiranja = Carbon::now();
            $noviUnos->save();

            return redirect()->route('users.index');

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
            $user= User::findOrFail($id);
            $user->status =0;
            $user->save();
            $poruka = 'Korisnik sa : '. $user->email.' je izmenjen status';
            $noviUnos = new Requests();
            $url = url()->current();
            $noviUnos->url = $url;
            $noviUnos->poruka =$poruka;
            $noviUnos->email = $user->email;
            $noviUnos->datum_kreiranja = Carbon::now();
            $noviUnos->save();
        }catch (\Exception $exception){
            dd($exception->getMessage());
        }
    }
}
