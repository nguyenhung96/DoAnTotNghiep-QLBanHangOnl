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
.login100-form-btn{
background: border-box !important;
}
</style>
</head>
<body>
	<%-- <div
		style="width: 500px; height: 500px; padding-left: 100px; padding-right: 100px; border: 2px red;">
		<div
			style="border: 2px; background-color: white; width: 500px; height: 400px">
			<h1 align="center" style="margin-block-start: 0px;">Account
				Login</h1>

			<form:form action="login/Login.do">
				<div style="width: 500px; height: 100px; margin-left: 100px;">
					<div style="float: none;">Username:tritran</div>
					<div style="float: left;">
						<form:input path="maNhanVien"  cssStyle="width: 300px; height: 60px;" />
					</div>
				</div>
				<form:errors />
				<br>
				<div
					style="width: 500px; height: 60px; margin-bottom: 50px; margin-left: 100px;">
					<div style="float: none;">Password:tri1999</div>
					<div style="float: left;">
						<form:password path="matKhau"  cssStyle="width: 300px; height: 60px;" />
					</div>
				</div>


				<form:errors />
				<div style="margin-left: 50px;">
					<button style="width: 400px; height: 50px; background-color: blue;">
						<p align="center"
							style="color: white; height: 35px; font-size: 17;">
							<b>SIGN IN</b>
						</p>
					</button>
				</div>
			</form:form>
		</div>
	</div> --%>
	
	
	
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('template/images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form:form class="login100-form validate-form" action="login/Login.do" onsubmit="return checklogin()">
					<span class="login100-form-title p-b-49">
						Login
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">Username</span>
						<form:input id="ID" class="input100" type="text" name="username" placeholder="Tên đăng nhập" path="maNhanVien" />
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
						<span id="login"></span>
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<form:password id="password" class="input100" type="password" name="pass" placeholder="Mật khẩu" path="matKhau" />
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<span id="pass"></span>
					<br>
					<br>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<input type="submit"  class="login100-form-btn" value="Login"/>
								
						</div>
					</div>
					<script type="text/javascript">
					 function checklogin(){
						 
						var ID = document.getElementById('ID').value;
						var pw = document.getElementById('password').value;
						
						var status = false;
						if(ID == ''){
							document.getElementById("login").innerHTML=
								" <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập tên đăng nhập!</span> ";
					        status = false;
						}
							else{
								document.getElementById("login").innerHTML = 
						            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
						            status = true;
							
						}
						
						if(pw == ''){
							document.getElementById("pass").innerHTML=
								" <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập mật khẩu!</span> ";
					        status = false;
							}
							else{
								document.getElementById("pass").innerHTML = 
						            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
							}
						
						return status;
					}
					</script>

					<!-- <div class="txt1 text-center p-t-54 p-b-20">
						<span>
							Or Sign Up Using
						</span>
					</div>

					<div class="flex-c-m">
						<a href="#" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="#" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
					</div> -->

					<!-- <div class="flex-col-c p-t-155">
						<span class="txt1 p-b-17">
							Or Sign Up Using
						</span>

						<a href="#" class="txt2">
							Sign Up
						</a>
					</div> -->
				</form:form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>

</body>
</html>