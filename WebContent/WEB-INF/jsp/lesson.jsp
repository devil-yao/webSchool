<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="head.jsp"/>
<!DOCTYPE html>
<!-- saved from url=(0038)http://wx.inxedu.com/front/showcoulist -->
<html>
<!--<![endif]--><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no,minimal-ui">
<title>课程列表---智慧树人教育网站</title>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta content="telephone=no" name="format-detection">
<link rel="shortcut icon" href="images/index/favicon.ico" type="image/x-icon">
<!--[if lt IE 9]><script src="http://wx.inxedu.com/static/common/html5.js"></script><![endif]-->
<style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
.en-markup-crop-options {
    top: 18px !important;
    left: 50% !important;
    margin-left: -100px !important;
    width: 200px !important;
    border: 2px rgba(255,255,255,.38) solid !important;
    border-radius: 4px !important;
}
.en-markup-crop-options div div:first-of-type {
    margin-left: 0px !important;
}
</style>
<style type="text/css">
		/* .c-fff {margin-top: 12px;} */
		*{ margin:0; padding:0; list-style:none;}
		a{ text-decoration:none;}
		a:hover{ text-decoration:none;cursor:pointer;}
		#clear{padding: 15px 20px;text-align: left;color: #ccc;text-align: center}
		#clear a{display: inline-block;color: #428bca;display: inline-block;height: 25px;	line-height: 25px;	padding: 0 10px;border: 1px solid #ddd;	margin: 0 2px;border-radius: 4px;vertical-align: middle;}
		#clear a:hover{text-decoration: none;border: 1px solid #428bca;}
		#clear span.current{display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;color: #fff;background-color: #428bca;	border: 1px solid #428bca;border-radius: 4px;vertical-align: middle;}
		#clear span.disabled{	display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;	color: #bfbfbf;background: #f2f2f2;border: 1px solid #bfbfbf;border-radius: 4px;vertical-align: middle;}
</style>
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	var name = "<%=request.getAttribute("name")%>";
	if(name == null || name.trim() == "null"){
		name = "";
	}
</script>
<%request.removeAttribute("name");%>
</head>
<body class="W-body">				
	<div id="aCoursesList" class="bg-f8 of">
		<div class="">
			<div class="container">
				<section class="path-wrap txtOf hLh30">
					<a class="c-999 fsize14" href="index" title="">首页</a>
					
					<span class="c-333 fsize14">课程列表</span>
				</section>
				<section class="c-s-dl coures-option">
					<dl>
						<dd class="c-s-dl-li">
							<ul class="clearfix" id="cate">
								</ul>
							<aside class="c-s-more">
							</aside>
						</dd>
					</dl>
					<div class="clear"></div>
				</section>

				</div>
		</div>
		<!-- /课程列表 开始 -->
		<section class="container">
			<section class="c-sort-box bg-fff c-sort-box-new">
				<div class="js-wrap ">
					<section class="clearfix">
						
						
					</section>
				</div>
				
				<div class="couresnew-big">
					<article class="comm-course-list">
							<ul class="of" id="lesson">
								
									
									</ul>
							<div class="" id="clear"></div>
							<div id="lessonContainer"></div>
						</article>
					</div>

				

			</section>
		</section>
		<!-- /课程列表 结束 -->
	</div>
<script type="text/javascript" src = "js/lesson/lesson.js"></script>
<script type="text/javascript" src = "js/jquery.pagination.min.js"></script>
<!-- </div>
		</div>
	</div> -->
	</body>
	</html>

