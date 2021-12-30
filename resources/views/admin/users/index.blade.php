@extends('layout.layout')
@section('title')
    <title>Korisnici | Pocetna</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row mt-3">
                <div class="col-lg-3">
                    <div class="d-grid"><a href="{{route('users.create')}}" class="btn btn-primary">Kreiraj novog korisnika</a></div>
                </div>
            </div>
            <div class="row my-5">
                <div class="col">
                    <div class="table-responsive-sm table-responsive-md">
                        <table class="table text-center align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Ime i prezime</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Uloge</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Datum kreiranja</th>
                                    <th scope="col">Datum azuriranja</th>
                                    <th scope="col">Status izmene</th>
                                    <th scope="col">Izmena</th>
                                    <th scope="col">Izbrisi</th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach($korisnici as $korisnik)
                                <tr>
                                    <th scope='row'>{{$loop->iteration}}</th>
                                    <td>{{$korisnik->ime.' '.$korisnik->prezime}}</td>
                                    <td>{{$korisnik->email}}</td>
                                    <td><div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                                Uloge korisnika
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                                @foreach($korisnik->roles as $role)
                                                    <li><a class="dropdown-item" href="#">{{$role->naziv_uloge}}</a></li>
                                                @endforeach
                                            </ul>
                                        </div></td>
                                    @if($korisnik->status == 1)
                                        <td>Aktivan</td>
                                    @else
                                        <td>Neaktivan</td>
                                        @endif
                                    <td>{{$korisnik->datum_kreiranja}}</td>
                                   @if($korisnik->datum_azuriranja == "")
                                        <td>NULL</td>
                                    @else
                                        <td>{{$korisnik->datum_azuriranja}}</td>
                                    @endif
                                    <td>
                                        <form action="{{route('users.update',['user' => $korisnik->id,'status' => $korisnik->status])}}" method="POST">
                                            @csrf
                                            @method("PATCH")
                                            <button type="submit" class="btn btn-warning btn-sm">Izmeni</button>
                                        </form>
                                    </td>
                                    <td><a href="{{route('users.edit',['user' => $korisnik->id])}}" class="btn btn-success btn-sm">Izmeni</a></td>
                                    <td>
                                        <form action="{{route('users.destroy',['user' => $korisnik->id])}}" method="POST">
                                            @method("DELETE")
                                            @csrf
                                            <button type="submit" class="btn btn-danger btn-sm {{$korisnik->status == 0 ? "disabled" : ""}}">Izbrisi</button>
                                        </form>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
