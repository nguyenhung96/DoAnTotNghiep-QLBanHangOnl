<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE htm>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>Website bán thiết bị điện tử</title>
<link href="css/layout.css" rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home | Website bán thiết bị điện tử</title>
<link href="user/css/bootstrap.min.css" rel="stylesheet">
<link href="user/css/font-awesome.min.css" rel="stylesheet">
<link href="user/css/prettyPhoto.css" rel="stylesheet">
<link href="user/css/price-range.css" rel="stylesheet">
<link href="user/css/animate.css" rel="stylesheet">
<link href="user/css/main.css" rel="stylesheet">
<link href="user/css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/htm5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="user/images/ico/favicon.ico">
</head>
<body style="position: relative; min-height: 100%; top: 0px;">
	<header id="header">
		<jsp:include page="nav.jsp"></jsp:include>

	</header>


	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>Nhập thông tin để đặt hàng</h3>
			</div>
			<div class="row">

				<form:form method="POST"
					action="${pageContext.request.contextPath}/pages/checkout.do"
					modelAttribute="khachhangcheckout" onsubmit="return checkdathang()">
					<div style="visibility: hidden">
						<form:input path="MaKH" />
					</div>
					<div>
						<span>Tên của bạn</span>
						<form:input id="Ten" path="hoTenKH" value = "${sessionScope.tenkhachhang}" />
					</div>
					<span id="checkTen"></span>
					<div>
						<span>Số điện thoại</span>
						<form:input id="SDT" path="SDT" type = "number" value = "${sessionScope.sdtkh}" />
					</div>
					<span id="checkSDT"></span>
					<div>
						<span>Email</span>
						<form:input id="email" path="Email" value = "${sessionScope.emailkh}" />
					</div>
					<span id="checkEmail"></span>
					<div>
						<span>Địa Chỉ</span>
						<form:input id="diachi" path="diaChi" value = "${sessionScope.diachikh}"/>
					</div>
					<span id="checkdiachi"></span>
					<div id="btndathang">
						<input type="submit" value="Đặt hàng">
					</div>
				</form:form>


			</div>
		</div>
	</section>

	<script type="text/javascript">
			function checkdathang(){
				var tenKH= document.getElementById('Ten').value;
				var SDT= document.getElementById('SDT').value;
				var emailID= document.getElementById('email').value;
				var diachi= document.getElementById('diachi').value;
				var status = false;
				var regExp = /^(0[2345789][0-9]{8}|1[89]00[0-9]{4})$/;
				atpos = emailID.indexOf("@");
		         dotpos = emailID.lastIndexOf(".");
				if (tenKH == ''){
					
					document.getElementById("checkTen").innerHTML=
						" <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập tên !</span> ";
			        status = false;
				}
				else{
					document.getElementById("checkTenSP").innerHTML = 
			            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
					status = true;
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
				if(diachi ==''){
					document.getElementById("checkdiachi").innerHTML = 
						" <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập địa chỉ!</span> ";
						status = false;
				}
				else{
					document.getElementById("checkdiachi").innerHTML = 
			            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
				}
				return status;
				
			}
			</script>

	<footer id="footer">
		<!--Footer-->
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Dá»ch vá»¥</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">so1</a></li>
								<li><a href="#">so2</a></li>
								<li><a href="#">so3</a></li>
								<li><a href="#">so4</a></li>
								<li><a href="#">so5</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Sáº£n pháº©m</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">SO1 </a></li>
								<li><a href="#">SO2</a></li>
								<li><a href="#">SO3</a></li>
								<li><a href="#">SO4</a></li>
								<li><a href="#">SO5</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>tHUONG HIEU</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">SO1</a></li>
								<li><a href="#">SO2</a></li>
								<li><a href="#">SO3</a></li>
								<li><a href="#">SO4</a></li>
								<li><a href="#">SO5</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>vá» CHÃNG TÃI</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">gIOI THIEU</a></li>
								<li><a href="#">Cá»¬U HÃNG</a></li>
								<li><a href="#">LIEN HÃ</a></li>
								<li><a href="#">GOP Ã</a></li>

							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>Phone</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Your phone..." />
								<button type="submit" class="btn btn-default">
									<i class="fa fa-arrow-circle-o-right"></i>
								</button>
								<p>
									chÃºng tÃ´i sáº½ liÃªn láº¡c tÆ° váº¥n cho báº¡n trong vÃ²ng 24
									giá» <br />Cáº£m Æ¡n quÃ½ khÃ¡ch!
								</p>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright Â© 2020 Dá» ÃN. All rights
						reserved.</p>
					<p class="pull-right">
						Designed by <span><a target="_blank" href="#">ĐỒ ÁN</a></span>
					</p>
				</div>
			</div>
		</div>

	</footer>
	<!--/Footer-->

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>