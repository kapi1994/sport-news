@extends('layout.layout')
@section('title')
    <title>Contact</title>
@endsection
@section('main')
    <main>
        <div class="container">
            <div class="row my-3">
                <div class="col" id="porukaKontakt">
                    @if(session()->has('poruka'))
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            {{session()->get('poruka')}}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        @endif
                </div>
            </div>
            <div class="row my-5">
                <div class="col-lg-6">
                    <h1 class="text-center">Kontaktirajte nas</h1>
                    <p class="fs-3 text-justfiy">Ukoliko imate neku zanimljivu reportazu ili neku sugestiju mozete nas kontaktirati.
                    Potrudicemo se da vam odgovorimo u najkracem vremenskom roku.</p>
                </div>
                <div class="col-lg-6">
                    <form action="{{route('submitContact')}}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="">Ime i prezime:</label>
                            <input type="text" name="imePrezime" id="imePrezime" class="form-control">
                            <em id="imePrezimeKontaktError"></em>
                        </div>
                        <div class="mb-3">
                            <label for="">Email:</label>
                            <input type="email" name="email" id="email" class="form-control">
                            <em id="emailKontaktError"></em>
                        </div>
                        <div class="mb-3">
                            <label for="">Poruka:</label>
                            <textarea name="poruka" id="poruka" cols="30" rows="5" class="form-control"></textarea>
                            <em id="porukaKontaktError"></em>
                        </div>
                        <button type="submit" class="btn btn-primary" id="kontaktirajteNas">Contact us</button>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
{{--@section('skripta')--}}
{{--    <script type="text/javascript">--}}
{{--        var token = $('meta[name="csrf-token"]').attr('content');--}}


{{--        let contact = document.querySelector('#kontaktirajteNas')--}}
{{--        contact.addEventListener('click', function(){--}}
{{--            let imePrezimeKorisnika = document.querySelector('#imePrezime').value--}}
{{--            let email = document.querySelector('#email').value--}}
{{--            let poruka = document.querySelector('#poruka').value--}}

{{--            let reImePrezimeKorisnika = /^[A-Z][a-z]{2,15}(\s[A-Z][a-z]{3,15})*$/--}}
{{--            let reEmail = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/--}}
{{--            let rePoruka = /^[A-Z][a-z]{2,20}(\s[\w\d\!\?\:\@\,\.]{2,})*$/--}}

{{--            let greske = [];--}}

{{--            if(!imePrezimeKorisnika.match(reImePrezimeKorisnika)){--}}
{{--                greske.push(imePrezimeKorisnika)--}}
{{--                createMessageError('#imePrezimeKontaktError','text-danger','Ime i prezime nisu ok!')--}}
{{--            }else{--}}
{{--                removeMessageError('#imePrezimeKontaktError','text-danger')--}}
{{--            }--}}
{{--            if(!email.match(reEmail)){--}}
{{--                greske.push(email)--}}
{{--                createMessageError('#emailKontaktError','text-danger','Email nije ok')--}}
{{--            }else{--}}
{{--                removeMessageError('#emailKontaktError','text-danger')--}}
{{--            }--}}
{{--            if(!poruka.match(rePoruka)){--}}
{{--                greske.push(poruka)--}}
{{--                createMessageError('#porukaKontaktError','text-danger','Poruka nije  ok!')--}}
{{--            }else{--}}
{{--                removeMessageError('#porukaKontaktError','text-danger')--}}
{{--            }--}}


{{--            if(greske.length > 0){--}}
{{--                return false;--}}
{{--            }else{--}}
{{--               $.ajax({--}}
{{--                   method: 'POST',--}}
{{--                   url : '/submitContact',--}}
{{--                   data:{imePrezimeKorisnika:imePrezimeKorisnika,--}}
{{--                       email:email,--}}
{{--                       poruka:poruka,--}}
{{--                   _token:token},--}}
{{--                   dataType:"json",--}}
{{--                   success:function (data){--}}
{{--                       console.log(data)--}}
{{--                   },error:function(err){--}}
{{--                       console.log(err)--}}
{{--                   }--}}
{{--               })--}}
{{--            }--}}
{{--        });--}}

{{--        let createMessageError = function (idElementa, klase, poruka){--}}
{{--            let element = document.querySelector(idElementa)--}}
{{--            element.classList.add(klase)--}}
{{--            element.textContent = poruka--}}
{{--        }--}}
{{--        let removeMessageError = function(idElementa, klasa){--}}
{{--            let element = document.querySelector(idElementa)--}}
{{--            element.classList.remove(klasa)--}}
{{--            element.textContent = ""--}}
{{--        }--}}
{{--    </script>--}}
{{--@endsection--}}
