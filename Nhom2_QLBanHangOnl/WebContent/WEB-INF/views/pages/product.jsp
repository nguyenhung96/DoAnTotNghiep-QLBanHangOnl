
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE htm>
<htm>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>Website bán thiết bị điện tử</title>
<link href="css/layout.css" rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Sản Phẩm | Website bán thiết bị điện tử </title>
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
	
	<section>
		<div class="container">
			<div class="row">
				
				<div class="col-sm-12 padding-right">
					<div class="features_items">
						<!--features_items-->
						
						<h2 class="title text-center">Tất cả các sản phẩm</h2>
						<c:forEach var="sanpham" items="${sanphamList}">
						<div class="col-sm-3">
						
							<div class="product-image-wrapper" >
								<div class="single-products">
								
									<div class="productinfo text-center producttsp">
										<img src="productImg/${sanpham.hinh}" alt="" height="237px" />
									
										<br>
									</div>
									<div class="product-overlay">
										<div class="overlay-content ">
											<a href="${pageContext.request.contextPath}/product-details/${sanpham.maSP}.do">${sanpham.tenSP}</a>
											<p>
											${sanpham.thongTinSP}
												
											</p>
											<p>
											${sanpham.tenNhomSP}
											</p>
											<a href="${pageContext.request.contextPath}/cart/${sanpham.maSP}.do" class="btn btn-default add-to-cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="${pageContext.request.contextPath}/product-details/${sanpham.maSP}.do"><i
												class="fa fa-plus-square"></i>Xem chi tiết sản phẩm</a></li>

									</ul>
								</div>
								
							</div>
							
						</div>
					
						</c:forEach>

					</div>
					</div>
					<!--features_items-->

					
	</section>
	
	<footer id="footer"><!--Footer-->
		
		
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
								<button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
								<p> chÃºng tÃ´i sáº½ liÃªn láº¡c tÆ° váº¥n cho báº¡n trong vÃ²ng 24 giá» <br />Cáº£m Æ¡n quÃ½ khÃ¡ch!</p>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright Â© 2020 Dá» ÃN. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a target="_blank" href="#">Dá» ÃN</a></span></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	


  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>