<?php

namespace Modules\Package\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Helpers\UploadHelper;
use Modules\Package\Entities\Ads;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Contracts\Support\Renderable;

class AdsController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index($isTrashed = false)
    {
        // if (is_null($this->user) || !$this->user->can('category.view')) {
        //     $message = 'You are not allowed to access this page !';
        //     return view('errors.403', compact('message'));
        // }

        if (request()->ajax()) {
            if ($isTrashed) {
                $ads = Ads::orderBy('id', 'desc')
                    ->where('status', 0)
                    ->get();
            } else {
                $ads = Ads::orderBy('id', 'desc')
                    ->where('deleted_at', null)
                    ->where('status', 1)
                    ->get();
            }

            $datatable = DataTables::of($ads, $isTrashed)
                ->addIndexColumn()
                ->addColumn(
                    'action',
                    function ($row) use ($isTrashed) {
                        $csrf = "" . csrf_field() . "";
                        $method_delete = "" . method_field("delete") . "";
                        $method_put = "" . method_field("put") . "";
                        $html = "";

                        if ($row->deleted_at === null) {
                            $deleteRoute =  route('admin.ads.destroy', [$row->id]);
                            // if ($this->user->can('category.edit')) {
                            $html = '<a class="btn waves-effect waves-light btn-success btn-sm btn-circle" title="Edit Category Details" href="' . route('admin.ads.edit', $row->id) . '"><i class="fa fa-edit"></i></a>';
                            // }
                            // if ($this->user->can('category.delete')) {
                            $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-2 text-white" title="Delete Admin" id="deleteItem' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            // }
                        }

                        $html .= '<script>
                            $("#deleteItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Category will be deleted as trashed !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deleteForm' . $row->id . '").submit();}})
                            });
                        </script>';

                        $html .= '<script>
                            $("#deleteItemPermanent' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Category will be deleted permanently, both from trash !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deletePermanentForm' . $row->id . '").submit();}})
                            });
                        </script>';

                        $html .= '<script>
                            $("#revertItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Category will be revert back from trash !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, Revert Back!"
                                }).then((result) => { if (result.value) {$("#revertForm' . $row->id . '").submit();}})
                            });
                        </script>';

                        $html .= '
                            <form id="deleteForm' . $row->id . '" action="' . $deleteRoute . '" method="post" style="display:none">' . $csrf . $method_delete . '
                                <button type="submit" class="btn waves-effect waves-light btn-rounded btn-success"><i
                                        class="fa fa-check"></i> Confirm Delete</button>
                                <button type="button" class="btn waves-effect waves-light btn-rounded btn-secondary" data-dismiss="modal"><i
                                        class="fa fa-times"></i> Cancel</button>
                            </form>';

                        $html .= '
                            <form id="deletePermanentForm' . $row->id . '" action="' . $deleteRoute . '" method="post" style="display:none">' . $csrf . $method_delete . '
                                <button type="submit" class="btn waves-effect waves-light btn-rounded btn-success"><i
                                        class="fa fa-check"></i> Confirm Permanent Delete</button>
                                <button type="button" class="btn waves-effect waves-light btn-rounded btn-secondary" data-dismiss="modal"><i
                                        class="fa fa-times"></i> Cancel</button>
                            </form>';
                        return $html;
                    }
                )

                ->editColumn('title', function ($row) {
                    return $row->title;
                    // . ' <br /><a href="' . route('category.show', $row->slug) . '" target="_blank"><i class="fa fa-link"></i> View</a>';
                })

                ->editColumn('image', function ($row) {
                    if ($row->image != null) {
                        return "<img src='" . asset('public/assets/images/pages/' . $row->image) . "' class='img img-display-list' />";
                    }
                    return '-';
                });

            $rawColumns = ['title', 'ads_link', 'image', 'video_link', 'action', 'description'];

            return $datatable->rawColumns($rawColumns)
                ->make(true);
        }

        $count_ads = count(Ads::select('id')->get());
        $count_active_ads = count(Ads::select('id')->where('status', 1)->get());
        $count_trashed_ads = count(Ads::select('id')->where('deleted_at', '!=', null)->get());
        return view('package::ads.index', compact('count_ads', 'count_active_ads', 'count_trashed_ads'));

        // return view('package::ads.index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('package::ads.create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        $request->validate([
            'title'  => 'required|max:50',
            'description'  => 'required|max:120',
            'ads_link'  => 'required',
            'video_link'  => 'required',
            'image'  => 'required|image',
        ]);

        $package = new Ads();
        $package->title = $request->title;

        if (!is_null($request->image)) {
            $package->image = UploadHelper::upload('image', $request->image, $request->title . '-' . time() . '-image', 'public/assets/images/pages');
        }

        $package->description = $request->description;
        $package->ads_link = $request->ads_link;
        $package->video_link = $request->video_link;
        $package->position = $request->position;

        // new insert end
        $package->created_at = Carbon::now();
        $package->created_by = Auth::id();
        $package->updated_at = Carbon::now();
        $package->save();

        session()->flash('success', 'Ads has been created successfully !!');
        return redirect()->route('admin.ads.index');
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function show($id)
    {
        // if (is_null($this->user) || !$this->user->can('page.view')) {
        //     $message = 'You are not allowed to access this page !';
        //     return view('errors.403', compact('message'));
        // }
        $ads = Ads::find($id);
        return view('package::ads.show', compact('ads'));
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Renderable
     */
    public function edit($id)
    {
        // if (is_null($this->user) || !$this->user->can('page.edit')) {
        //     $message = 'You are not allowed to access this page !';
        //     return view('errors.403', compact('message'));
        // }
        $ads = Ads::find($id);
        return view('package::ads.edit', compact('ads'));
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Renderable
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'title'  => 'required|max:50',
            'description'  => 'required|max:120',
            'ads_link'  => 'required',
            'video_link'  => 'required',
        ]);

        $package = Ads::find($id);
        $package->title = $request->title;

        if (!is_null($request->image)) {
            $package->image = UploadHelper::upload('image', $request->image, $request->title . '-' . time() . '-image', 'public/assets/images/pages');
        }

        $package->description = $request->description;
        $package->ads_link = $request->ads_link;
        $package->video_link = $request->video_link;
        $package->position = $request->position;

        // new insert end
        $package->updated_at = Carbon::now();
        $package->save();

        session()->flash('success', 'Ads has been update successfully !!');
        return redirect()->route('admin.ads.index');
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Renderable
     */
    public function destroy($id)
    {
        // if (is_null($this->user) || !$this->user->can('page.delete')) {
        //     $message = 'You are not allowed to access this page !';
        //     return view('errors.403', compact('message'));
        // }

        $page = Ads::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.ads.trashed');
        }
        $page->deleted_at = Carbon::now();
        $page->deleted_by = Auth::id();
        $page->status = 0;
        $page->save();

        session()->flash('success', 'Ads has been deleted successfully as trashed !!');
        return redirect()->route('admin.ads.index');
    }
}
