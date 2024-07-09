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
        Schema::create('reviews', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_customer');
            $table->unsignedBigInteger('id_product');
            $table->integer('start');
            $table->longText('review');
            $table->boolean('status')->default(0);
            $table->timestamps();
            $table->foreign('id_customer')->references('id')->on('customers');
            $table->foreign('id_product')->references('id')->on('products');
        });
        Schema::create('can_review', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_customer');
            $table->unsignedBigInteger('id_product');
            $table->timestamps();
            $table->foreign('id_customer')->references('id')->on('customers');
            $table->foreign('id_product')->references('id')->on('products');
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reviews');
    }
};
