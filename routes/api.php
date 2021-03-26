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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'v1'], function () {
    Route::post('/login', 'UserController@login');
    Route::post('/register', 'UserController@register');
    Route::get('/logout', 'UserController@logout')->middleware('auth:api');
    Route::get('/get_data_with_token', 'UserController@getData')->middleware('auth:api');
    Route::get('/get_data', 'UserController@getData');

    Route::group(['prefix' => '/user'], function (){
        Route::post('/upload_image', 'UserController@uploadImage');

    });
});
