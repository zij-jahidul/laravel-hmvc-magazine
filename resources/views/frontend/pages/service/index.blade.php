@extends('frontend.layouts.master')

@section('title')
Product Range | {{ config('app.name') }}
@endsection

@section('main-content')

<div role="main" class="main">
    <div class="container my-lg-4">
        <h1 class="page-title">Product Range</h1>
        @include('frontend.pages.partials.our-service')
    </div>
</div>
@endsection
