<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.col-md-8 input{

	width: 184% !important;
}
</style>
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
								action="/Nhom2_QLBanHangOnl/home/savesupplier.do">
								<table>

									<tr class="form-group col-md-11">
										<td class="col-md-5"><form:label path="maNhaCungCap">Mã nhà CC</form:label></td>
										<td class="col-md-8"><form:input path="maNhaCungCap"
												class="form-control " value="${nhacungcap.maNhaCungCap}" /></td>
									</tr>

									<tr class="form-group col-md-11">
										<td class="col-md-5"><form:label path="tenNhaCungCap">Tên nhà CC</form:label></td>
										<td class="col-md-8"><form:input class="form-control "
												path="tenNhaCungCap" value="${nhacungcap.tenNhaCungCap}" /></td>
									</tr>

									<tr class="form-group col-md-11">
										<td class="col-md-5"><form:label path="email">Email</form:label></td>
										<td class="col-md-8"><form:input path="email"
												class="form-control " value="${nhacungcap.email}" /></td>
									</tr>


									<tr class="form-group col-md-11">
										<td class="col-md-5"><form:label path="SDT">Số ĐT</form:label></td>
										<td class="col-md-8"><form:input path="SDT"
												class="form-control " value="${nhacungcap.SDT}" /></td>
									</tr>
									<tr class="form-group col-md-11">
										<td class="col-md-5"><form:label path="diaChi">Địa chỉ</form:label></td>
										<td class="col-md-8"><form:input path="diaChi"
												class="form-control " value="${nhacungcap.diaChi}" /></td>
									</tr>
									<tr>

										<td colspan="2"><input type="submit"
											class="btn btn-mini btn-primary glyphicon glyphicon-plus-sign btncreate"
											value="Lưu" /></td>
									</tr>

								</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>