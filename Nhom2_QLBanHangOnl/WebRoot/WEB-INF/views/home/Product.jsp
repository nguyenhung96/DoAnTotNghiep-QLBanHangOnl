<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Insert title here</title>
<base href="${pageContext.servletContext.contextPath}/">
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
</style>
</head>

<body>


	<!-- main content start-->
	<div id="page-wrapper">
		<div class="panel panel-title">
			<h3>
				<span class="glyphicon glyphicon-star-empty "></span> Danh sách sản
				phẩm
			</h3>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group">
						<div class="autocomplete col-md-8 " id="suggestProduct">
							<span class="input-icon input-icon-right" style="width: 100%;">
								<input type="text"
								placeholder="Nhập tên hoặc mã sản phẩm và nhấn Tìm kiếm"
								class="ng-dirty" id="txtSuggestProduct" autocomplete="off">
								<i class="icon-remove red ng-hide" style="cursor: pointer;"></i>
								<button class="btn btn-mini btn-primary" name="search"
									onclick="return true;" type="submit" value="Search">
									<span>Tìm kiếm</span> <i class="ace-icon fa fa-search"></i>
								</button>
							</span>
						</div>
						<div class="col-md-4">
							<a style="float: right;"
								class="btn btn-mini btn-primary btncreate"
								href="home/CreateProduct.do"> <i
								class="glyphicon glyphicon-plus-sign"></i> Thêm sản phẩm
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
								<th>Mã sản phẩm</th>
								<th>Tên sản phẩm</th>
								<th>Thông tin sản phẩm</th>
								<th>Ảnh</th>
								<th>Giá bán</th>
								<th>Loại sản phẩm</th>
								<th>Nhà cung cấp</th>
								<th>Số lượng</th>
								<th>Hoạt động</th>
							</tr>
						</thead>
					
							<tbody>
								<c:forEach var="sp" items="${sanpham}">
								<tr>
								<td>
									<a href="#" name="txtname">${sp.maSP}</a>
								</td>
									<td>${sp.tenSP}</td>
									<td>${sp.thongTinSP}</td>
									<td>${sp.hinh}</td>
									<td>${sp.giaSP}</td>
									<td>${sp.tenNhomSP}</td>
									<td>${sp.maNhaCungCap}</td>
									<td>${sp.soLuongSP}</td>
									<td>
										<div class="hidden-phone visible-desktop action-buttons">
											<a type="submit" name="btnedit" class="btn btn-minier btn-success" title="Chỉnh sửa thông tin sản phẩm" >
											<i class="glyphicon glyphicon-edit"></i>
											</a>
											 <a type="submit" name="btndelete" class="btn btn-minier btn-danger" title="Xóa sản phẩm">
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