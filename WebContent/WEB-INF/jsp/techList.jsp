<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no,minimal-ui">
<title>讲师列表--智慧树人教育网站</title>
<link rel="shortcut icon" href="images/index/favicon.ico"
	type="image/x-icon">

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
	cursor:pointer;
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
<body class="W-body">

	<div class="in-wrap">
		<div class="h-mobile-mask"></div>

		<div class="main-warp">
			<div class="main-infor">
				<!-- 公共头引入 -->
				<!-- /global header begin-->
				<!-- /global header end-->

				<!-- 公共头引入 -->

				<div id="aCoursesList" class="of bg-f8">
					<div class="bg-fff">
						<div class="container">
							<section class="path-wrap txtOf hLh30">
								<a class="c-999 fsize14" href="http://wx.inxedu.com/" title="">首页</a>

								<span class="c-333 fsize14">讲师列表</span>
							</section>
							<section class="new-all-cou-list">
								<ul class="clearfix" id="cate">
									
								</ul>
							</section>
						</div>
					</div>
					<!-- /课程列表 开始 -->
					<section class="container">
						<section class="c-sort-box unBr mt20">
							<div>
								<!-- /无数据提示 开始-->
								<!-- /无数据提示 结束-->
								<article class="i-teacher-list">
									<ul class="of" id="list">
										
									</ul>
									<div class="clear"></div>
								</article>
							</div>
							<!-- 分页 -->
							<div class="" id="clear"></div>
				</div>
				<script>
					$(function() {
						/*给选中的专业加选中样式*/
						var subjectId = '0';
						if (subjectId == '0') {
							$(".new-all-cou-list ul li").first().addClass(
									"current")
						} else {
							$("#" + subjectId).parent().addClass("current")
						}
					})
				</script>
			</div>
		</div>
	</div>
	<div class="mo-footer">
		<!-- 公共底引入 -->

		<!-- 公共底引入 -->
	</div>

</body>
<script type="text/javascript" src="js/jquery.pagination.min.js"></script>
<script type="text/javascript" src="js/tech/tech.js"></script>
</html>