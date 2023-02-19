@php
    $parentCategories = Modules\Article\Entities\Category::where('parent_category_id', null)
        ->where('status', 1)
        ->whereIn('id', [5, 8, 11, 14, 17, 18])
        ->get();
@endphp

<header id="header" class="header-effect-shrink"
    data-plugin-options="{&#39;stickyEnabled&#39;: true, &#39;stickyEffect&#39;: &#39;shrink&#39;, &#39;stickyEnableOnBoxed&#39;: true, &#39;stickyEnableOnMobile&#39;: false, &#39;stickyChangeLogo&#39;: true, &#39;stickyStartAt&#39;: 30, &#39;stickyHeaderContainerHeight&#39;: 85}"
    style="height: 85px;">
    <div class="header-body header-body-bottom-border border-top-0" style="position: fixed; top: 0px;">
        <div class="header-container container" style="height: 85px; min-height: 0px;">
            <div class="header-row">
                <div class="header-column">
                    <div class="header-row">
                        <div class="header-logo" style="width: 123px; height: 33px;">
                            <a href="{{ route('index') }}">
                                @if (empty($settings->general->logo))
                                    {{ $settings->general->name }}
                                @else
                                    <img src="{{ asset('public/assets/images/logo/' . $settings->general->logo) }}"
                                        class="img" alt="" style="top: 0px; height: 70px;">
                                @endif
                            </a>
                        </div>
                    </div>
                </div>
                <div class="header-column justify-content-end">
                    <div class="header-row">
                        <div class="header-nav header-nav-links">
                            <div
                                class="header-nav-main header-nav-main-text-capitalize header-nav-main-effect-2 header-nav-main-sub-effect-1">
                                <nav class="collapse">
                                    <ul class="nav nav-pills" id="mainNav">
                                        <li class="nav-item">
                                            <a class="nav-link" href="{{ route('magazine.index') }}" id="navbarDropdown"
                                                role="button">
                                                Magazine
                                            </a>

                                        </li>

                                        @foreach ($parentCategories as $parent)
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle"
                                                    href="{{ route('category.details', $parent->name) }}"
                                                    id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                    {{ $parent->name }}
                                                </a>
                                                @if (count($parent->getChildCategories))
                                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                        @foreach ($parent->getChildCategories as $child)
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="{{ route('category.details', $child->name) }}">
                                                                    {{ $child->name }}
                                                                </a>
                                                            </li>
                                                        @endforeach
                                                    </ul>
                                                @endif
                                            </li>
                                        @endforeach
                                    </ul>

                                    <ul class="nav nav-pills ml-5" id="mainNav">
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="" id="navbarDropdown"
                                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="fa fa-user" style="font-size: 24px"></i>
                                            </a>

                                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                @guest
                                                    <li>
                                                        <a href="{{ route('register') }}"
                                                            class="nav-link {{ Route::is('register') ? 'active current-page-active' : '' }}">Registration
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="{{ route('login') }}"
                                                            class="nav-link {{ Route::is('login') ? 'active current-page-active' : '' }}">Login
                                                        </a>
                                                    </li>
                                                @endguest

                                                @auth
                                                    <li>
                                                        <a href="{{ route('admin.index') }}"
                                                            class="nav-link {{ Route::is('admin.index') || Route::is('admin.index') ? 'active current-page-active' : '' }}">Dashboard
                                                        </a>
                                                    </li>

                                                    <li class="sidebar-item">
                                                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                            href="{{ route('admin.logout') }}"
                                                            onclick="event.preventDefault();
                                                                        document.getElementById('logout-form').submit();"
                                                            aria-expanded="false">
                                                            <i class="mdi mdi-directions"></i>
                                                            <span class="hide-menu">Log Out</span>
                                                        </a>
                                                        <form id="logout-form" action="{{ route('admin.logout') }}"
                                                            method="POST" style="display: none;">
                                                            @csrf
                                                        </form>
                                                    </li>

                                                @endauth
                                            </ul>

                                        </li>

                                    </ul>


                                </nav>
                            </div>
                        </div>
                        <button class="btn header-btn-collapse-nav" data-bs-toggle="collapse"
                            data-bs-target=".header-nav-main nav">
                            <i class="fas fa-bars"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
