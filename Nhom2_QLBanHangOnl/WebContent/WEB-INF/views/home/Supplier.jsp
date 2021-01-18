<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
<title>Nhà Cung Cấp</title>
<!--datatable-->
<link
	href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script
	src="http://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<!--datatable-->
<script>
	new WOW().init();
</script>
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
		<div class="panel panel-title">
			<h3>
				<span class="glyphicon glyphicon-star-empty "></span> Danh sách nhà
				cung cấp
			</h3>
			<input style="margin-left: 10px; border-style: none; width: 900px; background-color: #f2f2f2;" value="${messenge}" readonly/>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group">
						
						<div class="col-md-4">
							<a style="float: right;"
								class="btn btn-mini btn-primary btncreate"
								href="home/createsupplier.do"> <i
								class="glyphicon glyphicon-plus-sign"></i> Thêm nhà cung cấp
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
								<th>Mã NCC</th>
								<th>Tên NCC</th>
								<th>Email</th>
								<th>SDT</th>
								<th>Địa chỉ</th>
								<th>Hoạt động</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${nhacungcapList}" var="nhacungcap">

								<tr>
									<td><c:out value="${nhacungcap.maNhaCungCap}" /></td>
									<td><c:out value="${nhacungcap.tenNhaCungCap}" /></td>
									<td><c:out value="${nhacungcap.email}" /></td>
									<td><c:out value="${nhacungcap.SDT}" /></td>
									<td><c:out value="${nhacungcap.diaChi}" /></td>
	
									<td>
										<div class="hidden-phone visible-desktop action-buttons">
											<a
												href="home/editsupplier.do?MaNhaCungCap=${nhacungcap.maNhaCungCap}"
												class="btn btn-minier btn-success" id="btnEdit"
												title="Chỉnh sửa thông tin"> <i
												class="glyphicon glyphicon-edit"></i>
											</a> <a
												href="home/deletesupplier.do?MaNhaCungCap=${nhacungcap.maNhaCungCap}"
												class="btn btn-minier btn-danger" title="Xóa nhà cung cấp">
												<i class="glyphicon glyphicon-trash"></i>
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
</body>
</html>