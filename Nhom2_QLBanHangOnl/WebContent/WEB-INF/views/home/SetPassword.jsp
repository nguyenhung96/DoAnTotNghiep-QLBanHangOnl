
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
		<div class="panel">
			<div class="panel-title">
				<h3>
					<span class="glyphicon glyphicon-star-empty "></span> Thêm nhân
					viên mới
				</h3>
			</div>
			<div class="panel-body">
				<div class="row col-md-12">
					cos
					<div class="panel panel-default">
						<div class="panel-title">
							<h4>
								<span class="glyphicon glyphicon-info-sign"></span> Thông tin
								nhân viên
							</h4>
						</div>
						<div class="panel-body">
							<form:form method="POST" onsubmit="return CreateStaff()"
								action="/Nhom2_QLBanHangOnl/admin/savepassword.do">
								<table>

									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="maNhanVien">Mã nhân viên</form:label></td>
										<td class="col-md-5"><form:input id="MaNhanVien"
												readonly="true" path="maNhanVien" class="form-control "
												value="${quyennv.maNhanVien}" /></td>
									</tr>

									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="matKhau">Mật khẩu   </form:label></td>
										<td class="col-md-5"><form:input id="pass"
												path="matKhau" type="password" class="form-control "
												value="${nhanvien.matKhau}" /> <span id="checkpass1"></span></td>

									</tr>
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="matKhauNhap">Nhập lại MK:</form:label></td>
										<td class="col-md-5"><form:input id="pass2"
												path="matKhauNhap" type="password" class="form-control "
												value="${nhanvien.matKhau}" /> <span id="checkpass2"></span></td>

									</tr>
									<tr><td><span style= "color: red">${msg}</span></td></tr>
									<tr>

										<td colspan="2"><input type="submit"
											class="btn btn-mini btn-primary glyphicon glyphicon-plus-sign btncreate"
											value="Lưu" /></td>
									</tr>

									<script>
							
											function CreateStaff(){

								var pass= document.getElementById('pass').value;
								var pass2= document.getElementById('pass2').value;
								var status = false;
								 if (pass=='') {
										document.getElementById("checkpass1").innerHTML = 
								            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập mật khẩu!</span> ";
								         status= false;
									}
									else{
										document.getElementById("checkpass1").innerHTML = 
								            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
										status= true;
									}
								 
							    if (pass2 != pass) {
									document.getElementById("checkpass2").innerHTML = 
							            " <span class='fas fa-window-close' style='color:red;'>Mật khẩu không giống!</span> ";
							         status= false;
								}
								else{
									document.getElementById("checkpass2").innerHTML = 
							            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
									status= true;
								}
				
				
			
					
							
							</script>
								</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
