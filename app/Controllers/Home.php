<?php

namespace App\Controllers;

use App\Models\KaryawanModel;

class Home extends BaseController
{
    public function index()
    {
        $karyawanModel = new KaryawanModel();
        $data['karyawan_details'] = $karyawanModel->getKaryawanDetails();
        echo view('/inc/header.php');
        echo view('home.php', $data);
        echo view('/inc/footer.php');
    }

    public function addKaryawan()
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
            $error_message = "Gagal menambahkan karyawan!";
            if ($db->error()) {
                $error_message .= " Database Error: " . $db->error()['message'];
            }
            session()->setFlashdata('error', $error_message);
        }

        return redirect()->to(base_url()); 
    }

    // public function add()
    // {
    //     $db = \Config\Database::connect();

    //     if ($this->request->getMethod() === 'post') {
    //         $params = [
    //             'BranchID' => $this->request->getPost('BranchID'),
    //             'KaryawanID' => $this->request->getPost('KaryawanID'),
    //             'Isactive' => $this->request->getPost('Isactive'),
    //             'Dept_ID' => $this->request->getVar('Dept_ID'),
    //             'OfficeID' => $this->request->getVar('OfficeID'),
    //             'PositionID' => $this->request->getVar('PositionID'),
    //             'FirstName' => $this->request->getVar('FirstName'),
    //             'MiddleName' => $this->request->getVar('MiddleName'),
    //             'LastName' => $this->request->getVar('LastName'),
    //             'EmailAddress' => $this->request->getVar('EmailAddress'),
    //             'Phone' => $this->request->getVar('Phone'),
    //             'BirthDate' => $this->request->getVar('BirthDate'),
    //             'BirthPlace' => $this->request->getVar('BirthPlace'),
    //             'MaritalStatus' => $this->request->getVar('MaritalStatus'),
    //             'Gender' => $this->request->getVar('Gender'),
    //             'Other' => $this->request->getVar('Other'),
    //             'HP' => $this->request->getVar('HP'),
    //         ];


    //         $builder = $db->table('DetailKaryawan');
    //         $builder->set($params)->insert();

    //         if ($db->affectedRows() > 0) {
    //             // Success message
    //             session()->setFlashdata('success', 'Karyawan berhasil ditambahkan!');
    //             return redirect()->to(base_url());
    //         } else {
    //             // Error message 
    //             session()->setFlashdata('error', 'Gagal menambahkan karyawan!');
    //             return redirect()->to(base_url());
    //         }

    //     }

    //     // If not a POST request, show the add form
    //     echo view('/inc/header.php');
    //     echo view('home.php'); // Replace with your add form view
    //     echo view('/inc/footer.php');
    // }
}
