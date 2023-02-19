<?php

namespace Modules\Package\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Ads extends Model
{
    use HasFactory;

    protected $fillable = ['title', 'description', 'ads_link', 'image', 'video_link'];

    protected static function newFactory()
    {
        return \Modules\Package\Database\factories\AdsFactory::new();
    }
}
