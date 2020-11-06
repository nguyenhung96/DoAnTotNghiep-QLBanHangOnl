<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>All Employees</title>
</head>
<body>
<h1>List Employees</h1>
<h3><a href="addnhanvien.do">Add More Employee</a></h3>


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
			</tr>
		</c:forEach>
	</table>
</body>
</html>