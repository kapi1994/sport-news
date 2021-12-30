<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LogAndRegController;
use App\Http\Controllers\AdminController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/',[\App\Http\Controllers\FrontController::class,'index'])->name('index');
Route::get('/req',[AdminController::class,'showActions'])->name("requests")->middleware('isSuperAdmin');
Route::post('/comments',[\App\Http\Controllers\CommentsController::class,'addNew'])->name('comment.store');
Route::get('/login',[LogAndRegController::class,'login'])->name('login')->middleware('isLogin');
Route::get('/register',[LogAndRegController::class,'register'])->name('register')->middleware('isLogin');
Route::get('/autor',[\App\Http\Controllers\FrontController::class,'autor'])->name("autor");
Route::post('/logovanje',[LogAndRegController::class,'logovanje'])->name('logovanje');
Route::post('/registracija',[LogAndRegController::class,'registracija'])->name('registracija');
Route::get('/logout',[LogAndRegController::class,'logout'])->name('logout')->middleware('notLogin');

Route::get('/contact',[\App\Http\Controllers\FrontController::class,'contact'])->name('contact');
Route::post('/submitContact',[\App\Http\Controllers\FrontController::class,'submitContact'])->name('submitContact');

Route::resource('/categories',\App\Http\Controllers\CategoryController::class)->middleware('isAdmin','isSuperAdmin');
Route::resource('/headings',\App\Http\Controllers\HeadingController::class)->middleware('isAdmin','isSuperAdmin');
Route::resource('/tags',\App\Http\Controllers\TagController::class)->middleware('isAdmin','isSuperAdmin');
Route::resource('/users',\App\Http\Controllers\UserController::class)->middleware('isSuperAdmin');
Route::resource('/posts',\App\Http\Controllers\PostController::class)->middleware('isAdmin','isSuperAdmin');

Route::get('/products',[\App\Http\Controllers\FrontController::class,'postovi']);
Route::get('/postovi/{post}',[\App\Http\Controllers\FrontController::class,'post'])->name('postovi.show');//

