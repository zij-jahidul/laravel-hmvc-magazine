<?php

namespace App\Helpers;

use App\Settings\CurrencySettings;

class AmountFormatterHelper
{
    public static function getPrintableAmount(float $amount, string $currency = '', string $decimalSeparator = '.', string $thousandSeparator = ',', bool $currencyPositionLeft = true, int $numberOfDecimals = 2): string
    {
//        return $amount;
        $symbol = '$';
        $decimalSeparator = '.';
        $thousandSeparator = ',';
        $currencyPositionLeft = true;
        $numberOfDecimals = 2;

        $currencySetting = new CurrencySettings();

        if (empty($currency)) {
            $currency = $currencySetting->currency;
        }
        $currentCurrency  = Currency::getCurrencyByCode($currency);
        if (isset($currentCurrency['symbol'])) {
            $symbol = $currentCurrency['symbol'];
        }

        if (isset($currentCurrency['decimalSeparator'])) {
            $decimalSeparator = $currentCurrency['decimalSeparator'];
        }

        if (isset($currentCurrency['thousandSeparator'])) {
            $thousandSeparator = $currentCurrency['thousandSeparator'];
        }

        if (isset($currentCurrency['currencyPositionLeft'])) {
            $currencyPositionLeft = $currentCurrency['currencyPositionLeft'];
        }

        if (isset($currentCurrency['numberOfDecimals'])) {
            $numberOfDecimals = $currentCurrency['numberOfDecimals'];
        }

        $formattedAmount = number_format($amount, $numberOfDecimals, $decimalSeparator, $thousandSeparator);

        if ($currencyPositionLeft) {
            return $symbol . ' ' . $formattedAmount;
        } else {
            return $formattedAmount . ' ' . $symbol;
        }
    }
}
