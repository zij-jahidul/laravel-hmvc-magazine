@if (Route::is('admin.services.index'))
Catalogs
@elseif(Route::is('admin.services.create'))
Create New Catalog
@elseif(Route::is('admin.services.edit'))
Edit Catalog - {{ $service->title }}
@elseif(Route::is('admin.services.show'))
View Catalog - {{ $service->title }}
@elseif(Route::is('admin.services.trashed'))
Trashed Catalog
@endif
| Admin Panel -
{{ config('app.name') }}
