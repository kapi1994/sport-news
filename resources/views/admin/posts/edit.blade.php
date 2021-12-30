@extends('layout.layout')
@section('title')
    <title>Postovi | Edit</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-6 mx-auto">
                    <form action="{{route('posts.update',['post' => $post->id])}}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method("PATCH")
                        <div class="mb-3">
                            <label for="">Naziv posta:</label>
                            <input type="text" name="nazivPosta" id="nazivPosta" class="form-control" value="{{$post->naziv_posta}}">
                            @error('nazivPosta')
                            <em>{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Opis posta:</label>
                            <textarea name="opisPosta" id="opisPosta" cols="30" rows="5"
                                      class="form-control">{{$post->opis_posta}}</textarea>
                            @error('opisPosta')
                            <em>{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Kategorija posta:</label>
                            @foreach($kategorije as $kategorija)
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="kategorije" id="kategorije{{$kategorija->id}}" value="{{$kategorija->id}}" {{$post->category_id == $kategorija->id ? "checked" : ''}}>
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
                            @foreach($rubrike as $rubrika)
                            <div class="form-check">
                                <input class="form-check-input" type="radio" value="{{$rubrika->id}}" id="rubrika_{{$rubrika->id}}" name="rubrika" {{$post->heading_id == $rubrika->id ? "checked" : ''}} >
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

                            <label for="">Tagovi posta</label>
                            <br><br>
                            @foreach($tagovi  as $tag)
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="custom-control-input" id="category{{ $tag->id }}" name="tag_id[]" value="{{ $tag->id }}"
                                           @if(isset($tag) && in_array($tag->id, $post->tags()->pluck('id')->toArray()))
                                           checked
                                           @elseif(is_array(old('category_id')) && in_array($tag->id, old('category_id')))
                                           checked
                                        @endif
                                    />
                                    <label class="custom-control-label" for="category{{ $tag->id }}">{{ $tag->naziv_taga }}</label>
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
                        <div class="mb-3">

                            <img src="{{asset('storage/posts/'.$post->image->putanja_slike)}}" class="img-fluid" alt="{{$post->image->alt}}">
                        </div>
                        <div class="d-grid mt-3">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
