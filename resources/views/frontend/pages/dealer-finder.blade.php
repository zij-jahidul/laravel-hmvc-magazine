@extends('frontend.layouts.master')

@section('title')
    Dealer Finder | {{ config('app.name') }}
@endsection

@section('styles')
    <style>
        .mapouter {
            position: relative;
            text-align: right;
            width: 600px;
            height: 400px;
        }

        .gmap_canvas {
            overflow: hidden;
            background: none !important;
            width: 600px;
            height: 400px;
        }

        .gmap_iframe {
            width: 600px !important;
            height: 400px !important;
        }
    </style>
@endsection

@section('main-content')
    @php
        $contact_page = \Modules\Article\Entities\Page::where('slug', 'contact-us')->first();
    @endphp

    <div role="main" class="main">
        <div class="container mb-5 mt-3">
            <div class="row">
                <div class="col-md-6">
                    <div class="get-in-touch">
                        <h1 class="news-title">Dealer Finder</h1>
                        <p>
                            Search for a Optipart dealer in your region and contact them to begin your real-world
                            experience of our superior OE quality filters. If you have any questions, problems or if you
                            can't find an entry for your region, please contact us.
                        </p>

                        {{-- Form filter. Currenty it's static, we'll make filter dynamic later. --}}
                        <form class="cmp-dealer-finder__form">
                            <div class="mb-3">
                                <label for="region" class="form-label">Region *</label>
                                <select name="region" class="form-control">
                                    <option disabled="" value="">Please select your region</option>
                                    <option value="europe" selected>Europe</option>
                                    <option disabled="" value="americas">Americas</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="region" class="form-label">Country *</label>
                                <select name="country" class="form-control">
                                    <option disabled="" value="">Please select your country</option>
                                    <option disabled="" value="albania">Albania</option>
                                    <option disabled="" value="andorra">Andorra</option>
                                    <option disabled="" value="austria">Austria</option>
                                    <option disabled="" value="belarus">Belarus</option>
                                    <option disabled="" value="belgium">Belgium</option>
                                    <option disabled="" value="bosnia_and_herzegovina">Bosnia and Herzegovina</option>
                                    <option disabled="" value="bulgaria">Bulgaria</option>
                                    <option disabled="" value="croatia">Croatia</option>
                                    <option disabled="" value="czechia">Czechia</option>
                                    <option disabled="" value="denmark">Denmark</option>
                                    <option disabled="" value="estonia">Estonia</option>
                                    <option disabled="" value="faroe_islands">Faroe Islands</option>
                                    <option disabled="" value="finland">Finland</option>
                                    <option disabled="" value="france">France</option>
                                    <option disabled="" value="germany">Germany</option>
                                    <option disabled="" value="gibraltar">Gibraltar</option>
                                    <option disabled="" value="greece">Greece</option>
                                    <option disabled="" value="guernsey">Guernsey</option>
                                    <option disabled="" value="holy_see">Holy See</option>
                                    <option disabled="" value="hungary">Hungary</option>
                                    <option disabled="" value="iceland">Iceland</option>
                                    <option disabled="" value="ireland">Ireland</option>
                                    <option disabled="" value="isle_of_man">Isle of Man</option>
                                    <option disabled="" value="italy">Italy</option>
                                    <option disabled="" value="jersey">Jersey</option>
                                    <option disabled="" value="latvia">Latvia</option>
                                    <option disabled="" value="liechtenstein">Liechtenstein</option>
                                    <option disabled="" value="lithuania">Lithuania</option>
                                    <option disabled="" value="luxembourg">Luxembourg</option>
                                    <option disabled="" value="malta">Malta</option>
                                    <option disabled="" value="moldova_republic_of">Moldova, Republic of</option>
                                    <option disabled="" value="monaco">Monaco</option>
                                    <option disabled="" value="montenegro">Montenegro</option>
                                    <option disabled="" value="netherlands">Netherlands</option>
                                    <option disabled="" value="north_macedonia">North Macedonia</option>
                                    <option disabled="" value="norway">Norway</option>
                                    <option disabled="" value="poland">Poland</option>
                                    <option disabled="" value="portugal">Portugal</option>
                                    <option disabled="" value="romania">Romania</option>
                                    <option disabled="" value="russian_federation">Russian Federation</option>
                                    <option disabled="" value="san_marino">San Marino</option>
                                    <option disabled="" value="serbia">Serbia</option>
                                    <option disabled="" value="slovakia">Slovakia</option>
                                    <option disabled="" value="slovenia">Slovenia</option>
                                    <option disabled="" value="spain">Spain</option>
                                    <option disabled="" value="svalbard_and_jan_mayen">Svalbard and Jan Mayen</option>
                                    <option disabled="" value="sweden">Sweden</option>
                                    <option disabled="" value="switzerland">Switzerland</option>
                                    <option disabled="" value="ukraine">Ukraine</option>
                                    <option value="united_kingdom_of_great_britain_and_northern_ireland" selected>United
                                        Kingdom of
                                        Great Britain and Northern Ireland</option>
                                </select>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mapouter">
                        <div class="gmap_canvas">
                            <iframe class="gmap_iframe" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                                src="{!! $settings->contact->working_day_hours !!}">
                            </iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
