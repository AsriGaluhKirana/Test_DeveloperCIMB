$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
});

function createEmployeeData() {
	return {
	  BranchID: document.getElementById("branchid").value,
	  Dept_ID: document.getElementById("deptid").value,
	  OfficeID: document.getElementById("officeid").value,
	  KaryawanID: document.getElementById("employeeid").value,
	  Isactive: document.getElementById("isactive").checked ? 1 : 0,
	  PositionID: document.getElementById("positionid").value,
	  FirstName: document.getElementById("firstname").value,
	  MiddleName: document.getElementById("middlename").value,
	  LastName: document.getElementById("lastname").value,
	  EmailAddress: document.getElementById("emailaddress").value,
	  Phone: document.getElementById("phone").value,
	  BirthDate: document.getElementById("birthdate").value,
	  BirthPlace: document.getElementById("birthplace").value,
	  MaritalStatus: document.getElementById("maritalstatus").value,
	  Gender: document.getElementById("gender").value,
	  Other: document.getElementById("other").value,
	  HP: document.getElementById("hp").value,
	};
  }
  
  function addKaryawan() {
	const data = createEmployeeData();
  
	$.ajax({
	  type: "POST",
	  url: "controller/addKaryawan",
	  data: data, // Send individual form field values instead of the entire object
	  contentType: "application/json; charset=utf-8",
	  dataType: "json",
	  success: function (response) {
		if (response.success) {
		  alert("Employee added successfully!");
		} else {
		  alert("Error adding employee: " + response.message);
		}
	  },
	  error: function (xhr, status, error) {
		let errorMsg = "An error occurred: " + error;
		if (xhr.status) {
		  errorMsg += " (" + xhr.status + ")";
		}
		alert(errorMsg);
	  }
	});
  }
  