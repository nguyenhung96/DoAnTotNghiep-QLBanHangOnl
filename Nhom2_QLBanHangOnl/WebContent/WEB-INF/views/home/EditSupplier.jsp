<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Thêm Nhà Cung Cấp</title>
<style>
.col-md-8 input{

	width: 184% !important;
}
.ThongbaoEr{
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
					<span class="glyphicon glyphicon-star-empty "></span> Cập Nhật nhà cung cấp
				</h3>
				 
			</div>
			<div class="panel-body">
				<div class="row col-md-12">
					<div class="panel panel-default">
						<div class="panel-title">
							<h4>
								<span class="glyphicon glyphicon-info-sign"><input style="margin-left: 10px; border-style: none; width: 900px; background-color: #f2f2f2;" value="${messenge}" readonly/>
							</h4>
						</div>
						<div class="panel-body">
							<form:form method="POST"
								action="/Nhom2_QLBanHangOnl/home/editsupplier.do" onsubmit="return CreateSupplier()">
								<table>

									<tr class="form-group col-md-11">
										<td class="col-md-5"><form:label path="maNhaCungCap">Mã nhà CC</form:label></td>
										<td class="col-md-8"><form:input id="MaNCC" path="maNhaCungCap"
												class="form-control " value="${nhacungcap.maNhaCungCap}"/>
												<span class="ThongbaoEr" id="checkMaNCC"></span></td>
									</tr>

									<tr class="form-group col-md-11">
										<td class="col-md-5"><form:label path="tenNhaCungCap">Tên nhà CC</form:label></td>
										<td class="col-md-8"><form:input  id="TenNCC" class="form-control "
												path="tenNhaCungCap" value="${nhacungcap.tenNhaCungCap}" />
												<span class="ThongbaoEr" id="checkTenNCC"></span></td>
									</tr>

									<tr class="form-group col-md-11">
										<td class="col-md-5"><form:label path="email">Email</form:label></td>
										<td class="col-md-8"><form:input id="Email" path="email"
												class="form-control " value="${nhacungcap.email}" />
												<span class="ThongbaoEr" id="checkEmail"></span></td>
									</tr>


									<tr class="form-group col-md-11">
										<td class="col-md-5"><form:label path="SDT">Số ĐT</form:label></td>
										<td class="col-md-8"><form:input id="SDT" path="SDT"
												class="form-control " value="${nhacungcap.SDT}" />
												<span class="ThongbaoEr" id="checkSDT"></span></td>
									</tr>
									<tr class="form-group col-md-11">
										<td class="col-md-5"><form:label path="diaChi">Địa chỉ</form:label></td>
										<td class="col-md-8"><form:input id="Diachi" path="diaChi"
												class="form-control " value="${nhacungcap.diaChi}" />
												<span class="ThongbaoEr" id="checkDiachi"></span></td>
									</tr>
									<tr>

										<td colspan="2"><input type="submit"
											class="btn btn-mini btn-primary glyphicon glyphicon-plus-sign btncreate"
											value="Lưu" /></td>
									</tr>
								<script>
								function CreateSupplier(){
									var MaNCC = document.getElementById('MaNCC').value;
									var TenNCC = document.getElementById('TenNCC').value;
									var emailID = document.getElementById('Email').value;
									var SDT = document.getElementById('SDT').value;
									var Diachi = document.getElementById('Diachi').value;
									var regExp = /^(0[2345789][0-9]{8}|1[89]00[0-9]{4})$/;
									 atpos = emailID.indexOf("@");
							         dotpos = emailID.lastIndexOf(".");
									
								    var status = false;
								    
								    if (MaNCC == '') {
										document.getElementById("checkMaNCC").innerHTML = 
								            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Mã nhà cung cấp!</span> ";
								         status= false;
									}
									else{
										document.getElementById("checkMaNCC").innerHTML = 
								            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
								            status= true;
									}
								    if (TenNCC == '') {
										document.getElementById("checkTenNCC").innerHTML = 
								            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập tên nhà cung cấp!</span> ";
								         status= false;
									}
									else{
										document.getElementById("checkTenNCC").innerHTML = 
								            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
								            status= true;
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