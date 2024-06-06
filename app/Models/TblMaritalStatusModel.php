<?php

namespace App\Models;

use CodeIgniter\Model;

class TblMaritalStatusModel extends Model
{
    protected $table = 'TblMaritalStatus';
    protected $primaryKey = 'MaritalStatusID';
    protected $returnType = 'array';
    protected $useSoftDeletes = false;
    protected $allowedFields = ['MaritalStatusID', 'MaritalStatusDescription', 'ModifiedDate'];
}
