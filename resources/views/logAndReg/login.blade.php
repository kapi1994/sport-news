@extends('layout.layout')
@section('title')
    <title>Login</title>
@endsection
@section('main')

    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-4 mx-auto">
                    <form action="{{route('logovanje')}}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="">Email:</label>
                            <input type="email" name="email" id="email" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label for="">Lozinka:</label>
                            <input type="password" name="lozinka" id="lozinka" class="form-control">
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">Ulogujte se</button>
                            <a href="#" class="btn btn-secondary">Nemate nalog? Registrujte se.</a>
                        </div>
                    </form>
                    @if(session()->has('greska'))
                        <em class="text-danger text-center">
                            {{session()->get('greska')}}
                        </em>
                    @endif
                </div>
            </div>
        </div>
    </main>
@endsection
