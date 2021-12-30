@extends('layout.layout')
@section('title')
    <title>Postovi | Name</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                @foreach($postovi as $post)
                <div class="col-lg-3 d-flex align-items-stretch my-2">
                    <div class="card" style="width: 18rem;">
                        <img src="{{asset('storage/posts/'.$post->image->putanja_slike)}}" class="card-img-top" alt="{{$post->image->alt}}">
                        <div class="card-body">
                            <h5><a href="{{route('postovi.show',['post' => $post->id])}}" class="nav-item text-decoration-none text-dark text-justfiy">{{$post->naziv_posta}}</a></h5>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </main>
@endsection
