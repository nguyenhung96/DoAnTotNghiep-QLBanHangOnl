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
			<div class="breadcrumbs">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>

					<li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">

				<table class="table table-condensed">

					<thead>
						<tr class="cart_menu">
							<td class="image">Sản Phẩm</td>
							<td class="description"></td>
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
										<c:out value="${map.value.soluong * map.value.sanpham.giaSP}" />
									</p>
								</td>
								<td class="cart_delete"><a class="cart_quantity_delete"
									href=""><i class="fa fa-times"></i></a></td>
							</tr>
						</c:forEach>
						<tr>
							<td>Tổng tiền: <c:out value="${sessionScope.myCartTotal}" /></td>
						</tr>

					</tbody>



				</table>
				<div class="total_right">
					Total: $
					<c:out value="${sessionScope.myCartTotal}" />
				</div>
			</div>
		</div>
	</section>
	<!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<div class="check_button">
					<h3>
						<a href="pages/opencheckout.do">Check out</a>
					</h3>
				</div>
			</div>
			<div class="row"></div>
		</div>
	</section>
	<!--/#do_action-->

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
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>