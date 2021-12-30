<?php



namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TagRequestInsert extends FormRequest
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
            'nazivTaga' => 'bail|required|regex:/^[A-Z][a-z]{1,15}(\s[A-z]{1,15})*$/|unique:tags,naziv_taga',
            'rubrike_id' => 'bail|required|min:1'
        ];
    }

    public function messages()
    {
        return [
            'nazivTaga.required' => 'Naziv taga je obavezan',
            'nazivTaga.regex' => 'Naziv taga nije u redu',
            'nazivTaga.unique' => 'Naziv taga mora da bude jedinstven',
            'rubrike_id.required' => 'Morate odabrati bar jednu rubriku'
        ];
    }
}
