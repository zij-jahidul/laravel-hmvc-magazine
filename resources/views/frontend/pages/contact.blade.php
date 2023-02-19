@extends('frontend.layouts.master')

@section('title')
    Contact Us | {{ config('app.name') }}
@endsection

@section('main-content')
    @php
        $contact_page = \Modules\Article\Entities\Page::where('slug', 'contact-us')->first();
    @endphp

    <div role="main" class="main">
        <div class="container my-lg-5">
            <h1 class="page-title">Get in touch </h1>
            <div class="contact-form" id="contact">
                <form method="post" action="{{ route('contact') }}">
                    @csrf
                    <div class="row">
                        <div class="col-md-6">
                            <div class="Get-in-touch">
                                @include('frontend.layouts.partials.messages')
                                <p>For all enqueries, please email us using the form, Give your information and interested
                                    product ranges...</p>
                                {{-- <div class="card card-body p-5 mt-md-5">
                                    <h3 class="mb-4">Our Address</h3>
                                    <div class="row">
                                        <div class="col-1">
                                            <i class="fa fa-map-marker-alt"></i>
                                        </div>
                                        <div class="col-11">
                                            {{ $settings->contact->address }}
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-1">
                                            <i class="fa fa-envelope"></i>
                                        </div>
                                        <div class="col-11">
                                            <a href="mailto:{{ $settings->contact->email_primary }}" class="text-danger">
                                                {{ $settings->contact->email_primary }}
                                            </a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-1">
                                            <i class="fa fa-phone"></i>
                                        </div>
                                        <div class="col-11">
                                            <p>
                                                <a href="tel:{{ $settings->contact->contact_no }}" class="text-danger">
                                                    {{ $settings->contact->contact_no }}
                                                </a>
                                            </p>
                                        </div>
                                    </div>
                                </div> --}}
                                <div class="form-group">
                                    <label for="name" class="control-label">Your name <span
                                            class="text-danger">*</span></label>
                                    <input type="text" name="name" class="form-control" placeholder="Enter your name"
                                        required />
                                </div>
                                <div class="form-group">
                                    <label for="email" class="control-label">Your email <span
                                            class="text-danger">*</span></label>
                                    <input type="text" name="email" class="form-control" placeholder="Enter your email"
                                        required />
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="control-label">Your phone no <span
                                            class="text-danger">*</span></label>
                                    <input type="text" name="phone" class="form-control"
                                        placeholder="Enter your phone no" required />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 contact-form">
                            <div class="form-group">
                                <label for="subject" class="control-label">Interested Product Range <span
                                        class="text-danger">*</span></label>
                                <select type="text" name="subject" class="form-control" placeholder="Enter your subject"
                                    required>
                                    @php
                                        $productRanges = Modules\Service\Entities\Service::where('status', 1)->pluck('title');
                                    @endphp
                                    <option value="">-- Select --</option>
                                    @foreach ($productRanges as $range)
                                        <option value="{{ $range }}">
                                            {{ $range }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="phone_no" class="control-label">Your detail requirements <span
                                        class="text-danger">*</span></label>
                                <textarea name="message" class="form-control" placeholder="Enter your detail requirements"
                                    style="width: 100%; height: 140px;" required></textarea>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="btnSubmit" class="btn btn-primary btn-lg"
                                    value="Send Message" />
                            </div>

                        </div>
                    </div>

                </form>
            </div>
            <!-- /.contact-form -->
        </div>
    </div>
@endsection
