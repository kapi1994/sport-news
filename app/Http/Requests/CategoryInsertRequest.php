<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CategoryInsertRequest extends FormRequest
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
           'kategorijaNaziv' => 'bail|required|regex:/^[A-Z][a-z]{3,15}$/|unique:categories,naziv_kategorije'
        ];
    }
    public function messages()
    {
        return [
            'kategorijaNaziv.required' => 'Naziv kategorije je obavezan',
            'kategorijaNaziv.regex' => "Naziv kategorije nije u redu! Kategorija mora pocinjati sa velikim slovom i mora sadrzati mala slova",
            'kategorijaNaziv.unique' => "Naziv kategorija mora da bude jedinstven"
        ];
    }
}
