@extends('layout.layout')
@section('title')
    <title>Postovi | Pocetna</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row mt-5">
                <div class="col-lg-3">
                    <div class="d-grid"><a href="{{route('posts.create')}}" class="btn btn-primary">Kreiraj novi post</a></div>
                </div>
            </div>
            <div class="row my-5">
                <div class="table-responsive-sm table-responsive-md">
                    <table class="table text-center align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Naziv posta</th>
                                <th scope="col">Kategorija posta</th>
                                <th scope="col">Rubrika posta</th>
                                <th scope="col">Status</th>
                                <th scope="col">Datum kreiranja</th>
                                <th scope="col">Datum izmene</th>
                                <th scope="col">Detaljnije</th>
                                <th scope="col">Status izmene</th>
                                <th scope="col">Izmena</th>
                                <th scope="col">Izbrisi</th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($postovi as $post)
                            <tr>
                                <th scope="row">{{$loop->iteration}}</th>
                                <td>{{$post->naziv_posta}}</td>
                                <td>{{$post->category->naziv_kategorije}}</td>
                                <td>{{$post->heading->naziv_rubrike}}</td>
                                @if($post->status == 1)
                                    <td>Aktivan</td>
                                @else
                                    <td>Neaktivan</td>
                                @endif
                                <td>{{$post->datum_kreiranja}}</td>
                                @if($post->datum_azuriranja == "")
                                    <td>null</td>
                                @else
                                    <td>{{$post->datum_azuriranja}}</td>
                                @endif
                                <td>
                                    <a href="{{route('posts.show',['post' => $post->id])}}" class="btn btn-primary btn-sm">Detaljnije</a>
                                </td>
                                <td>
                                    <form action="{{route('posts.update',['post' => $post->id,'status' => $post->status])}}" method="POST">
                                        @method("PATCH")
                                        @csrf
                                        <button type="submit" class="btn btn-warning btn-sm">Izmeni</button>
                                    </form>
                                </td>
                                <td>
                                    <a href="{{route('posts.edit',['post' => $post->id])}}" class="btn btn-success btn-sm">Izmeni</a>
                                </td>
                                <td>
                                    <form action="{{route('posts.destroy',['post' => $post->id])}}" method="POST">
                                        @csrf
                                        @method("DELETE")
                                        <button type="submit" class="btn btn-danger btn-sm {{$post->status == 0 ? "disabled" : ""}}">Izbrisi</button>
                                    </form>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
@endsection


