
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Java5</title>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}

.login100-form-btn {
	background: border-box !important;
}
</style>
</head>
<body>
	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('template/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form:form class="login100-form validate-form"
					action="/Nhom2_QLBanHangOnl/login/resetpass.do" method='POST'
					onsubmit="return checklogin()">
					<table>
						<span class="login100-form-title p-b-49"> Mã xác nhận đã
							được gửi về mail </span>

						<tr class="wrap-input100 validate-input m-b-23">

							<td><form:input id="ID" class="input100" type="text"
									style="display:none" value="${sessionScope.nvsetmk}"
									path="maNhanVien" /></td>
							<td><form:label class="label-input100" path="matKhau">Nhập mật khẩu mới</form:label></td>
							<td><form:input id="ID" class="input100" type="password"
									path="matKhau" /></td>
							<td><form:label class="label-input100" path="matKhauNhap">Nhập lại mật</form:label></td>
							<td><form:input id="ID" class="input100" type="password"
									path="matKhauNhap" /></td>
							<td><span class="focus-input100" data-symbol="&#xf206;">${msg}</span></td>
						</tr>

						<script type="text/javascript">
						
							function checklogin() {
								alert(${msg1});

								var ID = document.getElementById('ID').value;
								var pw = document.getElementById('password').value;

								var status = false;
								if (ID == '') {
									document.getElementById("login").innerHTML = " <span  style='color:red;'>Vui lòng nhập tên đăng nhập!</span> ";
									status = false;
								} else {
									document.getElementById("login").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
									status = true;

								}

								return status;
							}
						</script>
					</table>
					<lable style="color:red">${msg}</lable>
					<br>

					<br>

					<tr class="container-login100-form-btn">

						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<input type="submit" class="login100-form-btn" value="Tiếp tục" />

						</div>
					</tr>
				</form:form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

</body>
</html>



<form:form method="POST" onsubmit="return CreateStaff()"
	action="/Nhom2_QLBanHangOnl/login/quenmatkhaumail.do">
	<table>

		<tr class="form-group col-md-11">
			<td class="col-md-3"><form:label path="maNhanVien">Mã nhân viên</form:label></td>
			<td class="col-md-5"><form:input id="MaNhanVien"
					path="maNhanVien" class="form-control " /></td>
		</tr>
		<tr>

			<td colspan="2"><input type="submit"
				class="btn btn-mini btn-primary glyphicon glyphicon-plus-sign btncreate"
				value="Lưu" /></td>
		</tr>
		<script>
							
											function CreateStaff(){

								var pass= document.getElementById('pass').value;
								var pass2= document.getElementById('pass2').value;
								var status = false;
								 if (pass=='') {
										document.getElementById("checkpass1").innerHTML = 
								            " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập mật khẩu!</span> ";
								         status= false;
									}
									else{
										document.getElementById("checkpass1").innerHTML = 
								            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
										status= true;
									}
				
				
			
					
							
							</script>
	</table>
</form:form>
