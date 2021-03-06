<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<title>Insert title here</title> <
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!-- js-->
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>
<!--datatable-->
<link
	href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script
	src="http://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<!--datatable-->
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css"
	media="all">
<script src="js/wow.min.js"></script>
<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
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
</style>
</head>
<body>
	<!-- main content start-->
	<div id="page-wrapper">
		<div class="panel panel-default">
			<div class="panel-title">
				<h3>
					<span class="glyphicon glyphicon-star-empty "></span> Tài khoản
				</h3>
			</div>
			<div class="panel-body">
				<div class="row col-md-6 col-sm-12">
					<form:form>
						<table>
							<tr class="form-group">
								<td class="col-sm-6"><form:label path="maNhanVien"
										class="col-sm-6 form-control">Mã nhân viên: </form:label></td>
								<td class="col-sm-6"><form:label path="maNhanVien"
										class=" form-control col-sm-6">${nhanvien.maNhanVien}</form:label></td>
							</tr>
							<tr class="form-group">
								<td class="col-sm-6"><form:label for="lblmaSP" path="hoTenNV"
										class="  form-control col-sm-6">Tên nhân
										viên: </form:label></td>
								<td class="col-sm-6"><form:label for="lblmaSP" path="hoTenNV"
										class=" form-control col-sm-6">${nhanvien.hoTenNV}</form:label></td>
							</tr>
							<tr class="form-group">
								<td class="col-sm-6"><form:label for="lbltenSP" path="gioiTinhString"
										class="col-sm-6">Giới
										tính: </form:label></td>
								<td class="col-sm-6"><form:label for="lbltenSP" path="gioiTinhString"
										class="col-sm-6 text">${nhanvien.gioiTinhString}</form:label></td>
							</tr>
							<tr class="form-group">
								<td class="col-sm-6"><form:label for="lbltenSP" path="SDT" class="col-sm-6">Số điện thoại</form:label></td>
								<td class="col-sm-6"><form:label for="lbltenSP" path="SDT"
										class="col-sm-6">${nhanvien.SDT}</form:label></td>
							</tr>
							<tr class="form-group">
								<td class="col-sm-6"><form:label for="lbltenSP" path="diaChi"
										class="col-sm-6">Địa chỉ</form:label></td>
								<td class="col-sm-6"><form:label for="lbltenSP" path="diaChi"
										class="col-sm-6 text">${nhanvien.diaChi}</form:label></td>
							</tr>
							<tr class="form-group">
								<td class="col-sm-6"><form:label for="lblthongTinSP" path="matKhau"
										class="col-sm-6">Mật
										khẩu:</form:label></td>
								<td class="col-sm-6">
									<button class="btn btn-mini btn-primary col-sm-6">Đổi
										mật khẩu</button>
								</td>
							</tr>
							<tr class="form-group">
								<td class="col-sm-6"><form:label for="lblgia" path="quyenNV"
										class="col-sm-6">Nhóm người
										dùng:</form:label></td>
								<td class="col-sm-6"><form:label for="lblgia" path="quyenNV"
										class="col-sm-6">Admin</form:label></td>
							</tr>
							<tr class="form-group">
								<td class="col-sm-6"><a style="float: right; margin-right: 35px;"
									class="btn btn-mini btn-primary btncreate" href="#"> <i
										class="glyphicon glyphicon-plus-sign"></i> Lưu sản phẩm
								</a></td>
							</tr>
						</table>
					</form:form>
				</div>
				<div class="row col-md-6 col-sm-12">
					<form>
						<div class="form-group">
							<lable for="lblnhaCungCap" style="text-align: center;"
								class="col-sm-12"> </lable>
							<p id="status"></p>
							<div style="text-align: center;">
								<img id="output" width="200px" height="200px">
							</div>
							<input type="file" id="file-selector" style="float: right;">
							<script>
								const status = document.getElementById('status');
								const output = document.getElementById('output');
								if (window.FileList && window.File && window.FileReader) {
								  document.getElementById('file-selector').addEventListener('change', event => {
									output.src = '';
									status.textContent = '';
									const file = event.target.files[0];
									if (!file.type) {
									  status.textContent = 'Error: The File.type property does not appear to be supported on this browser.';
									  return;
									}
									if (!file.type.match('image.*')) {
									  status.textContent = 'Error: The selected file does not appear to be an image.'
									  return;
									}
									const reader = new FileReader();
									reader.addEventListener('load', event => {
									  output.src = event.target.result;
									});
									reader.readAsDataURL(file);
								  }); 
								}
							  </script>
						</div>
					</form>
				</div>
			</div>
			<div style="height: 50px;">
				<a style="float: right; margin-right: 35px;"
					class="btn btn-mini btn-primary btncreate" href="#"> <i
					class="glyphicon glyphicon-plus-sign"></i> Lưu sản phẩm
				</a>
			</div>
		</div>
	</div>
</body>
</html>