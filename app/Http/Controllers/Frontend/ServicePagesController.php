<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Routing\Controller;
use Modules\Service\Entities\Service;

class ServicePagesController extends Controller
{
    public function index()
    {
        return view('frontend.pages.service.index');
    }

    public function show($slug)
    {
        $service = Service::where('slug', $slug)->first();
        return view('frontend.pages.service.show', compact('service'));
    }
}
