<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->string('name',255);
            $table->string('slug',255);
            $table->boolean('status')->default(false);
            $table->unsignedInteger('column')->default(1);
            $table->unsignedInteger('position')->nullable();
            $table->unsignedBigInteger('id_parent')->nullable();
            $table->unsignedBigInteger('id_collection')->nullable();
            $table->foreign('id_collection')->references('id')->on('collections');
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('categories');
    }
};
