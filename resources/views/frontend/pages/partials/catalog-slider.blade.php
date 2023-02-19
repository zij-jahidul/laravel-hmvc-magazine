<div id="catalogCarouselIndicators-{{ $service->slug }}" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#catalogCarouselIndicators-{{ $service->slug }}" data-slide-to="0" class="active"></li>
        <li data-target="#catalogCarouselIndicators-{{ $service->slug }}" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner home-baner" class="img-fluid" alt="Responsive image">
        <div class="carousel-item active">
            <img class="d-block w-100" src="{{ asset('public/assets/images/services/' . $service->banner_image) }}" alt="">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="{{ asset('public/assets/images/services/' . $service->image) }}" alt="">
        </div>
    </div>
    <a class="carousel-control-prev" href="#catalogCarouselIndicators-{{ $service->slug }}" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#catalogCarouselIndicators-{{ $service->slug }}" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
