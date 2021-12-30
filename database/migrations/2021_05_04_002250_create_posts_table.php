<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->string('naziv_posta',100);
            $table->text('opis_posta');
            $table->boolean('status')->default(1);
            $table->foreignId('category_id')->constrained();
            $table->foreignId('heading_id')->constrained();
            $table->foreignId('image_id')->constrained();
            $table->foreignId('user_id')->constrained();
            $table->timestamp('datum_kreiranja')->useCurrent();
            $table->timestamp('datum_azuriranja')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('posts');
    }
}
