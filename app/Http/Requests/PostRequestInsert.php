<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PostRequestInsert extends FormRequest
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
            'nazivPosta' => 'bail|required|unique:posts,naziv_posta',
            'opisPosta' => 'bail|required|',
            'kategorije' => "bail|required|exists:categories,id",
            'rubrika' => 'bail|required|exists:headings,id',
            'slikaPosta' => 'bail|required|image|mimes:jpg,jpeg,png',
            'tag_id' => 'bail|required|min:1'

        ];
    }

    public function messages()
    {
       return[
           'nazivPosta.required' => 'Naziv posta je obavezan',
           'nazivPosta.unique' => 'Naziv posta je obavezan',
           'opisPosta.required' => 'Opis posta je obavezan',
           'kategorija.required' => 'Kategorija posta je obavezna',
           'kategorija.exists' => 'Izabrana kategorija nepostoji',
           'rubrika.required' => 'Rubrika posta je obavezna',
           'rubrika.exists' => 'Izabrana rubrika nepostoji',
           'slikaPosta.required' => 'Slika je obavezna',
           'slikaPosta.image' => 'Mora da bude slika',
           'slikaPota.mimes' => "Izabrani fajl nije podrzanog formata",
           'tag_id' => 'Morate izabrati barem jedan tag'
       ];
    }
}
