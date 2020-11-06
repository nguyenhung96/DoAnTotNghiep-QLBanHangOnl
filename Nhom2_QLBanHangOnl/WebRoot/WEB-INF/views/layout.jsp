<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>Tổ chức giao diện</title>
<link href="template/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="template/css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="template/css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!-- js-->
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="template/js/modernizr.custom.js"></script>

<!--animate-->
<link href="template/css/animate.css" rel="stylesheet" type="text/css"
	media="all">
<script src="template/js/wow.min.js"></script>
<script>
	new WOW().init();
</script>
<script src="template/js/metisMenu.min.js"></script>
<script src="template/js/custom.js"></script>
<link href="template/css/custom.css" rel="stylesheet">
</head>
<body class="cbp-spmenu-push">
	<div class="main-content">
		<nav>
			<jsp:include page="home/menu.jsp" />
		</nav>
		<article>
			<jsp:include page="${param.view}" />
		</article>

	</div>
	<div class="footer">
		<p>
			&copy; 2020 Novus Admin Panel. All Rights Reserved | Design by <a
				href="https://www.facebook.com/thienpham20042000" target="_blank">Team
				đồ án</a>
		</p>
	</div>
	<!-- Classie -->
	<script src="template/js/classie.js"></script>
	<!-- Script thu và mở menu trái -->
	<script src="template/js/menuleft.js"></script>
	<!--scrolling js-->
	<script src="template/js/jquery.nicescroll.js"></script>
	<script src="template/js/scripts.js"></script>
	<!--//scrolling js-->
	<!-- Bootstrap Core JavaScript -->
	<script src="template/js/bootstrap.js">
		
	</script>
</body>
</html>