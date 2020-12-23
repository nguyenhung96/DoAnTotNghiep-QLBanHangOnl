<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="left-sidebar">

						<!--/category-products-->

						<div class="brands_products">
							<!--brands_products-->
							<h2>Sắp xếp theo</h2>
							
							<div class="brands-name">
							<c:forEach items="${nhacungcapList}" var="nhomsanpham">
								<ul class="nav nav-pills nav-stacked">
								
									<li><a
							href="{pageContext.request.contextPath}/category/{masp}"
							class="mobile" title="Điện thoại di động, smartphone"> <b>
								${nhacungcap.tenNhaCungCap}</b>
						</a></li>
									
									
								</ul>
								</c:forEach>
							</div>
						</div>
						<!--/brands_products-->


					</div>
