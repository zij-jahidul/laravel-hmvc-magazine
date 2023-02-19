<?php

use Spatie\LaravelSettings\Migrations\SettingsMigration;

class CreateCurrencySettings extends SettingsMigration
{
    public function up(): void
    {
        $this->migrator->add('currency.currency', 'United States (US) dollar ($)');
        $this->migrator->add('currency.currency_position', 'Left');
        $this->migrator->add('currency.thousand_separator', ',');
        $this->migrator->add('currency.decimal_separator', '.');
        $this->migrator->add('currency.number_of_decimals', '2');
    }
}
