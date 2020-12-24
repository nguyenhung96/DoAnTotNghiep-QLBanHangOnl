
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="css-117t92j">
	<div class="card-header css-0">
		<div color="#333" class="css-dcbhpa">
			<div class="css-1oycjaj">
				<div color="#333" class="css-wsluue"></div>
				<div color="#333" class="title css-akoccx">Xem thêm khác</div>
			</div>
			<div>
				<a target="_self" href="/search?brands=dell" class="css-587jha"><div
						color="#848788" data-track-content="true"
						data-content-region-name="sameBrandProduct"
						data-content-name="viewAllProduct" class="css-11q8rex">
						<span class="css-2dse8b">Xem tất cả</span><span size="13"
							class="css-wlyu8w"></span>
					</div></a>
			</div>
		</div>
	</div>
	<div class="card-body css-0">
		<div class="css-d1fjlh">
			<div class="css-hvsvc7">
			<c:forEach var="sanpham" items="${sanphamList}">
				<div
					class="swiper-container-h0lzi swiper-container swiper-container-initialized swiper-container-horizontal">
					
					<div class="swiper-wrapper"
						style="transform: translate3d(-6160px, 0px, 0px); transition-duration: 0ms;">
						
							<a class="swiper-slide css-587jha"
								href="/ban-phim-dell-s1202903.html" style="width: 246.4px;">
								<div
									class="product-card css-atjqcg" data-track-content="true"
									data-content-region-name="sameBrandProduct"
									data-content-name="1202903" data-content-target="productDetail">
									<div class="product-card__content css-mcowk8">
										<div class="css-cssveg">
											<div class="css-1u5p38b"></div>
											<div class="css-1trsi03">
												<picture> <img class="lazyload css-jdz5ak"
													alt="Bàn phím Dell KB216-Black" data-src=""
													src="productImg/${sanpham.hinh}" loading="lazy"
													decoding="async"></picture>
											</div>
										</div>
										<div class="product-card__info">
											<div class="css-1qgxba5">
												<a
													href="${pageContext.request.contextPath}/product-details/${sanpham.maSP}.do">${sanpham.tenSP}</a>
											</div>
											<div class="css-uxu180">
												<div class="css-m5hv1w">
													<div class="css-nel2x3">
														<span class="css-1ou7728"><p>${sanpham.giaSP}</p>
															<span class="css-1ul6wk9">đ</span></span>
													</div>
												</div>
												<div class="css-1vhjcbm"></div>
											</div>
										</div>
									</div>
								</div> </a>
						

					</div>
					
					<div
						class="swiper-button-next swiper-button-next-h0lzi swiper-button-disabled"
						tabindex="-1" role="button" aria-label="Next slide"
						aria-disabled="true"></div>
					<div class="swiper-button-prev swiper-button-prev-h0lzi"
						tabindex="0" role="button" aria-label="Previous slide"
						aria-disabled="false"></div>
					<span class="swiper-notification" aria-live="assertive"
						aria-atomic="true"></span>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
