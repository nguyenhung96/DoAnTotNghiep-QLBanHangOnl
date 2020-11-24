<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.widget-title {
	color: #0b87c9;
}

.form-group, .widget-header {
	height: 30px;
}

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
					<span class="glyphicon glyphicon-star-empty "></span> Chi Tiết Đơn
					Hàng
				</h3>
			</div>
			<div class="panel-body">
				<div class="row col-md-8">
					<div class="form-group"></div>
					<div class="table">
						<table class="table table-bordered" id="myTable">
							<thead>
								<tr>
									<th>STT</th>
									<th>Tên sản phẩm</th>
									<th>Số lượng</th>
									<th>Đơn giá</th>
									<th>Thành tiền</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="donhang" items="${donhangList}">
									<tr>
										<td>${donhang.id}</td>
										<td>${donhang.tenSanPham}</td>
										<td>${donhang.soLuong}</td>
										<td>${donhang.donGia}</td>
										<td>${donhang.tongTien}</td>
										<td><a class="red" data-ng-click=""> <i
												class="glyphicon glyphicon-trash"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row col-md-4 col-xs-12">
					<div class="widget-box">
						<div class="widget-header width-border">
							<h4 class="widget-title">
								<span class="glyphicon glyphicon-info-sign"></span> Thông Tin
								Đơn Hàng
							</h4>
						</div>
						<div class="widget-body">
							<form:form method="POST"
								action="/Nhom2_QLBanHangOnl/home/savenhanvien.do">

								<div class="form-group">
									<form:label class="col-sm-5" for="lbloaiSP" path="maDonHang">Mã đơn hàng</form:label>
									<form:input path="maDonHang" class="form-control col-sm-7 "
										value="${donhang.maDonHang}" />

								</div>
								<div class="form-group">
									<form:label class="col-sm-5" for="lbloaiSP" path="maKH">Khách Hàng</form:label>
									<form:input path="maKH" class="form-control col-sm-7 "
										value="${donhang.maKH}" />

								</div>
								<div class="form-group">
									<form:label class="col-sm-5" for="lbloaiSP" path="ngayDat">Ngày đặt</form:label>
									<form:input path="ngayDat" class="form-control col-sm-7 "
										value="${donhang.ngayDat}" />

								</div>
								<div class="form-group">
									<form:label class="col-sm-5" for="lbloaiSP" path="maNhanVien">Nhân Viên</form:label>
									<form:input path="maNhanVien" class="form-control col-sm-7 "
										value="${donhang.maNhanVien}" />

								</div>
								<div class="form-group">
									<form:label class="col-sm-5" for="lbloaiSP" path="diaChi">Địa chỉ giao</form:label>
									<form:input path="diaChi" class="form-control col-sm-7 "
										value="${donhang.diaChi}" />

								</div>

								<div class=" width-border col-sm-12">
									<h4 class="widget-title">
										<span class="glyphicon glyphicon-info-sign"></span> Thông Tin
										Thanh Toán
									</h4>
								</div>
								<div class="form-group">
									<form:label class="col-sm-5" for="lbloaiSP" path="tongTien">Tổng tiền hàng</form:label>
									<form:label class="col-sm-5" for="lbloaiSP" path="tongTien">${donhang.tongTien}</form:label>

								</div>
							</form:form>
						</div>
					</div>
				</div>
				<div class="widget-box"></div>
			</div>
		</div>
		<div style="height: 50px;">
			<a style="float: right; margin-right: 35px;"
				class="btn btn-mini btn-primary btncreate" href="#"> <i
				class="glyphicon glyphicon-print"></i> In
			</a> <a style="float: right; margin-right: 5px;"
				class="btn btn-mini btn-primary btncreate" href="#"> <i
				class="glyphicon glyphicon-floppy-save"></i> Lưu
			</a>
		</div>

	</div>

	</div>
</body>
</html>