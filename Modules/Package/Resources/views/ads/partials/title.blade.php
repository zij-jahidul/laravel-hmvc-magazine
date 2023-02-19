@if (Route::is('admin.pages.index'))
    @if (request()->type === 'advertisement')
        Advertisement
    @else
        Magazine
    @endif
@elseif(Route::is('admin.pages.create'))
    @if (request()->type === 'advertisement')
        Create Advertisement
    @else
        Create Magazine
    @endif
@elseif(Route::is('admin.pages.edit'))
    @if (request()->type === 'advertisement')
        Edit Advertisement - {{ $page->title }}
    @else
        Edit Magazine - {{ $page->title }}
    @endif
@elseif(Route::is('admin.pages.show'))
    @if (request()->type === 'advertisement')
        View Advertisement - {{ $page->title }}
    @else
        View Magazine - {{ $page->title }}
    @endif
@elseif(Route::is('admin.pages.trashed'))
    @if (request()->type === 'advertisement')
        Trashed Advertisement
    @else
        Trashed Magazine
    @endif
@endif
| Admin Panel -
{{ config('app.name') }}
