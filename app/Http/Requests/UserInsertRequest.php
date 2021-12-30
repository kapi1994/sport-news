<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserInsertRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'imeKorisnika' => 'bail|required|regex:/^[A-Z][a-z]{2,15}(\s[A-Z][a-z]{3,15})*$/',
            'prezimeKorisnika' => 'bail|required|regex:/^[A-Z][a-z]{2,15}(\s[A-Z][a-z]{3,15})*$/',
            'emailKorisnika' => 'bail|required|email|unique:users,email',
            'lozinkaKorisnika' => 'bail|required|regex:/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/',
            'role_id' => 'bail|required|exists:roles,id'
        ];
    }

    public function messages()
    {
        return [
            'imeKorisnika.required' => 'Ime je obavezno',
            'imeKorisnika.regex' => "Ime nije u dobrom formatu",
            'prezimeKorisnika.required' => 'Prezime je obavezno',
            'prezimeKorisnika.regex' => 'Prezime nije u dobrom formatu',
            'emailKorisnika.required' => 'Email je obzvezan',
            'emailKorisnika.email' => 'Email nije u dobrom formatu',
            'lozinkaKorisnika.required' => 'Lozinka je obavezna',
            'lozinkaKorisnika.regex'=> 'Lozinka nije u dobrom formatu',
            'role_id.required' => 'Uloga je obavezna',
            'role_id.exists' => "Izabrana uloga nepostoji"
        ];
    }
}
