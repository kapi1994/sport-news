@extends('layout.layout')
@section('title')
    <title>Requst | Show</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col">
                    <div class="table-resposnive-sm table-responsive-md">
                        <table class="text-center align-middle table">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Putanja</th>
                                    <th scope="col">Poruka</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Datum</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($logovi as $log)
                                    <tr>
                                        <th scope="row">{{$log->id}}</th>
                                        <td>{{$log->url}}</td>
                                        <td>{{$log->poruka}}</td>
                                        <td>{{$log->email}}</td>
                                        <td>{{$log->datum_kreiranja}}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{$logovi->links()}}
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
