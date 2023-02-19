@php $user = Auth::user(); @endphp

<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li class="nav-small-cap">
                    <i class="mdi mdi-dots-horizontal"></i>
                    <span class="hide-menu">
                        {{ $user->first_name }}
                        <span class="badge badge-info">{{ $user->language ? $user->language->name : '' }}</span>
                    </span>
                </li>

                @if ($user->can('dashboard.view'))
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('admin.index') }}"
                            aria-expanded="false">
                            <i class="mdi mdi-creation"></i>
                            <span class="hide-menu">Dashboard</span>
                        </a>
                    </li>
                @endcan

                @if ($user->can('admin.view') || $user->can('admin.create') || $user->can('role.view') || $user->can('role.create'))
                    <li class="sidebar-item ">
                        <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)"
                            aria-expanded="false">
                            <i class="mdi mdi-account"></i>
                            <span class="hide-menu">Users & Roles </span>
                        </a>
                        <ul aria-expanded="false"
                            class="collapse first-level {{ Route::is('admin.admins.index') || Route::is('admin.admins.create') || Route::is('admin.admins.edit') ? 'in' : null }}">
                            @if ($user->can('admin.view'))
                                <li class="sidebar-item">
                                    <a href="{{ route('admin.admins.index') }}"
                                        class="sidebar-link {{ Route::is('admin.admins.index') || Route::is('admin.admins.edit') ? 'active' : null }}">
                                        <i class="mdi mdi-view-list"></i>
                                        <span class="hide-menu"> User List </span>
                                    </a>
                                </li>
                            @endcan

                            @if ($user->can('admin.create'))
                                <li class="sidebar-item">
                                    <a href="{{ route('admin.admins.create') }}"
                                        class="sidebar-link {{ Route::is('admin.admins.create') ? 'active' : null }}">
                                        <i class="mdi mdi-plus-circle"></i>
                                        <span class="hide-menu"> New User </span>
                                    </a>
                                </li>
                            @endcan

                            @if ($user->can('role.view'))
                                <li class="sidebar-item">
                                    <a href="{{ route('admin.roles.index') }}"
                                        class="sidebar-link {{ Route::is('admin.roles.index') ? 'active' : null }}">
                                        <i class="mdi mdi-view-quilt"></i>
                                        <span class="hide-menu"> Roles </span>
                                    </a>
                                </li>
                            @endcan

                            @if ($user->can('role.create'))
                                <li class="sidebar-item">
                                    <a href="{{ route('admin.roles.create') }}"
                                        class="sidebar-link {{ Route::is('admin.roles.create') ? 'active' : null }}">
                                        <i class="mdi mdi-plus-circle"></i>
                                        <span class="hide-menu"> New Role </span>
                                    </a>
                                </li>
                            @endcan
        </ul>
    </li>
@endcan

@if ($user->can('category.view') || $user->can('category.create'))
    <li class="sidebar-item ">
        <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)"
            aria-expanded="false">
            <i class="mdi mdi-tune"></i>
            <span class="hide-menu">Categories </span>
        </a>
        <ul aria-expanded="false"
            class="collapse first-level {{ Route::is('admin.categories.index') || Route::is('admin.categories.create') || Route::is('admin.categories.edit') ? 'in' : null }}">
            @if ($user->can('category.view'))
                <li class="sidebar-item">
                    <a href="{{ route('admin.categories.index') }}"
                        class="sidebar-link {{ Route::is('admin.categories.index') || Route::is('admin.categories.edit') ? 'active' : null }}">
                        <i class="mdi mdi-view-list"></i>
                        <span class="hide-menu"> Category List </span>
                    </a>
                </li>
            @endif

            @if ($user->can('category.create'))
                <li class="sidebar-item">
                    <a href="{{ route('admin.categories.create') }}"
                        class="sidebar-link {{ Route::is('admin.categories.create') ? 'active' : null }}">
                        <i class="mdi mdi-plus-circle"></i>
                        <span class="hide-menu"> New Category </span>
                    </a>
                </li>
            @endif
        </ul>
    </li>
@endif

