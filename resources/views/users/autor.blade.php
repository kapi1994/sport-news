@extends('layout.layout')
@section('title')
    <title>Autor</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-5">
                <div class="col-lg-6 mx-auto">
                    <div class="row">
                        <div class="col-lg-6">
                            <h1 class="text-center">O meni</h1>
                            <p class="text-justfiy fs-4">
                                Moje ime je Nemanja Jovicic dolazim sa Uba.
                                Moji hobiji su igranje video igara.
                                Tema projekta je online vesti.
                            </p>
                        </div>
                        <div class="col-lg-6">

                                <img src="{{asset('assets/img/20200705_180831.jpg')}}" alt="Nemanja Jovicic" class="img-fluid">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
