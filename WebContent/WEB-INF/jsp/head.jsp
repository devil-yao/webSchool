<%@page import="com.dwh.tech.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="images/index/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/index/reset.css">
<link rel="stylesheet" type="text/css" href="css/index/global.css">
<link rel="stylesheet" type="text/css" href="css/index/web.css">
<link rel="stylesheet" type="text/css" href="css/index/theme.css">
<link href="css/index/mw_320_768.css" rel="stylesheet" type="text/css" media="screen and (min-width: 320px) and (max-width: 768px)">
<style type="text/css">
.mm{
	width:15px;
	heigth:15px;
	border-radius:15px;
	border:1px solid #fff;
	font-size:10px;
	display:block;
	background:red;
	position:absolute;
	top:3px;
	left:50px;
	color:#fff;
	text-align: center;
}
</style>
</head>
<body>
<header id="header">
	<section class="container">
		<h1 id="logo">
			<a class="headerlogo"  href="index" title="智慧树人教育网站">
				<img src="images/index/indexU.png" width="100%" alt="智慧树人教育网站">
			</a>
		</h1>
		<div class="h-r-nsl">
			<ul class="nav">
				<li><a href="index" title="首页" >首页</a></li>
				<li><a href="lesson" title="课程" >课程</a></li>
				<li><a href="examChoose" title="试题" >试题</a></li>
				<li><a href="techList" title="名师" >名师</a></li>
				</ul>
			<!-- / nav -->
			<ul class="h-r-login clearfix">
			
			<% User user = (User)session.getAttribute("user");
			if(user == null){ %>
				<li class="undis h-login-li" id="no-login">
					<a href="login" title="登录/注册">
						<span class="vam ml5">登录/注册</span>
					</a>
				</li>
				<%}else{ %>
				<li class="h-r-user undis h-login-li loginedLiShow">
					<a href="userinfo">
						<img src="/images/${user.head }" width="30" height="30" class="vam picImg" alt="头像"/>
						<span class="vam disIb c-master" id="userName"><%=user.getLogin_name() %></span>
					</a>
				</li>
				<li class="h-r-user undis h-login-li loginedLiShow">
					<a href="cart" title="购物车" class="ml10 vam">
						<span class="vam disIb c-fff">购物车</span>
					</a><div style="display:none;" class="mm">0</div>
				</li>
				<li class="h-r-user undis h-login-li loginedLiShow">
					<a href="javascript:void(0)" title="退出" onclick="exit();" class="ml10 vam">
						<span class="vam disIb c-fff">退出</span>
					</a>
				</li>
				<%} %>
			</ul>
			<aside class="h-r-search">
				<div class="pr h-r-s-box-cx">
					<form action="lesson" method="post" id="headerformSearch">
						<label class="h-r-s-box"><input type="text" value="" id="headerSearchName" name="name" placeholder="课程搜索...">
						<button class="s-btn" type="submit"> <em class="icon18">&nbsp;</em> </button></label>
						<!-- <input type="hidden" value="1" name="type"/> -->
					</form>
				</div>
			</aside>
		</div>
		<div class="clear mobile-clear"></div>
	</section>
</header>
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="js/index/index.js"></script>
<!-- <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> -->
<script type="text/javascript">
$(function(){
	showTit();
})
 function showTit(){
		 $.ajax({
			url:"getCount",
			type:"post",
			data:{"userId":"${sessionScope.user.id}"},
			success:function(rs){
				$(".mm").text(rs.trim());
				if($(".mm").text() != "0"){
					$(".mm").show();
				}
			}
		});
	 }
</script>

</body>
</html>