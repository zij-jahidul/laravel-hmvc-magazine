<div class="page-breadcrumb">
    <div class="row">
        <div class="col-5 align-self-center">
            <h4 class="page-title">
                @if (Route::is('admin.pages.index'))
                    @if (request()->type === 'advertisement')
                        Advertisement
                    @else
                        Magazine
                    @endif
                @elseif(Route::is('admin.pages.create'))
                    @if (request()->type === 'advertisement')
                        Create Advertisement Page
                    @else
                        Create Magazine Page
                    @endif
                @elseif(Route::is('admin.pages.edit'))
                    @if (request()->type === 'advertisement')
                        Edit Advertisement Page <span class="badge badge-info">{{ $page->title }}</span>
                    @else
                        Edit Magazine Page <span class="badge badge-info">{{ $page->title }}</span>
                    @endif
                @elseif(Route::is('admin.pages.show'))
                    @if (request()->type === 'advertisement')
                        View Advertisement Page <span class="badge badge-info">{{ $page->title }}</span>
                        <a class="btn btn-outline-success btn-sm" href="{{ route('admin.pages.edit', $page->id) }}"> <i
                                class="fa fa-edit"></i></a>
                    @else
                        View Magazine Page <span class="badge badge-info">{{ $page->title }}</span>
                        <a class="btn btn-outline-success btn-sm" href="{{ route('admin.pages.edit', $page->id) }}"> <i
                                class="fa fa-edit"></i></a>
                    @endif
                @endif
            </h4>
        </div>
        <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ route('admin.index') }}">Home</a></li>
                        @if (Route::is('admin.pages.index'))
                            {{-- <li class="breadcrumb-item active" aria-current="page">Article/Page List</li> --}}
                            @if (request()->type === 'advertisement')
                                <li class="breadcrumb-item active" aria-current="page">Advertisement List</li>
                            @else
                                <li class="breadcrumb-item active" aria-current="page">Magazine List</li>
                            @endif
                        @elseif(Route::is('admin.pages.create'))
                            @if (request()->type === 'advertisement')
                                <li class="breadcrumb-item"><a
                                        href="{{ route('admin.pages.index') }}?type=advertisement">Advertisement
                                        List</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Create New Advertisement</li>
                            @else
                                <li class="breadcrumb-item"><a
                                        href="{{ route('admin.pages.index') }}?type=magazine">Magazine
                                        List</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Create New Magazine</li>
                            @endif
                        @elseif(Route::is('admin.pages.edit'))
                            @if (request()->type === 'advertisement')
                                <li class="breadcrumb-item"><a
                                        href="{{ route('admin.pages.index') }}?type=advertisement">Advertisement
                                        List</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Edit Advertisement</li>
                            @else
                                <li class="breadcrumb-item"><a
                                        href="{{ route('admin.pages.index') }}?type=magazine">Magazine
                                        List</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Edit Magazine</li>
                            @endif
                        @elseif(Route::is('admin.pages.show'))
                            @if (request()->type === 'advertisement')
                                <li class="breadcrumb-item"><a
                                        href="{{ route('admin.pages.index') }}?type=advertisement">Advertisement
                                        List</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Show Advertisement</li>
                            @else
                                <li class="breadcrumb-item"><a
                                        href="{{ route('admin.pages.index') }}?type=magazine">Magazine
                                        List</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Show Magazine</li>
                            @endif
                        @endif
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
