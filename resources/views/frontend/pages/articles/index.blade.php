@extends('frontend.layouts.master')

@include('frontend.pages.articles.style')
@section('main-content')
    <div role="main" class="main">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-4 mt-5">
                    @include('frontend.pages.partials.article-filter', [
                        'enablePriceFilter' => true,
                        'enableConditionFilter' => true,
                    ])
                    @include('frontend.pages.partials.article-admin-advertisements', [
                        'adminAdvertisements' => $advertisements_view_page_left,
                    ])
                </div>
                <div class="col-12 col-md-8">
                    <div class="Advertisement-list-section mt-5">
                        <h2 class="page-title">All</h2>
                        <div class="container">
                            <div class="row">
                                @foreach ($advertisements_all as $page)
                                    <div class="col-6 col-md-4">
                                        @include('frontend.pages.partials.article-short-preview', [
                                            'page' => $page,
                                        ])
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>

                    {{-- Pagination --}}
                    <div class="d-flex justify-content-center my-5">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                {{ $advertisements_all->links() }}
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        $(".form-input").on('change', function(e) {
            $("#sortingTable").submit();
        });
    </script>
@endsection
