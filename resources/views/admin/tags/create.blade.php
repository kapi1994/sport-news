@extends('layout.layout')
@section('title')
    <title>Tagovi | Create</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-6 mx-auto">
                    <form action="{{route('tags.store')}}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="">Naziv taga:</label>
                            <input type="text" name="nazivTaga" id="nazivTaga" class="form-control">
                            @error('nazivTaga')
                                <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Rubrike:</label>
                            @foreach($rubrike as $rubrika)
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="{{$rubrika->id}}" id="rubrika{{$rubrika->id}}" name="rubrike_id[]">
                                <label class="form-check-label" for="rubrika{{$rubrika->id}}">
                                    {{$rubrika->naziv_rubrike}}
                                </label>
                            </div>

                            @endforeach
                            @error('rubrike_id')
                            <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="d-grid">
                            <button class="btn btn-primary" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
