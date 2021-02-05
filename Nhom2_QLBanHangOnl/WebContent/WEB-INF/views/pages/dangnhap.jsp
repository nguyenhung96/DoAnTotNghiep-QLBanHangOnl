<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="user/form/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="user/form/css/style.css">
</head>
<body>

	<div class="main">

		<!-- Sign up form -->


		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<!-- <div class="signin-image">
                        
                        <a href="goto.do?query=dangky" class="signup-image-link">Tạo tài khoản</a>
                    </div> -->
					<div class="signin-image">
						<figure>
							<img src="user/form/images/signin-image.jpg" alt="sing up image">
						</figure>
					</div>
					<div class="signin-form">
						<h2 class="form-title">Đăng nhập</h2>
						<input style="font-size: 15px; color: red; border: none;"
							class="form-control " value="${message}" readonly />
						<form:form class="login100-form validate-form"
							action="khachhang/loginkh.do" method='POST'
							onsubmit="return checklogin()">
							<div class="form-group">
								<tr>
									<td><form:label for="your_name" path="email">
											<i class="zmdi zmdi-account material-icons-name"></i>
										</form:label> <form:input path="email" type="text" name="your_name"
											id="your_name" placeholder="Email khách hàng" /><span
										id="login"></span></td>
								</tr>
							</div>
							<div class="form-group">
								<tr>
									<td><form:label for="your_pass" path="matKhau">
											<i class="zmdi zmdi-lock"></i>
										</form:label> <form:input path="matKhau" type="password" name="your_pass"
											id="your_pass" placeholder="Mật khẩu" /><span id="pass"></span></td>
								</tr>
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term"> <a href="khachhang/dangky.do"
									style="font-size: 14px; color: #222; display: block;">Tạo
									tài khoản</a>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Đăng nhập">
							</div>
						</form:form>
						<!-- <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div> -->
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script type="text/javascript">
		function checklogin() {

			var ID = document.getElementById('your_name').value;
			var pw = document.getElementById('your_pass').value;
			atpos = ID.indexOf("@");
			dotpos = ID.lastIndexOf(".");
			var status = false;
			if (ID !== '') {
				if (atpos < 1 || (dotpos - atpos < 2)) {
					document.getElementById("login").innerHTML = " <span style='color:red;'>Email không đúng định dạng!</span> ";
					status = false;
				} else {
					document.getElementById("login").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
					status = true;
				}
			} else {
				document.getElementById("login").innerHTML = " <span style='color:red;'>Vui lòng nhập email!</span> ";
				status = false;
			}

			if (pw == '') {
				document.getElementById("pass").innerHTML = " <span style='color:red;'>Vui lòng nhập mật khẩu!</span> ";
				status = false;
			} else {
				document.getElementById("pass").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
				
			}
			return status;
		}
	</script>
	<script src="user/form/vendor/jquery/jquery.min.js"></script>
	<script src="user/form/js/main.js"></script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>