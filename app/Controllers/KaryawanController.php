<?php

namespace App\Controllers;

use App\Models\KaryawanModel;

class KaryawanController extends BaseController
{
    public function index()
    {
        $karyawanModel = new KaryawanModel();
        $data['karyawan_details'] = $karyawanModel->getKaryawanDetails();
        return view('karyawan_view', $data);
    }

    public function add()
    {
        $db = db_connect(); // Connect to database

        // Get form data (replace with your form handling logic)
        $branchID = $this->request->getVar('BranchID');
        $karyawanID = $this->request->getVar('KaryawanID');
        $isActive = $this->request->getVar('Isactive');
        $deptID = $this->request->getVar('Dept_ID');
        $officeID = $this->request->getVar('OfficeID');
        $positionID = $this->request->getVar('PositionID');

        // Additional employee details
        $firstName = $this->request->getVar('FirstName');
        $middleName = $this->request->getVar('MiddleName');
        $lastName = $this->request->getVar('LastName');
        $emailAddress = $this->request->getVar('EmailAddress');
        $phone = $this->request->getVar('Phone');
        $birthDate = $this->request->getVar('BirthDate'); // Adjust format if necessary
        $birthPlace = $this->request->getVar('BirthPlace');
        $maritalStatus = $this->request->getVar('MaritalStatus');
        $gender = $this->request->getVar('Gender');
        $other = $this->request->getVar('Other');
        $hp = $this->request->getVar('HP');

        // Prepare parameters for the stored procedure
        $params = [
            'BranchID' => $branchID,
            'KaryawanID' => $karyawanID,
            'Isactive' => $isActive,
            'Dept_ID' => $deptID,
            'OfficeID' => $officeID,
            'PositionID' => $positionID,
            'FirstName' => $firstName,
            'MiddleName' => $middleName,
            'LastName' => $lastName,
            'EmailAddress' => $emailAddress,
            'Phone' => $phone,
            'BirthDate' => $birthDate,
            'BirthPlace' => $birthPlace,
            'MaritalStatus' => $maritalStatus,
            'Gender' => $gender,
            'Other' => $other,
            'HP' => $hp,
        ];

        // Execute the stored procedure
        $result = $db->query("EXEC dbo.sp_AddKaryawan @BranchID = :BranchID, @KaryawanID = :KaryawanID, @Isactive = :Isactive, @Dept_ID = :Dept_ID, @OfficeID = :OfficeID, @PositionID = :PositionID, @FirstName = :FirstName, @MiddleName = :MiddleName, @LastName = :LastName, @EmailAddress = :EmailAddress, @Phone = :Phone, @BirthDate = :BirthDate, @BirthPlace = :BirthPlace, @MaritalStatus = :MaritalStatus, @Gender = :Gender, @Other = :Other, @HP = :HP", $params);

        // Check for successful execution
        if (!$db->error()) { // Use db->error() for checking errors
            // Success message
            session()->setFlashdata('success', 'Karyawan berhasil ditambahkan!');
            return redirect()->to(base_url()); // Replace with your redirect URL
        } else {
            // Error message (You might want to log the error for debugging)
            session()->setFlashdata('error', 'Gagal menambahkan karyawan! Error: ');
            return redirect()->to(base_url()); // Replace with your redirect URL
        }
    }
}
