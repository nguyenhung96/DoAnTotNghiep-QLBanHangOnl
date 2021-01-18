<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="user/form/fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet"
	href="template/fonts/font-awesome-4.7.0/css/font-awesome.min.css">

<!-- Main css -->
<link rel="stylesheet" href="user/form/css/style.css">
</head>
<body>

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Đăng ký</h2>
						<input style="font-size: 20px; color: red; border: none;"
							class="form-control " value="${message}" readonly />
						<form:form class="login100-form validate-form" name="myform"
							method="POST" action="pages/dangky.do"
							onsubmit="return checklogin()">
							<div class="form-group">
								<tr>
									<td><label for="makh"><i
											class="zmdi zmdi-account material-icons-name"></i></label> <form:input
											id="MaKH" path="maKH" readonly="true" class="form-control "
											style="display : none!important" value="${khachhang.maKH}"
											placeholder="Mã khách hàng" /><span id="makh"></span></td>
								</tr>
							</div>
							<div class="form-group">
								<tr>
									<td><label for="name"><i
											class="zmdi zmdi-account material-icons-name"></i></label> <form:input
											id="TenKH" name="TenKhachHang" class="form-control "
											path="hoTenKH" value="${khachhang.hoTenKH}"
											placeholder="Họ tên" /><span id="hoten"></span></td>
								</tr>
							</div>
							<div class="form-group">
								<tr>
									<td><label for="pass"><i class="zmdi zmdi-lock"></i></label>
										<form:input type="password" id="Password" path="matKhau"
											class="form-control " value="${khachhang.matKhau}"
											placeholder="Mật khẩu" /><span id="passkh"></span></td>
								</tr>
							</div>
							<div class="form-group">
								<tr>
									<td><label for="SDT"><i class="zmdi zmdi-phone"></i></label>
										<form:input id="SDT" path="SDT" class="form-control "
											value="${khachhang.SDT}" placeholder="Số điện thoại"
											type="number" /><span id="sodienthoai"></span></td>
								</tr>
							</div>
							<div class="form-group">
								<tr>
									<td><label for="email"><i class="zmdi zmdi-email"></i></label>
										<form:input id="email" path="email" class="form-control "
											value="${khachhang.email}" placeholder="Email" /> <span
										id="emailkhachhang"></span></td>
								</tr>

							</div>
							<div class="form-group">
								<tr>
									<td><label for="diachi"><i
											class="fa fa-address-card"></i></label> <form:input id="Diachi"
											path="diaChi" class="form-control "
											value="${khachhang.diaChi}" placeholder="Địa chỉ" /><span
										id="diachikhachhang"></span></td>
								</tr>
							</div>
							<!-- <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div> -->
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Đăng ký tài khoản" />
							</div>
						</form:form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="user/form/images/signup-image.jpg" alt="sing up image">
						</figure>
						<!--  <a href="#" class="signup-image-link">I am already member</a> -->
					</div>
				</div>
			</div>
		</section>

		<!-- Sing in  Form -->


	</div>

	<!-- JS -->
	<script type="text/javascript">
		function checklogin() {

			var name = document.getElementById('TenKH').value;
			var pw = document.getElementById('Password').value;
			var SDT = document.getElementById('SDT').value;
			var email = document.getElementById('email').value;
			var diachi = document.getElementById('Diachi').value;
			var regExp = /^(0[2345789][0-9]{8}|1[89]00[0-9]{4})$/;
			atpos = email.indexOf("@");
			dotpos = email.lastIndexOf(".");
			var status = false;
			if (name == '') {
				document.getElementById("hoten").innerHTML = " <span  style='color:red;'>Vui lòng nhập Họ tên!</span> ";
				status = false;
			} else {
				document.getElementById("hoten").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
				status = true;

			}

			if (pw == '') {
				document.getElementById("passkh").innerHTML = " <span  style='color:red;'>Vui lòng nhập Mật khẩu!</span> ";
				status = false;
			} else {
				document.getElementById("passkh").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
			}
			if (SDT !== '') {
				if (regExp.test(SDT) == false) {
					document.getElementById("sodienthoai").innerHTML = " <span style='color:red;'>Số điện thoại không đúng định dạng!</span> ";
					status = false;
				} else {
					document.getElementById("sodienthoai").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
					
				}
			} else {
				document.getElementById("sodienthoai").innerHTML = " <span style='color:red;'>Bạn chưa nhập số điện thoại!</span> ";
				status = false;
			}
			/* document.getElementById("sodienthoai").innerHTML = " <span  style='color:red;'>Vui lòng nhập Số điện thoại!</span> ";
			status = false;
			} else {
			document.getElementById("sodienthoai").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
			status = true;

			} */

			if (email !== '') {
				if (atpos < 1 || (dotpos - atpos < 2)) {
					document.getElementById("emailkhachhang").innerHTML = " <span style='color:red;'>Email không đúng định dạng!</span> ";
					status = false;
				} else {
					document.getElementById("emailkhachhang").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
					status = true;
				}

			} else {
				document.getElementById("emailkhachhang").innerHTML = " <span  style='color:red;'>Vui lòng nhập Email!</span> ";
				status = false;

			}

			if (diachi == '') {
				document.getElementById("diachikhachhang").innerHTML = " <span  style='color:red;'>Vui lòng nhập Địa chỉ!</span> ";
				status = false;
			} else {
				document.getElementById("diachikhachhang").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";

			}

			return status;
		}
	</script>

	<!-- <script language="javascript">
		function CheckNewCustomer() {

			var TenKH = document.myform.TenKH.value;
			var pass = document.getElementById('Password').value;
			var SDT = document.getElementById('SDT').value;
			var regExp = /^(0[234][0-9]{8}|1[89]00[0-9]{4})$/;
			var emailID = document.getElementById('Email').value;
			var Diachi = document.getElementById('Diachi').value;

			atpos = emailID.indexOf("@");
			dotpos = emailID.lastIndexOf(".");

			var status = false;
			if (TenKH == '') {
				document.getElementById("checkTenKH").innerHTML = " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập tên khách hàng!</span> ";

				status = false;
			} else {
				document.getElementById("checkTenKH").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
				status = true;
			}
			if (pass == '') {
				document.getElementById("checkpass").innerHTML = " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập mật khẩu!</span> ";
				status = false;
			} else {
				document.getElementById("checkpass").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";

			}
			if (SDT !== '') {
				if (regExp.test(SDT) == false) {
					document.getElementById("checkSDT").innerHTML = " <span class='fas fa-window-close' style='color:red;'>Số điện thoại không đúng định dạng!</span> ";
					status = false;
				} else {
					document.getElementById("checkSDT").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
				}
			} else {
				document.getElementById("checkSDT").innerHTML = " <span class='fas fa-window-close' style='color:red;'>Bạn chưa nhập số điện thoại!</span> ";
				status = false;
			}
			if (email !== '') {
				if (atpos < 1 || (dotpos - atpos < 2)) {
					document.getElementById("checkEmail").innerHTML = " <span class='fas fa-window-close' style='color:red;'>Email không đúng định dạng!</span> ";
					status = false;
				} else {
					document.getElementById("checkEmail").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
				}
			} else {
				document.getElementById("checkEmail").innerHTML = " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập email!</span> ";
			}
			if (Diachi == '') {
				document.getElementById("checkDiachi").innerHTML = " <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập địa chỉ!</span> ";
				status = false;
			} else {
				document.getElementById("checkDiachi").innerHTML = " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
			}
			return status;
		}
	</script> -->
	<script src="user/form/vendor/jquery/jquery.min.js"></script>
	<script src="user/form/js/main.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>