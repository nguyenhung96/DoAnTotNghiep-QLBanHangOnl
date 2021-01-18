
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="header-middle">
	<!--header-middle-->
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<div class="logo pull-left">
					<a
						href="http://localhost:8080/Nhom2_QLBanHangOnl/Trangchu/index.do"><img
						src="" alt="" />ĐỒ ÁN</a>
				</div>


			</div>
			<div class="col-sm-3">
				<form method="POST" id="searchform" action=""
					enctype="multipart/form-data">
					<input type="text" name="k" value="" placeholder="Từ khóa"
						onblur="if(this.value=='') this.value='Từ khóa'"
						onfocus="if(this.value =='Từ khóa') this.value=''">
					<button type="submit" name="s">
						<i class="fa fa-search"></i>
					</button>


				</form>

			</div>

			<div class="col-sm-9">
				<div class="shop-menu ">

					<ul class="nav navbar-nav">
						<li><a href="goto.do?query=gioithieu"> Giới thiệu</a></li>
						<li><a href="Trangchu/Sanpham.do"> Sản Phẩm</a></li>
						<li><a href="goto.do?query=tintuc"> Tin tức</a></li>
						<li><a href="goto.do?query=lienhe">Liên hệ</a></li>
						<!-- <li><a href="http://localhost:8080/Nhom2_QLBanHangOnl/login/register.do"><img
						src="" alt="" />Đăng ký</a></li> -->


						<%-- <span id="maKH">${sessionScope.makhachhang}</span> --%>
						<c:set var="y" scope="session" value="${makhachhang}" />
						<c:if test="${y == null }">
							<li><a id="dangnhap" href="khachhang/login.do"></a></li>
						</c:if>

						<c:if test="${y != null }">
							<li><a id="lsdh" href="pages/orderkh.do"
								onclick="myFunction()">Lịch sử đặt hàng</a></li>
						</c:if>
						<!-- <li><a href="home/orderkh.do">Lịch sử đặt hàng</a></li> -->


						<span style="color: blue;" id="tenKH">${sessionScope.tenkhachhang}</span>

						<c:set var="x" scope="session" value="${makhachhang}" />
						<c:if test="${x == null }">
							<li><a id="dangnhap" href="khachhang/login.do">Đăng nhập</a></li>
						</c:if>

						<c:if test="${x != null }">
							<a style="color: red;" id="dangxuat" href="khachhang/dangxuat.do" />
									Đăng xuất</a>
						</c:if>



					</ul>

					<!-- <ul class="giohang ">
						<a href="pages/cart.do" class="a1"><i
							aria-hidden="true"></i>Giỏ hàng</a>
					</ul> -->
				</div>
			</div>

		</div>
	</div>
</div>
<!--/header-middle-->

<div class="header-bottom">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<nav>
					<a href="khachhang/shop.htm" class="mobile"
						title="Điện thoại di động, smartphone"> <b> Điện thoại</b>
					</a> <a href="khachhang/shop.htm" class="laptop"
						title="Máy tính xách tay, Laptop"> <b>Laptop</b>
					</a> <a href="khachhang/shop.htm" class="tablet"
						title="Máy tính bảng, tablet"> Tablet</b>
					</a> <a href="khachhang/shop.htm" class="phukien"
						title="Phụ kiện điện thoại di động, phụ kiện tablet, phụ kiện laptop">
						<b>Phụ kiện</b>
					</a> <a href="khachhang/shop.htm" class="fashionwatch"
						title="Đồng hồ thời trang"> <b>Đồng hồ thời trang</b>
					</a> <a href="khachhang/shop.htm" class="smartwatch"
						title="Đồng hồ thông minh"> <b>Đồng hồ thông minh</b>
					</a> <a href="khachhang/shop.htm" class="pc" title="PC, Máy in"> <b>PC,
							Máy in</b>
					</a> <a href="khachhang/shop.htm" class="fashionwatch"
						title="Đồng hồ thời trang"> <b>Đồng hồ thời trang</b>
					</a> <a href="khachhang/shop.htm" class="smartwatch"
						title="Đồng hồ thông minh"> <b>Đồng hồ thông minh</b>
				</nav>
			</div>

			<div class="col-sm-12">
				<nav>
					<c:forEach items="${nhomsanphamList}" var="nhomsanpham">
						<a
							href="${pageContext.request.contextPath}/category/${item.categoryId}.html"
							class="mobile" title="Điện thoại di động, smartphone"> <b>
								${nhomsanpham.tenNhomSP}</b>
						</a>
					</c:forEach>
				</nav>
			</div>
			<script>
				function myFunction() {
					
					/* window.open("http://localhost:8080/Nhom2_QLBanHangOnl/Trangchu/index.do"); */
				}
			</script>