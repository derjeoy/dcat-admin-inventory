<?php

namespace App\Admin\Renderable;

use Illuminate\Contracts\Support\Renderable;

class KeywordPage implements Renderable
{
    public function render()
    {
        return admin_view('admin.keywordpage1');
    }
}