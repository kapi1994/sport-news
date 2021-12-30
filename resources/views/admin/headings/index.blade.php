@extends('layout.layout')
@section('title')
    <title>Rubrike | Pocetna</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row mt-3">
                <div class="col-lg-3">
                    <div class="d-grid">
                        <a href="{{route('headings.create')}}" class="btn btn-primary">Dodaj novu rubriku</a>
                    </div>
                </div>
            </div>
            <div class="row my-5">
                <div class="col">
                    <div class="table-responsive-sm table-responsive-md">
                        <table class="table text-center align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">#</th>

                                    <th scope="col">Naziv rubrike</th>
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
                            @foreach($rubrike as $rubrika)
                                <tr>
                                    <th scope="row">{{$rubrika->id}}</th>
                                    <td>{{$rubrika->naziv_rubrike}}</td>
                                    <td>{{$rubrika->category->naziv_kategorije}}</td>
                                    @if($rubrika->status == 1)
                                        <td>Aktivan</td>
                                    @else
                                        <td>Neaktivan</td>
                                    @endif
                                    <td>{{$rubrika->datum_kreiranja}}</td>
                                    @if($rubrika->datum_azuriranje	 =="")
                                        <td>NULL</td>
                                    @else
                                        <td>{{$rubrika->datum_azuriranje}}</td>
                                    @endif
                                    <td>
                                        <form action="{{route('headings.update',['heading' => $rubrika->id,'status' => $rubrika->status])}}" method="POST">
                                            @csrf
                                            @method("PATCH")
                                            <button type="submit" class="btn btn-warning btn-sm">Izmeni</button>
                                        </form>
                                    </td>
                                    <td>
                                        <a href="{{route('headings.edit',['heading'=> $rubrika->id])}}" class="btn btn-success btn-sm">Izmeni</a>
                                    </td>
                                   <td> <form action="{{route('headings.destroy',['heading' => $rubrika->id])}}" method="POST">
                                           @csrf
                                           @method("DELETE")
                                           <button type="submit" class="btn btn-danger btn-sm {{$rubrika->status == 0 ? "disabled" : ""}}">Obrisi</button>
                                       </form></td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{$rubrike->links()}}
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
