@extends('backend.layouts.master')

@section('title')
    @include('article::pages.partials.title')
@endsection

@section('admin-content')
    {{-- @include('article::pages.partials.header-breadcrumbs') --}}
    <div class="container-fluid">
        {{-- @include('article::pages.partials.top-show') --}}
        @include('backend.layouts.partials.messages')
        <div class="table-responsive product-table">
            <table class="table table-striped table-bordered display ajax_view" id="packages_table">
                <thead>
                    <tr>
                        <th>Sl</th>
                        <th>Package Name</th>
                        <th>Title </th>
                        <th>Amount </th>
                        <th>Duration</th>
                        <th>Logo</th>
                        <th width="100">Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        const ajaxURL = "<?php echo Route::is('admin.packages.trashed' ? 'packages/trashed/view' : 'packages'); ?>";
        $('table#packages_table').DataTable({
            dom: 'Blfrtip',
            language: {
                processing: "<span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span> Loading Data..."
            },
            processing: true,
            serverSide: true,
            ajax: {
                url: ajaxURL
            },
            aLengthMenu: [
                [25, 50, 100, 1000, -1],
                [25, 50, 100, 1000, "All"]
            ],
            buttons: ['excel', 'pdf', 'print'],
            columns: [{
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex'
                },
                {
                    data: 'name',
                    name: 'name'
                },
                {
                    data: 'title',
                    name: 'title'
                },
                {
                    data: 'amount',
                    name: 'amount'
                },
                {
                    data: 'duration',
                    name: 'duration'
                },
                {
                    data: 'logo',
                    name: 'logo'
                },
                {
                    data: 'action',
                    name: 'action'
                }
            ]
        });
    </script>
@endsection
