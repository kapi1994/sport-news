<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class HeadingRequestInsert extends FormRequest
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
            'nazivRubrike' => 'bail|required|regex:/^[A-Z][a-z]{1,15}(\s[\w\d]{1,15})*/|unique:headings,naziv_rubrike',
            'kategorijaRubrike' => 'bail|required|exists:categories,id'
        ];
    }

    public function messages()
    {
        return [
            'nazivRubrike.required' => 'Naziv kategorije je obavezan',
            'nazivRubrike.regex' => 'Naziv rubrike nije u redu',
            'nazivRubrike.unique' => 'Naziv kategorije mora da bude jedinstven',
            'kategorijaRubrike.required' => 'Kategorija je obavezna',
            'kategorijaRubrike.exists' => 'Izabrana kategorija nepostoji'
        ];
    }
}
