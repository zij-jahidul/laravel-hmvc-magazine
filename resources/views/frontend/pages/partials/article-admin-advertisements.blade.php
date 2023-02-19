<div class="card p-3">
    @forelse ($adminAdvertisements as $adminAdvertisement)
        <a href="{{ route('articles.show', $adminAdvertisement->slug) }}">
            <div class="card single-advertise-list p-2">
                <div class="">
                    <div class="advertise-img d-flex justify-content-center">
                        @if ($adminAdvertisement->poster_image)
                            <img src="{{ asset('public/assets/images/pages/' . $adminAdvertisement->poster_image) }}"
                                class="img-fluid" />
                        @else
                            <img src="{{ asset('uploads/pages/house-demo.jpg') }}" class="img-fluid" />
                        @endif

                    </div>
                    <div class="advertise-details mt-3">
                        <h5>{{ $adminAdvertisement->title }}</h5>
                        <h6><span>Price -
                                @if ($adminAdvertisement->advertisement->offer_price > 0)
                                    {!! currency($adminAdvertisement->advertisement->offer_price) !!}
                                @else
                                    {!! currency($adminAdvertisement->advertisement->price) !!}
                                @endif
                        </h6>
                    </div>
                    @if ($adminAdvertisement->is_pinned == 1)
                        <div class="feature">
                            <span>
                                {{ $adminAdvertisement->is_pinned == 1 ? 'feature' : '' }}
                            </span>
                        </div>
                    @endif
                </div>
            </div>
        </a>
    @empty
        <span class="text-center text-danger">No-advertisement</span>
    @endforelse
</div>
