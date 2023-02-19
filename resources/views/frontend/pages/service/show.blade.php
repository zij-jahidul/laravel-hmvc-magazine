@extends('frontend.layouts.master')

@section('title')
    Home | {{ config('app.name') }}
@endsection

@section('main-content')
    <div role="main" class="main">
        <div class="container my-lg-4">
            <h1 class="page-title">{{ $service->title }}</h1>
            <div class="row ctg-bottom">
                <div class="col-12 col-md-6">
                    {!! $service->description !!}
                </div>
                <div class="col-12 col-md-6">
                    @include('frontend.pages.partials.catalog-slider')
                </div>
            </div>
        </div>
    </div>
@endsection
