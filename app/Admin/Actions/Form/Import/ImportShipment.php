<?php
namespace App\Admin\Actions\Form\Import;

use Dcat\Admin\Models\Administrator;
use Dcat\Admin\Widgets\Form;
use Symfony\Component\HttpFoundation\Response;
use App\Admin\Actions\Form\Import\DataExcelShipment;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Validators\ValidationException;

class ImportShipment extends Form
{
    public function handle(array $input)
    {
        $file = env('APP_URL').'uploads/files'.$input['file'];

        try {
            Excel::import(new DataExcelShipment(time()), $input['file'],'admin');
				//dcat-2.0版本写法
            return $this->response()
                ->success('导入成功')
                ->redirect('/');
                //dcat-1.7
                //return $this->success('导入成功');
        } catch (ValidationException $validationException) {
            return Response::withException($validationException);
        } catch (Throwable $throwable) {
        	//dcat 2.0写法
            $this->response()->status = false;
            return $this->response()->error('上传失败')->refresh();
            //dcat 1.7
            //return $this->error('上传失败')->refresh();
        }
    }

    public function form()
    {
        $this->file('file', '上传数据（Excel）')->rules('required', ['required' => '文件不能为空']);
    }



}

