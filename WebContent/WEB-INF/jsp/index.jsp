<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="head.jsp"/>
<!DOCTYPE HTML>
<!--[if lt IE 7]>      <html class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no,minimal-ui">
<title>在线学习--智慧树人教育网站</title>
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta content="telephone=no" name="format-detection" />
<link rel="shortcut icon" href="images/index/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="js/index/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
</head>
<body class="W-body">
<style>
	.mbqh-qt{width:32px;position: fixed;top:70px;left: 0;z-index: 9999999;}
	.mbqh-qt ul li{display: block;width: 32px;height: 80px;position: absolute;}
	.mbqh-qt ul li a {color: #fff;display: block;font-size: 14px;line-height: 18px;margin-top: 12px;padding: 0 0 0 6px;width: 20px;}
	/* .mbqh-qt ul li.li-1{background: url("/static/inxweb/img/indexchange/li-1.png") no-repeat top left;z-index: 99;top:0px;right: 0;}
	.mbqh-qt ul li.li-2{background: url("/static/inxweb/img/indexchange/li-2.png") no-repeat top left;z-index: 100;top:75px;right: 0;}
	.mbqh-qt ul li.li-3{background: url("/static/inxweb/img/indexchange/li-3.png") no-repeat top left;z-index: 101;top:150px;right: 0;}

	.mbqh-qt ul li.li-1:hover,.mbqh-qt ul li.li-1.current{background: url("/static/inxweb/img/indexchange/li-1-xz.png") no-repeat top left;}
	.mbqh-qt ul li.li-2:hover,.mbqh-qt ul li.li-2.current{background: url("/static/inxweb/img/indexchange/li-2-xz.png") no-repeat top left;}
	.mbqh-qt ul li.li-3:hover,.mbqh-qt ul li.li-3.current{background: url("/static/inxweb/img/indexchange/li-3-xz.png") no-repeat top left;} */
	.mbqh-qt ul li:hover a{text-decoration: none;}
	.cc-l-wrap{width:267.5px height:149.2px}
	
</style>
<div class="i-slide banner-slide">
		<section>
			<!-- 如果需要导航按钮 -->
			<a class="arrow-left s-arrow" href="javascript:void(0)"></a>
			<a class="arrow-right s-arrow" href="javascript:void(0)"></a>
			<!-- 图片位置 -->
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
							<a target="_blank" href="index">
								<img class="imgload" src="images/index/li-1.jpg" alt="首页banner图-01">
							</a>
						</div>
					<!-- <div class="swiper-slide">
							<a target="_blank" href="index">
								<img class="imgload" src="http://wx.inxedu.com/images/upload/image/20161201/1480559338591.jpg" alt="首页banner图片02">
							</a>
						</div> -->
					</div>
			</div>
			<!-- 如果需要分页器 -->
			<div class="pagination"></div>
		</section>
	</div>
	<!-- /index slide -->
	<div id="aCoursesList" class="of index-bg">
		<!-- /网校课程 开始 -->
		<div class="of bg-f8">
			<section class="container">
				<header class="comm-title">
					<span class="fr mt15 mr10 hyh"><a href="lesson" title="更多" class="c-master fsize14" target="_blank" >更多 &gt;</a></span>
					<h2 class="fl tac tit-header">
						<span class="c-333">精品课程</span>
					</h2>
				</header>
				<div>
					<article class="comm-course-list">
						<ul id="goodCourse" class="current">
							
								
								</ul>
								<!-- 精品课程结束 -->
								
						
						<div class="clear"></div>
					</article>
				</div>
			</section>
		</div>
		<!-- /网校课程 结束 -->
			
		<!-- /网校名师 开始 -->
		<div class="of bg-f8">
			<section class="container">
				<header class="comm-title">
					<span class="fr mt15 mr10 hyh"><a href="techList" title="更多" class="c-master fsize14" target="_blank">更多 &gt;</a></span>
					<h2 class="fl tac tit-header">
						<span class="c-333">校内名师</span>
					</h2>
				</header>
				<div>
					<article class="i-teacher-list">
						<ul class="of" id="iteach">
							
							
							</ul>
						<div class="clear"></div>
					</article>
				</div>
			</section>
				</div>
		<!-- /网校名师 结束 -->
		</div>
	</div>
	<div class="mo-footer">
<footer id="footer">
	<section class="container">
		<div class="b-foot">
			<section class="fl col-80">
				<section class="mr20">
					<section class="b-f-link mt20">
						<a href="javascript:void(0)" title="加入我们" >加入我们</a>|
						<a href="javascript:void(0)" title="关于我们" >关于我们</a>|
						<span>服务热线：17721120095</span>
						<span>Email：787767641@qq.com</span>
						<span class="ml30"></span>
					</section>
					<section class="b-f-link mt10">
						<span class="c-666">Powered by<a title="智慧树人教育网站" target="_blank" href="index" class="c-666">智慧树人教育网站</a></span>
						<!-- 统计代码 -->
						</section>
				</section>
			</section>
			<div class="clear"></div>

		</div>
	</section>
</footer>
<!-- 公共底引入 -->
	</div>
</body>
</html>