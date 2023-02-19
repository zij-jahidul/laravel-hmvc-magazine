@section('social_meta_tags')
    <meta name="author" content="{{ $settings->general->meta_author }}">
    <meta name="description" content="{{ $code->meta_description }}">
    <meta name="keywords" content="{{ $settings->general->meta_keywords }}">
    <meta property="og:title" content="{{ $code->title }}">
    <meta property="og:description" content="{{ $code->meta_description }}">
    <meta property="og:url" content=" {{ route('articles.show', $code->slug) }}">
    <meta name="twitter:title" content="{{ $code->title }} ">
    <meta name="twitter:description" content=" {{ $code->meta_description }}">
    <meta name="twitter:card" content="{{ route('articles.show', $code->slug) }}">
@endsection
