@php
    $why = Modules\Article\Entities\Page::where('id', 6)
        ->where('deleted_at', null)
        ->where('status', 1)
        ->first();
@endphp

@if ($why)
    <div class="why-man-filter-section py-5">
        <div class="container">
            <div class="row">
                <h1 class="page-title">{{ $why->title }}</h1>
            </div>
        </div>
        <div
            class="container-responsive container responsivegrid cmp-component aem-GridColumn aem-GridColumn--default--12">
            <div class="cmp-container-grid">

                <div id="container-responsive-51a819a246" class="cmp-container-content">
                    <div class="aem-Grid aem-Grid--12 aem-Grid--default--12 aem-Grid--md--12 aem-Grid--sm--12 ">
                        <div
                            class="text-media cmp-component aem-GridColumn--sm--none aem-GridColumn--default--none aem-GridColumn--offset--sm--0 aem-GridColumn aem-GridColumn--offset--md--0 aem-GridColumn--sm--11 aem-GridColumn--default--6 aem-GridColumn--offset--default--0 aem-GridColumn--md--none aem-GridColumn--md--12">
                            <div class="cmp-text-media cmp-text-media--media-left"
                                data-cmp-data-layer="{&quot;text-media-1f12123fe4&quot;:{&quot;@type&quot;:&quot;mannhummel-base/components/whitelabel/text-media&quot;}}"
                                id="text-media-1f12123fe4">
                                <div class="cmp-container">
                                    <div class="cmp-text-media__container">
                                        <div class="cmp-text-media__content">
                                            <div class="cmp-text cmp-text--standard cmp-text--as-benefits">
                                                {!! $why->description !!}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endif
