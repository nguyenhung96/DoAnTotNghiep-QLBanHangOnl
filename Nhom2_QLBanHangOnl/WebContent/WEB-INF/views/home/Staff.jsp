<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
	href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script
	src="http://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>

<style>
h2 {
	text-align: center;
}
/* Định dạng cho bảng dữ liệu*/
table {
	margin: auto;
	border-collapse: collapse;
	border-spacing: 0;
	width: 90%;
	border: 1px solid #ddd;
}
/* Định dạng cho các cột*/
th, td {
	border: none;
	text-align: left;
	padding: 8px;
	vertical-align: middle !important;
}
/* Tạo thanh sroll ngang nếu chiều dài nội dung quá lớn*/
#table {
	overflow-x: auto;
}
/* Thiết lập màu nền cho các ô*/
tr:nth-child(even) {
	background-color: #f2f2f2;
}

@media screen and (max-width: 1100px) {
	.profile_details-left {
		display: none;
	}
}

@media screen and (min-width: 1100px) {
	input.col-md-5, select.col-md-5 {
		width: 30%;
	}
}

.modal {
	display: block; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: -1; /* Sit on top */
	left: 0;
	top: 0;
	overflow: auto; /* Enable scroll if needed */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto; /* 15% from the top and centered */
	border: 1px solid #888;
}

/* The Close Button */
.closeSetKey, .closeEdit {
	color: blue;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>

<body>
	<!-- main content start-->
	<div id="page-wrapper">
		<div class="tabable">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#staffList">Danh
						sách nhân viên</a></li>
				<li><a data-toggle="tab" href="#accountList">Danh sách tài
						khoản</a></li>
			</ul>
			<!--Tab danh sách nhân viên-->
			<div class="tab-content">
				<div id="staffList" class="tab-pane fade in active">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">

									<div class="col-md-6">
										<input style="margin-left: 10px; border-style: none; width: 800px; background-color: #f2f2f2;" value="${msg}" readonly/>
									</div>
									<div class="col-md-6">
										<a style="float: right;"
											class="btn btn-mini btn-primary btncreate"
											href="admin/createstaff.do"> <i
											class="glyphicon glyphicon-plus-sign"></i> Thêm nhân viên
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xm-12">
							<div id="table">
								<table class="table table-bordered" id="myTable">
									<thead>
										<tr>
											<th>Mã NV</th>
											<th>Tên NV</th>
											<!-- <th>Mật Khẩu</th> -->
											<th>Email</th>
											<th>SĐT</th>
											<th>Số CMND</th>
											<th>Giới Tính</th>
											<th>TrangThai</th>
											<th>Địa Chỉ</th>
											<th>Hoạt động</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${nhanvienList}" var="nhanvien">
											<tr>
												<td><c:out value="${nhanvien.maNhanVien}" /></td>
												<td><c:out value="${nhanvien.hoTenNV}" /></td>
												<td><c:out value="${nhanvien.email}" /></td>
												<td><c:out value="${nhanvien.SDT}" /></td>
												<td><c:out value="${nhanvien.CMND}" /></td>
												<td><c:out value="${nhanvien.gioiTinhString}" /></td>
												<td><c:out value="${nhanvien.enableString}" /></td>
												<td><c:out value="${nhanvien.diaChi}" /></td>

												<td>
													<div class="hidden-phone visible-desktop action-buttons">
														<a
															href="admin/editnhanvien.do?MaNhanVien=${nhanvien.maNhanVien}"
															class="btn btn-minier btn-success" id="btnEdit"
															title="Chỉnh sửa thông tin"> <i
															class="glyphicon glyphicon-edit"></i>
														</a> <a onclick="abc()"
															href="admin/deletenhanvien.do?MaNhanVien=${nhanvien.maNhanVien}"
															class="btn btn-minier btn-danger" title="Xóa nhân viên">
															<i class="glyphicon glyphicon-trash"></i>
														</a> <a
															href="admin/editquyennv.do?MaNhanVien=${nhanvien.maNhanVien}"
															class="btn btn-minier btn-success" id="btnEdit"
															title="Phân quyền"> <i
															class="glyphicon glyphicon-user"></i>
														</a>

													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!--Tab danh sách tài khoản-->
				<div id="accountList" class="tab-pane fade">

					<div id="staffList" class="tab-pane fade in active">
						<div class="container"></div>
						<div class="row">
							<div class="col-xm-12">
								<div id="table">

									<table class="table table-bordered" id="myTable">
										<thead>
											<tr>
												<th>Mã NV</th>
												<th>Tên NV</th>
												<th>Quyền</th>
												<th>Hoạt động</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${quyennvList}" var="quyennv">
												<tr>
													<td><c:out value="${quyennv.maNhanVien}" /></td>
													<td><c:out value="${quyennv.hoTenNV}" /></td>
													<td><c:out value="${quyennv.quyenNV}" /></td>
													<td>
														<div class="hidden-phone visible-desktop action-buttons">
															<a onclick="abc()"
															href="admin/deleterole.do?MaNhanVien=${quyennv.maNhanVien}"
															class="btn btn-minier btn-danger" title="Xóa quyền">
															<i class="glyphicon glyphicon-trash"></i>
														</a> <a class="btn btn-mini btn-primary" id="btnSetKey"
																href="admin/setpassword.do?MaNhanVien=${quyennv.maNhanVien}"
																title="Cấp lại mật khẩu"> <i
																class="ace-icon fa fa-key"></i>
															</a>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- main content end-->
		<!-- Edit model popup-->
		<div id="editModal" class="modal">
			<div id="page-wrapper">
				<div class="row col-md-12">
					<div class="panel panel-success">
						<div class="panel-title">
							<span class="closeEdit">&times;</span>
							<h4>
								<span class="glyphicon glyphicon-edit"></span> Chỉnh sửa thông
								tin nhân viên
							</h4>
						</div>
						<div class="panel-body"></div>

					</div>
				</div>
			</div>
		</div>
		<!-- Edit model popup-->
		<!-- Setkey model popup-->
		<div id="setkeyModal" class="modal">
			<div id="page-wrapper">
				<div class="row col-md-12">
					<div class="panel panel-success">
						<div class="panel-title">
							<span class="closeSetKey">&times;</span>
							<h4>
								<span class="glyphicon glyphicon-edit"></span> Cấp lại mật khẩu
							</h4>
						</div>
						<div class="panel-body">
							<form>
								<div class="form-group col-md-11">
									<label class="col-md-3" for="lbloaiSP">Mã nhân viên</label> <input
										type="text" class="form-control col-md-5" id="">
								</div>
								<div class="form-group col-md-11">
									<label class="col-md-3" for="lbloaiSP">Nhập mật khẩu
										mới</label> <input type="password" class="form-control col-md-5" id="">
								</div>
								<div class="form-group col-md-11">
									<label class="col-md-3" for="lbloaiSP">Xác nhận lại mật
										khẩu</label> <input type="password" class="form-control col-md-5"
										id="">
								</div>
							</form>
						</div>
						<div class="panel-footer">
							<a class="btn btn-mini btn-primary" title="Cấp lại mật khẩu">
								<span><i class="ace-icon fa fa-key"></i> Lưu mật khẩu</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Setkey model popup-->
	</div>
	<script>
	function abc(){
       confirm("Bấm vào nút OK để tiếp tục")
    }
	</script>
</body>
</html>