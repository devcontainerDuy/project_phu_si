<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Permissions;
class PermissionTable extends Seeder
{
    public function run(): void
    {
        $permissions = [
           'role-list',
           'role-create',
           'role-edit',
           'role-delete',
           'permission-list',
           'permission-create',
           'permission-edit',
           'permission-delete',
           'user-list',
           'user-create',
           'user-edit',
           'user-delete'
        ];

        foreach ($permissions as $permission) {
            Permissions::create(['name' => $permission]);
        }
    }
}
