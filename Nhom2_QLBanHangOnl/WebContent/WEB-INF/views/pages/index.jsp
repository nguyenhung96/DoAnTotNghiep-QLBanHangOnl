
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
								<a href="khachhang/tin-tuc">Tin công nghệ</a>
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
					<div class="navigat cate42">
						<h2>Lap top</h2>
						<div class="viewallcat">

							<a href="#">Samsung Galaxy Note 20</a> <a href="#">iPhone 12
								Pro Max</a> <a href="#">iPhone 12</a> <a href="#">Redmi Note 9S</a>
							<a href="#">OPPO Reno4</a> <a href="#" class="mobile">Xem tất
								cả điện thoại</a>
						</div>
					</div>
					<ul class="homeproduct item2020  ">
						<c:forEach var="sanpham" items="${sanphamList}">
							<li data-id="229056"><a href="#" class=" vertion2020 large"
								data-s="0">
									<div class="heightlabel">
										<label class="installment">Trả góp <b>0%</b></label>
									</div>
									<div>
										<a href="${pageContext.request.contextPath}/product-details/${sanpham.maSP}.do">
											<img width="180" height="180" data-original=""
											class=" lazyloaded" alt="OPPO A93"
											src="productImg/${sanpham.hinh}">
										</a>
									</div>



									<h3>${sanpham.tenSP}</h3>
									<div class="props"></div>


									<div class="price">
										<strong>${sanpham.giaSP}</strong>
									</div>
									<div class="ratingresult">
										<i class="icontgdd-ystar"></i> <i class="icontgdd-ystar"></i>
										<i class="icontgdd-ystar"></i> <i class="icontgdd-ystar"></i>
										<i class="icontgdd-gstar"></i>

									</div> <input class="spInfo" data-brand="OPPO" data-cat="Điện thoại"
									data-code="0131491002236" data-price="7490000" data-pro="3"
									data-version="" id="data229056" name="data229056" type="hidden"
									value="229056">
							</a></li>
						</c:forEach>
					</ul>

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
									<li><a href="#"> <span class="pull-right">(50)</span>số1
									</a></li>
									<li><a href="#"> <span class="pull-right">(56)</span>số2
									</a></li>
									<li><a href="#"> <span class="pull-right">(27)</span>số3
									</a></li>
									<li><a href="#"> <span class="pull-right">(32)</span>số4
									</a></li>
									<li><a href="#"> <span class="pull-right">(5)</span>số5
									</a></li>
									<li><a href="#"> <span class="pull-right">(9)</span>số6
									</a></li>
									<li><a href="#"> <span class="pull-right">(4)</span>số7
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
											<h2>${sanpham.maSP}</h2>
											<p>${sanpham.tenSP}</p>
											<p class="dollar">
												<span class="in-dollar">$</span><span>${sanpham.giaSP}</span>
											</p>

											<a
												href="${pageContext.request.contextPath}/cart/${sanpham.maSP}.do"
												class="btn btn-default add-to-cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
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
	<section>
		<div class="col-sm-12">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tshirt" data-toggle="tab">so1
				</a></li>
				<li><a href="#blazers" data-toggle="tab">so2</a></li>
				<li><a href="#sunglass" data-toggle="tab">so3</a></li>
				<li><a href="#kids" data-toggle="tab">so4</a></li>
				<li><a href="#poloshirt" data-toggle="tab">so5</a></li>
			</ul>
		</div>
		<div class="tab-content">
			<div class="tab-pane fade active in" id="tshirt">
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>Gía</h2>
								<p>Tên</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>gia</h2>
								<p>tên</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>gia</h2>
								<p>ten</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>gia</h2>
								<p>ten</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="tab-pane fade" id="blazers">
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>gia</h2>
								<p>ten</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>gia</h2>
								<p>ten</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>gia</h2>
								<p>ten</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>gia</h2>
								<p>ten</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="tab-pane fade" id="sunglass">
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>ten</h2>
								<p>gia</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>ten</h2>
								<p>gia</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>ten</h2>
								<p>gia</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>gia</h2>
								<p>ten</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="tab-pane fade" id="kids">
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>ten</h2>
								<p>gia</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>gia</h2>
								<p>ten</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/home/gallery3.jpg" alt="" />
								<h2>ten</h2>
								<p>gia</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>ten</h2>
								<p>gia</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="tab-pane fade" id="poloshirt">
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>ten</h2>
								<p>gia</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>ten</h2>
								<p>gia</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>ten</h2>
								<p>gia</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<img src="images/laptop/hot/1.jpg" alt="" />
								<h2>ten</h2>
								<p>gia</p>
								<a href="#" class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Add to cart</a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
	<footer id="footer">
		<!--Footer-->


		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Dịch vụ</h2>
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
							<h2>Sản phẩm</h2>
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
							<h2>vỀ CHÚNG TÔI</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">gIOI THIEU</a></li>
								<li><a href="#">CỬU HÀNG</a></li>
								<li><a href="#">LIEN HÊ</a></li>
								<li><a href="#">GOP Ý</a></li>

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

				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2020 DỒ ÁN. All rights
						reserved.</p>
					<p class="pull-right">
						Designed by <span><a target="_blank" href="#">DỒ ÁN</a></span>
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