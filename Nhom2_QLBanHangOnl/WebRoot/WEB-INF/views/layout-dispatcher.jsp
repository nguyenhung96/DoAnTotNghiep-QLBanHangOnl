<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Java5</title>
</head>
<body>
	<%
		String view = request.getParameter("view");
		if (view.startsWith("login/")) {
			
			pageContext.forward("admin-layout.jsp");
			
		} else if (view.startsWith("home/")) {
			
			pageContext.forward("layout.jsp");
			
		} else {
			
			pageContext.forward("blank-layout.jsp");
			
		}
	%>
</body>
</html>