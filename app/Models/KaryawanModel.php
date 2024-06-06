<?php

namespace App\Models;

use CodeIgniter\Model;

class KaryawanModel extends Model
{
    protected $table = 'KaryawanDetails';
    protected $primaryKey = 'KaryawanID';
    protected $returnType = 'array';
    protected $useSoftDeletes = false;
    protected $allowedFields = [
        'KaryawanID', 'Branch', 'Department', 'Office', 'Nama', 'Email', 'Gender', 'IsActive'
    ];

    public function getKaryawanDetails()
    {
        return $this->db->table($this->table)->get()->getResultArray(); // Use consistent method name
    }

    public function addKaryawan($data)
    {
        $db = \Config\Database::connect();

        try {
            // Execute the stored procedure:
            $query = $db->query("EXEC [dbo].[sp_AddKaryawan] ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?", [
                $data['BranchID'],
                $data['KaryawanID'],
                $data['Isactive'],
                $data['Dept_ID'],
                $data['OfficeID'],
                $data['PositionID'],
                $data['FirstName'],
                $data['MiddleName'],
                $data['LastName'],
                $data['EmailAddress'],
                $data['Phone'],
                $data['BirthDate'],
                $data['BirthPlace'],
                $data['MaritalStatus'],
                $data['Gender'],
                $data['Other'],
                $data['HP']
            ]);

            // Check for successful execution (may vary based on your stored procedure):
            if ($query->resultID) {
                return true; // Indicate success
            } else {
                // Optionally, log errors or throw exceptions
                throw new \Exception("Failed to execute stored procedure.");
            }

        } catch (\Exception $e) {
            log_message('error', 'Error in addKaryawan: ' . $e->getMessage());
            return false; // Indicate failure
        }
    }
}
