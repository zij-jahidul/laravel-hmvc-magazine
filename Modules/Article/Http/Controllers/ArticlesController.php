<?php

namespace Modules\Article\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Modules\Article\Entities\Page;
use Modules\Article\Entities\Category;
use Illuminate\Contracts\Support\Renderable;

class ArticlesController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function index(Request $request): Renderable
    {
        $advertisements_all = Page::getPageData([
            'paginate' => true,
            'sorting' => $request->sorting,
            'min_price' => $request->min_price,
            'max_price' => $request->max_price,
            'is_pinned' => $request->featured,
            'condition' => $request->condition,
        ]);

        $advertisements_view_page_left = Page::getPageData([
            'position' => 'advertisement_view_page_left'
        ]);

        return view('frontend.pages.articles.index', compact('advertisements_all', 'advertisements_view_page_left'));
    }

    /**
     * Display a listing of the resource.
     * @return Renderable
     */
    public function magazineIndex(Request $request): Renderable
    {
        $magazines_all = Page::getPageData([
            'paginate' => true,
            'sorting' => $request->sorting,
            'is_pinned' => $request->featured,
            'group_name' => 'magazine'
        ]);

        $magazine_view_page_left = Page::getPageData([
            'position' => 'magazine_view_page_left'
        ]);

        return view('frontend.pages.articles.magazines', compact('magazines_all', 'magazine_view_page_left'));
    }

    /**
     * Show the specified resource.
     * @param string $slug
     * @return Renderable
     */
    public function show(string $slug): Renderable
    {
        $advertisement_details = Page::select(
            'id',
            'slug',
            'is_pinned',
            'group_name',
            'title',
            'description',
            'poster_image',
            'banner_image',
            'phone_visible',
            'user_id',
            'category_id',
            'created_at',
        )
            ->where('slug',  '=', $slug)
            ->with([
                'advertisement' => function ($query) {
                    $query->select(
                        'id',
                        'page_id',
                        'price',
                        'offer_price',
                        'address',
                        'condition',
                        'additional_info_title',
                        'additional_info_description',
                        'is_phone_visible',
                    );
                },
                'admin' => function ($query) {
                    $query->select(
                        'id',
                        'first_name',
                    );
                },
            ])->first();

        $advertisement_page_right = Page::getPageData([
            'position' => 'view_details_page_right'
        ]);

        return view('frontend.pages.articles.show', compact('advertisement_details', 'advertisement_page_right'));
    }

    public function categoryDetails($name)
    {
        $category_name = $name;
        $category = Category::where('name', $category_name)->first();
        $advertisements_all = Page::getPageData([
            'paginate' => true,
            'category_id' => $category->id
        ]);

        $category_page_left = Page::getPageData([
            'position' => 'category_view_page_left'
        ]);

        return view('frontend.pages.articles.category_index', compact('advertisements_all', 'category_name', 'category_page_left'));
    }
}
