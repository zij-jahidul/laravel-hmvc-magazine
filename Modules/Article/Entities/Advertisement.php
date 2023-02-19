<?php

namespace Modules\Article\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Advertisement extends Model
{
    use HasFactory;

    protected $fillable = ['page_id', 'condition', 'is_phone_visible', 'price', 'offer_price', 'address', 'additional_info_title', 'additional_info_description', 'start_date', 'end_date'];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'position' => AdvertisementPosition::class,
    ];
}
