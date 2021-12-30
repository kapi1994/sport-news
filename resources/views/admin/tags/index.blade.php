@extends('layout.layout')
@section('title')
    <title>Tagovi | Pocetan</title>
@endsection

@section('main')
    <main>
        <div class="container">
            <div class="row mt-5">
                <div class="col-lg-3">
                   <div class="d-grid">
                       <a href="{{route('tags.create')}}" class="btn btn-primary">Kreirajte novi tag</a>
                   </div>
                </div>
            </div>
            <div class="row my-3">
                <form class="row g-3" action="{{route('tags.index')}}" method="GET">
                    <div class="col-auto">
                        <label for="keyword" class="visually-hidden">Search tags</label>
                        <input type="text" class="form-control" id="keyword" placeholder="Search" name="keyword" value="{{$key ?? ""}}">
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary mb-3">Search</button>
                    </div>
                </form>
            </div>
            <div class="row my-5">
                <div class="table-responsive-sm table-responsive-md">
                    <table class="table text-center align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Naziv taga</th>
                                <th scope="col">Naziv rubrike</th>
                                <th scope="col">Status</th>
                                <th scope="col">Datum kreiranja</th>
                                <th scope="col">Datum azuriranja</th>
                                <th scope="col">Status izmena</th>
                                <th scope="col">Status</th>
                                <th scope="col">Izmena</th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($tagovi as $tag)
                            <tr>
                                <th scope="row">{{$loop->iteration}}</th>
                                <td>{{$tag->naziv_taga}}</td>
                                <td><div class="dropdown">
                                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                            Rubrike
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                            @foreach($tag->headings as $rubrika)
                                                <li><a class="dropdown-item" href="#">{{$rubrika->naziv_rubrike}}</a></li>
                                            @endforeach
                                        </ul>
                                    </div></td>
                                @if($tag->status == 1)
                                    <td>Aktivan</td>
                                @else
                                    <td>Neaktivan</td>
                                @endif

                                <td>{{$tag->datum_kreiranja}}</td>
                                @if($tag->datum_azuriranja == "")
                                    <td>null</td>
                                @else
                                    <td>{{$tag->datum_azuriranja}}</td>
                                    @endif
                                <td>
                                    <form action="{{route('tags.update', ['tag' => $tag->id,'status' => $tag->status])}}" method="POST">
                                        @csrf
                                        @method("PATCH")
                                        <button type="submit" class="btn btn-warning btn-sm">Izmeni</button>
                                    </form>
                                </td>
                                <td>
                                    <a href="{{route('tags.edit',['tag' => $tag->id])}}" class="btn btn-success btn-sm">Izmeni</a>
                                </td>
                                <td>
                                    <form action="{{route('tags.destroy',['tag' => $tag->id])}}" method="POST">
                                        @csrf
                                        @method("DELETE")
                                        <button type="submit" class="btn btn-danger btn-sm {{$tag->status == 0 ? "disabled" : ""}}">Izbrisi</button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    {{$tagovi->links()}}
                </div>
            </div>
        </div>
    </main>
@endsection
