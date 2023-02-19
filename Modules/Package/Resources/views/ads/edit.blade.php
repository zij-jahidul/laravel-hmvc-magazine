@extends('backend.layouts.master')

@section('title')
    @include('article::pages.partials.title')
@endsection

@section('admin-content')
    @include('article::pages.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('backend.layouts.partials.messages')
        <div class="create-page">
            <form action="{{ route('admin.ads.update', $ads->id) }}" method="POST" enctype="multipart/form-data"
                data-parsley-validate data-parsley-focus="first">
                @csrf
                @method('put')

                <div class="form-body pb-3">
                    <div class="card-body">
                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="title">Ads Title <span
                                            class="required">*</span></label>
                                    <input type="text" class="form-control" id="title" name="title"
                                        value="{{ $ads->title }}" placeholder="Ads Title" required="" />

                                    @if ($errors->has('title'))
                                        <span class="text-danger">{{ $errors->first('title') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group has-success">
                                    <label class="control-label" for="position">Ads Show Position <span
                                            class="required">*</span></label>
                                    <select class="form-control custom-select" id="position" name="position" required>
                                        <option value="1" {{ $ads->position === 1 ? 'selected' : null }}>
                                            View Page
                                        </option>
                                        <option value="2" {{ $ads->position === 2 ? 'selected' : null }}>
                                            Details Page
                                        </option>
                                    </select>
                                </div>
                            </div>

                        </div>

                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="ads_link">Ads link <span
                                            class="required">*</span></label>
                                    <input type="text" class="form-control" id="ads_link" name="ads_link"
                                        value="{{ $ads->ads_link }}" placeholder="Ads link" required="" />

                                    @if ($errors->has('ads_link'))
                                        <span class="text-danger">{{ $errors->first('ads_link') }}</span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="video_link">Video link <span
                                            class="required">*</span></label>
                                    <input type="text" class="form-control" id="video_link" name="video_link"
                                        value="{{ $ads->video_link }}" placeholder="Video link" required="" />

                                    @if ($errors->has('video_link'))
                                        <span class="text-danger">{{ $errors->first('video_link') }}</span>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label" for="description">
                                        Ads Description
                                        <span class="optional">(optional)</span>
                                    </label>
                                    <textarea type="text" class="form-control tinymce_advance" id="description" name="description"
                                        placeholder=" Ads Description">{{ $ads->description }}</textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label" for="image">Ads Image <span
                                            class="required">*</span></label>

                                    <input type="file" class="form-control dropify" data-height="70"
                                        data-allowed-file-extensions="png jpg jpeg webp" id="image" name="image"
                                        data-default-file="{{ $ads->image != null ? asset('public/assets/images/pages/' . $ads->image) : null }}" />

                                    @if ($errors->has('image'))
                                        <span class="text-danger">{{ $errors->first('image') }}</span>
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


{{--
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
                        </div> --}}
