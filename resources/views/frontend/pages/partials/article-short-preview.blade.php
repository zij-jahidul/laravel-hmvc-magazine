@if (@$page->advertisement->start_date < @$page->advertisement->end_date)

    <a href="{{ route('articles.show', $page->slug) }}">
        <div class="card single-advertise-list p-2">
            <div class="">
                <div class="advertise-img d-flex justify-content-center">
                    @if ($page->poster_image)
                        <img src="{{ asset('public/assets/images/pages/' . $page->poster_image) }}" class="img-fluid" />
                    @else
                        <img src="{{ asset('uploads/pages/house-demo.jpg') }}" class="img-fluid" />
                    @endif
                </div>
                <div class="advertise-details mt-3">
                    <h5>{{ $page->title }}</h5>
                    @if ($page->group_name === 'advertisement')
                        <h6>
                            {!! currency($page->advertisement->price) !!}

                            @php
                                $oldPrice = App\Helpers\DiscountCalculation::getOldPrice($page->advertisement->price, $page->advertisement->offer_price);
                            @endphp
                            @if ($oldPrice !== $page->advertisement->price)
                                <del>
                                    {!! currency($oldPrice) !!}</del>
                            @endif
                        </h6>
                    @endif
                </div>
                @if ($page->is_pinned == 1)
                    <div class="feature">
                        <span>
                            Featured
                        </span>
                    </div>
                @endif
            </div>
        </div>
    </a>
@endif
