<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FriendsController extends Controller
{
    /**
     * Return a listing of friends for the authenticated user.
     *
     * @return \Illuminate\Http\Response
     */
    function index(){
        $user = Auth::user();
        $friends = $user->friends;
        return $friends;
    }

    /**
     * Create a link for the authenticated user and another user, called friend.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        if($request->has('friend_id')){
            $user = Auth::user();
            $user->friends()->attach($request['friend_id']);

            return response()->json(['message' => 'friend successfully linked.']);
        }

        return response()->json(['message' => 'friend_id field is empty.'], 400);

    }



}
