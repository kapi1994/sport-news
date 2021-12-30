<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="/"><span class="text-dark">Sport</span><span class="text-danger">|News</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                @foreach($meni as $m)
                    <li class="nav-item text-uppercase"><a href="/products?category_id={{$m->id}}" class="nav-link">{{$m->naziv_kategorije}}</a></li>
                @endforeach
                @if(session()->has('korisnik'))
                   @php
                    $korisnik = session()->get('korisnik')->roles->pluck('id')->toArray();
                    $isAdmin = 2;
                    $isSuperAdmin = 3;


                   @endphp
                    @if(in_array($isAdmin, $korisnik))
                            <li class="nav-item text-uppercase"><a href="{{route('categories.index')}}" class="nav-link">Categories</a></li>
                            <li class="nav-item text-uppercase"><a href="{{route('headings.index')}}" class="nav-link">Headings</a></li>
                            <li class="nav-item text-uppercase"><a href="{{route('tags.index')}}" class="nav-link">Tags</a></li>
                            <li class="nav-item text-uppercase"><a href="{{route('posts.index')}}" class="nav-link">Posts</a></li>
                            @if(in_array($isSuperAdmin, $korisnik))
                            <li class="nav-item text-uppercase"><a href="{{route('users.index')}}" class="nav-link">Users</a></li>
                            <li class="nav-item text-uppercase"><a href="{{route('requests')}}" class="nav-link">Requests</a></li>
                                @endif
                   @endif
                @endif
                    <li class="nav-item text-uppercase"><a href="{{route('autor')}}" class="nav-link">Autor</a></li>
                    <li class="nav-item text-uppercase"><a href="{{route('contact')}}" class="nav-link">Contact</a></li>


                @if(session()->has('korisnik'))
                    <li class="nav-item text-uppercase"><a href="{{route('logout')}}" class="nav-link">Logout</a></li>
                @else
                    <li class="nav-item text-uppercase"><a href="{{route('login')}}" class="nav-link">Login</a></li>
                    <li class="nav-item text-uppercase"><a href="{{route('register')}}" class="nav-link">Register</a></li>
                @endif





            </ul>

        </div>
    </div>
</nav>
