@extends('frontend.layouts.master')

@include('frontend.pages.articles.style')
@section('main-content')
    <div role="main" class="main">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-4 mt-5">
                    {{-- <!-- <p>Sort results by</p>
                        <div class="dropdown">
                        <button onclick="myFunction()" class="dropbtn">Sort results by</button>
                        <div id="myDropdown" class="dropdown-content">
                        <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
                        <a href="#about">Date: Newest on top</a>
                        <a href="#base">Date: Oldest on top</a>
                        <a href="#blog">Price: high to low</a>
                        <a href="#contact">Price: Low to high</a>

                        </div>
                    </div> --> --}}

                    @include('frontend.pages.partials.article-filter', [
                         'enablePriceFilter' => false,
                         'enableConditionFilter' => false,
                    ])

                    <div class="card p-3">
                        @forelse ($magazine_view_page_left as $magazine)
                            @include('frontend.pages.partials.article-short-preview', [
                                 'page' => $magazine
                            ])
                        @empty
                            <span class="text-center text-danger">No-advertisement</span>
                        @endforelse
                    </div>
                </div>
                <div class="col-12 col-md-8">
                    {{-- All List --}}
                    <div class="Advertisement-list-section mt-5">
                        <h2 class="page-title">Magazines</h2>
                        <div class="container">
                            <div class="row">
                                @foreach ($magazines_all as $magazine)
                                    <div class="col-6 col-md-4">
                                        @include('frontend.pages.partials.article-short-preview', [
                                            'page' => $magazine,
                                        ])
                                    </div>
                                @endforeach
                            </div>
                            <div>
                                {{ $magazines_all->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        $(".form-input").on('change', function (e) {
            $("#sortingTable").submit();
        });
    </script>
@endsection
