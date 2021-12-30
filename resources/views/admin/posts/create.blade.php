@extends('layout.layout')
@section('title')
    <title>Postovi | Create</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-6 mx-auto">
                    <form action="{{route('posts.store')}}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="mb-3">
                            <label for="">Naziv posta:</label>
                            <input type="text" name="nazivPosta" id="nazivPosta" class="form-control">
                            @error('nazivPosta')
                                <em>{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Opis posta:</label>
                            <textarea name="opisPosta" id="opisPosta" cols="30" rows="5"
                                      class="form-control"></textarea>
                            @error('opisPosta')
                                <em>{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Kategorija posta:</label>
                            @foreach($kategorije as $kategorija)
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="kategorije" id="kategorije{{$kategorija->id}}" value="{{$kategorija->id}}">
                                <label class="form-check-label" for="kategorije{{$kategorija->id}}">
                                    {{$kategorija->naziv_kategorije}}
                                </label>
                            </div>
                            @endforeach
                            @error('kategorijaPosta')
                                {{$message}}
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Rubrike posta</label>
                            <br><br>
                            @foreach($rubrike as $rubrika)
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" value="{{$rubrika->id}}" id="rubrika_{{$rubrika->id}}" name="rubrika">
                                <label class="form-check-label" for="rubrika_{{$rubrika->id}}">
                                    {{$rubrika->naziv_rubrike}}
                                </label>
                            </div>
                            @endforeach
                            @error('rubrikePosta')
                                {{$message}}
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Tagovi posta:</label>
                            <br>
                            @foreach($tagovi as $tag)
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="tag{{$tag->id}}" value="{{$tag->id}}" name="tag_id[]">
                                    <label class="form-check-label" for="tag{{$tag->id}}">{{$tag->naziv_taga}}</label>
                                </div>
                            @endforeach
                            @error('')
                                {{$message}}
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Slika posta:</label>
                            <input type="file" name="slikaPosta" id="slikaPosta" class="form-control">
                            @error('slikaPosta')
                                {{$message}}
                            @enderror
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
