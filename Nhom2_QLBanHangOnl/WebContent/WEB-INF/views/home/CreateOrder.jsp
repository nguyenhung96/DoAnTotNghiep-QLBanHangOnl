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
<base href="${pageContext.servletContext.contextPath}/">
<link
	href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script
	src="http://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
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
						<table class="table table-bordered">
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
								<c:forEach var="map" items="${sessionScope.orderItems}">
									<c:set var="count" value="${count+1}"></c:set>
									<tr>
										<td><c:out value="${count}" /></td>
										<td><c:out value="${map.value.sanpham.tenSP}" /></td>
										<td><a class="cart_quantity_up" href="home/increas/${map.value.sanpham.maSP}.do"> + </a> <input
											class="cart_quantity_input" type="text" name="quantity"
											value="${map.value.soluong}" autocomplete="off" size="2">
											<a class="cart_quantity_down" href="home/sub/${map.value.sanpham.maSP}.do"> - </a></td>
										<td><c:out value="${map.value.giaSPFormat}" /></td>
										<td><c:out value="${map.value.thanhTienFormat}" /></td>
										<td><a class="red"
											href="home/remove/${map.value.sanpham.maSP}.do"> <i
												class="glyphicon glyphicon-trash"></i>
										</a></td>
									</tr>
								</c:forEach>
								<tr>
									<td></td>
									<td></td>
									<td></td>

									<td colspan="3"><c:out
											value="${sessionScope.orderTotalFormat}" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row col-md-4 col-xs-12">
					<div class="widget-box">
						<div class="widget-header width-border">
							<h4 class="widget-title">
								<span class="glyphicon glyphicon-info-sign"></span> Thông Tin
								Khách Hàng
							</h4>
						</div>
						<div class="widget-body">
						<span>${msg}</span>
							<form:form method="POST"
								action="/Nhom2_QLBanHangOnl/home/saveorder.do">
								<table>
									<tr class="form-group">
										<td><form:label class="col-sm-5" for="lbloaiSP"
												path="hoTenKH">Tên khách hàng</form:label></td>
										<td><form:input path="hoTenKH"
												class="form-control col-sm-7 " /></td>
												

									</tr>
									<tr class="form-group">
										<td><form:label class="col-sm-5" for="lbloaiSP"
												path="sDT">Số điện thoại</form:label></td>

										<td><form:input path="sDT" class="form-control col-sm-7 " /></td>

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

		<div class="row">
			<div class="col-xm-12">

				<div id="table">

					<table class="table table-bordered" id="myTable">

						<thead>
							<tr>
								<th>Mã sản phẩm</th>
								<th>Tên sản phẩm</th>
								<th>Thông tin sản phẩm</th>
								<th>Ảnh</th>
								<th>Giá bán</th>
								<th>Loại sản phẩm</th>
								<th>Nhà cung cấp</th>
								<th>Trạng thái</th>
								<th>Hoạt động</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="sanpham" items="${sanphamList}">
								<tr>
									<td><a href="#" name="txtname">${sanpham.maSP}</a></td>
									<td>${sanpham.tenSP}</td>
									<td>${sanpham.thongTinSP}</td>
									<td>${sanpham.hinh}</td>
									<td>${sanpham.giaFormat}</td>
									<td>${sanpham.tenNhomSP}</td>
									<td>${sanpham.maNhaCungCap}</td>
									<td>${sanpham.enableString}</td>
									<td>
										<div class="hidden-phone visible-desktop action-buttons">
											<a href="home/addtoorder/${sanpham.maSP}.do"
												class="btn btn-minier btn-success" id="btnEdit"
												title="Chọn sản phẩm"> <i
												class="glyphicon glyphicon-edit"></i>
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