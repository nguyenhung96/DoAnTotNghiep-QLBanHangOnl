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
.col-md-5{
display: flex;
 align-items: center;
 justify-content: center;

}
</style>
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
							<form:form name="myform" method="POST" action="home/savekhachhang.do" onsubmit = "return CheckNewCustomer()">
								<table>
					
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="maKH">Mã khách hàng</form:label></td>
										<td class="col-md-5"><form:input id="MaKH" path="maKH"
												readonly="true" class="form-control "
												value="${khachhang.maKH}" /></td>
									</tr>
									
								
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="hoTenKH">Tên khách hàng</form:label></td>
										<td class="col-md-5"><form:input id="TenKH" name="TenKhachHang"
												class="form-control " path="hoTenKH" 
												value="${khachhang.hoTenKH}"  placeholder="Nhập họ tên"/>
												<span id="checkTenKH"></span>
												</td>
									
									</tr>
									
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="matKhau">Mật khẩu</form:label></td>
										<td class="col-md-5"><form:input id="Password"
												path="matKhau" class="form-control "
												value="${khachhang.matKhau}" />
												<span id="checkpass"></span></td>
									</tr>
									
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="SDT">Số ĐT</form:label></td>
										<td class="col-md-5"><form:input id="SDT" path="SDT" type = "number"
												class="form-control " value="${khachhang.SDT}" />
												<span id="checkSDT"></span></td>
												</td>
									</tr>
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="email">Email</form:label></td>
										<td class="col-md-5"><form:input id="Email" path="email"
												class="form-control " value="${khachhang.email}" />
												<span id="checkEmail"></span></td>
									</tr>


									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="diaChi">Địa chỉ</form:label></td>
										<td class="col-md-5"><form:input id="Diachi"
												path="diaChi" class="form-control "
												value="${khachhang.diaChi}" />
												<span id="checkDiachi"></span></td>
									</tr>
									<tr>

										<td colspan="2"><input id="btnNewCustomer" type="submit"
											class="btn btn-mini btn-primary glyphicon glyphicon-plus-sign btncreate"
											value="Lưu" /></td>
									</tr>
									<script language="javascript">
										function CheckNewCustomer() {
											
											
											var TenKH = document.myform.TenKH.value;
											var pass= document.getElementById('Password').value;
											var SDT = document.getElementById('SDT').value;
											var regExp = /^(0[234][0-9]{8}|1[89]00[0-9]{4})$/;
											var emailID = document.getElementById('Email').value;
											var Diachi = document.getElementById('Diachi').value;
											
									         atpos = emailID.indexOf("@");
									         dotpos = emailID.lastIndexOf(".");
											
										    var status = false;
											if (TenKH == '') {
												document.getElementById("checkTenKH").innerHTML = 
										            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập tên khách hàng!</span> ";
										         status= false;
											}
											else{
												document.getElementById("checkTenKH").innerHTML = 
										            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
										            status= true;
											}
											if(pass ==''){
												document.getElementById("checkpass").innerHTML = 
										            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập mật khẩu!</span> ";
										         status=false;
											}
											else{
												document.getElementById("checkpass").innerHTML = 
										            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
										            
											}
											if(SDT!==''){
												if(regExp.test(SDT) == false){
												document.getElementById("checkSDT").innerHTML = 
										            " <span class='fas fa-window-close' style='color:red;'>Số điện thoại không đúng định dạng!</span> ";
										         status=false;
												}
												else{
													document.getElementById("checkSDT").innerHTML = 
											            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
												}
											}
											else{
												document.getElementById("checkSDT").innerHTML = 
										            " <span class='fas fa-window-close' style='color:red;'>Bạn chưa nhập số điện thoại!</span> ";
										         status=false;
											}
											if(emailID !==''){
												if(atpos < 1 || ( dotpos - atpos < 2 )){
													document.getElementById("checkEmail").innerHTML = 
											            " <span class='fas fa-window-close' style='color:red;'>Email không đúng định dạng!</span> ";
											         status=false;
											}
												else{
													document.getElementById("checkEmail").innerHTML = 
											            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
												}
											}
											else{
												document.getElementById("checkEmail").innerHTML = 
													" <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập email!</span> ";
											}
											if(Diachi ==''){
												document.getElementById("checkDiachi").innerHTML = 
													" <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập địa chỉ!</span> ";
													status = false;
											}
											else{
												document.getElementById("checkDiachi").innerHTML = 
										            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
											}
											return status;
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