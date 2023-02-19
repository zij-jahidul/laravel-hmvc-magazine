@extends('frontend.layouts.master')

@section('title')
{{ $blog->title }} | News and Stories | {{ config('app.name') }}
@endsection

@section('main-content')
    <div role="main" class="main">
        <section class="section position-relative border-0 m-0">
            <div class="container py-4">
                <h1 class="page-title" style="max-width: 100%">
                    {{ $blog->title }}
                </h1>
                <div class="row">
                    <div class="col-lg-12 mb-5 mb-lg-0 appear-animation animated fadeInUpShorter appear-animation-visible"
                        data-appear-animation="fadeInUpShorter" data-appear-animation-delay="1600"
                        style="animation-delay: 1600ms;">
                        <article class="mb-5">
                            <div class="card border-0 border-radius-0 box-shadow-1">
                                <div class="card-body p-3 z-index-1">
                                    <a href="demo-cleaning-services-blog-post.html">
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
                                                href="demo-cleaning-services-blog-post.html">
                                                {{ $blog->title }}
                                            </a>
                                        </h4>
                                        <div class="card-text mb-2">
                                            {!! $blog->description !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
