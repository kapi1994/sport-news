<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
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
            'ime' => 'bail|required|regex:/^[A-Z][a-z]{2,15}(\s[A-Z][a-z]{3,15})*$/',
            'prezime' => 'bail|required|regex:/^[A-Z][a-z]{2,15}(\s[A-Z][a-z]{3,15})*$/',
            'email' => 'bail|required|email|unique:users,email',
            'lozinka' => 'bail|required|regex:/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/'
        ];
    }

    public function messages()
    {
        return [
            'ime.required' => 'Ime je obavezno',
            'ime.regex' => "Ime nije u dobrom formatu",
            'prezime.regex' => "Prezime nije u dobrom formatu",
            'prezime.required' => "Prezime je obavezno",
            'email.required' => 'Email je obavezan',
            'email.email' => 'Email nije u dobrom formatu',
            'lozinka.required' => 'Lozinka je obavezna',
            'lozinka.regex' => "Lozinka nije u redu"
        ];
    }
}
