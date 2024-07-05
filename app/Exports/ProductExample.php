<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use Illuminate\Contracts\View\View;
use App\Models\Collections\ProductCollection;
use App\Models\Brands\Brands;

class ProductExample implements FromView, WithEvents
{
    public function view(): View
    {
        $brands = Brands::all(['id', 'name'])->toArray();
        $collections = ProductCollection::all();

        return view('exports.productExample', compact('brands', 'collections'));
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $brands = Brands::pluck('name')->toArray();
                $brandsList = '"' . implode(',', $brands) . '"';

                $cellRange = 'I2:I1';

                foreach (range(2, 100) as $row) {
                    $event->sheet->getDelegate()->getCell('I' . $row)->setDataValidation(
                        (new \PhpOffice\PhpSpreadsheet\Cell\DataValidation())
                            ->setType(\PhpOffice\PhpSpreadsheet\Cell\DataValidation::TYPE_LIST)
                            ->setErrorStyle(\PhpOffice\PhpSpreadsheet\Cell\DataValidation::STYLE_INFORMATION)
                            ->setAllowBlank(false)
                            ->setShowInputMessage(true)
                            ->setShowErrorMessage(true)
                            ->setShowDropDown(true)
                            ->setFormula1($brandsList)
                    );
                }

                // Apply styling to header
                $event->sheet->getStyle('A1:I1')->applyFromArray([
                    'font' => [
                        'bold' => true,
                        'color' => ['argb' => 'FFFFFFFF'],
                    ],
                    'fill' => [
                        'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                        'startColor' => ['argb' => 'FF0000FF'],
                    ],
                    'alignment' => [
                        'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                        'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                    ],
                ]);

                // Set columns width
                foreach (range('A', 'I') as $columnID) {
                    $event->sheet->getColumnDimension($columnID)->setWidth(30);
                }

                $event->sheet->getStyle('A1:I1')->applyFromArray([
                    'alignment' => [
                        'wrapText' => true,
                    ],
                    'borders' => [
                        'allBorders' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                            'color' => ['argb' => '000000'],
                        ],
                    ],
                ]);
            },
        ];
    }
}
