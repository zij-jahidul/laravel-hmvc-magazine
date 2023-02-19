@extends('frontend.layouts.master')

@section('title')
    Home | {{ $settings->general->name }}
@endsection

@include('frontend.pages.articles.style')

@include('frontend.layouts.partials.seo_meta_tags', [
    'code' => $advertisement_details,
])

@section('main-content')
    <div role="main" class="main">
        <div class="card adverise-secion mt-5">
            <div class="container bg-light p-3">
                <div class="row">
                    <div class="col-md-8">

                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
                                <li class="breadcrumb-item"><a
                                        href="#">{{ isset($advertisement_details->category->name) ? $advertisement_details->category->name : 'No-Category' }}</a>
                                </li>
                                {{-- <li class="breadcrumb-item active" aria-current="page">Data</li> --}}
                            </ol>
                        </nav>

                        <h1>
                            {{ $advertisement_details->title }}
                        </h1>

                        {{-- {{ Carbon\Carbon::parse($advertisement_details->created_at)->format('d-m-Y i') }} --}}
                        <p>
                            <strong>Posted on - </strong>
                            {{ isset($advertisement_details->created_at) ? $advertisement_details->created_at->format('l jS \\of F Y h:i:s A') : '12.00 AM' }},
                            {{ isset($advertisement_details->advertisement) ? $advertisement_details->advertisement->address : 'no-address' }}
                        </p>
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="advertise-details">
                            <a href="#">
                                @if ($advertisement_details->poster_image)
                                    {{-- <img src="{{ asset('public/assets/images/pages/' . $advertisement_details->poster_image) }}"
                                        class="img-fluid" /> --}}


                                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active">
                                            </li>
                                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                        </ol>
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img class="d-block w-100"
                                                    src="{{ asset('public/assets/images/pages/' . $advertisement_details->poster_image) }}"
                                                    alt="First slide" data-toggle="modal"
                                                    data-target=".bd-example-modal-lg">

                                                <!-- Modal -->
                                                <!-- Large modal -->
                                                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
                                                    aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-lg">
                                                        <div class="modal-content">
                                                            <img class="d-block"
                                                                src="{{ asset('public/assets/images/pages/' . $advertisement_details->poster_image) }}"
                                                                alt="First slide" style="width: 150%; height: 700px;">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="carousel-item">
                                                <img class="d-block w-100"
                                                    src="https://qph.cf2.quoracdn.net/main-qimg-e9f4255267ff57587840511437db801b-pjlq"
                                                    alt="Second slide">
                                            </div>
                                            <div class="carousel-item">
                                                <img class="d-block w-100"
                                                    src="https://www.homesandlands.in/wp-content/uploads/2022/07/Trivandrum.webp"
                                                    alt="Third slide">
                                            </div>

                                            <div class="carousel-item">
                                                <img class="d-block w-100"
                                                    src="https://thumbs.dreamstime.com/b/san-francisco-waterfront-night-scene-christmas-1556138.jpg"
                                                    alt="Four slide">
                                            </div>
                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                                            data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                                            data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                @else
                                    <img src="{{ asset('uploads/pages/house-demo.jpg') }}" class="img-fluid" />
                                @endif

                            </a>
                            <h4 class="mt-3">
                                @if (isset($advertisement_details->advertisement) ? $advertisement_details->advertisement->offer_price > 0 : 0)
                                    {!! currency($advertisement_details->advertisement->offer_price) !!}
                                    <br>

                                    <del class="text-secondary">
                                        {!! currency($advertisement_details->advertisement->price) !!}
                                    </del>
                                @else
                                    {!! currency($advertisement_details->advertisement->price) !!}
                                @endif
                            </h4>
                            <div class="row">
                                <div class="col-6 product-details">
                                    <p>
                                        Condition:
                                        {{ isset($advertisement_details->advertisement) ? ($advertisement_details->advertisement->condition == 'new' ? 'New' : 'Old') : 'new' }}
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="product-description mt-3">
                            <h6>Description</h6>
                            <p>{!! $advertisement_details->description !!}</p>
                        </div>

                    </div>
                    <div class="col-md-4">

                        <div class="side-product-card pt-3">


                            <p>For sale by

                                <b>{{ isset($advertisement_details->admin) ? $advertisement_details->admin->first_name : 'anonymous' }}</b>
                            </p>
                            <div class="d-flex">

                            </div>
                            <div class="contact-number">
                                <p>Call seller</p>
                                <div class="call-text d-flex">
                                    <img class="img-fluid" src="{{ asset('uploads/pages/call.png') }}" />

                                    @if (isset($advertisement_details->advertisement)
                                            ? $advertisement_details->advertisement->is_phone_visible == 'true'
                                            : 'show')
                                        <p>01711111000</p>
                                    @else
                                        <p>01711XXXXXX</p>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <div class="seafty-tips card mt-3 p-2 ">
                            <div class="d-flex">
                                <img class="img-fluid" src="{{ asset('uploads/pages/safety.png') }}" />
                                <p>
                                    {!! isset($advertisement_details->advertisement)
                                        ? $advertisement_details->advertisement->additional_info_title
                                        : 'no-additional_info_title' !!}

                                </p>
                            </div>
                            <ul>
                                {!! isset($advertisement_details->advertisement)
                                    ? $advertisement_details->advertisement->additional_info_description
                                    : 'no-additional_info_description' !!}
                            </ul>

                        </div>

                        {{-- Advertisemnet Section Start --}}
                        <div class="card p-3">

                            @forelse ($advertisement_page_right as $magazine)
                                {{-- Single item start --}}
                                <a href="{{ route('articles.show', $magazine->slug) }}">
                                    <div class="card single-advertise-list p-2">
                                        <div class="">
                                            <div class="advertise-img d-flex justify-content-center">
                                                @if ($magazine->poster_image)
                                                    <img src="{{ asset('public/assets/images/pages/' . $magazine->poster_image) }}"
                                                        class="img-fluid" />
                                                @else
                                                    <img src="{{ asset('uploads/pages/house-demo.jpg') }}"
                                                        class="img-fluid" />
                                                @endif

                                            </div>
                                            <div class="advertise-details mt-3">
                                                <h5>{{ $magazine->title }}</h5>
                                                <h6>
                                                    @if ($magazine->advertisement->offer_price > 0)
                                                        {!! currency($magazine->advertisement->offer_price) !!}
                                                    @else
                                                        {!! currency($magazine->advertisement->price) !!}
                                                    @endif

                                                </h6>
                                            </div>
                                            @if ($magazine->is_pinned == 1)
                                                <div class="feature">
                                                    <span>
                                                        {{ $magazine->is_pinned == 1 ? 'feature' : '' }}
                                                    </span>
                                                </div>
                                            @endif
                                        </div>
                                    </div>
                                </a>
                                {{-- End single item --}}
                            @empty
                                <span class="text-center text-danger">No-advertisement</span>
                            @endforelse
                        </div>
                        {{-- Advertisemnet Section End --}}

                    </div>
                </div>
            </div>

        </div>
    </div>
@endsection
