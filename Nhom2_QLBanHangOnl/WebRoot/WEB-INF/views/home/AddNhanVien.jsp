<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Spring MVC Form Handling</title>
	</head>
	<body>
		<h2>Add Employee Data</h2>
		<form:form method="POST" action="/Nhom2_QLBanHangOnl/savenhanvien.do">
	   		<table>
			    <tr>
			        <td><form:label path="maNhanVien">Mã nhân viên:</form:label></td>
			        <td><form:input path="maNhanVien" value="${nhanvien.maNhanVien}" /></td>
			    </tr>
			    <tr>
			        <td><form:label path="hoTenNV">ten:</form:label></td>
			        <td><form:input path="hoTenNV" value="${nhanvien.hoTenNV}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="matKhau">mat khau:</form:label></td>
			        <td><form:input path="matKhau" value="${nhanvien.matKhau}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="email">email:</form:label></td>
			        <td><form:input path="email" value="${nhanvien.email}"/></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="SDT">sdt:</form:label></td>
                    <td><form:input path="SDT" value="${nhanvien.SDT}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="CMND">cmnd:</form:label></td>
                    <td><form:input path="CMND" value="${nhanvien.CMND}"/></td>
                 </tr>
                 <tr>
			        <td><form:label path="gioiTinh">giới tính:</form:label></td>
                    <td><form:input path="gioiTinh" value="${nhanvien.gioiTinh}"/></td>
                  </tr>
                  <tr>
			        <td><form:label path="chucVu">chuc vu:</form:label></td>
                    <td><form:input path="chucVu" value="${nhanvien.chucVu}"/></td>
                  </tr>
                 <tr>
			        <td><form:label path="hinh">hinh:</form:label></td>
                    <td><form:input path="hinh" value="${nhanvien.hinh}"/></td>
			    </tr>
			  <tr>
			        <td><form:label path="diaChi">diachi:</form:label></td>
                    <td><form:input path="diaChi" value="${nhanvien.diaChi}"/></td>
			    </tr>
			    <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
			</table> 
		</form:form>
		
  <c:if test="${!empty nhanvienList}">
		<h2>List Employees</h2>
	<table align="left" border="1">
		<tr>
			<th>Employee ID</th>
			<th>Employee Name</th>
			<th>Employee Age</th>
			<th>Employee Salary</th>
			<th>Employee Address</th>
			<th>Actions on Row</th>
			<th>Employee Name</th>
			<th>Employee Age</th>
			<th>Employee Salary</th>
			<th>Employee Address</th>
			<th>Actions on Row</th>
		</tr>

		<c:forEach items="${nhanvienList}" var="nhanvien">
			<tr>
				<td><c:out value="${nhanvien.maNhanVien}"/></td>
				<td><c:out value="${nhanvien.hoTenNV}"/></td>
				<td><c:out value="${nhanvien.matKhau}"/></td>
				<td><c:out value="${nhanvien.email}"/></td>
				<td><c:out value="${nhanvien.SDT}"/></td>
				<td><c:out value="${nhanvien.CMND}"/></td>
				<td><c:out value="${nhanvien.gioiTinh}"/></td>
				<td><c:out value="${nhanvien.chucVu}"/></td>
				<td><c:out value="${nhanvien.hinh}"/></td>
				<td><c:out value="${nhanvien.diaChi}"/></td>
				<td align="center"><a href="editnhanvien.do?maNhanVien=${nhanvien.maNhanVien}">Edit</a> | <a href="deletenhanvien.do?MaNhanVien=${nhanvien.maNhanVien}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</c:if>
	</body>
</html>