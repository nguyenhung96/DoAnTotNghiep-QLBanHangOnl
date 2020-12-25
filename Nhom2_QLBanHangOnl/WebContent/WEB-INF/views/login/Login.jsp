
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
				<form class="login100-form validate-form" name='f'
					action="<c:url value='j_spring_security_check' />" method='POST'
					onsubmit="return checklogin()">
					<table>
						<span class="login100-form-title p-b-49"> Login </span>

						<tr class="wrap-input100 validate-input m-b-23">
							<td><span class="label-input100">Username</span></td>
							<td><input id="ID" class="input100" type="text"
								name="j_username" placeholder="Tên đăng nhập" /> <span
								id="login"></span></td>
							<td><span class="focus-input100" data-symbol="&#xf206;"></span></td>
						</tr>

						<tr class="wrap-input100 validate-input">
							<td><span class="label-input100">Password</span></td>
							<td><input id="password" class="input100" type="password"
								name="j_password" placeholder="Mật khẩu" /> <span id="pass"></span></td>
							<td><span class="focus-input100" data-symbol="&#xf190;"></span></td>
						</tr>




						<script type="text/javascript">
							function checklogin() {

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

								if (pw == '') {
									document.getElementById("pass").innerHTML = " <span  style='color:red;'>Vui lòng nhập mật khẩu!</span> ";
									status = false;
								} else {
									document.getElementById("pass").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
								}

								return status;
							}
						</script>
					</table>
					<a href="login/quenmatkhau.do">Quên mật khẩu</a> <br> <br>
					<tr class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<input type="submit" class="login100-form-btn" value="submit" />

						</div>
					</tr>
				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

</body>
</html>