@extends('layout.layout')
@section('title')
    <title>Korisnici | Insert</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-6 mx-auto">
                    <form action="{{route('users.store')}}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="">Ime:</label>
                            <input type="text" name="imeKorisnika" id="imeKorisnika" class="form-control" value="{{@old('imeKorisnika')}}">
                            @error('imeKorisnika')
                                <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Prezime:</label>
                            <input type="text" name="prezimeKorisnika" id="prezimeKorisnika" class="form-control" value="{{@old('prezimeKorisnika')}}">
                            @error('prezimeKorisnika')
                                <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Email:</label>
                            <input type="email" name="emailKorisnika" id="emailKorisnika" class="form-control" value="{{@old('emailKorisnika')}}">
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
                            <label for="">Izaberite uloge</label>
                            @foreach($uloge as $uloga)
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="{{$uloga->id}}" id="uloga{{$uloga->id}}" name="role_id[]">
                                <label class="form-check-label" for="uloga{{$uloga->id}}">
                                    {{$uloga->naziv_uloge}}
                                </label>
                            </div>
                            @endforeach
                            @error('role_id')
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
