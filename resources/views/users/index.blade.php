@extends('layout.layout')
@section('title')
    <title>Sport news | Pocetna</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                @foreach($postovi_glavni as $glavni_post)
                    <div class="col-lg-6 align-items-stretch">
                        <div class="card">
                            <img src="{{asset('storage/posts/'.$glavni_post->image->putanja_slike)}}" class="card-img-top" alt="{{$glavni_post->image->alt}}">
                            <div class="card-body">
                                <h5><a href="{{route('postovi.show',['post' => $glavni_post->id])}}" class="nav-item text-decoration-none text-dark">{{$glavni_post->naziv_posta}}</a></h5>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <div class="row">
                @foreach($postovi as $post)
                    <div class="col-lg-3 d-flex align-items-stretch my-1">
                        <div class="card">
                            <img src="{{asset('storage/posts/'.$post->image->putanja_slike)}}" class="card-img-top" alt="{{$post->image->alt}}">
                            <div class="card-body">
                                <h5><a href="{{route('postovi.show',['post' => $post->id])}}" class="nav-item text-decoration-none text-dark">{{$post->naziv_posta}}</a></h5>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </main>
@endsection
