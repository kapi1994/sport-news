@extends('layout.layout')
@section('title')
    <title>Rubrike | Create</title>
@endsection
@section('main')
    {{$rubrika->category_id}}
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-6 mx-auto">
                    <form action="{{route('headings.update',['heading'=>$rubrika->id])}}" method="POST">
                        @method("PATCH")
                        @csrf
                        <div class="mb-3">
                            <label for="">Naziv rubrike:</label>
                            <input type="text" name="nazivRubrike" id="nazivRubrike" class="form-control" value="{{$rubrika->naziv_rubrike ?? @old('nazivRubrike')}}">
                            @error('nazivRubrike')
                                <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Kategorija rubrike:</label>
                            <select name="kategorijaRubrike" id="kategorijaRubrike" class="form-control">
                                @foreach($kategorije as $kategorija)

                                    <option {{$rubrika->category_id == $kategorija->id ? "selected" : ""}} value="{{$kategorija->id}}">{{$kategorija->naziv_kategorije}}</option>
                                @endforeach
                            </select>
                            @error('kategorijaRubrike')
                            <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary" id="submitCategory">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
