<?php

namespace App\View\Composer;

use stdClass;
use Illuminate\View\View;
use App\Settings\SocialSettings;
use App\Settings\ContactSettings;
use App\Settings\GeneralSettings;
use App\Settings\CurrencySettings;

class SettingsComposer
{
    public GeneralSettings $general;
    public ContactSettings $contact;
    public SocialSettings $social;
    public CurrencySettings $currency;

    public function __construct(GeneralSettings $general, ContactSettings $contact, SocialSettings $social, CurrencySettings $currency)
    {
        $this->general = $general;
        $this->contact = $contact;
        $this->social = $social;
        $this->currency = $currency;
    }

    /**
     * Bind data to the view.
     *
     * @param  \Illuminate\View\View  $view
     * @return void
     */
    public function compose(View $view)
    {
        $settings = new stdClass();
        $settings->general = $this->general;
        $settings->contact = $this->contact;
        $settings->social  = $this->social;
        $settings->currency  = $this->currency;

        $view->with('settings', $settings);
    }
}
