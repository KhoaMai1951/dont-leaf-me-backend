<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/test', 'ImageController@test')->name('test');
Route::get('/show_token', 'ImageController@showToken')->name('show token');
Route::post('/test', 'ImageController@upload')->name('upload');
Route::get('/test2', 'ImageController@uploadPage')->name('upload page');
Route::post('/app_login', 'UserController@appLogin')->name('upload page');
Route::get('/app_login', 'UserController@appLogin')->name('upload page');
Route::get('/send-mail', function () {

    $details = [
        'title' => 'Mail from Don\'t leaf me.com',
        'body' => 'This is for testing email using smtp'
    ];

    \Mail::to('chronicle1951@gmail.com')->send(new \App\Mail\MailNotify($details));

    dd("Email is Sent.");
});

Route::group(['prefix' => '/admin'], function () {
    //SERVER PLANT
    Route::group(['prefix' => '/server-plant'], function () {
        //DS PLANT
        Route::get('/list-plant', 'ServerPlantController@listPlant')->name('server_plant.list_plant');
        //CHI TIẾT PLANT
        Route::get('/detail/{id}', 'ServerPlantController@detailPage')->name('server_plant.detail');
        //ADMIN UPDATE CHI TIẾT PLANT
        Route::post('/admin_update', 'ServerPlantController@adminUpdate')->name('server_plant.update');
    });

});
