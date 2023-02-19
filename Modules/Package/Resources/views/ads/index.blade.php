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
            <table class="table table-striped table-bordered display ajax_view" id="ads_table">
                <thead>
                    <tr>
                        <th>Sl</th>
                        <th>Title</th>
                        <th>Ads link </th>
                        <th>Image </th>
                        <th>Video link</th>
                        <th width="100">Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        const ajaxURL = "<?php echo Route::is('admin.ads.trashed' ? 'ads/trashed/view' : 'ads'); ?>";
        $('table#ads_table').DataTable({
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
                    data: 'title',
                    name: 'title'
                },
                {
                    data: 'ads_link',
                    name: 'ads_link'
                },
                {
                    data: 'image',
                    name: 'image'
                },
                {
                    data: 'video_link',
                    name: 'video_link'
                },
                {
                    data: 'action',
                    name: 'action'
                }
            ]
        });
    </script>
@endsection
