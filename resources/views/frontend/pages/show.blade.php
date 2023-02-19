@extends('frontend.layouts.master')

@section('title')
{{ $page->title }} | {{ config('app.name') }}
@endsection

@section('main-content')

<div role="main" class="main">
    <div class="container my-lg-4">
        <h1 class="page-title">
            {{ $page->title }}
        </h1>

        <div>
            {!! $page->description !!}
        </div>
    </div>
</div>

@endsection
