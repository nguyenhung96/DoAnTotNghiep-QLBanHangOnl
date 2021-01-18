<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thêm Loại Sản Phẩm</title>
</head>
<body>
	<!-- main content start-->
	<div id="page-wrapper">
		<div class="panel">
			<div class="panel-title">
				<h3>
					<span class="glyphicon glyphicon-star-empty "></span> Thêm loại sản
					phẩm
				</h3>
			</div>
			<div class="panel-body">
				<div class="row col-md-12">
					<div class="panel panel-default">
						<div class="panel-title">
							<h4>
								<span class="glyphicon glyphicon-info-sign"></span> <input style="margin-left: 10px; border-style: none; width: 800px; background-color: #f2f2f2;" value="${messenge}" readonly/>
							</h4>
						</div>
						<div class="panel-body">
							<form:form method="POST"
								action="/Nhom2_QLBanHangOnl/home/saveproducttype.do" onsubmit="return CreateProductType()">
								<table>

									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="Id">STT</form:label></td>
										<td class="col-md-5"><form:input path="Id" readonly="true"
												class="form-control " value="${nhomsanpham.id}" />
												</td>
									</tr>

									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="tenNhomSP">Tên loại sản phẩm</form:label></td>
										<td class="col-md-5"><form:input id="TenNhomSP" class="form-control "
												path="tenNhomSP" value="${nhomsanpham.tenNhomSP}" />
												<span class="ThongbaoEr" id="checkTenNhomSP"></span></td>
									</tr>

									<tr class="form-group col-md-11">
										<td class="col-md-3"><form:label path="maNhaCungCap">Nhà cung cấp</form:label></td>
										<td class="col-md-5"><form:select class="form-control"
												path="maNhaCungCap">												
												<c:forEach var="c" items="${nhacungcapList}">
													<option value="${c.maNhaCungCap}"
														${nhomsanpham.maNhaCungCap == c.maNhaCungCap ? 'selected=""' : ''}>${c.tenNhaCungCap}</option>
												</c:forEach>
											</form:select></td>
									</tr>


									<tr>

										<td colspan="2"><input type="submit"
											class="btn btn-mini btn-primary glyphicon glyphicon-plus-sign btncreate"
											value="Lưu" /></td>
									</tr>
								<script>
								function CreateProductType(){
									var TenNhomSP = document.getElementById('TenNhomSP').value;
									
									
								    var status = false;								    
								    
								    if(TenNhomSP ==''){
										document.getElementById("checkTenNhomSP").innerHTML = 
											" <span class='fas fa-window-close' style='color:red;'>Vui lòng nhập Tên loại sản phẩm!</span> ";
											status = false;
									}
									else{
										document.getElementById("checkTenNhomSP").innerHTML = 
								            " <span class='fa fa-check-square' style='color:#3FFF00;'></span> ";
								            status = true;
									}
									return status;
								}
								</script>
								</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>