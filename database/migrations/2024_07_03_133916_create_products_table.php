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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('slug');
            $table->string('sku');
            $table->unsignedBigInteger('price');
            $table->unsignedBigInteger('compare_price');
            $table->unsignedInteger('discount')->default(0);
            $table->longText('description');
            $table->longText('content');
            $table->unsignedBigInteger('id_brand');
            $table->unsignedBigInteger('in_stock')->default(0);
            $table->timestamps();
            $table->foreign('id_brand')->references('id')->on('brands');
        });
        Schema::create('gallery', function (Blueprint $table) {
            $table->id();
            $table->string('model');
            $table->string('image');
            $table->unsignedBigInteger('id_parent');
            $table->boolean('status')->default(0);
            $table->timestamps();
        });

        // Schema::create('links', function (Blueprint $table) {
        //     $table->bigIncrements('id');
        //     $table->unsignedBigInteger('id_links');
        //     $table->string('model');
        //     $table->unsignedBigInteger('id_parent');
        //     $table->timestamps();
        // });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
