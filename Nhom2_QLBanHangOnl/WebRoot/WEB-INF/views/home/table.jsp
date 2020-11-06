<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Java5</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/style.css" />
<style type="text/css">
</style>
</head>
<body>
	<div class="container" style="width: 1000px;margin: 0px;">
		<div class="row col-md-6 col-md-offset-2 custyle" style="width: 990px;margin: 0px;">
			<table class="" style="width: 950px;">
				<thead>
					<a href="home/new.htm" class="btn btn-primary btn-xs pull-right"><b>+</b>
						Add new User</a>
					<tr>
						<th width="50px">STT</th>
						<th>Usernamr</th>
						<th>Password</th>
						<th>Fullname</th>
						<th class="text-center" style="width: 200px;">Action</th>
					</tr>
				</thead>
				<c:set var="count" value="0"></c:set>
				<c:forEach var="u" items="${users}">
				<c:set var="count" value="${count+1}"></c:set>
					<form action="home/index.htm">
						<tr>
							<td>${count}</td>
							<td>
							<!--${u.username}-->
							<input type="submit" value="${u.username}" style="border: 0px; background-color: white; ">
							<input type="hidden" name="txtname"
								value="${u.username}">
							</td>
							<td>
							<input type="text" name="txtpass"
								value="${u.password}">
							</td>
							<td>
							<input type="text" name="txtfull"
								value="${u.fullname}">
							</td>
							<td class="text-center" style="width: 200px;">
								<input type="submit" name="btnedit"
								value="Edit" class="btn btn-danger btn-xs"> 
								<input
								type="submit" name="btndelete" value="Del"
								class="btn btn-danger btn-xs">
							</td>

						</tr>
					</form>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>