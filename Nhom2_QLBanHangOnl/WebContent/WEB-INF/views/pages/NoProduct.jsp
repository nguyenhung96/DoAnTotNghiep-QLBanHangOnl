<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
._3IlWyc {
	height: 21rem;
}

._2DgV5v {
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-webkit-align-items: center;
	-moz-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-moz-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	height: 37.5rem;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-moz-box-orient: vertical;
	-moz-box-direction: normal;
	-ms-flex-direction: column;
	flex-direction: column;
}

._3IlWyc ._1H_1n1 {
	width: 6.75rem;
	height: 6.125rem;
}

._1H_1n1 {
	background-position: 50%;
	background-size: cover;
	background-repeat: no-repeat;
	width: 12.5rem;
	height: 11.1875rem;
	background-image: url("template/images/cart.png");
}

.button {
	display: inline-block;
	border-radius: 4px;
	background-color: #f4511e;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 20px;
	padding: 10px;
	width: 200px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}
</style>
</head>
<body>
	<div class="_2DgV5v _3IlWyc">
		<div class="_1H_1n1"></div>
		<div class="_1vTbrq">Giỏ hàng của bạn còn trống</div>
		<br /> <a class="_3gQPM1" href="Trangchu/Sanpham.do"><button
				class="button" style="vertical-align: middle">
				<span>MUA NGAY </span>
			</button></a>
	</div>
</body>
</html>