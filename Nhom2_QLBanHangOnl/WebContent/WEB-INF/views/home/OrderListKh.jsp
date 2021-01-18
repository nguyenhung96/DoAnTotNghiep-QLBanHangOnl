<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<link
	href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script
	src="http://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<meta charset="utf-8">
<title>Insert title here</title>
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
				<span class="glyphicon glyphicon-star-empty "></span> Danh sách đơn
				hàng
			</h3>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group">
						<div class="col-md-4">
							<!-- <a style="float: right;"
								class="btn btn-mini btn-primary btncreate"
								href="CreateProduct.html"> <i
								class="glyphicon glyphicon-plus-sign"></i> Tạo đơn hàng
							</a> -->
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
								<th>Mã đơn hàng</th>
								<th>Khách hàng</th>
								<th>Nhân viên</th>
								<th>Ngày đặt</th>
								<th>Trạng thái</th>
								<th>Tổng tiền</th>
								<!-- <th></th> -->
							</tr>
						</thead>
						<tbody>
							<c:forEach var="donhang" items="${donhangkhList}">
								<tr>
									<td>${donhang.maDonHang}</td>
									<td>${donhang.maKH}</td>
									<td>${donhang.maNhanVien}</td>
									<td>${donhang.ngayDat}</td>
									<td>${donhang.trangThaiString}</td>
									<td>${donhang.tongTienString}</td>

									<%-- <td><a
										href="home/detailorder.do?MaDonHang=${donhang.maDonHang}">Chi
											tiết</a></td> --%>
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