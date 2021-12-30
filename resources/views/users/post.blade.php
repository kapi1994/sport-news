@extends('layout.layout')
@section('title')
    <title></title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-8">
                    <img src="{{asset('storage/posts/'.$post->image->putanja_slike)}}" alt="{{$post->image->alt}}" class="img-fluid">
                    <div class="my-5">
                        <span class="text-danger">Rubrika</span>: {{$post->heading->naziv_rubrike}} |
                        Autor: {{$post->user->ime.' '.$post->user->prezime}}  |
                        Datum kreiranja {{$post->datum_kreiranja}}
                    </div>
                    <h1 class="my-4">{{$post->naziv_posta}}</h1>
                    <p class="text-justfiy fs-5">{{$post->opis_posta}}</p>

                    @foreach($post->tags as $tag)
                        <a href="/products?tag_id={{$tag->id}}" class="btn btn-primary">{{$tag->naziv_taga}}</a>
                    @endforeach

                    @if(session()->has('korisnik'))
                      <div class="my-4">
                          <form action="{{route('comment.store',['post_id' => $post->id])}}" method="POST">
                              @csrf
                              <div class="mb-3">
                                  <label for="">Unesite vas komenta:</label>
                                  <textarea name="comment" id="comment" cols="30" rows="5" class="form-control" placeholder="Dodajte vas komentar"></textarea>
                              </div>
                              <button type="submit" class="btn btn-primary">Dodajte komentar</button>
                          </form>
                      </div>
                    @endif
                    @isset($post->comments)
                        @foreach($post->comments as $comment)
                            <form action="#">
                                <span class="text-danger">{{$comment->user->ime.' '.$comment->user->prezime}}</span> <span>{{$comment->datum_kreiranja}}</span>
                                <div class="mb-3">
                                    <textarea name="#" id="#" cols="" rows="3" class="form-control">{{$comment->tekst_komentara}}</textarea>
                                </div>
                            </form>
                            <p>
                              @if(session()->has('korisnik'))

                                    <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample{{$comment->id}}" role="button" aria-expanded="false" aria-controls="collapseExample">
                                        Odgovori
                                    </a>
                                  @endif

                            </p>
                            <div class="collapse mb-5" id="collapseExample{{$comment->id}}">
                                <div class="card card-body">
                                    <form action="{{route('comment.store',['post_id' => $post->id, 'comment_id' => $comment->id])}}" method="POST">
                                        @csrf
                                      <div class="mb-3">
                                          <textarea name="comment" id="comment" cols="30" rows="3" class="form-control" placeholder="Odgovorite"></textarea>
                                      </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
                                </div>
                            </div>

                        @endforeach
                    @endisset
                </div>
                <div class="col-lg-4">
                   <div class="row">

                       <h2 class="text-center">Postovi iz kategorije</h2>
                       <div class="col-lg">

                           @foreach($category_posts as $cat_post)
                               <div class="card mb-2">
                                   <img src="{{asset('storage/posts/'.$cat_post->image->putanja_slike)}}" class="card-img-top" alt="...">
                                   <div class="card-body">
                                       <h5><a href="{{route('postovi.show',['post' => $cat_post->id])}}" class="nav-item text-decoration-none text-dark text-justfiy">{{$cat_post->naziv_posta}}</a></h5>
                                   </div>
                               </div>
                           @endforeach
                       </div>

                   </div>
                </div>
            </div>
        </div>
    </main>
@endsection
