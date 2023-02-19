@extends('backend.layouts.master')

@section('title')
    @include('article::pages.partials.title')
@endsection

@section('admin-content')
    @include('article::pages.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('backend.layouts.partials.messages')
        <div class="create-page">
            <form action="{{ route('admin.packages.update', $package->id) }}" method="POST" enctype="multipart/form-data"
                data-parsley-validate data-parsley-focus="first">
                @csrf
                @method('put')

                <div class="form-body pb-3">
                    <div class="card-body">
                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="name">Package Name <span
                                            class="required">*</span></label>
                                    <input type="text" class="form-control" id="name" name="name"
                                        value="{{ $package->name }}" placeholder="Package Name" required="" />

                                    @if ($errors->has('name'))
                                        <span class="text-danger">{{ $errors->first('name') }}</span>
                                    @endif

                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="title">Package Title <span
                                            class="required">*</span></label>
                                    <input type="text" class="form-control" id="title" name="title"
                                        value="{{ $package->title }}" placeholder="Package Title" required="" />

                                    @if ($errors->has('title'))
                                        <span class="text-danger">{{ $errors->first('title') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="amount">Amount <span
                                            class="required">*</span></label>
                                    <input type="number" class="form-control" id="amount" name="amount"
                                        value="{{ $package->amount }}" placeholder="Amount" required="" />
                                    @if ($errors->has('amount'))
                                        <span class="text-danger">{{ $errors->first('amount') }}</span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="duration">Duration (7,15,30 or Custom days)<span
                                            class="required">*</span></label>
                                    <input type="number" class="form-control" id="duration" name="duration"
                                        value="{{ $package->duration }}" placeholder="Days Duration" required="" />
                                    @if ($errors->has('duration'))
                                        <span class="text-danger">{{ $errors->first('duration') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label" for="logo">Package Logo <span
                                            class="required">*</span></label>

                                    <input type="file" class="form-control dropify" data-height="70"
                                        data-allowed-file-extensions="png jpg jpeg webp" id="logo" name="logo"
                                        data-default-file="{{ $package->logo != null ? asset('public/assets/images/pages/' . $package->logo) : null }}" />

                                    @if ($errors->has('logo'))
                                        <span class="text-danger">{{ $errors->first('logo') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-12">
                        <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i>
                            Save</button>
                        <a href="{{ route('admin.packages.index') }}" class="btn btn-dark">Cancel</a>
                    </div>
                    {{-- if advertisement end --}}
                </div>


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
