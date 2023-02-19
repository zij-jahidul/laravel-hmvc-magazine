@php
    $carousels = Modules\Article\Entities\Page::where('category_id', 4)
        ->where('deleted_at', null)
        ->where('status', 1)
        ->get();
@endphp

<div id="carouselExampleIndicators" class="carousel slide main-carousel" data-ride="carousel">
    <ol class="carousel-indicators">
        @foreach ($carousels as $carousel)
            <li data-target="#carouselExampleIndicators" data-slide-to="{{ $loop->index }}"
                class="{{ $loop->index === 0 ? 'active' : '' }}"></li>
        @endforeach
    </ol>
    <div class="carousel-inner home-baner" class="img-fluid">
        @foreach ($carousels as $carousel)
            <div class="carousel-item {{ $loop->index === 0 ? 'active' : '' }}">
                <img class="d-block w-100" src="{{ asset('public/assets/images/pages/' . $carousel->image) }}" alt="First slide">
                <div class="carousel-caption text-white">
                    <h1 class="text-white fw-lighter">{{ $carousel->title }}</h1>
                    @if ($carousel->meta_description)
                        <p>
                            <a href="{{ url('') }}{{ $carousel->meta_description }}"
                                class="btn rounded bg-gradient btn-lg px-5 rounded-0">Visit ⇾</a>
                        </p>
                    @endif
                </div>
            </div>
        @endforeach
    </div>

    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
