<?php

namespace App\Http\Controllers\Frontend;

use Modules\Article\Entities\Page;
use Illuminate\Contracts\View\View;
use App\Http\Controllers\Controller;
use Modules\Service\Entities\Service;
use Illuminate\Contracts\View\Factory;

class FrontPagesController extends Controller
{
    public function index(): View|Factory
    {
        $featured_data = Page::getPageData([
            'is_pinned' => 1
        ]);

        $advertisements_all = Page::getPageData([
            'paginate' => true,
            'paginateNo' => 10
        ]);

        $catalogs = Service::get();

        return view('frontend.pages.index', compact('catalogs', 'advertisements_all', 'featured_data'));
    }

    public function price()
    {
        return view('frontend.pages.price');
    }

    public function portfolio()
    {
        return view('frontend.pages.portfolio');
    }

    public function about()
    {
        $page = Page::where('slug', 'about-us')->first();

        if (empty($page)) {
            abort(404, 'Sorry the page could not found.');
        }

        return view('frontend.pages.show', compact('page'));
    }

    public function categoryDetails()
    {
    }
}
