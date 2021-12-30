<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('ime',50);
            $table->string('prezime',50);
            $table->string('email')->unique();
            $table->string('lozinka',50);
            $table->boolean('status')->default(1);
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
        Schema::dropIfExists('users');
    }
}
