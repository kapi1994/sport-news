@extends('layout.layout')
@section('title')
    <title>Korisnici | Insert</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-6 mx-auto">
                    <form action="{{route('users.update',['user' => $korisnik->id])}}" method="POST">
                        @csrf
                        @method("PATCH")
                        <div class="mb-3">
                            <label for="">Ime:</label>
                            <input type="text" name="imeKorisnika" id="imeKorisnika" class="form-control" value="{{$korisnik->ime ??  @old('imeKorisnika')}}">
                            @error('imeKorisnika')
                            <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Prezime:</label>
                            <input type="text" name="prezimeKorisnika" id="prezimeKorisnika" class="form-control" value="{{$korisnik->prezime ?? @old('prezimeKorisnika')}}">
                            @error('prezimeKorisnika')
                            <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Email:</label>
                            <input type="email" name="emailKorisnika" id="emailKorisnika" class="form-control" value="{{$korisnik->email ??  @old('emailKorisnika')}}">
                            @error('emailKorisnika')
                            <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Lozinka:</label>
                            <input type="password" name="lozinkaKorisnika" id="lozinkaKorisnika" class="form-control" value="{{@old('lozinkaKorisnika')}}">
                            @error('lozinkaKorisnika')
                            <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Izaberite uloge</label><br><br>
                            @foreach($uloge as $uloga)
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="custom-control-input" id="rubrika{{ $uloga->id }}" name="uloge_id[]" value="{{ $uloga->id }}"
                                           @if(isset($uloga) && in_array($uloga->id, $korisnik->roles()->pluck('id')->toArray()))
                                           checked
                                           @elseif(is_array(old('rubrike_id')) && in_array($rubrika->id, old('rubrike_id')))
                                           checked
                                        @endif
                                    />
                                    <label class="custom-control-label" for="rubrika{{ $uloga->id }}">{{ $uloga->naziv_uloge }}</label>
                                </div>
                            @endforeach
                            @error('uloge_id')
                            <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
