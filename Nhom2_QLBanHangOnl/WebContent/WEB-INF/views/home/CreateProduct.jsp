<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<!-- main content start-->
			<div id="page-wrapper">
				<div class="panel panel-default">
				<div class="panel-title">
					<h3> <span class="glyphicon glyphicon-star-empty "></span> Thêm sản phẩm mới</h3>
				</div>
				<div class="panel-body">
					<div class="row col-md-6 col-sm-12" >
						<form>
							<div class="form-group">
							<label for="lblmaSP" class="col-sm-4">Mã sản phẩm</label>
							<input type="text" class="form-control" id="txtproductCode">
							</div>
							<div class="form-group">
								<label for="lbltenSP" class="col-sm-4">Tên sản phẩm</label>
								<input type="text" class="form-control" id="txtproductName">
							</div>
							<div class="form-group">
								<label for="lblthongTinSP" class="col-sm-4">Thông tin SP</label>
								<input type="text" class="form-control" id="txtproductInfomation">
							</div>
							<div class="form-group">
								<label for="lblgia" class="col-sm-4">Giá bán</label>
								<input type="number" class="form-control" id="txtproductPrice">
							</div>
						</form>
					</div>
					<div class="row col-md-6 col-sm-12">
						<form>
							<div class="form-group">
							<label for="lbloaiSP" class="col-sm-4">Loại sản phẩm</label>
							<select class="form-control" id="productType">
								<option>Ram</option>
								<option>Laptop</option>
								<option>Điện thoại</option>
							</select>
							</div>
							<div class="form-group">
								<label for="lblnhaCungCap" class="col-sm-4">Nhà cung cấp</label>
								<select class="form-control" id="Supplier">
								<option>Datvietmobi</option>
								<option>Cty3i</option>
								<option>Thien</option>
								</select>
							</div>
							<div class="form-group">
								<label for="lblnhaCungCap" class="col-sm-4">Chọn hình ảnh</label>
								
								<p id="status"></p>
								<div>
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
						<a  style="float: right;margin-right: 35px;" class="btn btn-mini btn-primary btncreate" href="#">
							<i class="glyphicon glyphicon-plus-sign"></i>
							Lưu sản phẩm	
						</a>
					</div>
				</div>

				</div>
</body>
</html>