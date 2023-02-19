<?php

namespace Modules\Article\Http\Controllers;

use Carbon\Carbon;
use App\Models\Admin;
use App\Models\Track;
use Illuminate\Http\Request;
use App\Helpers\StringHelper;
use App\Helpers\UploadHelper;
use Illuminate\Support\Facades\DB;
use Modules\Article\Entities\Page;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Modules\Package\Entities\Package;
use Modules\Article\Entities\Category;
use Yajra\DataTables\Facades\DataTables;
use Modules\Article\Entities\ArticleType;
use Modules\Article\Entities\Advertisement;

class PagesController extends Controller
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
     *
     * @return \Illuminate\Http\Response
     */
    public function index($isTrashed = false)
    {
        $user = Auth::guard('admin')->user();

        if (is_null($this->user) || !$this->user->can('page.view') || !$this->user->can('advertisement.all')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        if (request()->ajax()) {
            $type = request()->type === 'advertisement' ? '?type=advertisement' : '?type=magazine';

            if ($this->user->can('advertisement.view') || Admin::isSuperAdmin($user)) {
                if (Admin::isSuperAdmin($user)) {
                    $query = Page::orderBy('id', 'desc');
                } else {
                    $query = Page::orderBy('id', 'desc')->where('created_by', Auth::id());
                }
            } else {
                $query = Page::orderBy('id', 'desc');
            }
            if ($isTrashed) {
                $query->where('status', 0);
            } else {
                $query->where('deleted_at', null);
            }

            // problem 1 (magazines_all)

            if (!Admin::isSuperAdmin($user)) {
                if (
                    request()->type === 'advertisement' && $user->hasPermissionTo('advertisement_all')
                    || request()->type === 'magazine' && $user->hasPermissionTo('magazines_all')
                ) {
                    $query->where('created_by', Auth::id());
                }
            }

            if (!empty(request()->type)) {
                $query->where('group_name', request()->type);
            }

            $pages = $query->get();

            $datatable = DataTables::of($pages, $isTrashed)
                ->addIndexColumn()
                ->addColumn(
                    'action',
                    function ($row) use ($isTrashed, $type) {
                        $csrf = "" . csrf_field() . "";
                        $method_delete = "" . method_field("delete") . "";
                        $method_put = "" . method_field("put") . "";
                        $html = '<a class="btn waves-effect waves-light btn-info btn-sm btn-circle" title="View Page Details" href="' . route('admin.pages.show', $row->id) . '"><i class="fa fa-eye"></i></a>';

                        if ($row->deleted_at === null) {
                            $deleteRoute =  route('admin.pages.destroy', [$row->id]);
                            $editRoute = route('admin.pages.edit', $row->id) . $type;
                            if ($this->user->can('page.edit') || $this->user->can('advertisement.edit')) {
                                $html .= '<a class="btn waves-effect waves-light btn-success btn-sm btn-circle ml-1 " title="Edit Page Details" href="' . $editRoute . '"><i class="fa fa-edit"></i></a>';
                            }
                            if ($this->user->can('page.delete') || $this->user->can('advertisement.delete')) {
                                $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-1 text-white" title="Delete Admin" id="deleteItem' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            }
                        } else {
                            $deleteRoute =  route('admin.pages.trashed.destroy', [$row->id]);
                            $revertRoute = route('admin.pages.trashed.revert', [$row->id]);

                            if ($this->user->can('page.delete') || $this->user->can('advertisement.delete')) {
                                $html .= '<a class="btn waves-effect waves-light btn-warning btn-sm btn-circle ml-1" title="Revert Back" id="revertItem' . $row->id . '"><i class="fa fa-check"></i></a>';
                                $html .= '
                                <form id="revertForm' . $row->id . '" action="' . $revertRoute . '" method="post" style="display:none">' . $csrf . $method_put . '
                                    <button type="submit" class="btn waves-effect waves-light btn-rounded btn-success"><i
                                            class="fa fa-check"></i> Confirm Revert</button>
                                    <button type="button" class="btn waves-effect waves-light btn-rounded btn-secondary" data-dismiss="modal"><i
                                            class="fa fa-times"></i> Cancel</button>
                                </form>';
                                $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-1 text-white" title="Delete Page Permanently" id="deleteItemPermanent' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            }
                        }



                        $html .= '<script>
                            $("#deleteItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Page will be deleted as trashed !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deleteForm' . $row->id . '").submit();}})
                            });
                        </script>';

                        if ($this->user->can('page.delete') || $this->user->can('advertisement.delete')) {
                            $html .= '<script>
                            $("#deleteItemPermanent' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Page will be deleted permanently, both from trash !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deletePermanentForm' . $row->id . '").submit();}})
                            });
                        </script>';

                            $html .= '<script>
                            $("#revertItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Page will be revert back from trash !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, Revert Back!"
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
                        }
                        return $html;
                    }
                )

                ->editColumn('title', function ($row) {
                    return $row->title;
                })
                ->editColumn('poster_image', function ($row) {
                    if ($row->poster_image != null) {
                        return "<img src='" . asset('public/assets/images/pages/' . $row->poster_image) . "' class='img img-display-list' />";
                    }
                    return '-';
                })
                ->editColumn('image', function ($row) {
                    if ($row->image != null) {
                        return "<img src='" . asset('public/assets/images/pages/' . $row->image) . "' class='img img-display-list' />";
                    }
                    return '-';
                })
                ->addColumn('category', function ($row) {
                    $html = "";
                    $category = Category::find($row->category_id);
                    if (!is_null($category)) {
                        $html .= "<span>" . $category->name . "</span>";
                    } else {
                        $html .= "-";
                    }
                    return $html;
                })
                ->editColumn('status', function ($row) {
                    if ($row->status) {
                        return '<span class="badge badge-success font-weight-100">Active</span>';
                    } else if ($row->deleted_at != null) {
                        return '<span class="badge badge-danger">Trashed</span>';
                    } else {
                        return '<span class="badge badge-warning">Inactive</span>';
                    }
                });

            $rawColumns = ['action', 'title', 'status', 'category', 'poster_image', 'image'];
            return $datatable->rawColumns($rawColumns)->make(true);
        }

        // request type wise logic for advertisement & magazine and pages all
        // $user = Auth::guard('admin')->user();
        if (Admin::isSuperAdmin($user)) {
            $count_pages = Page::select('id')->count();
            $count_active_pages = Page::select('id')->where('status', 1)->count();
            $count_trashed_pages = Page::select('id')->where('deleted_at', '!=', null)->count();
        } else {
            $count_pages = Page::select('id')->where('user_id', Auth::id())->count();
            $count_active_pages = Page::select('id')->where('user_id', Auth::id())->where('status', 1)->count();
            $count_trashed_pages = Page::select('id')->where('user_id', Auth::id())->where('deleted_at', '!=', null)->count();
        }
        return view('article::pages.index', compact('count_pages', 'count_active_pages', 'count_trashed_pages'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::printCategory(null, 3);
        $article_types = ArticleType::all();
        $packages = Package::all();
        return view('article::pages.create', compact('categories', 'article_types', 'packages'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // if (is_null($this->user) || !$this->user->can('page.create')) {
        //     return abort(403, 'You are not allowed to access this page !');
        // }

        $request->validate([
            'title'  => 'required|max:100',
            'slug'  => 'nullable|max:100|unique:pages,slug',
            'image'  => 'nullable|image',
            'banner_image'  => 'nullable|image'
        ]);

        // $request->validate([
        // 'page_id'  => 'required',
        // 'condition'  => 'required',
        // 'phone_visible'  => 'required',
        // 'price'  => 'required',
        // 'address'  => 'required',
        // ]);

        try {
            DB::beginTransaction();
            $page = new Page();
            $page->title = $request->title;
            if ($request->slug) {
                $page->slug = $request->slug;
            } else {
                $page->slug = StringHelper::createSlug($request->title, 'Modules\Article\Entities\Page', 'slug', '-', true);
            }

            if (!is_null($request->banner_image)) {
                $page->banner_image = UploadHelper::upload('banner_image', $request->banner_image, $request->title . '-' . time() . '-banner', 'public/assets/images/pages');
            }

            if (!is_null($request->image)) {
                $page->image = UploadHelper::upload('image', $request->image, $request->title . '-' . time() . '-logo', 'public/assets/images/pages');
            }

            if (request()->type === 'advertisement') {
                if (!is_null($request->poster_image)) {
                    $page->poster_image = UploadHelper::upload('poster_image', $request->poster_image, $request->title . '-' . time() . '-poster_image', 'public/assets/images/pages');
                }
            }

            $page->user_id = Auth::id();
            $page->category_id = $request->category_id;
            $page->article_type_id = $request->article_type_id;
            $page->position = $request->position;
            $page->is_position = $request->is_position;

            if ($request->package_id) {
                $page->package_id = $request->package_id;
                $getPackage = Package::where('id', $request->package_id)->first();
                $packageDay = $getPackage->duration;
            }

            $page->status = $request->status;
            $page->priority = $request->priority;
            $page->description = $request->description;
            $page->meta_description = $request->meta_description;
            // new insert start
            if (request()->type === 'advertisement') {
                $page->group_name = request()->type;
            } else {
                $page->group_name = 'magazine';
            }
            $page->phone_visible = $request->phone_visible;
            $page->is_approved = $request->is_approved;
            $page->is_pinned = $request->is_pinned;

            $user = Auth::guard('admin')->user();
            if (Admin::isSuperAdmin($user)) {
                $page->is_paid = 1;
            }

            // new insert end
            $page->created_at = Carbon::now();
            $page->created_by = Auth::id();
            $page->updated_at = Carbon::now();
            $page->save();

            // Advertisement
            if (request()->type === 'advertisement') {
                $advertisement = new Advertisement();
                $advertisement->page_id = $page->id;
                $advertisement->condition = $request->condition;
                $advertisement->is_phone_visible = $request->is_phone_visible;
                $advertisement->price = $request->price;
                $advertisement->offer_price = $request->offer_price;
                $advertisement->address = $request->address;
                $advertisement->additional_info_title = $request->additional_info_title;
                $advertisement->additional_info_description = $request->additional_info_description;
                if ($packageDay) {
                    $advertisement->start_date = Carbon::now();
                    $advertisement->end_date = Carbon::now()->addDays($packageDay);
                }
                $advertisement->created_at = Carbon::now();
                $advertisement->updated_at = Carbon::now();
                $advertisement->save();
            }

            Track::newTrack($page->title, 'Advertisement has been created');
            DB::commit();

            if (isset($request->package_id)) {
                return redirect()->route('stripe.index', $page->id);
            } else {
                $type = request()->type === 'advertisement' ? '?type=advertisement' : '?type=magazine';
                session()->flash('success', 'Advertisement has been created successfully !!');
                return redirect()->route('admin.pages.index') . $type;
            }
        } catch (\Exception $e) {
            session()->flash('sticky_error', $e->getMessage());
            DB::rollBack();
            return back();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        if (is_null($this->user) || !$this->user->can('page.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $page = Page::find($id);
        $advertisement = Advertisement::where('page_id', $id)->first();
        $categories = DB::table('categories')->select('id', 'name')->get();
        return view('article::pages.show', compact('categories', 'page'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (is_null($this->user) || !$this->user->can('page.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $page = Page::find($id);
        $categories = Category::printCategory($page->category_id);
        $article_types = ArticleType::all();
        $advertisement = Advertisement::where('page_id', '=', $id)->first();
        return view('article::pages.edit', compact('categories', 'page', 'article_types', 'advertisement'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        if (is_null($this->user) || !$this->user->can('page.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $page = Page::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.pages.index');
        }

        $request->validate([
            'title'  => 'required|max:100',
            'slug'  => 'required|max:100|unique:pages,slug,' . $page->id,
        ]);

        try {
            DB::beginTransaction();
            $page->title = $request->title;
            $page->slug = $request->slug;
            $page->status = $request->status;
            if (!is_null($request->banner_image)) {
                $page->banner_image = UploadHelper::update('banner_image', $request->banner_image, $request->title . '-' . time() . '-banner', 'public/assets/images/pages', $page->banner_image);
            }

            if (!is_null($request->image)) {
                $page->image = UploadHelper::update('image', $request->image, $request->title . '-' . time() . '-logo', 'public/assets/images/pages', $page->image);
            }

            if (request()->type === 'advertisement') {
                if (!is_null($request->poster_image)) {
                    $page->poster_image = UploadHelper::upload('poster_image', $request->poster_image, $request->title . '-' . time() . '-poster_image', 'public/assets/images/pages');
                }
            }

            $page->category_id = $request->category_id;
            $page->article_type_id = $request->article_type_id;
            $page->status = $request->status;
            $page->priority = $request->priority;
            $page->description = $request->description;
            $page->meta_description = $request->meta_description;
            $page->position = $request->position;
            $page->is_position = $request->is_position;

            // new insert start
            if (request()->type === 'advertisement') {
                $page->phone_visible = $request->phone_visible;
                $page->is_approved = $request->is_approved;
                $page->is_pinned = $request->is_pinned;
            }

            $page->updated_by = Auth::id();
            $page->updated_at = Carbon::now();
            $page->save();

            // Advertisement
            if (request()->type === 'advertisement') {
                Advertisement::where('page_id', $page->id)->update([
                    'condition' => $request->condition,
                    'is_phone_visible' => $request->is_phone_visible,
                    'price' => $request->price,
                    'offer_price' => $request->offer_price,
                    'address' => $request->address,
                    'additional_info_title' => $request->additional_info_title,
                    'additional_info_description' => $request->additional_info_description,
                    'updated_at' => Carbon::now(),
                ]);
            }

            Track::newTrack($page->title, 'Advertisement updated successfully !!');
            DB::commit();

            $type = request()->type === 'advertisement' ? '?type=advertisement' : '?type=magazine';
            session()->flash('success', 'Advertisement updated successfully !!');
            return redirect()->route('admin.pages.index') . $type;
        } catch (\Exception $e) {
            session()->flash('sticky_error', $e->getMessage());
            DB::rollBack();
            return back();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (is_null($this->user) || !$this->user->can('page.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $page = Page::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.pages.trashed');
        }
        $page->deleted_at = Carbon::now();
        $page->deleted_by = Auth::id();
        $page->status = 0;
        $page->save();

        session()->flash('success', 'Page has been deleted successfully as trashed !!');
        return redirect()->route('admin.pages.trashed');
    }

    /**
     * revertFromTrash
     *
     * @param integer $id
     * @return Remove the item from trash to active -> make deleted_at = null
     */
    public function revertFromTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('page.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $page = Page::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.pages.trashed');
        }
        $page->deleted_at = null;
        $page->deleted_by = null;
        $page->save();

        session()->flash('success', 'Page has been revert back successfully !!');
        return redirect()->route('admin.pages.trashed');
    }

    /**
     * destroyTrash
     *
     * @param integer $id
     * @return void Destroy the data permanently
     */
    public function destroyTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('page.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $page = Page::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.pages.trashed');
        }

        // Remove Images
        UploadHelper::deleteFile('public/assets/images/pages/' . $page->banner_image);
        UploadHelper::deleteFile('public/assets/images/pages/' . $page->image);

        // Delete Page permanently
        $page->delete();

        session()->flash('success', 'Page has been deleted permanently !!');
        return redirect()->route('admin.pages.trashed');
    }

    /**
     * trashed
     *
     * @return view the trashed data list -> which data status = 0 and deleted_at != null
     */
    public function trashed()
    {
        if (is_null($this->user) || !$this->user->can('page.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        return $this->index(true);
    }
}
