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
	<!-- main content start-->
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
					action="/Nhom2_QLBanHangOnl/home/savesanpham.do">
					<table>
						<tr>
							<td class="row col-md-6 col-sm-12">

								<div class="form-group">
									<form:label for="lblmaSP" path="maSP" class="col-sm-4">Mã sản phẩm</form:label>
									<form:input class="form-control" path="maSP"
										value="${sanpham.maSP}" id="txtproductCode" />
								</div>
								<div class="form-group">
									<form:label for="lbltenSP" path="tenSP" class="col-sm-4">Tên sản phẩm</form:label>
									<form:input class="form-control" path="tenSP"
										value="${sanpham.tenSP}" id="txtproductName" />
								</div>
								<div class="form-group">
									<form:label for="lblthongTinSP" path="thongTinSP"
										class="col-sm-4">Thông tin
										SP</form:label>
									<form:input class="form-control" path="thongTinSP"
										id="txtproductInfomation" value="${sanpham.thongTinSP}" />
								</div>
								<div class="form-group">
									<form:label for="lblgia" path="giaSP" class="col-sm-4">Giá bán</form:label>
									<form:input class="form-control" path="giaSP"
										id="txtproductPrice" value="${sanpham.giaSP}" />
								</div>
								<div class="form-group">
									<form:label for="lblgia" path="enable" class="col-sm-4">Trạng thái</form:label>
									<form:select class="form-control" path="enable">
										<option value="${sanpham.enable}">${sanpham.enableString}</option>
										<option value="1">Bật</option>
										<option value="2">Tắt</option>

									</form:select>
								</div>

							</td>
						</tr>
						<tr>
							<td class="row col-md-6 col-sm-12">

								<div class="form-group">
									<form:label for="lbloaiSP" path="id_NhomSP" class="col-sm-4">Loại sản phẩm</form:label>
									<form:select class="form-control" path="id_NhomSP"
										id="productType">
										<option value="-1">chọn loại sản phẩm</option>
										<c:forEach var="nhomsp" items="${nhomsanphamList}">
											<option value="${nhomsp.id}"
												${sanpham.id_NhomSP == nhomsp.id ? 'selected=""' : ''}>${nhomsp.tenNhomSP}</option>
										</c:forEach>
									</form:select>
								</div>
								<div class="form-group">
									<form:label path="maNhaCungCap" class="col-sm-4">Nhà cung cấp</form:label>
									<form:select class="form-control" path="maNhaCungCap">
										<option value="-1">Chọn nhà cung cấp</option>
										<c:forEach var="c" items="${nhacungcapList}">
											<option value="${c.maNhaCungCap}"
												${sanpham.maNhaCungCap == c.maNhaCungCap ? 'selected=""' : ''}>${c.tenNhaCungCap}</option>
										</c:forEach>
									</form:select>
								</div>

								<div class="form-group">
									<label for="lblnhaCungCap" class="col-sm-4">Chọn hình
										ảnh</label>

									<p id="status"></p>
									<div>
										<img src="productImg/${sanpham.hinh}" width="200px" height="200px">
									</div>
									
									
									<input type="file" id="file-selector" style="float: right;">
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

		</div>

	</div>
</body>
</html>