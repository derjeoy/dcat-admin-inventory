<?php
/*
 * @Descripttion: CMS-M-System
 * @version: 1.0.0
 * @Author: W394786996
 * @Date: 2021-09-04 09:46:12
 * @LastEditors: WangBaoYu
 * @LastEditTime: 2021-11-22 09:41:13
 * 使用：修改config/admin.php grid_action_class => App\Admin\Actions\TextActions::class
 */

namespace App\Admin\Actions;

use Dcat\Admin\Grid\Displayers\Actions;

class TextActions extends Actions
{

    /**
     * @return string
     */
    protected function getViewLabel()
    {
        $label = '<i class="feather icon-eye"></i> ' . trans('admin.show');
        return '<span class="text-success">' . $label . '</span> &nbsp;';
    }

    /**
     * @return string
     */
    protected function getEditLabel()
    {
        $label = '<i class="feather icon-edit-1"></i> ' . trans('admin.edit');

        return '<span class="text-primary">' . $label . '</span> &nbsp;';
    }

    /**
     * @return string
     */
    protected function getQuickEditLabel()
    {
        $label = '<i class="feather icon-edit-2"></i> ' . trans('admin.edit');
        $label2 = trans('admin.quick_edit');

        return '<span class="text-blue-darker" title="' . $label2 . '">' . $label . '</span> &nbsp;';
    }

    /**
     * @return string
     */
    protected function getDeleteLabel()
    {
        $label = '<i class="feather icon-trash-2"></i> ' . trans('admin.delete');

        return '<span class="text-danger">' . $label . '</span> &nbsp;';
    }
}