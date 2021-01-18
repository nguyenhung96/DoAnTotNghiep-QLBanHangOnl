
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	<!--/header-->
	<section id="slide-k">
		<div class="container">
			<div class="row">

				<div class="col-md-8">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="user/images/slide/1.jpg" alt="Los Angeles">
							</div>

							<div class="item">
								<img src="user/images/slide/3.jpg" alt="Chicago">
							</div>

							<div class="item">
								<img src="user/images/slide/2.png" alt="New York" width="825px"
									he>
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<div class="col-sm-4">
					<aside class="homenews">
						<figure>
							<h2>
								<a href="goto.do?query=tintuc">Tin công nghệ</a>
							</h2>
							<b></b>
						</figure>
						<ul id="new">
							<li><a href="#"> <img width="100" height="70"
									src="user/images/slide/1.jpg" alt="">
									<h3>Hưởng ứng ngày Nhà Giáo Việt Nam 20/11, hotsale cuối
										tuần này hứa hẹn sẽ ngập tràn deal giảm sốc đến 50%, đừng bỏ
										lỡ</h3> <span>Xem chi tiết</span>
							</a></li>
						</ul>
						<div class="twobanner ">
							<a aria-label="slide" data-cate="0" data-place="1158" href="#"><img
								style="cursor: pointer" src="user/images/slide/11.png"
								alt="A series" width="398" height="110"></a> <a
								aria-label="slide" data-cate="0" data-place="1158"
								href="user/images/slide/11.png"><img style="cursor: pointer"
								src="https://cdn.tgdd.vn/2020/11/banner/398-110-398x110.png"
								alt="đt" width="398" height="110"></a>
						</div>

					</aside>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row">

				<div class="col-sm-12">
					
					<div class="recommended_items">
						<!--recommended_items-->
						<h2 class="title text-center">SẢN PHẨM NỔI BẬT</h2>

						<div id="recommended-item-carousel" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">
									<div class="col-sm-3">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="productImg/1.jpg" alt="" />
													<h2>17.000.000</h2>
													<p>Laptop ACER Aspire 5 A515-55-37HD NX.HSMSV.006</p>
													<button type="button" class="btn btn-default add-to-cart">
														<i class="fa fa-shopping-cart"></i>Add to cart
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="productImg/2.jpg" alt="" />
													<h2>15.000.000</h2>
													<p>Laptop ASUS D509DA EJ800T</p>
													<button type="button" class="btn btn-default add-to-cart">
														<i class="fa fa-shopping-cart"></i>Add to cart
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="productImg/3.jpg" alt="" />
													<h2>16.000.000</h2>
													<p>Laptop ASUS Vivobook A512DA EJ1448Tn</p>
													<button type="button" class="btn btn-default add-to-cart">
														<i class="fa fa-shopping-cart"></i>Add to cart
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="productImg/4.jpg" alt="" />
													<h2>16.000.000</h2>
													<p>Laptop Dell Vostro 15 3591 V5I3308W</p>
													<button type="button" class="btn btn-default add-to-cart">
														<i class="fa fa-shopping-cart"></i>Add to cart
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="productImg/2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart">
														<i class="fa fa-shopping-cart"></i>Add to cart
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="productImg/2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart">
														<i class="fa fa-shopping-cart"></i>Add to cart
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="productImg/2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart">
														<i class="fa fa-shopping-cart"></i>Add to cart
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<a class="left recommended-item-control"
								href="#recommended-item-carousel" data-slide="prev"> <i
								class="fa fa-angle-left"></i>
							</a> <a class="right recommended-item-control"
								href="#recommended-item-carousel" data-slide="next"> <i
								class="fa fa-angle-right"></i>
							</a>
						</div>
					</div>

				</div>

			</div>
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">

						<!--/category-products-->

						<div class="brands_products">
							<!--brands_products-->
							<h2>tiêu đề</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#"> <span class="pull-right">(10)</span>May tinh DELL
									</a></li>
									<li><a href="#"> <span class="pull-right">(56)</span>May tinh ASUS
									</a></li>
									
									</a></li>
								</ul>
							</div>
						</div>
						<!--/brands_products-->


					</div>
				</div>

				<div class="col-sm-9 padding-right">
					<div class="features_items">
						<!--features_items-->

						<h2 class="title text-center">Top Bán chạy</h2>
						<c:forEach var="sanpham" items="${sanphamList}">
							<div class="col-sm-4">

								<div class="product-image-wrapper">
									<div class="single-products">

										<div class="productinfo text-center">
											<img src="productImg/${sanpham.hinh}" alt="" height="237px" />
											<h2>${sanpham.tenSP}</h2>
											
											
											
										</div>
										<div class="product-overlay">
											<div class="overlay-content ">
												<a
													href="${pageContext.request.contextPath}/product-details/${sanpham.maSP}.do">${sanpham.tenSP}</a>
												<p>${sanpham.thongTinSP}</p>
												<p>${sanpham.tenNhomSP}</p>
												<a
													href="${pageContext.request.contextPath}/cart/${sanpham.maSP}.do"
													class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div>
									</div>
									<div class="choose">
										<ul class="nav nav-pills nav-justified">
											<li><a
												href="${pageContext.request.contextPath}/product-details/${sanpham.maSP}.do"><i
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
	
	<footer id="footer">
		<!--Footer-->


		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Hỗ trợ khách hàng</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Thẻ ưu đãi</a></li>
								<li><a href="#">Trung tâm bảo hành</a></li>
								<li><a href="#">Thanh toán và giao hàng</a></li>
								<li><a href="#">Dịch vụ sửa chữa</a></li>
								<li><a href="#">doanh nghiệp thân thiết</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Chính sách Mua hàng và Bảo hành</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Quy định chung </a></li>
								<li><a href="#">Chính sách bảo mật thong tin</a></li>
								<li><a href="#">Chính sách vận chuyển lắp đặt</a></li>
								<li><a href="#">Chính sách đổi trả</a></li>
								<li><a href="#">Quy định giá cả</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Về chúng tôi</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Giới thiệu</a></li>
								<li><a href="#">Thông tin liên hệ</a></li>
								<li><a href="#">Hỏi đáp</a></li>
								<li><a href="#">Tin công nghệ</a></li>
								<li><a href="#">Tuyển dụng</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Phương thức thanh toán</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Hỗ trợ khách hàng</a></li>
								<li><a href="#">Liên hệ báo giá</a></li>
								<li><a href="#">Hợp tác</a></li>
								

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
									chúng tôi sẽ liên lạc tư vấn cho bạn trong vòng 24 giờ <br />Cảm
									ơn quý khách!
								</p>
							</form>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2></a> <a href="http://localhost:8080/Nhom2_QLBanHangOnl/login/login.do"><img
						src="" alt="" />Đăng nhập</a></h2>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2020 DỒ ÁN. All rights
						reserved.</p>
					<p class="pull-right">
						Designed by <span><a target="_blank" href="#">ĐỒ ÁN</a></span>
					</p>
				</div>
			</div>
		</div>
		<article></article>
	</footer>
	<!--/Footer-->



	<script src="user/js/jquery.js"></script>
	<script src="user/js/bootstrap.min.js"></script>
	<script src="user/js/jquery.scrollUp.min.js"></script>
	<script src="user/js/price-range.js"></script>
	<script src="user/js/jquery.prettyPhoto.js"></script>
	<script src="user/js/main.js"></script>


</body>
</html>