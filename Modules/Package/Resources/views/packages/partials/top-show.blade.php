<!-- ============================================================== -->
<!-- Top Show Data of Categorie List Article -->
<!-- ============================================================== -->
<div class="row mt-1">
    <!-- Column -->
    <div class="col-md-6 col-lg-3 col-xlg-3 pointer" onclick="location.href='{{ route('admin.pages.index') }}'">
        <div class="card card-hover">
            <div class="box bg-info text-center">
                <h1 class="font-light text-white">{{ $count_pages }}</h1>
                @if (request()->type === 'advertisement')
                    <h6 class="text-white">Total Advertisements</h6>
                @else
                    <h6 class="text-white">Total Magazines</h6>
                @endif
            </div>
        </div>
    </div>

    <!-- Column -->
    <div class="col-md-6 col-lg-3 col-xlg-3 pointer" onclick="location.href='{{ route('admin.pages.index') }}'">
        <div class="card card-hover">
            <div class="box bg-success text-center">
                <h1 class="font-light text-white">{{ $count_active_pages }}</h1>
                @if (request()->type === 'advertisement')
                    <h6 class="text-white">Active Advertisements</h6>
                @else
                    <h6 class="text-white">Active Magazines</h6>
                @endif
            </div>
        </div>
    </div>

    <!-- Column -->
    <div class="col-md-6 col-lg-3 col-xlg-3 pointer" onclick="location.href='{{ route('admin.pages.trashed') }}'">
        <div class="card card-hover">
            <div class="box bg-primary text-center">
                <h1 class="font-light text-white">{{ $count_pages - $count_active_pages }} / {{ $count_trashed_pages }}
                </h1>
                @if (request()->type === 'advertisement')
                    <h6 class="text-white">Inactive/Trashed Advertisements</h6>
                @else
                    <h6 class="text-white">Inactive/Trashed Magazines</h6>
                @endif
            </div>
        </div>
    </div>

    <!-- Column -->
    @if (Auth::user()->can('page.create'))
        <div class="col-md-6 col-lg-3 col-xlg-3 pointer"
            onclick="location.href='{{ route('admin.pages.create') }}{{ request()->type === 'advertisement' ? '?type=advertisement' : '?type=magazine' }}'">
            <div class="card card-hover">
                <div class="box bg-info text-center">
                    <h1 class="font-light text-white">
                        <i class="fa fa-plus-circle"></i>
                    </h1>
                    @if (request()->type === 'advertisement')
                        <h6 class="text-white">Create New Advertisements</h6>
                    @else
                        <h6 class="text-white">Create New Magazines</h6>
                    @endif
                </div>
            </div>
        </div>
    @endif

</div>
