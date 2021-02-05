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
			tr:nth-child(even){
			background-color: #f2f2f2;
			}
			@media screen and (max-width: 1100px) {
				.profile_details-left{
					display: none;
				}
			}
			@media screen and (min-width: 1100px) {
				input.col-md-5, select.col-md-5{
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

				.close:hover,
				.close:focus {
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
						sách khách hàng</a></li>
				<!-- <li><a data-toggle="tab" href="#accountList">Danh sách tài
						khoản</a></li> -->
			</ul>
			<!--Tab danh sách nhân viên-->
			<div class="tab-content">
				<div id="staffList" class="tab-pane fade in active">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
							<!-- 		<div class="autocomplete col-md-8 " id="suggestProduct">
										<span class="input-icon input-icon-right" style="width: 100%;">
											<input type="text"
											placeholder="Nhập tên hoặc mã khách hàng và nhấn Tìm kiếm"
											class="ng-dirty" id="txtSuggestProduct" autocomplete="off">
											<i class="icon-remove red ng-hide" style="cursor: pointer;"></i>
											<button class="btn btn-mini btn-primary" name="search"
												onclick="return true;" type="submit" value="Search">
												<span>Tìm kiếm</span> <i class="ace-icon fa fa-search"></i>
											</button>
										</span>
									</div>    
									 -->
									<%--  <div class="col-md-6">
										<input ${msg} readonly/>
									</div> --%>
									<%-- <div class="col-md-4">
										<a style="float: right;"
											class="btn btn-mini btn-primary btncreate"
											href="home/createkhachhang.do?maKH=${khachhang.maKH}"> <i
											class="glyphicon glyphicon-plus-sign"></i> Thêm khách hàng
										</a>
									</div> --%>
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
											<th>Mã KH</th>
											<th>Tên KH</th>
											<th>Mật Khẩu</th>
											<th>SĐT</th>
											<th>Email</th>
											<th>Địa Chỉ</th>
											<th>Hoạt động</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${khachhangList}" var="khachhang">
											<tr>
												<td><c:out value="${khachhang.maKH}" /></td>
												<td><c:out value="${khachhang.hoTenKH}" /></td>
												<td><c:out value="${khachhang.matKhau}" /></td>
												<td><c:out value="${khachhang.SDT}" /></td>
												<td><c:out value="${khachhang.email}" /></td>
												<td><c:out value="${khachhang.diaChi}" /></td>
												<td>
													<div class="hidden-phone visible-desktop action-buttons">
														<a
															href="home/editkhachhang.do?maKH=${khachhang.maKH}"
															class="btn btn-minier btn-success" id="btnEdit"
															title="Chỉnh sửa thông tin"> <i
															class="glyphicon glyphicon-edit"></i>
														</a> 
														
														<a
															href="home/deletekhachhang.do?maKH=${khachhang.maKH}"
															class="btn btn-minier btn-danger" title="Xóa khách hàng">
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
								tin khách hàng
							</h4>
						</div>
						<div class="panel-body">
						</div>

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
									<label class="col-md-3" for="lbloaiSP">Mã khách hàng</label> <input
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
		//Script mở model Edit
			var modal = document.getElementById("editModal");
			var modal2 = document.getElementById("setkeyModal");
			// Get the button that opens the modal
			var btn = document.getElementById("btnEdit");
			var btn2 = document.getElementById("btnSetKey");
			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("closeEdit")[0];
			var span2 = document.getElementsByClassName("closeSetKey")[0];
			// When the user clicks on the button, open the modal
			btn.onclick = function() {
			modal.style.zIndex = "100";
			}
			btn2.onclick = function() {
			modal2.style.zIndex = "100";
			}

			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
			modal.style.zIndex = "-2";
			}
			span2.onclick = function() {
			modal2.style.zIndex = "-2";
			}

		//Script mở model Edit
	</script>
</body>
</html>