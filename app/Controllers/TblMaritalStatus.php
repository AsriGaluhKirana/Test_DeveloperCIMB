<?php

namespace App\Controllers;

use App\Models\TblMaritalStatusModel;

class TblMaritalStatus extends BaseController
{
    public function index()
    {
        $model = new TblMaritalStatusModel();
        $data['marital_statuses'] = $model->findAll();
        return view('tbl_marital_status_view', $data);
    }
}
