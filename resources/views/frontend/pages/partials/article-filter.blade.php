{{-- Filter --}}
<div class="card p-3">
    <form action="" id="sortingTable" method="get">
        <div class="mb-3">
            <label for="sorting" class="form-label">Sort results by</label>
            <select id="sorting" name="sorting" class="form-control">
                <option value="latest" {{ request()->sorting === 'latest' ? 'selected' : '' }}>Date:
                    Newest on top
                </option>
                <option value="oldest" {{ request()->sorting === 'oldest' ? 'selected' : '' }}>Date:
                    Oldest on top
                </option>
            </select>
        </div>

        @if($enablePriceFilter)
            <div class="mb-3">
                <label for="min_price">Price filter</label>
                <div class="row">
                    <div class="col-6">
                        <input type="number" id="min_price" name="min_price" step="0.1" class="form-control"
                               value="{{ request()->min_price ?? '0' }}"
                               placeholder="Min price, eg:0">
                    </div>
                    <div class="col-6">
                        <input type="number" id="max_price" name="max_price" step="0.1" class="form-control"
                               value="{{ request()->max_price ?? '100000' }}" placeholder="Max price, eg:100000">
                        <!-- @Todo: Make this highest value dynamic -->
                    </div>
                </div>
            </div>
        @endif

        <div class="mb-3">
            <div class="mb-3">
                <label for="featured" class="form-label">Featured ?</label>
                <div>
                    <input type="checkbox"
                           class="mr-1"
                           id="featured"
                           name="featured"
                           value="{{ request()->featured ?? '1' }}"
                        {{ request()->featured == 1 ? 'checked' : ''}}
                    >
                    <label for="featured">
                    <span class="badge badge-dark p-1 ml-5">
                        FEATURED
                    </span>
                    </label>
                </div>
            </div>
        </div>

        @if($enableConditionFilter)
            <div class="mb-3">
                <label for="condition" class="form-label">Condition</label>
                <select id="condition" name="condition" class="mb-5 form-control">
                    <option value="">All</option>
                    <option value="new" {{ request()->condition === 'new' ? 'selected' : '' }}>New</option>
                    <option value="old" {{ request()->condition === 'old' ? 'selected' : '' }}>Old</option>
                </select>
            </div>
        @endif

        <button type="submit" class="btn rounded bg-gradient btn-lg px-5 rounded-0">Filter</button>
    </form>
</div>
