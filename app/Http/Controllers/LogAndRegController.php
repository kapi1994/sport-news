<?php

namespace App\Http\Controllers;

use App\Http\Requests\RegisterRequest;
use App\Models\Requests;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class LogAndRegController extends BasicController
{
    public function login(){
        return view('logAndReg.login', $this->data);
    }
    public function register(){
        return view('logAndReg.register', $this->data);
    }
    public function logovanje(Request  $request){
        try {
            $korisnik = User::where([
                'email' => $request->email,
                'lozinka' => md5($request->lozinka)
            ])->first();

            if($korisnik){
                 $request->session()->put('korisnik', $korisnik);
                 $poruka = 'Korisnikse  ulogovao sa: '. $korisnik->email;
                 $noviUnos = new Requests();
                 $url = url()->current();
                 $noviUnos->url = $url;
                 $noviUnos->poruka =$poruka;
                 $noviUnos->email = $korisnik->email;

                 $noviUnos->datum_kreiranja = Carbon::now();
                 $noviUnos->save();
                 return redirect()->route('index');
            }else{
                return redirect()->route('login')->with(['greska' => 'Vasi kredencijali nisu u redu!']);
            }
        }catch (\Exception $exception){
            dd($exception->getMessage());
        }
    }
    public function registracija(RegisterRequest $request){

        try {
            $user = new User();
            $user->ime = $request->ime;
            $user->prezime = $request->prezime;
            $user->email=  $request->email;
            $user->lozinka = md5($request->lozinka);
            $user->save();
            $user->roles()->attach(1);

            $poruka = 'Novi korisnik se registrovao sa: '. $request->email;
            $noviUnos = new Requests();
            $url = url()->current();
            $noviUnos->url = $url;
            $noviUnos->poruka =$poruka;
            $noviUnos->email = $request->email;

            $noviUnos->datum_kreiranja = Carbon::now();
            $noviUnos->save();
            return redirect()->route('login');
        }catch (\Exception $exception){
            dd($exception->getMessage());
        }
    }

    public function logout(Request  $request){
        $poruka = 'Korisnik sa email se: '. $request->session()->get('korisnik')->email .'is logovao.';
        $noviUnos = new Requests();
        $url = url()->current();
        $noviUnos->url = $url;
        $noviUnos->poruka =$poruka;
        $noviUnos->email = $request->session()->get('korisnik')->email;

        $noviUnos->datum_kreiranja = Carbon::now();
        $noviUnos->save();
        $request->session()->forget('korisnik');
        return redirect()->route('index');
    }
}
