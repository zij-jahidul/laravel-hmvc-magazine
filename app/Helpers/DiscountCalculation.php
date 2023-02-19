<?php

namespace App\Helpers;


class DiscountCalculation
{
    public static function getOldPrice(float $currentPriceAmount, float $discountAmount = 0): float
    {
//        if ($discountAmount === 0) {
//            return 0;
//        }

        return $currentPriceAmount + $discountAmount;
    }
}
