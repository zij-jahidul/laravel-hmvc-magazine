@extends('frontend.layouts.master')

@section('title')
    News and Stories | {{ config('app.name') }}
@endsection

@section('main-content')
    <div role="main" class="main">
        <section class="section position-relative border-0 m-0">
            <div class="container py-4 news-section">
                <h1 class=" news-title">News and Stories</h1>
                <div class="row">
                    @foreach ($blogs as $blog)
                        <div class="col-lg-4 mb-5 mb-lg-0 appear-animation animated fadeInUpShorter appear-animation-visible"
                            data-appear-animation="fadeInUpShorter" data-appear-animation-delay="1600"
                            style="animation-delay: 1600ms;">
                            <article class="mb-5">
                                <div class="card border-0 border-radius-0 box-shadow-1">
                                    <div class="card-body p-3 z-index-1">
                                        <a href="{{ route('blog.show', $blog->slug) }}">
                                            <img class="card-img-top border-radius-0 mb-2"
                                                src="{{ asset('public/assets/images/blogs/' . $blog->image) }}"
                                                alt="Card Image">
                                        </a>
                                        <p class="text-uppercase text-color-default text-1 my-2">
                                            <time pubdate="" datetime="2021-01-10">
                                                {{ $blog->created_at->format('Y-m-d') }}
                                            </time>
                                        </p>
                                        <div class="card-body p-0">
                                            <h4 class="card-title text-5 font-weight-bold pb-1 mb-2">
                                                <a class="text-color-dark text-color-hover-primary text-decoration-none"
                                                    href="{{ route('blog.show', $blog->slug) }}">
                                                    {{ $blog->title }}
                                                </a>
                                            </h4>
                                            <p class="card-text mb-2">
                                                {!! substr(strip_tags($blog->description), 100) !!}...
                                            </p>
                                            <a href="{{ route('blog.show', $blog->slug) }}"
                                                class="btn btn-link font-weight-semibold text-decoration-none text-3 ps-0">
                                                READ MORE
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    @endforeach

                    {!! $blogs->links() !!}
                </div>
            </div>
        </section>

        <!-- @include('frontend.pages.partials.booking') -->

    </div>
@endsection
