<?php

namespace App\Settings;

use Spatie\LaravelSettings\Settings;

class CurrencySettings extends Settings
{
    public ?string $currency;

    public ?string $currency_position;

    public ?string $thousand_separator;

    public ?string $decimal_separator;

    public ?string $number_of_decimals;

    public static function group(): string
    {
        return 'currency';
    }
}