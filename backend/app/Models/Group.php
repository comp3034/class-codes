<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    use HasFactory;

    protected $hidden = ['created_at'];

    /**
     * The users that belong to the role.
     */
    public function users()
    {
        return $this->belongsToMany('App\Models\User');
    }

}
