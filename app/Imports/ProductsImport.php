<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithCalculatedFormulas;
use Illuminate\Support\Str;
use App\Models\Brands\Brands;
use App\Models\Products\Products;
use DB;
class ProductsImport implements ToCollection,WithCalculatedFormulas
{
    /**
    * @param Collection $collection
    */
    public function collection(Collection $rows)
    {
        foreach ($rows as $key => $row) {
            if ($key==0  || $row->isEmpty()) {
                continue;
            }
            $brand = $row[8];
            $idBrand=Brands::where('name',$brand)->value('id');
            $data =[
                'sku'=>$row[0],
                'name'=>$row[1],
                'slug'=>Str::slug($row[1]),
                'price'=>$row[2],
                'compare_price'=>$row[3],
                'discount'=>$row[4],
                'description'=>$row[5],
                'content'=>$row[6],
                'in_stock'=>$row[7],
                'id_brand'=>$idBrand,
                'status'=>0,
            ];
            Products::create($data);
        }
    }
}
