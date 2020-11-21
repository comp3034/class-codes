<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('register', 'App\Http\Controllers\API\RegisterController@store')->name('api.register');
Route::post('login', 'App\Http\Controllers\API\LoginController@authenticate')->name('api.login');

Route::resource('groups', 'App\Http\Controllers\API\GroupsController');

Route::middleware('auth:sanctum')
    ->get('user/groups', 'App\Http\Controllers\API\GroupsController@groups');

Route::middleware('auth:sanctum')
    ->get('user/{user}/groups', 'App\Http\Controllers\API\GroupsController@user');

Route::middleware('auth:sanctum')
    ->post('user/friend', 'App\Http\Controllers\API\FriendsController@store');

Route::middleware('auth:sanctum')
    ->get('user/friends', 'App\Http\Controllers\API\FriendsController@index');

Route::get('teste', function () {
    return 'teste';
});
