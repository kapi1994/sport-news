@extends('layout.layout')
@section('title')
    <title>Kategorije | Pocetna</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row mt-3">
                <div class="col-lg-3">
                    <div class="d-grid">
                        <a href="{{route('categories.create')}}" class="btn btn-primary">Dodaj novu kategoriju</a>
                    </div>
                </div>
            </div>
{{--            <form action="{{route('categories.index')}}" method="GET">--}}
{{--            <div class="row my-3 g-3 align-items-center">--}}
{{--                    <div class="col-auto">--}}
{{--                        <input type="text" id="inputPassword" name="pretraga" class="form-control" aria-describedby="passwordHelpInline" placeholder="search categories">--}}
{{--                    </div>--}}
{{--                    <div class="col-auto">--}}
{{--                        <button type="submit" class="btn btn-primary">Search</button>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </form>--}}
            <div class="row my-5">
                <div class="table-responsive-sm table-responsive-md">
                    <table class="text-center table align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Naziv kategorije</th>
                                <th scope="col">Status</th>
                                <th scope="col">Datum kreiranja</th>
                                <th scope="col">Datum azuriranja</th>
                                <th scope="col">Status izmena</th>
                                <th scope="col">Izmena</th>
                                <th scope="col">Obrisi</th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($kategorije as $kategorija)
                        <tr>
                            <th scope="row">{{$loop->iteration}}</th>
                            <td>{{$kategorija->naziv_kategorije}}</td>
                            @if($kategorija->status == 1)
                                <td>Aktivan</td>
                            @else
                                <td>Neaktivan</td>
                            @endif
                            <td>{{$kategorija->datum_kreiranja}}</td>
                            @if($kategorija->datum_azuriranja == "")
                                <td>NULL</td>
                            @else
                                <td>{{$kategorija->datum_azuriranja}}</td>
                            @endif
                            <td>
                                <form action="{{route('categories.update',['category'=> $kategorija->id,'status'  => $kategorija->status])}}" method="POST">
                                    @csrf
                                    @method('PATCH')
                                    <button type="submit" class="btn btn-warning btn-sm" id="izmenaStatusaKategorije">Izmena</button>
                                </form>
                            </td>
                            <td><a href="{{route('categories.edit',['category' => $kategorija->id])}}" class="btn btn-success btn-sm">Izmena</a></td>
                            <td>
                                <form action="{{route('categories.destroy',['category' => $kategorija->id])}}" method="POST">
                                    @csrf
                                    @method("DELETE")
                                    <button class="btn btn-danger btn-sm {{$kategorija->status == 0 ? 'disabled' : ''}}" type="submit" id="izbrisiKategorij u">Izbrisi</button>
                                </form></td>
                        </tr>
                            @endforeach

                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </main>
@endsection
