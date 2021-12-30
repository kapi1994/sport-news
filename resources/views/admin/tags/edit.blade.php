@extends('layout.layout')
@section('title')
    <title>Tag | Update</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-6 mx-auto">
                    <form action="{{route('tags.update',['tag' => $tag->id])}}" method="POST">
                        @csrf
                        @method("PATCH")
                        <div class="mb-3">
                            <label for="">Naziv taga:</label>
                            <input type="text" name="nazivTaga" id="nazivTaga" class="form-control" value="{{$tag->naziv_taga ?? @old('naziv_taga')}}">
                            @error('nazivTaga')
                                <em class="text-danger">{{$message}}</em>
                            @enderror
                        </div>
                        <div class="mb-3">
                            <label for="">Rubrike:</label>
                            <br><br>
                            @foreach($rubrike as $rubrika)
                                <div class="form-check form-check-inline">
                                <input type="checkbox" class="custom-control-input" id="rubrika{{ $rubrika->id }}" name="rubrike_id[]" value="{{ $rubrika->id }}"
                                       @if(isset($rubrika) && in_array($rubrika->id, $tag->headings()->pluck('id')->toArray()))
                                       checked
                                       @elseif(is_array(old('rubrike_id')) && in_array($rubrika->id, old('rubrike_id')))
                                       checked
                                    @endif
                                />
                                <label class="custom-control-label" for="rubrika{{ $rubrika->id }}">{{ $rubrika->naziv_rubrike }}</label>
                            </div>
                            @endforeach
                            @error('rubrike_id')
                                <em class="text-danger">{{$message}}</em>
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
