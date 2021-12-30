@extends('layout.layout')
@section('title')
    <title> Detaljnije | Post {{$post->id}}</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-6">
                    <form action="#">
                        <div class="mb-3">
                            <label for="">Autor:</label>
                            <input type="text" name="" id="" class="form-control" disabled value="{{$post->user->ime. " ".$post->user->prezime}}">
                        </div>
                        <div class="mb-3">
                            <label for="">Datum kreiranja:</label>
                            <input type="text" name="" id="" class="form-control" disabled value="{{$post->datum_kreiranja}}">
                        </div>
                        <div class="mb-3">
                            <label for="">Naziv posta</label>
                            <input type="text" name="post" id="postNaziv" class="form-control" value="{{$post->naziv_posta}}" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="">Opis posta:</label>
                            <textarea name="" id="" cols="30" rows="10" class="form-control" disabled>{{$post->opis_posta}}</textarea>
                        </div>
                        <div class="mb-3">
                            <label for="">Kategorija posta</label>
                            <input type="text" name="post" id="postNaziv" class="form-control" value="{{$post->category->naziv_kategorije}}" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="">Rubrika posta</label>
                            <input type="text" name="post" id="postNaziv" class="form-control" value="{{$post->heading->naziv_rubrike}}" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="">Tagovi posta:</label><br>
                            @foreach($post->tags as $tag)
                                <a href="#" class="btn btn-primary">{{$tag->naziv_taga}}</a>
                            @endforeach
                        </div>
                        <div class="mb-3">
                            <label for="">Slika posta:</label>
                            <br>
                            <img src="{{asset('storage/posts/'.$post->image->putanja_slike)}}" alt="{{$post->image->alt}}" class="img-fluid">
                        </div>
                    </form>
                </div>
                <div class="col-lg-6">
                    <div class="d-grid">
                        <h1 class="text-center">Komentari</h1>
                        @isset($post->comments)
                            @foreach($post->comments as $comment)
                                <form action="">
                                    <span class="text-danger">{{$comment->user->ime.' '.$comment->user->prezime}}</span> <span>{{$comment->datum_kreiranja}}</span>
                                    <div class="mb-3">
                                        <textarea name="#" id="#" cols="" rows="3" class="form-control">{{$comment->tekst_komentara}}</textarea>
                                    </div>
                                </form>
                            @endforeach
                        @endisset
                    </div>
                </div>
            </div>
        </div>
    </main>
    @endsection
