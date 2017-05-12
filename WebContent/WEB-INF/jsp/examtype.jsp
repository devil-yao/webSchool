<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no,minimal-ui">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>考试首页--智慧树人教育网站</title>
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/exam/exam-style.css">
<link rel="stylesheet" href="css/exam/examtheme.css">
<!-- <link rel="stylesheet" href="css/exam/mw_320_768_002.css">
<link rel="stylesheet" href="css/exam/mw_320_768.css"> -->
	
	
	<style type="text/css">
		.n-i-m-bottom{display: block}
	</style>
	<style type="text/css">
	body {
	overflow: hidden;
}
	</style>
</head>
<body>
<div class="e-wrap in-wrap">
		<div class="main-warp">
			<div class="main-infor">
<div class="e-main">
	<div class="exam-banner">
		<img class="imgload" src="images/exam/exam-banner.jpg" alt="考试首页">
				</div>
	<div class="container ">
		<div class="clearfix p-nav-box">
				<div class="fl col80">
					<div class="ex-per-nav">
							<div class="c-1-content">
								<span>请选择试卷类型</span></div>
							<ul class="clearfix" id="type">
								
								<div class="clear"></div>
							</ul>
						</div>
						</div>
					</div>
			</div>
		</div>
</div>
</div>
		</div>
	</div>
	<script type="text/javascript">
		$.ajax({
			url:"getCate",
			type:"get",
			dataType:"json",
			async:false,
			success:function(rs){
				for(var i in rs){
					$("#type").append("<li><a href='exam?type="+rs[i].id+"' title='"+rs[i].cateName+"'>"+rs[i].cateName+"</a></li>")
				}
				
			}
		} )
	</script>
</body>
</html>