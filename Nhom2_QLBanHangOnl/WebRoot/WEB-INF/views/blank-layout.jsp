<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div style="background-image: url('images/2.jpg');">
			<jsp:include page="${param.view}" />
		</div>
		
</body>
</html>