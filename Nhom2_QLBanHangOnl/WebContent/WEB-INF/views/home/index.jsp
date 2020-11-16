<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="template/css/clndr.css" type="text/css" />
    <script src="template/js/underscore-min.js" type="text/javascript"></script>
    <script src="template/js/moment-2.2.1.js" type="text/javascript"></script>
    <script src="template/js/clndr.js" type="text/javascript"></script>
    <script src="template/js/site.js" type="text/javascript"></script>
<meta charset="utf-8" />
<base href="${pageContext.servletContext.contextPath}/">
<title>Java5</title>
<style>
</style>
</head>
<body>
			<div id="page-wrapper">
		            <div class="main-page">
                <div class="row-one">
                    <div class="col-md-4 widget">
                        <div class="stats-left ">
                            <h5>Today</h5>
                            <h4>Đã bán</h4>
                        </div>
                        <div class="stats-right">
                            <label> 45</label>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="col-md-4 widget states-mdl">
                        <div class="stats-left">
                            <h5>Today</h5>
                            <h4>Khách hàng</h4>
                        </div>
                        <div class="stats-right">
                            <label> 80</label>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="col-md-4 widget states-last">
                        <div class="stats-left">
                            <h5>Today</h5>
                            <h4>Đơn hàng</h4>
                        </div>
                        <div class="stats-right">
                            <label>51</label>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="charts">
                    <div class="row calender widget-shadow">
                        <h4 class="title">Calender</h4>
                        <div class="cal1">

                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
				  
				</div>
</body>
</html>