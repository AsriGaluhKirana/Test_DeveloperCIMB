<div class="container-xl">
	<div class="table-responsive d-flex flex-column">
		<?php if (session()->setFlashdata("success")) {
			?>
			<div class="alert w-50 align-self-center alert-success alert-dismissible fade show" role="alert">
				<?php echo session()->setFlashdata("success"); ?>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		<?php } ?>
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2><b>Employee Form Order</b></h2>
					</div>
				</div>
			</div>
			<form action="<?php echo base_url('karyawan/add'); ?>" id="karyawanForm" method="POST">
				<div class="modal-header">
					<h4 class="modal-title">Employee Information</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="form-group col-md-6">
							<label>BranchID</label>
							<input id="branchid" type="text" class="form-control" name="branchid" required>
						</div>
						<div class="form-group col-md-6">
							<label>Dept_ID</label>
							<input id="deptid" type="text" class="form-control" name="deptid" required>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label>Employee_ID</label>
							<input id="branchid" type="text" class="form-control" name="employeeid" required>
						</div>
						<div class="form-group col-md-6">
							<label>Office_ID</label>
							<input id="officeid" type="text" class="form-control" name="officeid" required>
						</div>
					</div>
				</div>
				<div class="modal-header">
					<h4 class="modal-title">Personal Information</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="form-group col-md-4">
							<label>First Name</label>
							<input type="text" class="form-control" id="firstname" required>
						</div>
						<div class="form-group col-md-4">
							<label>Middle Name</label>
							<input type="text" class="form-control" id="middlename">
						</div>
						<div class="form-group col-md-4">
							<label>Last Name</label>
							<input type="text" class="form-control" id="lastname" required>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-4">
							<label for="gender">Gender : </label>
							<select name="gender" id="gender" class="form-control">
								<option value="">Choose Gender</option>
								<option value="perempuan">Perempuan</option>
								<option value="laki">Laki-laki</option>
							</select>
						</div>
						<div class="form-group col-md-4">
							<label>Email Address</label>
							<input type="email" class="form-control" id="email" required>
						</div>
						<div class="form-group col-md-4">
							<label>Phone</label>
							<input type="text" class="form-control" id="phone" required>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label>Birth of Date</label>
							<input type="date" class="form-control" id="birthdate" required>
						</div>
						<div class="form-group col-md-6">
							<label>Birth Place</label>
							<input type="text" class="form-control" id="birthplace" required>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label for="maritalstatus">Marital Status : </label>
							<select name="maritalstatus" id="maritalstatus" class="form-control">
								<option value="single">Lajang</option>
								<option value="married">Menikah</option>
							</select>
						</div>
						<div class="form-group col-md-6">
							<label>Contact (HP)</label>
							<input type="text" class="form-control" id="hp" required>
						</div>
					</div>
					<div class="form-group">
						<label>Other (other information)</label>
						<textarea type="textbox" class="form-control" id="other" required></textarea>
					</div>
				</div>
				<div class="text-center">
					<form id="karyawanForm" method="POST">
						<div class="text-center">
							<button type="submit" class="btn btn-success">
								<i class="material-icons">&#xE147;</i> <span>Submit</span>
							</button>
							<button type="reset" class="btn btn-danger">
								<i class="material-icons">&#xE15C;</i> <span>Reset</span>
							</button>
						</div>
					</form>

				</div>
			</form>
			</br>
			<!-- Detail HTML -->
			<div class="modal-header">
				<h4 class="modal-title">Employee Detail</h4>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>

						<th>Employee ID</th>
						<th>Name</th>
						<th>Branch</th>
						<th>Department</th>
						<th>Office</th>
						<th>Email</th>
						<th>Gender</th>
						<th>IsActive</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php if (count($karyawan_details) > 0): ?>
						<?php foreach ($karyawan_details as $karyawan): ?>
							<tr>
								<td><?php echo $karyawan['KaryawanID']; ?></td>
								<td><?php echo $karyawan['Nama']; ?></td>
								<td><?php echo $karyawan['Branch']; ?></td>
								<td><?php echo $karyawan['Department']; ?></td>
								<td><?php echo $karyawan['Office']; ?></td>
								<td><?php echo $karyawan['Email']; ?></td>
								<td><?php echo $karyawan['Gender']; ?></td>
								<td><?php echo $karyawan['IsActive'] ? 'Yes' : 'No'; ?></td>
								<td>
									<a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons"
											data-toggle="tooltip" title="Edit">&#xE254;</i></a>
									<a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons"
											data-toggle="tooltip" title="Delete">&#xE872;</i></a>
								</td>
							</tr>
						<?php endforeach; ?>
					<?php else: ?>
						<tr>
							<td colspan="8">Tidak ada data karyawan.</td>
						</tr>
					<?php endif; ?>


				</tbody>
			</table>
		</div>
	</div>
</div>
<!-- Edit HTML -->
<div id="editEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="#" method="POST">
				<div class="modal-header">
					<h4 class="modal-title">Edit Employee</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<input type="hidden" name="updateId" class="updateId">
					<div class="form-group">
						<label>Name</label>
						<input type="text" class="form-control updateUsername" name="username" required>
					</div>
					<div class="form-group">
						<label>password</label>
						<input type="text" class="form-control updatePassword" name="password" required>
					</div>
				</div>
				<div class="modal-footer">
					<input type="button" name="submit" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-info" value="Save">
				</div>
			</form>
		</div>
	</div>
</div>