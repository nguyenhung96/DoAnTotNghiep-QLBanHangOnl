<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loại Sản Phẩm</title>
<link
	href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link
	href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script
	src="http://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<!--datatable-->
<script>
	new WOW().init();
</script>
</head>
<body>
	<!-- main content start-->
	<div id="page-wrapper">
		<div class="panel panel-title">
			<h3>
				<span class="glyphicon glyphicon-star-empty "></span> Danh sách Loại
				sản phẩm
			</h3>
			<input style="margin-left: 10px; border-style: none; width: 800px; background-color: #f2f2f2;" value="${messenge}" readonly/>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group">
						
						<div class="col-md-4">
							<a style="float: right;"
								class="btn btn-mini btn-primary btncreate"
								href="home/createproducttype.do"> <i
								class="glyphicon glyphicon-plus-sign"></i> Thêm loại sản phẩm
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xm-12">
				<div id="table">
					<table class="table table-bordered" id="myTable">
						<thead>
							<tr>
								<th>STT</th>
								<th>Tên loại sản phẩm</th>
								<th>Mã nhà cung cấp</th>
								<th>Hoạt Động</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="count" value="0"></c:set>
							<c:forEach items="${nhomsanphamList}" var="nhomsanpham">
								<c:set var="count" value="${count+1}"></c:set>

								<tr>
									<td><c:out value="${count}" /></td>
									<td><c:out value="${nhomsanpham.tenNhomSP}" /></td>
									<td><c:out value="${nhomsanpham.maNhaCungCap}" /></td>
									<td>
										<div class="hidden-phone visible-desktop action-buttons">
											<a href="home/editproducttype.do?Id=${nhomsanpham.id}"
												class="btn btn-minier btn-success" id="btnEdit"
												title="Chỉnh sửa thông tin"> <i
												class="glyphicon glyphicon-edit"></i>
											</a> <a href="home/deleteproducttype.do?Id=${nhomsanpham.id}"
												class="btn btn-minier btn-danger" title="Xóa STT"> <i
												class="glyphicon glyphicon-trash"></i>
											</a>


										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>
			</div>
		</div>

	</div>
</body>
</html>