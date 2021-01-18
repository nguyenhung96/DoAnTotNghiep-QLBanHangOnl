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
								<c:set var="count" value="0"></c:set>
								<c:forEach var="c" items="${donhangList}">
									<c:set var="count" value="${count+1}"></c:set>
									<tr>
										<td>${count}</td>
										<td>${c.tenSanPham}</td>
										<td>${c.soLuong}</td>
										<td>${c.donGia}</td>
										<td>${c.tongTien}</td>
										<td><a class="red"> <i
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
								<span class="glyphicon glyphicon-info-sign"></span> Trạng Thái
								Đơn Hàng
							</h4>
							<table>
								<tr>
									<td><span>${donhang.trangThaiString}</span> <input
										id="Trangthai" value="${donhang.trangThai}"
										style="visibility: hidden" /></td>

								</tr>
							</table>
						</div>
						<br> <br>

						<div class="widget-body">
							<form:form method="POST"
								action="/Nhom2_QLBanHangOnl/home/duyetdonhang.do">
								<table>
									<tr class="form-group">
										<td><form:label class="col-sm-5" for="lbloaiSP"
												path="maDonHang">Mã đơn hàng</form:label></td>

										<td><form:input path="maDonHang" readonly="true"
												class="form-control col-sm-7 " value="${donhang.maDonHang}" />
										</td>

									</tr>
									<tr class="form-group">
										<td><form:label class="col-sm-5" for="lbloaiSP"
												path="maKH">Khách Hàng</form:label></td>
										<td><form:input path="maKH" readonly="true"
												class="form-control col-sm-7 " value="${donhang.maKH}" /></td>

									</tr>
									<tr class="form-group">
										<td><form:label class="col-sm-5" for="lbloaiSP"
												path="ngayDat">Ngày đặt</form:label></td>
										<td><form:input path="ngayDat" readonly="true"
												class="form-control col-sm-7 " value="${donhang.ngayDat}" />
										</td>

									</tr>
									<tr class="form-group">
										<td><form:label class="col-sm-5" for="lbloaiSP"
												path="maNhanVien">Nhân Viên</form:label></td>
										<td><form:input path="maNhanVien" id="MaNhanVien"
												class="form-control col-sm-7 " value="${donhang.maNhanVien}"
												readonly="true" /> <form:input path="maNhanVienDuyetDon"
												id="MaNhanVien" style="display:none"
												class="form-control col-sm-7 "
												value="${sessionScope.nhanviendangnhap.maNhanVien}" /></td>
									</tr>
									<tr class="form-group">
										<td><form:label class="col-sm-5" for="lbloaiSP"
												path="diaChi">Địa chỉ giao</form:label></td>
										<td><form:input path="diaChi" readonly="true"
												class="form-control col-sm-7 " value="${donhang.diaChi}" />
										</td>

									</tr>
									<tr class=" width-border col-sm-12">
										<h4 class="widget-title">
											<span class="glyphicon glyphicon-info-sign"></span> Thông Tin
											Thanh Toán
										</h4>
									</tr>
									<tr class="form-group">
										<td><form:label class="col-sm-5" for="lbloaiSP"
												path="tongTien">Tổng tiền hàng</form:label></td>
										<td><form:label class="col-sm-5" for="lbloaiSP"
												path="tongTien">${donhang.tongTienString} VNĐ</form:label></td>

									</tr>
									<tr>

										<td colspan="2"><input type="submit" id="btnduyet"
											class="btn btn-mini btn-primary glyphicon glyphicon-plus-sign btncreate"
											value="Duyệt đơn hàng" /></td>
									</tr>
								</table>
							</form:form>
						</div>
					</div>
				</div>
				<div class="widget-box"></div>
			</div>
		</div>
		<div style="height: 50px;">
			<a style="float: right; margin-right: 35px;" id="btnin"
				class="btn btn-mini btn-primary btncreate"
				href="home/print.do?MaDonHang=${donhang.maDonHang}"> <i
				class="glyphicon glyphicon-print"></i> In
			</a> <a id="btnhuydon" style="float: right; margin-right: 5px;"
				class="btn btn-mini btn-primary btncreate"
				href="home/huydonhang.do?MaDonHang=${donhang.maDonHang}"> <i
				class="glyphicon glyphicon-floppy-save"></i> Hủy đơn hàng
			</a> <a id="btnhoanthanh" style="float: right; margin-right: 5px;"
				class="btn btn-mini btn-primary btncreate"
				href="home/completedonhang.do?MaDonHang=${donhang.maDonHang}"> <i
				class="glyphicon glyphicon-floppy-save"></i> Hoàn thành
			</a>
		</div>

	</div>
	<script>
		var manhanvien = document.getElementById('MaNhanVien').value;
		var trangthai = document.getElementById('Trangthai').value;
		if (trangthai == "1") {
			document.getElementById("btnhoanthanh").style.display = 'none';
		} else if (trangthai == "2") {
			document.getElementById("btnduyet").style.display = 'none';
		} else if (trangthai == "3") {
			document.getElementById("btnduyet").style.display = 'none';
			document.getElementById("btnhoanthanh").style.display = 'none';
			document.getElementById("btnhuydon").style.display = 'none';
		} else if (trangthai == "4") {
			document.getElementById("btnduyet").style.display = 'none';
			document.getElementById("btnhoanthanh").style.display = 'none';
			document.getElementById("btnhuydon").style.display = 'none';
		}
	</script>
</body>
</html>