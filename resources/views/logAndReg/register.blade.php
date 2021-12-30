@extends('layout.layout')
@section('title')
    <title>Login</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-4 mx-auto">
                    <form action="{{route('registracija')}}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="">Ime:</label>
                                <input type="text" name="ime" id="ime" class="form-control">
                            @error('ime')
                                <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Prezime:</label>
                            <input type="text" name="prezime" id="prezime" class="form-control">
                            @error('prezime')
                            <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Email:</label>
                            <input type="email" name="email" id="email" class="form-control">
                            @error('email')
                            <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Lozinka:</label>
                            <input type="password" name="lozinka" id="lozinka" class="form-control">
                            @error('lozinka')
                            <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">Registruj se</button>
                            <a href="#" class="btn btn-secondary">Imate nalog? Uloguj se.</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
