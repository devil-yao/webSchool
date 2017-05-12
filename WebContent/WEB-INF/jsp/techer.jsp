<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no,minimal-ui">
<title>教师在线--智慧树人教育网站</title>
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style"
	content="black-translucent" />
<meta content="telephone=no" name="format-detection" />
<link rel="shortcut icon" href="images/index/favicon.ico"
	type="image/x-icon">
<script type="text/javascript" src="js/index/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
.en-markup-crop-options {
	top: 18px !important;
	left: 50% !important;
	margin-left: -100px !important;
	width: 200px !important;
	border: 2px rgba(255, 255, 255, .38) solid !important;
	border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
	margin-left: 0px !important;
}
</style>
<style type="text/css">
.t-infor-pic img{width:270px;height:270px;}
.course-img img{width:257.5px;height:143.5px;}
</style>
<script type="text/javascript">
	var techId = <%=request.getParameter("techId")%>;
	$.ajax({
		url:"getLesson",
		data:{"techId":techId},
		type:"post",
		dataType:"json",
		success:function(rs){
			if(rs==null || rs == "null" || rs.length == 0){
				return false;
			}
			for(var i = 0;i<rs.length;i++){
				$("#myLess").append("<li><div class='cc-l-wrap'><section class='course-img'>" +
						"<a href='lessonDetail?classId="+rs[i].classId+"'><img src='/images/lesson/"+rs[i].picture+"' class='img-responsive'></a></section><div class='coure-bg-g'><h3 class='hLh30 txtOf'>" +
						"<a href='lessonDetail?classId="+rs[i].classId+"' class='course-title fsize16 c-333'>"+rs[i].className+"</a></h3><section class='mt10 hLh20 of'><span class='fr'>" +
						"<tt class='c-green fsize12 f-fA'>"+parseFloat(rs[i].price).toFixed(2)+"</tt></span><span class='fl jgAttr c-ccc f-fA'>" +
						"<tt class='c-999 f-fA mr10'>"+rs[i].numBuy+"人购买</tt>" +
						"<tt class='c-999 f-fA span-2'>"+rs[i].numLook+"浏览</tt></span></section></div></div></li>");	
			}
		}
	})
</script>
</head>
<body class="W-body">
	<div id="aCoursesList" class="bg-f8 of">
		<!-- /课程列表 开始 -->
		<section class="container">
			<header class="comm-title">
				<h2 class="fl tac">
					<span class="c-333">讲师介绍</span>
				</h2>
			</header>
			<div class="t-infor-wrap bg-fff">
				<section class="t-infor-box c-desc-content">
					<div class="">
						<section class="t-infor-pic">
							<img src="/images/${requestScope.techInfo.head}">
						</section>
						<h3 class="hLh30">
							<span class="fsize24 c-333">首席讲师&nbsp;${requestScope.techInfo.login_name }</span>
						</h3>
						<section class="mt10">
							<!-- <span class="t-tag-bg">资深课程设计专家，专注10年AACTP美国培训协会认证导师</span> -->
						</section>
						<section class="t-infor-txt">
							<p class="mt20">${requestScope.techInfo.dec}</p>
						</section>
						<div class="clear"></div>
					</div>
				</section>
				<div class="clear"></div>
			</div>
			<section class="mt30">
				<div>
					<header class="comm-title all-teacher-title c-course-content">
						<h2 class="fl tac">
							<span class="c-333">主讲课程</span>
						</h2>
						<section class="c-tab-title">
							<a href="javascript: void(0)">&nbsp;</a>
						</section>
					</header>
					<section class="bg-fff artil-list-box">
						<article class="comm-course-list">
							<ul class="of" id="myLess">
								
							</ul>
							<div class="clear"></div>
						</article>

					</section>
				</div>
			</section>
		</section>
		<!-- /课程列表 结束 -->
	</div>
</body>
</html>