@extends('layout.layout')
@section('title')
    <title>Contact</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-6"></div>
                <div class="col-lg-6">
                    <form action="#">
                        <div class="mb-3">
                            <label for="">Ime i prezime</label>
                            <input type="text" name="imePrezimeKontakt" id="imePrezimeKontakt" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label for="">Email:</label>
                            <input type="email" name="emailKontakt" id="emailKontakt" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label for="">Poruka</label>
                            <textarea name="porukaKontakt" id="porukaKontakt" cols="30" rows="5" class="form-control"></textarea>
                        </div>
                        <button class="btn btn-primary pull-right">Contact us</button>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
