
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


	<section>
		<div class="container">
			<div class="row">
				<main id="content" class="CONTENT-CONTENT">
					<div id="columns" class="">
						<div id="content-sidebar" class="content-sidebar col-md-12">
							<div class="PRODUCT-DETAIL single-product-page">
								<div class="col-wrapper-main container ">
									<div class="product-view clearfix">
									<c:forEach var="sanpham" items="${sanphamList}">
										<div class="row product-collateral primary_block">
											<div class="col-md-5 product-left-column">
												<div
													class="owl-w-effectt owl-carousel owl-theme owl-loaded owl-drag">

													<div class="owl-stage-outer">
														<div class="owl-stage"
															style="transform: translate3d(-858px, 0px, 0px); transition: all 0s ease 0s; width: 2145px;">

															<div class="owl-item cloned" style="width: 429px;">
															
																<div class="item">
																	<a class="fancybox_room"
																		href="/uploads/product/THIT_BI/camera-ben-phai-vietmap-r001-2.jpg">
																		Nga <img src="productImg/${sanpham.hinh}" alt="" />
																	</a>
																</div>
																	
															</div>
														</div>
													</div>

												</div>
											</div>
											<div class="col-md-4 product-center-column">
												<h1 itemprop="name">${sanpham.tenSP}</h1>
												<div class="category" itemprop="category">
													<span>Category: </span> <a href="thiet-bi-dinh-vi/"
														title="THIẾT BỊ ĐỊNH VỊ">
														<h2 class="h5">${sanpham.tenSP}</h2>
													</a>
												</div>
												<div class="thongtin">
													<p>
														Mã sản phẩm:${sanpham.maSP} <span></span>
													</p>
													|
													<p>
														Người dùng đánh giá: <i class="fa fa-star-o"></i><i
															class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i
															class="fa fa-star-o"></i><i class="fa fa-star-o"></i>
													</p>
												</div>
												<div class="clearfix">
													<div class="js-qty">
														<button type="button"
															class="control-quantity control-minus">−</button>
														<input name="idtin" id="idtin" type="hidden" value="226">
														<input type="text" name="quantity" size="5" id="qty"
															class="slsp" style="text-align: center" value="1">
														<button type="button" class="control-quantity control-add">+</button>
													</div>
													<div>
														Giá bán:
														<div class="price"> ${sanpham.giaSP}</div>
													</div>
												</div>
												<div class="t-mota" itemprop="description2">
													<ul class="list">
														<li><i class="fa fa-check-square-o"></i><span
															style="font-size: 14pt; font-family: 'times new roman', times, serif;"><strong>Camera
																	HD hiển thị hình ảnh rõ nét</strong></span></li>
														<li><i class="fa fa-check-square-o"></i><span
															style="font-size: 14pt; font-family: 'times new roman', times, serif;"><strong>Thiết
																	kế chuẩn IP68 chống bụi, chống nước</strong></span></li>
														<li><i class="fa fa-check-square-o"></i><span
															style="font-size: 14pt; font-family: 'times new roman', times, serif;"><strong>Quan
																	sát góc rộng lên đến 170 độ</strong></span></li>
														<li><i class="fa fa-check-square-o"></i><span
															style="font-size: 14pt; font-family: 'times new roman', times, serif;"><strong>Quan
																	sát tốt cả ngày và đêm</strong></span></li>
														<li><i class="fa fa-check-square-o"></i><span
															style="font-size: 14pt; font-family: 'times new roman', times, serif;"><strong>Thiết
																	kế nhỏ gọn Nhỏ gọn, thời trang , tiện dụng</strong></span></li>
														<li><i class="fa fa-check-square-o"></i><span
															style="font-size: 14pt; font-family: 'times new roman', times, serif;"><strong>Sử
																	dụng nguồn trực tiếp của xe Hoạt động đồng bộ theo xe</strong></span></li>
													</ul>
													
												</div>
												</c:forEach>
												<div class="clearfix"></div>
												<div class="socialsharing_product no-print">
													<ul class="social-sharing list-unstyled">
														
														
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
											<div class="col-md-3">
												<div class="t-mota2">
													<p>
														<span style="font-size: 8pt;"><strong><span
																style="color: #ff6600;">CHÚNG TÔI LUÔN CAM KẾT MANG ĐẾN </span></strong></span>
													</p>
													<ul>
														<li><i class="fa fa-caret-right"></i><span
															style="font-size: 8pt; color: #000000;"><strong>Sản
																	phẩm 100% chính hãng</strong></span></li>
														<li><i class="fa fa-caret-right"></i><span
															style="font-size: 8pt; color: #000000;"><strong>Giá
																	cạnh tranh</strong></span></li>
														<li><i class="fa fa-caret-right"></i><span
															style="font-size: 8pt; color: #000000;"><strong>Giao
																	hàng miễn phí</strong></span></li>
													</ul>


												</div>
												<div class="quantity_wanted_p">
													<button type="button" name="addcart" idtin="226"
														id="addcart2" class="btn adtocart2">
														<i class="fa fa-shopping-bag"></i> <span
															id="AddToCartText">Mua ngay</span>
													</button>
												</div>
												<div class="quantity_wanted_p">
													<button type="button" name="addcart" idtin="226"
														id="addcart" class="btn adtocart">
														<i class="fa fa-shopping-cart"></i> <span
															id="AddToCartText">Thêm vào giỏ hàng</span>
													</button>
												</div>

											</div>
											<div class="clearfix"></div>
										</div>
										<div class="product-collateral foreign_block col-md-9">

										</div>

									</div>
								</div>

								<div class="relatived-product container">
									<div class="relatived-product-title">
										<div class="h3" id="lienquan">Sản phẩm liên quan</div>
									</div>
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
							</div>

						</div>
	</section>
	</div>



	<div class="clearfix"></div>
	</div>
	</main>
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
						Designed by <span><a target="_blank" href="#">Dá» ÃN</a></span>
					</p>
				</div>
			</div>
		</div>

	</footer>
	<!--/Footer-->




	<script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
