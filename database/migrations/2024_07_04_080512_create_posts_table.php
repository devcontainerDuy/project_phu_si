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
        Schema::create('posts', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug');
            $table->string('summary');
            $table->longText('content');
            $table->boolean('status')->default(0);
            $table->boolean('highlighted')->default(0);
            $table->unsignedBigInteger('id_collection')->nullable();
            $table->unsignedBigInteger('view')->default(0);
            $table->unsignedBigInteger('id_category')->nullable();
            $table->unsignedInteger('position')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('posts');
    }
};
