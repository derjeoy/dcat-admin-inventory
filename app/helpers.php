<?php

use Illuminate\Support\Arr;

if (! function_exists('user_admin_config')) {
    function user_admin_config($key = null, $value = null)
    {
        $session = session();

        if (! $config = $session->get('admin.config')) {
            $config = config('admin');

            $config['lang'] = config('app.locale');
        }

        if (is_array($key)) {
            // 保存
            foreach ($key as $k => $v) {
                Arr::set($config, $k, $v);
            }

            $session->put('admin.config', $config);

            return;
        }

        if ($key === null) {
            return $config;
        }

        return Arr::get($config, $key, $value);
    }
}


if (! function_exists('build_order_no')) {
    /**
     * @param string $prefix
     * @return string
     */
    function build_order_no(string $prefix = ''): string
    {
        $date = date("Ymd");
        $number = 1234;

        return $prefix . $date . str_pad($number + 1, "4", "0", STR_PAD_LEFT);
    }
}
