@extends('layout.layout')
@section('title')
    <title>Kategorije | Update</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-6 mx-auto">
                    <form action="{{route('categories.update',['category' => $kategorija->id])}}" method="POST">
                        @csrf
                        @method("PATCH")
                        <div class="mb-3">
                            <label for="">Naziv kategorije:</label>
                            <input type="text" name="kategorijaNaziv" id="kategorijaNaziv" class="form-control" value="{{$kategorija->naziv_kategorije ?? @old('kategorijaNaziv')}}">
                            @error('kategorijaNaziv')
                            <em class="text-center text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary" id="categorySubmit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
