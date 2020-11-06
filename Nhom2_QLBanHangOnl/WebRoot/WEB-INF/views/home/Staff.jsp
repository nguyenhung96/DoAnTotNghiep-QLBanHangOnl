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
						sách nhân viên</a></li>
				<li><a data-toggle="tab" href="#accountList">Danh sách tài
						khoản</a></li>
			</ul>
			<!--Tab danh sách nhân viên-->
			<div class="tab-content">
				<div id="staffList" class="tab-pane fade in active">
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
											href="home/createstaff.do"> <i
											class="glyphicon glyphicon-plus-sign"></i> Thêm nhân viên
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
											<th>Mã NV</th>
											<th>Tên NV</th>
											<th>Mật Khẩu</th>
											<th>Email</th>
											<th>SĐT</th>
											<th>Số CMND</th>
											<th>Giới Tính</th>
											<th>Chức Vụ</th>
											<th>Ảnh</th>
											<th>Địa Chỉ</th>
											<th>Hoạt động</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${nhanvienList}" var="nhanvien">
											<tr>
												<td><c:out value="${nhanvien.maNhanVien}" /></td>
												<td><c:out value="${nhanvien.hoTenNV}" /></td>
												<td><c:out value="${nhanvien.matKhau}" /></td>
												<td><c:out value="${nhanvien.email}" /></td>
												<td><c:out value="${nhanvien.SDT}" /></td>
												<td><c:out value="${nhanvien.CMND}" /></td>
												<td><c:out value="${nhanvien.gioiTinh}" /></td>
												<td><c:out value="${nhanvien.chucVu}" /></td>
												<td><c:out value="${nhanvien.hinh}" /></td>
												<td><c:out value="${nhanvien.diaChi}" /></td>
												<td>
													<div class="hidden-phone visible-desktop action-buttons">
														<a
															href="home/editnhanvien.do?MaNhanVien=${nhanvien.maNhanVien}"
															class="btn btn-minier btn-success" id="btnEdit"
															title="Chỉnh sửa thông tin"> <i
															class="glyphicon glyphicon-edit"></i>
														</a> 
														
														<a
															href="home/deletenhanvien.do?MaNhanVien=${nhanvien.maNhanVien}"
															class="btn btn-minier btn-danger" title="Xóa nhân viên">
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

				<!--Tab danh sách tài khoản-->
				<div id="accountList" class="tab-pane fade">

					<div id="staffList" class="tab-pane fade in active">
						<div class="container"></div>
						<div class="row">
							<div class="col-xm-12">
								<div id="table">
									<table class="table table-bordered" id="myTable">
										<thead>
											<tr>
												<th>Mã Nhân viên</th>
												<th>Tên sản phẩm</th>
												<th>Thông tin sản phẩm</th>
												<th>Loại sản phẩm</th>
												<th>Nhà cung cấp</th>
												<th>Số lượng</th>
												<th>Giá bán</th>
												<th>Hoạt động</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>SP001</td>
												<td>Ram ddr4 2400</td>
												<td>là sdsfsfdsfdsf dsf sdfds</td>
												<td>Ram</td>
												<td>Cty Đất việt</td>
												<td>10</td>
												<td>20000000</td>
												<td>
													<div class="hidden-phone visible-desktop action-buttons">
														<a class="btn btn-mini btn-primary" id="btnSetKey"
															title="Cấp lại mật khẩu"> <i
															class="ace-icon fa fa-key"></i>
														</a>
														
														 <a class="btn btn-mini btn-danger" href=""
															title="Xóa tài khoản"> <i
															class="glyphicon glyphicon-trash"></i>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
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
								tin nhân viên
							</h4>
						</div>
						<div class="panel-body">
<%-- 						<form:form method="POST"
								action="/Nhom2_QLBanHangOnl/home/savenhanvien.do">
								<table>

									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="maNhanVien">Mã nhân viên</form:label></td>
										<td class="col-md-5"><form:input path="maNhanVien"
												class="form-control " value="${nhanvien.maNhanVien}" /></td>
									</tr>

									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="hoTenNV">Tên nhân viên</form:label></td>
										<td class="col-md-5"><form:input class="form-control "
												path="hoTenNV" value="${nhanvien.hoTenNV}" /></td>
									</tr>

									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="matKhau">Mật khẩu</form:label></td>
										<td class="col-md-5"><form:input path="matKhau"
												class="form-control " value="${nhanvien.matKhau}" /></td>
									</tr>
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="email">Email</form:label></td>
										<td class="col-md-5"><form:input path="email"
												class="form-control " value="${nhanvien.email}" /></td>
									</tr>


									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="SDT">Số ĐT</form:label></td>
										<td class="col-md-5"><form:input path="SDT"
												class="form-control " value="${nhanvien.SDT}" /></td>
									</tr>
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="CMND">Số CMND</form:label></td>
										<td class="col-md-5"><form:input path="CMND"
												class="form-control " value="${nhanvien.CMND}" /></td>
									</tr>
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="gioiTinh">Giới tính</form:label></td>
										<td class="col-md-5"><form:input path="gioiTinh"
												class="form-control " value="${nhanvien.gioiTinh}" /></td>
									</tr>

									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="chucVu">Chức vụ</form:label></td>
										<td class="col-md-5"><form:input path="chucVu"
												class="form-control " value="${nhanvien.chucVu}" /></td>
									</tr>
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="hinh">Hình ảnh</form:label></td>
										<td class="col-md-5"><form:input path="hinh"
												class="form-control " value="${nhanvien.gioiTinh}" /></td>
									</tr>
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="diaChi">Địa chỉ</form:label></td>
										<td class="col-md-5"><form:input path="diaChi"
												class="form-control " value="${nhanvien.diaChi}" /></td>
									</tr>
									<tr style="height: 50px;">
									<td>
										<a style="margin-right: 50px; float: right;" type="submit"
											class="btn btn-mini btn-primary btncreate"> <i
											class="glyphicon glyphicon-plus-sign"></i> Lưu
										</a>
										</td>
									</tr>
								</table>
							</form:form> --%>
							
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
									<label class="col-md-3" for="lbloaiSP">Mã nhân viên</label> <input
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