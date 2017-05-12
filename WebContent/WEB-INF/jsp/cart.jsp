<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="head.jsp" />
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>购物车--智慧树人教育网站</title>
<link rel="shortcut icon" href="images/index/favicon.ico"
	type="image/x-icon">
<link href="css/cart/myCart.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src = "js/jquery.pagination.min.js"></script>
<script type="text/javascript" src="js/cart/myCart.js"></script>
<script type="text/javascript" src="js/cart/detail.js"></script>
<style type="text/css">
a:HOVER {
	cursor: pointer;
}
/* .c-fff {
	margin-top: 12px;
} */
* {
	margin: 0;
	padding: 0;
	list-style: none;
}
a {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
#clear {
	padding: 15px 20px;
	text-align: left;
	color: #ccc;
	text-align: center
}
#clear a {
	display: inline-block;
	color: #428bca;
	display: inline-block;
	height: 25px;
	line-height: 25px;
	padding: 0 10px;
	border: 1px solid #ddd;
	margin: 0 2px;
	border-radius: 4px;
	vertical-align: middle;
}
#clear a:hover {
	text-decoration: none;
	border: 1px solid #428bca;
}
#clear span.current {
	display: inline-block;
	height: 25px;
	line-height: 25px;
	padding: 0 10px;
	margin: 0 2px;
	color: #fff;
	background-color: #428bca;
	border: 1px solid #428bca;
	border-radius: 4px;
	vertical-align: middle;
}
#clear span.disabled {
	display: inline-block;
	height: 25px;
	line-height: 25px;
	padding: 0 10px;
	margin: 0 2px;
	color: #bfbfbf;
	background: #f2f2f2;
	border: 1px solid #bfbfbf;
	border-radius: 4px;
	vertical-align: middle;
}
</style>
</head>
<body>
	<div id="content">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			id="shopping">
			
		</table>
	</div>
	<div class="" id="clear"></div>
</body>
</html>