<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<!-- main content start-->
	<div id="page-wrapper">
		<div class="panel">
			<div class="panel-title">
				<h3>
					<span class="glyphicon glyphicon-star-empty "></span> Thêm nhân
					viên mới
				</h3>
			</div>
			<div class="panel-body">
				<div class="row col-md-12">
					<div class="panel panel-default">
						<div class="panel-title">
							<h4>
								<span class="glyphicon glyphicon-info-sign"></span> Thông tin
								nhân viên
							</h4>
						</div>
						<div class="panel-body">
							<form:form method="POST"
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
									<tr>
									
										<td  colspan="2" >
										
										<input  type="submit"class="btn btn-mini btn-primary glyphicon glyphicon-plus-sign btncreate" value="Lưu" />
										
										
										</td>
									</tr>

								</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<h2>Add Employee Data</h2>
</body>
</html>