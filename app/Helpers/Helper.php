<?php

function currency($price)
{
    return App\Helpers\AmountFormatterHelper::getPrintableAmount($price);
}