<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
		<!--left-fixed -navigation-->
		<div class=" sidebar" role="navigation">
			
            <div class="navbar-collapse">
				<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
					<ul class="nav" id="side-menu">
						<li>
							<a href="home/index.do" class="active"><i class="fa fa-home nav_icon"></i>Trang chủ</a>
						</li>
						 
						<li>
							<a href="#"><i class="fa fa-cogs nav_icon"></i>Sản phẩm<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level collapse">
								<li>
									<a href="home/CreateProduct.do">Thêm sản phẩm mới</a>
								</li>
								<li>
									<a href="home/Product.do">Danh sách sản phẩm</a>
								</li>
								<li>
									<a href="ProductType.html">Loại sản phẩm</a>
								</li><li>
									<a href="Supplier.html">Nhà cung cấp</a>
								</li>
							</ul>
							<!-- /nav-second-level -->
						</li>
						<li class="">
							<a href="#"><i class="fa fa-book nav_icon"></i>Đơn hàng <span class="fa arrow"></span></a>
							<ul class="nav nav-second-level collapse">
								<li>
									<a href="CreateOder.html">Tạo đơn hàng</a>
								</li>
								<li>
									<a href="Orderlist.html">Danh sách đơn hàng</a>
								</li>
							</ul>
							<!-- /nav-second-level -->
						</li>
						<li>
							<a href="Customers.html"><i class="fa fa-th-large nav_icon"></i>Khách hàng</span></a>
						</li>
						<li>
							<a href="#"><i class="fa fa-envelope nav_icon"></i>Quản lý kho<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level collapse">
								<li>
									<a href="ProductInbound.html">Nhập kho <span class="nav-badge-btm"></span></a>
								</li>
								<li>
									<a href="ProductOutbound.html">Xuất kho</a>
								</li>
							</ul>
							<!-- //nav-second-level -->
						</li>
						<li>
							<a href="home/nhansu.do"><i class="fa fa-table nav_icon"></i>Nhân sự</a>
						</li>
						<li>
							<a href="Revenue.html"><i class="fa fa-table nav_icon"></i>Thống kê doanh thu</a>
						</li>
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
				<button id="showLeftPush"><i class="fa fa-bars"></i></button>

				<!--logo -->
				<div class="logo">
					<a href="index.html">
						<h4>Nhóm đồ án</h4>
						<span>Trang quản trị</span>
					</a>
				</div>
				<!--//logo-->
				
			</div>
			<div class="header-center"  >
				<div class="profile_details-left " style=" float: left;">	
					<ul>
						<li class="profile_details_drop ">
						
									<div class="user-name">
										<a style="color: white;" href="">Hướng dẫn sử dụng</a>
										<a style="color: white;" href="">hotline: <span style="color: orange;"> 0582224599 </span></a>
									</div>
							
				

						</li>
					</ul>
					</div>
				<!--notification menu end -->
				<div class="profile_details">	

					<ul>
						<li class="dropdown profile_details_drop ">
							<a href="#" class="dropdown-toggle " data-toggle="dropdown" aria-expanded="false">
<%-- <%-- 								<c:forEach var="nv" items="${nhanvien}">
									<div class="user-name">
										<span>${nv.maNhanVien}</span>
										<span style="color: orange;">${nv.chucVu}</span>
									</div>
										</c:forEach> --%> --%>
									<i class="fa fa-angle-down lnr"></i>
									<i class="fa fa-angle-up lnr"></i>
									<div class="clearfix"></div>	
								
							</a>
							<ul class="dropdown-menu drp-mnu">
								<li> <a href="#"><i class="fa fa-cog"></i> Cài đặt</a> </li> 
								<li> <a href="#"><i class="fa fa-user"></i> Thông tin tài khoản</a> </li> 
								<li> <a href="#"><i class="fa fa-sign-out"></i> Đăng xuất</a> </li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>				
			</div>
			<div class="clearfix"> </div>	
		</div>
		</div>
		<!-- //header-ends -->