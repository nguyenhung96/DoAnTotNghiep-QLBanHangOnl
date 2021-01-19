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
					<span class="glyphicon glyphicon-star-empty "></span> Đổi mật khẩu
				</h3>
			</div>
			<div class="panel-body">
				<div class="row col-md-12 col-sm-12">
					<form:form action="/Nhom2_QLBanHangOnl/home/savepass.do">
						<table>
							<tr class="form-group">
								<td class="col-sm-4"><form:label path="maNhanVien"
										class="col-sm-6">Mã nhân viên: </form:label></td>
								<td><form:label path="maNhanVien" class="col-sm-6">${nhanvien.maNhanVien}</form:label></td>

							</tr>

							<tr class="form-group">
								<td class="col-sm-4"><form:label path="matKhau"
										class="col-sm-6">Mật khẩu hiện tại </form:label></td>
								<td><form:input path="matKhau" class="col-sm-6" type = "password"></form:input>
									<span style="color: red">${msg}</span></td>
							</tr>
							<tr class="form-group">
								<td class="col-sm-4"><form:label path="matKhauNhap"
										class="col-sm-6">Mật khẩu mới </form:label></td>
								<td><form:input path="matKhauNhap" class="col-sm-6" type = "password"></form:input><span
									style="color: red">${msg2}</span></td>

							</tr>
							<tr class="form-group">
								<td class="col-sm-4"><form:label path="matKhauNhap2"
										class="col-sm-6">Nhập lại mật khẩu </form:label></td>
								<td><form:input path="matKhauNhap2" class="col-sm-6" type = "password"></form:input><span
									style="color: red">${msg1}</span></td>
							</tr>
							<tr>

								<td class="col-sm-4"><label class="col-sm-6"></label></td>
								<td class="col-sm-4"><input id="btn" type="submit"
									class="btn btn-mini btn-primary glyphicon glyphicon-plus-sign btncreate"
									value="Lưu mật khẩu" /></td>
							</tr>
						</table>
					</form:form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>