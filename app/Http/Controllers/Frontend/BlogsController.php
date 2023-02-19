<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Blog;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Routing\Controller;

class BlogsController extends Controller
{
    public function index(): Renderable
    {
        $blogs = Blog::paginate(10);
        return view('frontend.pages.blogs.index', compact('blogs'));
    }

    public function show(string $slug)
    {
        $blog = Blog::where('slug', $slug)->first();

        if (empty($blog)) {
            return redirect()->route('index');
        }

        return view('frontend.pages.blogs.show', compact('blog'));
    }
}