@if (
    $user->can('page.view') ||
        $user->can('page.create') ||
        $user->can('advertisement.view') ||
        $user->can('advertisement.create'))
    <li class="sidebar-item ">
        <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)"
            aria-expanded="false">
            <i class="mdi mdi-tag-text-outline"></i>
            <span class="hide-menu">Advertisements </span>
        </a>
        <ul aria-expanded="false"
            class="collapse first-level {{ request()->type === 'advertisement' && (Route::is('admin.pages.index') || Route::is('admin.pages.create') || Route::is('admin.pages.edit')) ? 'in' : null }}">
            @if ($user->can('page.view') || $user->can('advertisement.view'))
                <li class="sidebar-item">
                    <a href="{{ route('admin.pages.index') }}?type=advertisement"
                        class="sidebar-link {{ request()->type === 'advertisement' && (Route::is('admin.pages.index') || Route::is('admin.pages.edit')) ? 'active' : null }}">
                        <i class="mdi mdi-view-list"></i>
                        <span class="hide-menu"> Advertisements </span>
                    </a>
                </li>
            @endif

            @if ($user->can('page.create') || $user->can('advertisement.create'))
                <li class="sidebar-item">
                    <a href="{{ route('admin.pages.create') }}?type=advertisement"
                        class="sidebar-link {{ request()->type === 'advertisement' && Route::is('admin.pages.create') ? 'active' : null }}">
                        <i class="mdi mdi-plus-circle"></i>
                        <span class="hide-menu"> New Advertisement </span>
                    </a>
                </li>
            @endif
        </ul>
    </li>
@endif

@if (
    $user->can('page.view') ||
        $user->can('page.create') ||
        $user->can('advertisement.view') ||
        $user->can('advertisement.create'))
    <li class="sidebar-item ">
        <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)"
            aria-expanded="false">
            <i class="mdi mdi-tag-text-outline"></i>
            <span class="hide-menu">Magazine </span>
        </a>
        <ul aria-expanded="false"
            class="collapse first-level {{ request()->type === 'magazine' && (Route::is('admin.pages.index') || Route::is('admin.pages.create') || Route::is('admin.pages.edit')) ? 'in' : null }}">
            @if ($user->can('page.view') || $user->can('advertisement.view'))
                <li class="sidebar-item">
                    <a href="{{ route('admin.pages.index') }}?type=magazine"
                        class="sidebar-link {{ request()->type === 'magazine' && (Route::is('admin.pages.index') || Route::is('admin.pages.edit')) ? 'active' : null }}">
                        <i class="mdi mdi-view-list"></i>
                        <span class="hide-menu"> Magazines </span>
                    </a>
                </li>
            @endif

            @if ($user->can('page.create') || $user->can('advertisement.create'))
                <li class="sidebar-item">
                    <a href="{{ route('admin.pages.create') }}?type=magazine"
                        class="sidebar-link {{ request()->type === 'magazine' && Route::is('admin.pages.create') ? 'active' : null }}">
                        <i class="mdi mdi-plus-circle"></i>
                        <span class="hide-menu"> New Magazine </span>
                    </a>
                </li>
            @endif
        </ul>
    </li>
@endif

@if ($user->can('service.view') || $user->can('service.create'))
    <li class="sidebar-item ">
        <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)"
            aria-expanded="false">
            <i class="mdi mdi-arrow-right-drop-circle"></i>
            <span class="hide-menu">Catalog </span>
        </a>
        <ul aria-expanded="false"
            class="collapse first-level {{ Route::is('admin.services.index') || Route::is('admin.services.create') || Route::is('admin.services.edit') ? 'in' : null }}">
            @if ($user->can('service.view'))
                <li class="sidebar-item">
                    <a href="{{ route('admin.services.index') }}"
                        class="sidebar-link {{ Route::is('admin.services.index') || Route::is('admin.services.edit') ? 'active' : null }}">
                        <i class="mdi mdi-view-list"></i>
                        <span class="hide-menu"> Catalog List </span>
                    </a>
                </li>
            @endif

            @if ($user->can('service.create'))
                <li class="sidebar-item">
                    <a href="{{ route('admin.services.create') }}"
                        class="sidebar-link {{ Route::is('admin.services.create') ? 'active' : null }}">
                        <i class="mdi mdi-plus-circle"></i>
                        <span class="hide-menu"> New Catalog </span>
                    </a>
                </li>
            @endif
        </ul>
    </li>
