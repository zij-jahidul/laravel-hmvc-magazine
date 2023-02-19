<?php

namespace Modules\Package\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Package extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'title', 'duration', 'logo', 'status'];

    protected static function newFactory()
    {
        return \Modules\Package\Database\factories\PackageFactory::new();
    }
}
