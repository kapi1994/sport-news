<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
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
            'email' => 'bail|required|email',
            'lozinka' => 'bail|required|regex:/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/'
        ];
    }

    public function messages()
    {
        return [
            'email.required' => 'Email je obavezan',
            'email.email' => 'Email nije u dobrom formatu',
            'lozinka.required' => 'Lozinka je obavezna',
            'lozinka.regex' => "Lozinka nije u dobrom formatu"
        ];
    }
}
