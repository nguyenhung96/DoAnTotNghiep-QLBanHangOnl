<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div id="page-wrapper">
		<div class="panel panel-default">
			<div class="panel-title">
				<h3>
					<span class="glyphicon glyphicon-star-empty "></span> Thêm sản phẩm
					mới
				</h3>
			</div>
			<div class="panel-body">
				<form:form method="POST"
					action="/Nhom2_QLBanHangOnl/home/updateimage.do"
					enctype="multipart/form-data">
					<table>
						<tr>
							<td class="row col-md-6 col-sm-12">

								<div class="form-group">
									<form:label for="lblmaSP" path="maSP" class="col-sm-4">Mã sản phẩm</form:label>
									<form:input class="form-control" path="maSP"
										value="${sanpham.maSP}" id="txtproductCode" readonly="true"/>
								</div>

							</td>
						</tr>
						<tr>
							<td class="row col-md-6 col-sm-12">
								<div class="form-group">
									<label for="lblnhaCungCap" class="col-sm-4">Chọn hình
										ảnh</label>

									<p id="status"></p>
									<div>
										<img id="output" width="200px" height="200px">
									</div>
									<input type="file" id="file-selector" name="multipartFile"
										style="float: right;">



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
							</td>
						</tr>
						<tr>

							<td colspan="2"><input type="submit"
								class="btn btn-mini btn-primary glyphicon glyphicon-plus-sign btncreate"
								value="Lưu sản phẩm" /></td>
						</tr>
					</table>
				</form:form>
			</div>
			<!-- 			<div style="height: 50px;">
				<a style="float: right; margin-right: 35px;"
					class="btn btn-mini btn-primary btncreate" href="#"> <i
					class="glyphicon glyphicon-plus-sign"></i> Lưu sản phẩm
				</a>
			</div> -->
		</div>

	</div>
</body>
</html>