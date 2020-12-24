<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


	<section id="cart_items">
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<div cl></div>
					<div class="table-responsive cart_info">

						<table class="table table-condensed">

							<thead>
								<tr class="cart_menu">
									<td class="image">Sản Phẩm</td>
									<td class="description">Tên Sản Phẩm</td>
									<td class="price">Giá Sản Phẩm</td>
									<td class="quantity">Số Lượng</td>
									<td class="total">Tổng Tiền</td>
									<td></td>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="map" items="${sessionScope.myCartItems}">
									<tr>
										<td class="cart_product"><a href=""><img
												src="${pageContext.request.contextPath}/productImg/${map.value.sanpham.hinh}"
												class="img-responsive" alt="" width="150px" height="150px"></a>

										</td>
										<td class="cart_description"><c:out
												value="${map.value.sanpham.tenSP}" /></td>
										<td class="cart_price"><c:out
												value="${map.value.sanpham.giaSP}" /></td>
										<td class="cart_quantity">
											<div class="cart_quantity_button">
												<a class="cart_quantity_up" href=""> + </a> <input
													class="cart_quantity_input" type="text" name="quantity"
													value="${map.value.soluong}" autocomplete="off" size="2">
												<a class="cart_quantity_down" href=""> - </a>
											</div>
										</td>
										<td class="cart_total">
											<p class="cart_total_price">
												<c:out
													value="${map.value.soluong * map.value.sanpham.giaSP}" />
											</p>
										</td>
										<td class="cart_delete">
										<p class="cart_total_price">
												<a class="cart_quantity_delete"
											href=""><i class="fa fa-times"></i></a>
											</p></td>
									</tr>
								</c:forEach>
								

							</tbody>



						</table>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="css-1odjv61">
						<div class="card-header css-0">
							<h5>Thanh toán</h5>
						</div>
						<div class="card-body css-0">
							<div class="css-nouyrl">
								<table class="css-qc9cbn">
									<tbody>
										<tr>
											<td color="#848788" class="css-8ogxmh">Tạm tính</td>
											<td class="css-1xrkmkn"><span class="css-htm2b9"><c:out value="${sessionScope.myCartTotal}" />
													<span class="css-1angbw">đ</span>
											</span></td>
										</tr>
										<tr>
											<td color="#848788" class="css-13izjcd">Phí vận chuyển</td>
											<td class="css-fsu5pb"><span class="css-htm2b9">0
													<span class="css-1angbw">đ</span>
											</span></td>
										</tr>
										
										<tr>
											<td color="#848788" class="css-13izjcd">Thành tiền</td>
											<td class="css-aafp0n"><span class="css-htm2b9"><c:out value="${sessionScope.myCartTotal}" />
													<span class="css-1ul6wk9">đ</span>
											</span></td>
										</tr>
									</tbody>
								</table>
								<div class="css-1jfkofq">(Đã bao gồm VAT)</div>
							</div>
						</div>
						<div class="card-footer css-0">
							<button data-track-content="true" data-content-name="buyNow"
									data-content-target="cart" class="css-33xjxx">
									<strong><a href="pages/opencheckout.do">MUA NGAY</a></strong>
									
								</button>
						</div>
					</div>
					
				</div>


			</div>
		</div>
	</section>
	<!--/#cart_items-->

	
	<!--/#do_action-->

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



	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>