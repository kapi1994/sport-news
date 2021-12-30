@component('mail::message')
    # Dear, {{$content['name']}}

    {{$content['poruka']}}

    From : {{$content['email']}}

    {{ config('app.name') }}
@endcomponent
