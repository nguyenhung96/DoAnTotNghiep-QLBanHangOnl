<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!--left-fixed -navigation-->
<div class=" sidebar" role="navigation">

	<div class="navbar-collapse">
		<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left"
			id="cbp-spmenu-s1">
			<ul class="nav" id="side-menu">
				<li><a href="home/index.do" class="active"><i
						class="fa fa-home nav_icon"></i>Trang chủ</a></li>

				<li><a href="#"><i class="fa fa-cogs nav_icon"></i>Sản phẩm<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse">

						<li><a href="home/sanpham.do">Danh sách sản phẩm</a></li>
						<li><a href="home/producttype.do">Loại sản phẩm</a></li>
						<li><a href="home/supplier.do">Nhà cung cấp</a></li>
					</ul> <!-- /nav-second-level --></li>
				<li class=""><a href="home/order.do"><i
						class="fa fa-book nav_icon"></i>Đơn hàng</span></a></li>
				<li class=""><a href="home/createorder.do"><i
						class="fa fa-book nav_icon"></i>Tạo đơn hàng</span></a></li>
				<li><a href="home/khachhang.do"><i
						class="fa fa-th-large nav_icon"></i>Khách hàng</span></a></li>
				<li><a href="admin/nhansu.do"><i
						class="fa fa-table nav_icon"></i>Nhân sự</a></li>

			</ul>
			<!-- //sidebar-collapse -->
		</nav>

	</div>
</div>
<!--left-fixed -navigation-->
<!-- header-starts -->
<div>
	<div class="sticky-header header-section">
		<div class="header-left">

			<!--nút thu mở menu-->
			<button id="showLeftPush">
				<i class="fa fa-bars"></i>
			</button>

			<!--logo -->
			<div class="logo">
				<a href="index.html">
					<h4>Nhóm đồ án</h4> <span>Trang quản trị</span>
				</a>
			</div>
			<!--//logo-->

		</div>
		<div class="header-center">
			<div class="profile_details-left " style="float: left;">
				<ul>
					<li class="profile_details_drop ">

						<div class="user-name">
							<a style="color: white;" href="">Hướng dẫn sử dụng</a> <a
								style="color: white;" href="">hotline: <span
								style="color: orange;"> 0582224599 </span></a>
						</div>



					</li>
				</ul>
			</div>
			<!--notification menu end -->
			<div class="profile_details">

				<ul>
					<li class="dropdown profile_details_drop "><a href="#"
						class="dropdown-toggle " data-toggle="dropdown"
						aria-expanded="false">

							<div class="user-name">
								<span style="color: orange;">${sessionScope.nhanviendangnhap.maNhanVien}</span>
								<span style="color: orange;">${sessionScope.nhanviendangnhap.hoTenNV}</span>
							</div> <i class="fa fa-angle-down lnr"></i> <i
							class="fa fa-angle-up lnr"></i>
					</a>
						<ul class="dropdown-menu drp-mnu">
							<li><a href="#"><i class="fa fa-cog"></i> Cài đặt</a></li>
							<li><a href="home/profile.do"><i class="fa fa-user"></i>
									Thông tin tài khoản</a></li>
							<li><a href="home/changepass.do"><i class="fa fa-user"></i>
									Đổi mật khẩu</a></li>
							<li><a href='<c:url value="/j_spring_security_logout" />'><i
									class="fa fa-sign-out"></i> Đăng xuất</a></li>
						</ul></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!-- //header-ends -->