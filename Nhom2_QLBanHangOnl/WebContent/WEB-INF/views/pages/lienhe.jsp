<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE htm>
<htm>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
<title>Website bán thiết bị điện tử</title>
<link href="css/layout.css" rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Home | Website bán thiết bị điện tử </title>
	<link href="user/css/bootstrap.min.css" rel="stylesheet">
	<link href="user/css/font-awesome.min.css" rel="stylesheet">
	<link href="user/css/prettyPhoto.css" rel="stylesheet">
	<link href="user/css/price-range.css" rel="stylesheet">
	<link href="user/css/animate.css" rel="stylesheet">
	<link href="user/css/main.css" rel="stylesheet">
	<link href="user/css/responsive.css" rel="stylesheet">
	<!--[if lt IE 9]>
    <script src="js/htm5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
	<link rel="shortcut icon" href="user/images/ico/favicon.ico">
</head>
<body style="position: relative; min-height: 100%; top: 0px;">
	<header id="header">
		<jsp:include page="nav.jsp"></jsp:include>
		
	</header>

	 <section>
	 <div id="contact-page" class="container">
    	<div class="bg">   	
    		<div class="row">  	
	    		<div class="col-sm-8">
	    			<div class="contact-form">
	    				<h2 class="title text-center">Get In Touch</h2>
	    				<div class="status alert alert-success" style="display: none"></div>
				    	<form id="main-contact-form" class="contact-form row" name="contact-form" method="post">
				            <div class="form-group col-md-6">
				                <input type="text" name="name" class="form-control" required="required" placeholder="Name">
				            </div>
				            <div class="form-group col-md-6">
				                <input type="email" name="email" class="form-control" required="required" placeholder="Email">
				            </div>
				            <div class="form-group col-md-12">
				                <input type="text" name="subject" class="form-control" required="required" placeholder="Subject">
				            </div>
				            <div class="form-group col-md-12">
				                <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your Message Here"></textarea>
				            </div>                        
				            <div class="form-group col-md-12">
				                <input type="submit" name="submit" class="btn btn-primary pull-right" value="Submit">
				            </div>
				        </form>
	    			</div>
	    		</div>
	    		<div class="col-sm-4">
	    			<div class="contact-info">
	    				<h2 class="title text-center">Contact Info</h2>
	    				<address>
	    					<p>E-Shopper Inc.</p>
							<p>935 W. Webster Ave New Streets Chicago, IL 60614, NY</p>
							<p>Newyork USA</p>
							<p>Mobile: +2346 17 38 93</p>
							<p>Fax: 1-714-252-0026</p>
							<p>Email: info@e-shopper.com</p>
	    				</address>
	    				<div class="social-networks">
	    					<h2 class="title text-center">Social Networking</h2>
							<ul>
								<li>
									<a href="#"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-google-plus"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-youtube"></i></a>
								</li>
							</ul>
	    				</div>
	    			</div>
    			</div>    			
	    	</div>  
    	</div>	
    </div><!--/#contact-page-->
    </section>
	
    <footer id="footer"><!--Footer-->
		
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Dá»ch vá»¥</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">so1</a></li>
								<li><a href="#">so2</a></li>
								<li><a href="#">so3</a></li>
								<li><a href="#">so4</a></li>
								<li><a href="#">so5</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Sáº£n pháº©m</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">SO1 </a></li>
								<li><a href="#">SO2</a></li>
								<li><a href="#">SO3</a></li>
								<li><a href="#">SO4</a></li>
								<li><a href="#">SO5</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>tHUONG HIEU</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">SO1</a></li>
								<li><a href="#">SO2</a></li>
								<li><a href="#">SO3</a></li>
								<li><a href="#">SO4</a></li>
								<li><a href="#">SO5</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>vá» CHÃNG TÃI</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">gIOI THIEU</a></li>
								<li><a href="#">Cá»¬U HÃNG</a></li>
								<li><a href="#">LIEN HÃ</a></li>
								<li><a href="#">GOP Ã</a></li>
								
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>Phone</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Your phone..." />
								<button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
								<p> chÃºng tÃ´i sáº½ liÃªn láº¡c tÆ° váº¥n cho báº¡n trong vÃ²ng 24 giá» <br />Cáº£m Æ¡n quÃ½ khÃ¡ch!</p>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright Â© 2020 Dá» ÃN. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a target="_blank" href="#">Đồ Án</a></span></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	


  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript" src="js/gmaps.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>