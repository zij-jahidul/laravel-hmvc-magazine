<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="control-label" for="currency">Currency</label>
            <select class="form-control" id="currency" name="currency">
                @foreach ($currencies as $currency)
                    <option value="{{ $currency['code'] }}"
                        {{ $currency['code'] === $settings->currency->currency ? 'selected' : '' }}>
                        {{ $currency['name'] }} ({!! $currency['symbol'] !!})</option>
                @endforeach
            </select>


        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="control-label" for="currency_position">Currency Position</label>
            <input type="text" class="form-control" id="currency_position" name="currency_position"
                placeholder="Currency Position" value="{{ $settings->currency->currency_position }}" />
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="control-label" for="thousand_separator">Thousand Separator</label>
            <input type="text" class="form-control" id="thousand_separator" name="thousand_separator"
                placeholder="Thousand Separator" value="{{ $settings->currency->thousand_separator }}" />
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="control-label" for="decimal_separator">Decimal Separator</label>
            <input type="text" class="form-control" id="decimal_separator" name="decimal_separator"
                placeholder="Decimal Separator" value="{{ $settings->currency->decimal_separator }}" />
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="control-label" for="number_of_decimals">Number of Decimals</label>
            <input type="text" class="form-control" id="number_of_decimals" name="number_of_decimals"
                placeholder="Number of Decimals" value="{{ $settings->currency->number_of_decimals }}" />
        </div>
    </div>
</div>
