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
					<span class="glyphicon glyphicon-star-empty "></span> Thêm khách
					hàng mới
				</h3>
			</div>
			<div class="panel-body">
				<div class="row col-md-12">
					<div class="panel panel-default">
						<div class="panel-title">
							<h4>
								<span class="glyphicon glyphicon-info-sign"></span> Thông tin
								khách hàng
							</h4>
						</div>
						<div class="panel-body">
							<form:form method="POST" action="home/savekhachhang.do">
								<table>

									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="maKH">Mã khách hàng</form:label></td>
										<td class="col-md-5"><form:input id="MaKH" path="maKH"
												readonly="true" class="form-control "
												value="${khachhang.maKH}" /></td>
									</tr>

									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="hoTenKH">Tên khách hàng</form:label></td>
										<td class="col-md-5"><form:input id="TenKH"
												class="form-control " path="hoTenKH"
												value="${khachhang.hoTenKH}" /></td>
									</tr>


									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="matKhau">Mật khẩu</form:label></td>
										<td class="col-md-5"><form:input id="Password"
												path="matKhau" class="form-control "
												value="${khachhang.matKhau}" /></td>
									</tr>
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="SDT">Số ĐT</form:label></td>
										<td class="col-md-5"><form:input id="SDT" path="SDT"
												class="form-control " value="${khachhang.SDT}" /></td>
									</tr>
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="email">Email</form:label></td>
										<td class="col-md-5"><form:input id="Email" path="email"
												class="form-control " value="${khachhang.email}" /></td>
									</tr>


									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="diaChi">Địa chỉ</form:label></td>
										<td class="col-md-5"><form:input id="Diachi"
												path="diaChi" class="form-control "
												value="${khachhang.diaChi}" /></td>
									</tr>
									<tr>

										<td colspan="2"><input id="btn" type="submit"
											class="btn btn-mini btn-primary glyphicon glyphicon-plus-sign btncreate"
											value="Lưu" /></td>
									</tr>
									<script language="javascript">
										var button = document
												.getElementById("btn");
										button.onclick = function CheckNewCustomer() {
											var MaKH = document
													.getElementById('MaKH').value;
											var TenKH = document
													.getElementById('TenKH').value;
											var Pass = document
													.getElementById('Password').value;
											var SDT = document
													.getElementById('SDT').value;
											var Email = document
													.getElementById('Email').value;
											var Diachi = document
													.getElementById('Diachi').value;
											var letter3 = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
											if (letter3.test(MaKH.value)) {
												alert("Sai định dạng mã KH");
												return false;
											}

										}
									</script>
								</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<h2>Add Customer Data</h2>
</body>
</html>