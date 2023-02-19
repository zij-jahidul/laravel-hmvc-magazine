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

                    {{-- Advertisemnet Section Start --}}
                    <div class="card p-3">
                        @forelse ($category_page_left as $advertisement)
                            @include('frontend.pages.partials.article-short-preview', [
                                'page' => $advertisement
                            ])
                        @empty
                            <span class="text-center text-danger">No-advertisement</span>
                        @endforelse
                    </div>
                </div>
                <div class="col-12 col-md-8">
                    <div class="Advertisement-list-section mt-5">
                        <h2 class="page-title">{{ $category_name }}</h2>
                        <div class="container">
                            <div class="row">
                                @foreach ($advertisements_all as $advertisement)
                                    <div class="col-6 col-md-4">
                                        @include('frontend.pages.partials.article-short-preview', [
                                            'page' => $advertisement
                                        ])
                                    </div>
                                @endforeach
                            </div>
                            <div>
                                {{ $advertisements_all->links() }}
                            </div>
                        </div>
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
