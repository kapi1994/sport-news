<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class isSuperAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if($request->session()->has('korisnik')){
            $korisnik = $request->session()->get('korisnik');
            $korisnik_id = $korisnik->roles->pluck('id')->toArray();
            $uloga_id = 3;
            if(in_array($uloga_id, $korisnik_id)){
                return $next($request);
            }
        }else{
            abort(401);
        }

    }
}
