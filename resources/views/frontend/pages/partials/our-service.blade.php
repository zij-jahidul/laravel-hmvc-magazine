@php $services = \Modules\Service\Entities\Service::get(); @endphp

<div class="row appear-animation animated fadeInUpShorter appear-animation-visible"
    data-appear-animation="fadeInUpShorter" data-appear-animation-delay="500" style="animation-delay: 500ms;">

    @foreach ($services as $service)
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
            <div class="">
                <a href="{{ route('service.show', $service->slug) }}" class="text-decoration-none">
                    <div class="card custom-card-style-1">
                        <div class="card-body text-center py-5">
                            <div class="custom-card-style-1-image-wrapper bg-primary d-inline-block mb-3">
                                <img src="{{ asset('public/assets/images/services/' . $service->image) }}" class="img-fluid"
                                    alt="">
                            </div>
                            <h4 class="custom-card-style-1-title text-color-secondary font-weight-bold mb-2">
                                {{ $service->title }}
                            </h4>
                            <p class="custom-card-style-1-description">
                                {{ substr(strip_tags($service->description), 0, 45) }}...
                            </p>
                            <span class="custom-card-style-1-link font-weight-bold">VIEW MORE</span>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    @endforeach
</div>
