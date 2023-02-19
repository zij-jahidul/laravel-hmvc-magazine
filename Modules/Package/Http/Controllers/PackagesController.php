<?php

namespace Modules\Package\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Helpers\UploadHelper;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Modules\Package\Entities\Package;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Contracts\Support\Renderable;

class PackagesController extends Controller
{
    public $user;

    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->user = Auth::user();
            return $next($request);
        });
    }


    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index($isTrashed = false)
    {

        if (is_null($this->user) || !$this->user->can('package.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        if (request()->ajax()) {
            if ($isTrashed) {
                $packages = Package::orderBy('id', 'desc')
                    ->where('status', 0)
                    ->get();
            } else {
                $packages = Package::orderBy('id', 'desc')
                    ->where('deleted_at', null)
                    ->where('status', 1)
                    ->get();
            }

            $datatable = DataTables::of($packages, $isTrashed)
                ->addIndexColumn()
                ->addColumn(
                    'action',
                    function ($row) use ($isTrashed) {
                        $csrf = "" . csrf_field() . "";
                        $method_delete = "" . method_field("delete") . "";
                        $method_put = "" . method_field("put") . "";
                        $html = "";

                        if ($row->deleted_at === null) {
                            $deleteRoute =  route('admin.packages.destroy', [$row->id]);
                            if ($this->user->can('package.edit')) {
                                $html = '<a class="btn waves-effect waves-light btn-success btn-sm btn-circle" title="Edit Category Details" href="' . route('admin.packages.edit', $row->id) . '"><i class="fa fa-edit"></i></a>';
                            }
                            if ($this->user->can('package.delete')) {
                                $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-2 text-white" title="Delete Admin" id="deleteItem' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            }
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

                ->editColumn('name', function ($row) {
                    return $row->name;
                    // . ' <br /><a href="' . route('category.show', $row->slug) . '" target="_blank"><i class="fa fa-link"></i> View</a>';
                })

                ->editColumn('logo', function ($row) {
                    if ($row->logo != null) {
                        return "<img src='" . asset('public/assets/images/pages/' . $row->logo) . "' class='img img-display-list' />";
                    }
                    return '-';
                });

            $rawColumns = ['name', 'title', 'amount', 'duration', 'logo', 'action'];

            return $datatable->rawColumns($rawColumns)
                ->make(true);
        }

        $count_packages = count(Package::select('id')->get());
        $count_active_packages = count(Package::select('id')->where('status', 1)->get());
        $count_trashed_packages = count(Package::select('id')->where('deleted_at', '!=', null)->get());
        return view('package::packages.index', compact('count_packages', 'count_active_packages', 'count_trashed_packages'));
    }

    /**
     * Show the form for creating a new resource.
     * @return Renderable
     */
    public function create()
    {
        return view('package::packages.create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Renderable
     */
    public function store(Request $request)
    {
        $request->validate([
            'title'  => 'required|max:150',
            'name'  => 'required|max:120',
            'amount'  => 'required',
            'duration'  => 'required',
            'logo'  => 'required|image'
        ]);

        $package = new Package();
        $package->title = $request->title;

        if (!is_null($request->logo)) {
            $package->logo = UploadHelper::upload('logo', $request->logo, $request->title . '-' . time() . '-logo', 'public/assets/images/pages');
        }

        $package->name = $request->name;
        $package->amount = $request->amount;
        $package->duration = $request->duration;

        // new insert end
        $package->created_at = Carbon::now();
        $package->created_by = Auth::id();
        $package->updated_at = Carbon::now();
        $package->save();

        session()->flash('success', 'Package has been created successfully !!');
        return redirect()->route('admin.packages.index');
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
        $package = Package::find($id);
        return view('package::packages.show', compact('package'));
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
        $package = Package::find($id);
        return view('package::packages.edit', compact('package'));
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
            'title'  => 'required|max:150',
            'name'  => 'required|max:120',
            'amount'  => 'required',
            'duration'  => 'required',
        ]);

        $package = Package::find($id);
        $package->title = $request->title;

        if (!is_null($request->logo)) {
            $package->logo = UploadHelper::upload('logo', $request->logo, $request->title . '-' . time() . '-logo', 'public/assets/images/pages');
        }

        $package->name = $request->name;
        $package->amount = $request->amount;
        $package->duration = $request->duration;
        // new insert end
        $package->updated_at = Carbon::now();
        $package->save();

        session()->flash('success', 'Package has been created successfully !!');
        return redirect()->route('admin.packages.index');
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

        $page = Package::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.pages.trashed');
        }
        $page->deleted_at = Carbon::now();
        $page->deleted_by = Auth::id();
        $page->status = 0;
        $page->save();

        session()->flash('success', 'Package has been deleted successfully as trashed !!');
        return redirect()->route('admin.packages.index');
    }
}