@endif

@if ($user->can('package.view') || $user->can('package.create'))
    <li class="sidebar-item ">
        <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)"
            aria-expanded="false">
            <i class="mdi mdi-email"></i>
            <span class="hide-menu">Package</span>
        </a>
        <ul aria-expanded="false"
            class="collapse first-level {{ Route::is('admin.packages.index') || Route::is('admin.packages.show') ? 'in' : null }}">
            @if ($user->can('package.view'))
                <li class="sidebar-item">
                    <a href="{{ route('admin.packages.index') }}"
                        class="sidebar-link {{ Route::is('admin.packages.index') || Route::is('admin.packages.show') ? 'active' : null }}">
                        <i class="mdi mdi-email"></i>
                        <span class="hide-menu"> Package List </span>
                    </a>
                </li>
            @endif

            @if ($user->can('package.create'))
                <li class="sidebar-item">
                    <a href="{{ route('admin.packages.create') }}"
                        class="sidebar-link {{ Route::is('admin.packages.create') || Route::is('admin.packages.edit') ? 'active' : null }}">
                        <i class="mdi mdi-email"></i>
                        <span class="hide-menu"> New Package </span>
                    </a>
                </li>
            @endif
        </ul>
    </li>
@endif

@if ($user->can('contact.view') || $user->can('contact.create'))
    <li class="sidebar-item ">
        <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)"
            aria-expanded="false">
            <i class="mdi mdi-email"></i>
            <span class="hide-menu">Contact Message </span>
        </a>
        <ul aria-expanded="false"
            class="collapse first-level {{ Route::is('admin.contacts.index') || Route::is('admin.contacts.show') ? 'in' : null }}">
            @if ($user->can('contact.view'))
                <li class="sidebar-item">
                    <a href="{{ route('admin.contacts.index') }}"
                        class="sidebar-link {{ Route::is('admin.contacts.index') || Route::is('admin.contacts.show') ? 'active' : null }}">
                        <i class="mdi mdi-email"></i>
                        <span class="hide-menu"> Message List </span>
                    </a>
                </li>
            @endif
        </ul>
    </li>
@endif


@if ($user->can('contact.view') || $user->can('contact.create'))
    <li class="sidebar-item ">
        <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)"
            aria-expanded="false">
            <i class="mdi mdi-settings"></i>
            <span class="hide-menu">Settings </span>
        </a>
        <ul aria-expanded="false"
            class="collapse first-level {{ Route::is('admin.languages.index') || Route::is('admin.languages.create') || Route::is('admin.languages.edit') || Route::is('admin.languages.connection.index') ? 'in' : null }}">
            <li class="sidebar-item">
                <a href="{{ route('admin.languages.index') }}"
                    class="sidebar-link {{ Route::is('admin.languages.index') || Route::is('admin.languages.create') || Route::is('admin.languages.edit') ? 'active' : null }}">
                    <i class="mdi mdi-plus-circle"></i>
                    <span class="hide-menu"> Languages </span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="{{ route('admin.settings.index') }}"
                    class="sidebar-link {{ Route::is('admin.settings.index') ? 'active' : null }}">
                    <i class="mdi mdi-settings"></i>
                    <span class="hide-menu"> Settings </span>
                </a>
            </li>
        </ul>
    </li>

@endif


<li class="sidebar-item">
    <a class="sidebar-link waves-effect waves-dark sidebar-link"
        href="{{ route('admin.logout') }}"
        onclick="event.preventDefault();
                    document.getElementById('logout-form').submit();"
        aria-expanded="false">
        <i class="mdi mdi-directions"></i>
        <span class="hide-menu">Log Out</span>
    </a>
    <form id="logout-form" action="{{ route('admin.logout') }}" method="POST"
        style="display: none;">
        @csrf
    </form>
</li>
</ul>
</nav>
<!-- End Sidebar navigation -->
</div>
<!-- End Sidebar scroll-->
</aside>
