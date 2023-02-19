@extends('frontend.layouts.master')

@section('title')
    Home | {{ $settings->general->name }}
@endsection

@section('main-content')
    <div role="main" class="main">

        {{-- Carousel Start --}}
        @include('frontend.layouts.partials.carousel')
        {{-- Carousel End --}}

        <!-- start -->
        <div class="mann-filter-section pb-5">
            <div class="container">
                {{-- <div class="row py-4">
                    <h1 class="text-left">
                        Product Range
                    </h1>
                    <div class="col-md-12">
                        <div class="tab">
                            @foreach ($catalogs as $catalog)
                                <button class="tablinks" onclick="openCity(event, '{{ $catalog->slug }}')"
                                    id="{{ $loop->index === 0 ? 'defaultOpen' : '' }}">
                                    {{ $catalog->title }}
                                </button>
                            @endforeach
                        </div>
                    </div>
                </div> --}}

                {{-- Featured List --}}
                <div class="Advertisement-list-section mt-5">
                    <h2 class="page-title">Featured</h2>
                    <div class="container">
                        <div class="row">

                            @foreach ($featured_data as $featured)
                                <div class="col-6 col-lg-3 col-md-4">
                                    @include('frontend.pages.partials.article-short-preview', [
                                        'page' => $featured
                                    ])
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>

                {{-- All List --}}
                <div class="Advertisement-list-section mt-5">
                    <div class="d-flex justify-content-between">
                        <h2 class="page-title">
                            All
                        </h2>
                        <div>
                            <a href="{{ route('articles.index') }}"
                               class="btn rounded bg-gradient btn-lg px-5 rounded-0">View all</a>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            @foreach ($advertisements_all as $page)
                                <div class="col-6 col-lg-3 col-md-4">
                                    @include('frontend.pages.partials.article-short-preview', [
                                        'page' => $page
                                    ])
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
