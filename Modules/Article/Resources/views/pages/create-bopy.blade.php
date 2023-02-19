@extends('backend.layouts.master')
@php $user = Auth::user(); @endphp

@section('title')
@include('article::pages.partials.title')
@endsection

@section('admin-content')
@include('article::pages.partials.header-breadcrumbs')
<div class="container-fluid">
    @include('backend.layouts.partials.messages')

    <div class="create-page">
        <form
            action="{{ route('admin.pages.store') }}{{ request()->type === 'advertisement' ? '?type=advertisement' : '?type=magazine' }}"
            method="POST" enctype="multipart/form-data" data-parsley-validate data-parsley-focus="first">
            @csrf

            <div class="form-body">
                <div class="card-body">
                    <div class="row ">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="title">
                                    @if (request()->type === 'advertisement')
                                    Advertisement Title
                                    @else
                                    Magazine Title
                                    @endif
                                    <span class="required">*</span>
                                </label>
                                <input type="text" class="form-control" id="title" name="title"
                                    value="{{ old('title') }}" placeholder="Enter Title" required="" />
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label" for="category_id">
                                    @if (request()->type === 'advertisement')
                                    Advertisement
                                    @else
                                    Magazine
                                    @endif
                                    Category <span class="optional">(optional)</span>
                                </label>
                                <br>
                                <select class="categories_select form-control custom-select " id="categories"
                                    name="category_id" style="width: 100%;">
                                    {!! $categories !!}
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label" for="slug">Short URL <span
                                        class="optional">(optional)</span></label>
                                <input type="text" class="form-control" id="slug" name="slug" value="{{ old('slug') }}"
                                    placeholder="Enter short url (Keep blank to auto generate)" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        @if ($user->can('admin.view') || $user->can('admin.create'))
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label" for="article_type_id">
                                    @if (request()->type === 'advertisement')
                                    Advertisement
                                    @else
                                    Magazine
                                    @endif
                                    Type
                                    <span class="optional">(optional)</span>
                                </label>
                                <br>
                                <select class="form-control custom-select select2" id="types" name="article_type_id"
                                    style="width: 100%;">
                                    <option value="">Select</option>
                                    @foreach ($article_types as $type)
                                    <option value="{{ $type->id }}">{{ $type->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group has-success">
                                <label class="control-label" for="is_pinned">Priority<span
                                        class="required">*</span></label>

                                <input type="number" class="form-control" id="priority" name="priority"
                                    value="{{ old('priority') }}" placeholder="Priority" required />
                            </div>
                        </div>
                        @endif

                        <div class="col-md-3">
                            <div class="form-group has-success">
                                <label class="control-label" for="is_pinned">Is Pinned <span
                                        class="required">*</span></label>
                                <select class="form-control custom-select" id="is_pinned" name="is_pinned" required>
                                    <option value="0" {{ old('is_pinned') === 0 ? 'selected' : null }}>
                                        No
                                    </option>
                                    <option value="1" {{ old('is_pinned') === 1 ? 'selected' : null }}>
                                        Yes
                                    </option>
                                </select>
                            </div>
                        </div>


                        <div class="col-md-3">
                            <div class="form-group has-success">
                                <label class="control-label" for="status">Status <span class="required">*</span></label>
                                <select class="form-control custom-select" id="status" name="status" required>
                                    <option value="0" {{ old('status') === 0 ? 'selected' : null }}>Inactive
                                    <option value="1" {{ old('status') === 1 ? 'selected' : null }}>Active
                                    </option>
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group has-success">
                                <label class="control-label" for="phone_visible">Phone Visible <span
                                        class="required">*</span></label>
                                <select class="form-control custom-select" id="phone_visible" name="phone_visible"
                                    required>
                                    <option value="0" {{ old('phone_visible') === 0 ? 'selected' : null }}>
                                        No
                                    </option>
                                    <option value="1" {{ old('phone_visible') === 1 ? 'selected' : null }}>
                                        Yes
                                    </option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        @if ($user->can('admin.view') || $user->can('admin.create'))
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label" for="is_approved">Approve Status</label>
                                <br>
                                <select class="form-control custom-select" id="is_approved" name="is_approved" required>
                                    <option value="0" {{ old('is_approved') === 0 ? 'selected' : null }}>
                                        Pending
                                    </option>
                                    <option value="1" {{ old('is_approved') === 1 ? 'selected' : null }}>
                                        Approve
                                    </option>
                                </select>
                            </div>
                        </div>


                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label" for="position">Advertisement Position</label>
                                <br>
                                <select class="form-control custom-select" id="position" name="position" required>
                                    <option value="advertisement_view_page_left"
                                        {{ old('position') === 'advertisement_view_page_left' ? 'selected' : null }}>
                                        Advertisement View Page Left
                                    </option>
                                    <option value="magazine_view_page_left"
                                        {{ old('position') === 'magazine_view_page_left' ? 'selected' : null }}>
                                        Magazine View Page Left
                                    </option>

                                    <option value="category_view_page_left"
                                        {{ old('position') === 'category_view_page_left' ? 'selected' : null }}>
                                        Category View Page Left
                                    </option>

                                    <option value="view_details_page_right"
                                        {{ old('position') === 'view_details_page_right' ? 'selected' : null }}>
                                        View Details Page Right
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label" for="is_position">Position Status</label>
                                <br>
                                <select class="form-control custom-select" id="is_position" name="is_position" required>
                                    <option value="0" {{ old('is_position') === 0 ? 'selected' : null }}>
                                        Pending
                                    </option>
                                    <option value="1" {{ old('is_position') === 1 ? 'selected' : null }}>
                                        Approve
                                    </option>
                                </select>
                            </div>
                        </div>
                        @endif
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="image">
                                    @if (request()->type === 'advertisement')
                                    Advertisement
                                    @else
                                    Magazine
                                    @endif
                                    Featured Image <span class="optional">(optional)</span>
                                </label>
                                <input type="file" class="form-control dropify" data-height="70"
                                    data-allowed-file-extensions="png jpg jpeg webp" id="image" name="image"
                                    value="{{ old('image') }}" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="banner_image">
                                    @if (request()->type === 'advertisement')
                                    Advertisement
                                    @else
                                    Magazine
                                    @endif
                                    Banner Image <span class="optional">(optional)</span>
                                </label>
                                <input type="file" class="form-control dropify" data-height="70"
                                    data-allowed-file-extensions="png jpg jpeg webp" id="banner_image"
                                    name="banner_image" value="{{ old('banner_image') }}" />
                            </div>
                        </div>
                    </div>

                    <div class="row ">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="description">
                                    @if (request()->type === 'advertisement')
                                    Advertisement Description
                                    @else
                                    Magazine Description
                                    @endif
                                    <span class="optional">(optional)</span>
                                </label>
                                <textarea type="text" class="form-control tinymce_advance" id="description"
                                    name="description" value="{{ old('description') }}"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="meta_description">
                                    @if (request()->type === 'advertisement')
                                    Advertisement Meta Description
                                    @else
                                    Magazine Meta Description
                                    @endif
                                    <span class="optional">(optional)</span>
                                </label>
                                <textarea type="text" class="form-control" id="meta_description" name="meta_description"
                                    value="{{ old('meta_description') }}"
                                    placeholder="Meta description for SEO"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- if advertisement start --}}
                @if (request()->type === 'advertisement')
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group has-success">
                                <label class="control-label" for="condition">Condition <span
                                        class="required">*</span></label>
                                <select class="form-control custom-select" id="condition" name="condition" required>
                                    <option value="new" {{ old('condition') === 'new' ? 'selected' : null }}>
                                        New
                                    </option>
                                    <option value="old" {{ old('condition') === 'old' ? 'selected' : null }}>
                                        Old
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group has-success">
                                <label class="control-label" for="is_phone_visible">Phone Visible <span
                                        class="required">*</span></label>
                                <select class="form-control custom-select" id="is_phone_visible" name="is_phone_visible"
                                    required>

                                    <option value="false" {{ old('is_phone_visible') === 'false' ? 'selected' : null }}>
                                        No
                                    </option>
                                    <option value="true" {{ old('is_phone_visible') === 'true' ? 'selected' : null }}>
                                        Yes
                                    </option>

                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="price">Price<span class="required">*</span></label>
                                <input type="text" class="form-control" id="price" name="price"
                                    value="{{ old('price') }}" placeholder="Price" required="" />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="offer_price">Offer Price<span
                                        class="required">*</span></label>
                                <input type="text" class="form-control" id="offer_price" name="offer_price"
                                    value="{{ old('offer_price') }}" placeholder="Offer Price" required="" />
                            </div>
                        </div>


                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="address">Address<span
                                        class="required">*</span></label>
                                <input type="text" class="form-control" id="address" name="address"
                                    value="{{ old('address') }}" placeholder="Enter Title" required="" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="additional_info_title">Additional Info Title
                                    <span class="optional">(optional)</span></label>
                                <textarea type="text" class="form-control" id="additional_info_title"
                                    name="additional_info_title" value="{{ old('additional_info_title') }}"
                                    placeholder="Meta description for SEO"></textarea>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="additional_info_description">Additional Info
                                    Description<span class="optional">(optional)</span></label>
                                <textarea type="text" class="form-control tinymce_advance"
                                    id="additional_info_description" name="additional_info_description"
                                    value="{{ old('additional_info_description') }}"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="poster_image">Advertisement Image <span
                                        class="optional">(*)</span></label>
                                <input type="file" class="form-control dropify" data-height="70"
                                    data-allowed-file-extensions="png jpg jpeg webp" id="poster_image"
                                    name="poster_image" value="{{ old('poster_image') }}" />
                            </div>
                        </div>
                    </div>

                </div>
                @endif

                <div class="col-md-12">
                    <div class="form-actions">
                        <div class="card-body">
                            <div class="form-actions">
                                <div class="card-body">

                                    @if ($user->can('admin.view') || $user->can('admin.create'))
                                    <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i>
                                        Save</button>
                                    @endif

                                    {{-- Modal Start --}}
                                    @if ($user->can('advertisement.view') || $user->can('advertisement.create'))
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                        data-target="#exampleModal" data-whatever="@getbootstrap"> Buy Package
                                    </button>
                                    @endif
                                    <a href="{{ route('admin.pages.index') }}" class="btn btn-dark">Cancel</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                {{-- if advertisement end --}}
            </div>



            {{-- Modal Strat  --}}
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel"> Buy Package</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        {{-- <form action="{{ url('stripe') }}" method="Get">
                        @csrf --}}

                        <div class="modal-body">
                            <table class="table table-striped table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col">Title</th>
                                        <th scope="col">Duration</th>
                                        <th scope="col">Amount</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($packages as $package)
                                    <tr>
                                        <td>{{ $package->title }}</td>
                                        <td>{{ $package->duration }}</td>
                                        <td>
                                            <button type="text" class="btn btn-primary btn-sm">Buy
                                                {{ $package->amount }}</button>
                                        </td>
                                        <td>
                                            <input type="radio" name="package_id" value="{{ $package->id }}">
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Buy
                                Package</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                        {{-- </form> --}}

                    </div>
                </div>
            </div>
            {{-- Modal End --}}

        </form>


    </div>



</div>
@endsection

@section('scripts')
<script>
$(".categories_select").select2({
    placeholder: "Select a Category"
});
</script>
@endsection
