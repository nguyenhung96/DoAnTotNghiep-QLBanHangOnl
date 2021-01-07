<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
.col-md-5 {
	margin: 0 auto;
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
					cos
					<div class="panel panel-default">
						<div class="panel-title">
							<h4>
								<span class="glyphicon glyphicon-info-sign"></span> Thông tin
								nhân viên
							</h4>
						</div>
						<div class="panel-body">
							<form:form method="POST"
								action="/Nhom2_QLBanHangOnl/admin/luuquyennv.do"
								onsubmit="return CreateStaff()">
								<table>

									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="maNhanVien">Mã nhân viên</form:label></td>
										<td class="col-md-5"><form:input id="MaNhanVien"
												readonly="true" path="maNhanVien" class="form-control "
												value="${nhanvien.maNhanVien}" /></td>
									</tr>

									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="hoTenNV">Tên nhân viên</form:label></td>
										<td class="col-md-5"><form:input id="TenNV"
												class="form-control " path="hoTenNV" readonly="true"
												value="${nhanvien.hoTenNV}" /> <span id="checkTenNV"></span></td>
									</tr>
									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="quyenNV"></form:label></td>
										<td class="col-md-5"><form:select class="form-control"
												path="quyenNV">
												<option value="${quyennv.quyenNV}"></option>
												<option value="ROLE_ADMIN">ROLE_ADMIN</option>
												<option value="ROLE_USER">ROLE_USER</option>
											</form:select></td>
									</tr>
									<tr>

										<td colspan="2"><input type="submit"
											class="btn btn-mini btn-primary glyphicon glyphicon-plus-sign btncreate"
											value="Lưu" /></td>
									</tr>

									<script>
							
											function CreateStaff(){
								var TenNV= document.getElementById('TenNV').value;
								var pass= document.getElementById('pass').value;
								var emailID= document.getElementById('email').value;
								var SDT= document.getElementById('SDT').value;
								var 	CMND = document.getElementById('CMND').value;
								var Gioitinh= document.getElementById('Gioitinh').value;
								var stt= document.getElementById('stt').value;
								var Diachi= document.getElementById('Diachi').value;
								
								var regExp = /^(0[2345789][0-9]{8}|1[89]00[0-9]{4})$/;
								 atpos = emailID.indexOf("@");
						         dotpos = emailID.lastIndexOf(".");
								
							    var status = false;
							    
							    if(!(document.getElementById("MaNhanVien").value = '')){
							    	document.getElementById("pass").style.display="none"
							    }
							    
							    
							    if (TenNV == '') {
									document.getElementById("checkTenNV").innerHTML = 
							            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tên nhân viên!</span> ";
							         status= false;
								}
								else{
									document.getElementById("checkTenNV").innerHTML = 
							            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
							            status= true;
								}
							    if (pass == '') {
									document.getElementById("checkpass").innerHTML = 
							            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập mật khẩu!</span> ";
							         status= false;
								}
								else{
									document.getElementById("checkpass").innerHTML = 
							            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
							          
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
							    if (CMND.length <9 || CMND.length >9) {
									document.getElementById("checkCMND").innerHTML = 
							            " <span class='fas fa-window-close' style='color:red;'>CMND phải có 9 chữ số!</span> ";
							         status= false;
								}
								else{
									document.getElementById("checkCMND").innerHTML = 
							            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
							          
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
</body>
</html>