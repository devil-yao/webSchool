<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="head.jsp" />
<!DOCTYPE html>
<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no,minimal-ui">
<title>课程详情-智慧树人教育网站</title>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style"
	content="black-translucent">
<meta content="telephone=no" name="format-detection">
<link rel="shortcut icon" href="images/index/favicon.ico" type="image/x-icon">
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
.lh-reply-btn:HOVER{
cursor: pointer;
}
#clear {
	padding: 15px 20px;
	text-align: left;
	color: #ccc;
	text-align: center;
	position: absolute;
	float: left;
	margin-left:20%; 
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
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="js/jquery.pagination.min.js"></script>
</head>
<body class="W-body">
	<div id="videoarea_kMiKK"></div>
	<div class="main-warp">
		<div class="main-infor">
			<div id="aCoursesList" class="bg-f8 of">
				<!-- /课程详情 开始 -->
				<section class="container">
					<section class="path-wrap txtOf hLh30 current">
						<a href="index" title="" class="c-999 fsize14">首页</a> \ <a
							href="lesson" title="" class="c-999 fsize14">课程列表</a> \ <span
							class="c-333 fsize14">课程详情</span>
					</section>
					<div class="cours-big-box">
						<article class="c-v-pic-wrap" style="height: 334px;">
							<section class="p-h-video-box" id="videoPlay">
								<img src="/images/lesson/${lesson.picture }" alt="课程详情" class="dis c-v-pic">
								<a href="javascript:void(0)" id="watch" onclick="judge(this)" class="v-play-btn">
							<em class="icon30">&nbsp;</em>
						</a>
						<section class="zhz-bg"></section>
							</section>
							<section class="p-h-video-tip">
								<img src="images/loading.gif">
								<p class="hLh20">
									<span class="c-999">加载中...</span>
								</p>
							</section>
						</article>
						<aside class="c-attr-wrap">
							<section class="c-attr-wrap-infor">
								<h2 class="hLh30 txtOf">
									<span class="c-333 fsize24">课程详情</span>
								</h2>
								<section class="hLh30 mt15 of c-th-box">
									<ol class="thr-attr-ol clearfix">
										<li>
											<aside>
												<em class="icon16 gms-ico">&nbsp;</em>
												<tt class="c-666 f-fM fsize14 mr5 vam">购买数</tt>
												<tt class="c-333 f-fM fsize14 vam">${lesson.numBuy}</tt>
											</aside>
										</li>
										<li>
											<aside>
												<em class="icon16 kss-ico">&nbsp;</em>
												<tt class="c-666 f-fM fsize14 mr5 vam">课时数</tt>
												<tt class="c-333 f-fM fsize14 vam">${lesson.classNum}</tt>
											</aside>
										</li>
										<li>
											<aside>
												<em class="icon16 lls-ico">&nbsp;</em>
												<tt class="c-666 f-fM fsize14 mr5 vam">浏览数</tt>
												<tt class="c-333 f-fM fsize14 vam">${lesson.numLook}</tt>
											</aside>
										</li>
									</ol>
								</section>
								<section class="c-attr-mt hLh30 of mt10">
									<tt class="c-999 fsize14 f-fM vam">主讲：</tt>
									<tt class="c-999 fsize14 f-fM vam"> ${lesson.techName}</tt>
								</section>
								<section class="c-attr-jg mt15">
									<span class="c-666">价格：</span><big class="c-red">￥${lesson.price}</big>
								</section>

								<section class="c-attr-mt new-cours-btnbox mt30">
									<a href="javascript:void(0)" id="cou-by" title="购买"
										class="comm-btn c-btn-3 cou-buy-btn"
										onclick="buyNow()">购买课程</a>
									<section class="ml15 c-shop-car-wrap disIb">
									<input type="hidden" value="${lesson.classId}" id="hid"/>
										<a class=" c-fff f-fM btnCart" id="cou-shopcar" onclick="addCart()"
											>加入购物车</a>
										<div class="fly_item" id="flyItem">
											<!-- <img width="50" height="50"
												src="images/lesson/default.jpg"> -->
												<c:if test="${user.id == lesson.techId }">
													<script type="text/javascript">
														$("#cou-by").removeAttr("onclick");
														$("#cou-shopcar").removeAttr("onclick");
														$("#watch").removeAttr("onclick");
														$("#cou-by").attr("onclick","alert('无法购买该课程')")
														$("#cou-shopcar").attr("onclick","alert('无法购买该课程')")
														$("#watch").attr("onclick","window.location.href='video_${lesson.classId}'")
													</script>
												</c:if>
										</div>
									</section>
								</section>
							</section>
						</aside>
						<div class="clear"></div>
					</div>
					<!-- /课程封面介绍 -->
					<div class="mt20 c-infor-box">
						<article class="fl col-7">
							<section class="mr30">
								<div class="i-box cou-in-boc " style="height: 658px;">
									<div class="clearfix c-infor-tabTitle c-tab-title">
										<section id="c-i-tabTitle" class="fl">
											<a title="课程评论" href="javascript:void(0)" class="">课程评价</a>
										</section>
									</div>
									<article class="ml10 mr10 new-c-i-b-warp">

										<!-- /课程大纲 -->
										<div id="courseComment">
											<div class="commentHtml">
												<div>
													<section class="lh-bj-list pr replyhtml">
														<ul>
															<li class="unBr">
																<aside class="noter-pic">
																	<img width="50" height="50" class="picImg"
																		src="images/lesson/default.jpg">
																</aside>
																<div class="of">
																	<section class="n-reply-wrap">
																		<div class="numb-box">
																			<fieldset>
																				<textarea name="" placeholder="输入您要评论的文字"
																					id="commentContent"></textarea>
																			</fieldset>
																		</div>
																		<p class="of mt5 tar pl10 pr10">
																			<span class="fl "><tt
																					class="c-red commentContentmeg"
																					style="display: none;"></tt></span> <a
																				onclick="addReview()" title="评论" class="lh-reply-btn">评论</a>
																		</p>
																	</section>
																</div>
															</li>
														</ul>
													</section>
													<section class="">
														<section class="question-list lh-bj-list pr">
															<ul id="allReview" class="pr10">
																
															</ul>
															
														</section>
													</section>
												</div>
											</div>
										</div>
										<!-- /课程评论 -->
										<div id="clear"></div>
									</article>
								</div>
							</section>
						</article>
						
						<aside class="fl col-3">
							<div class="i-box">
								<div>
									<section class="c-infor-tabTitle c-tab-title">
										<span>主讲讲师</span>
									</section>
									<section class="stud-act-list">
										<ul style="height: auto;">
											<li>
												<div class="u-face">
													<a href="tech?techId=${tech.id}"> <img
														src="/images/${tech.head}"
														width="50" height="50">
													</a>
												</div>
												<section class="hLh30 txtOf">
													<a class="c-333 fsize16 fl"
														href="tech?techId=${tech.id}">${tech.login_name }</a>
												</section>
												<section class="hLh20 txtOf">
													<span class="c-999">${tech.dec }</span>
												</section>
											</li>
										</ul>

									</section>
								</div>
							</div>

						</aside>
					</div>
				</section>
				<!-- /课程详情 结束 -->
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
 	function buyNow(){
 		var u = ${empty user};
 		if(u){
 			$("#cou-by").attr("href","login"); 
 		}else{
		var flag = confirm("确认购买?");
		if(flag){
			$.ajax({
				url:"payForLesson",
				data:{classId:${lesson.classId}},
				type:"get",
				success:function(rs){
					alert(rs);
				},
				error:function(){
					alert("系统繁忙，请稍后再试")
				}
			})
		}
	}
 	}
	
function judge(athis){
	var classId = <%=request.getParameter("classId")%>;
	if(${empty user}){ 
		$(athis).attr("href","video_"+classId);
	}else{ 
		if(${lesson.price == 0}){
			$(athis).attr("href","video_"+classId);
		}else{ 
		$.post("confLess",{"classId":classId},function(rs){
			if(rs == "1"){
				window.location.href="video_"+classId;
			}else{
				alert("请先购买该课程");
			}
		})
		}
	}
}

function addCart(){  
	var flag = ${empty user};   
  if(flag){ 
		$("#cou-shopcar").attr("href","login"); 
	}else{
	$.ajax({
		url:"addCart",
		data : {"classId" : $("#hid").val()},
		type:"post",
		async:false,
		success:function(rs){
			showTit();
			if(rs != null && rs.trim() == "false"){
				alert("您已添加或购买过该课程");
			}else{
				alert("添加购物车成功");
			}
		},
		error:function(){
			alert("系统繁忙，请稍后再试")
		}
	});
	};
	//ajax添加购物车结束
}
function addReview(){
	if($("#commentContent").val() == ""){
		return false;
	}

	$.ajax({
		url:"addView",
		data:{
			"conent":$("#commentContent").val(),
			"classId":${lesson.classId} 
		},
		type:"get",
		success:function(rs){
			switch (rs) {
			case "0":
				getAllReview(1);
				$("#commentContent").val("");
				alert("评论成功")
				break;

			case "1":
				window.location.href="login";
				break;
			case "2":
				alert("系统异常，请稍后再试")
				break;
			case "3":
				alert("教师用户不可评论")
				break;
			}
		}
	})
}
function getAllReview(current){
	/*分页5个  */
	$.ajax({
		url:"getReview",
		data:{
			"current":current,
			"pageCount":5
		},
	type:"get",
	dataType:"json",
	success:function(rs){
		alert(JSON.stringify(rs))
		/* "list":[{"classId":1,"head":"head.jpg","id":1,"revTime":"2017-05-09 14:52:19","review":"讲解很详细","userId":9}],"pageCount":5,"total":1 */
		if(rs != null && rs.list != null && rs.list.length != 0){
			$("#allReview").empty();
			for(var i = 0;i<rs.list.length;i++){
				$("#allReview").append("<li><aside class='noter-pic'><img width='50' height='50' class='picImg'	src='/images/"+rs.list[i].head+"'></aside><div class='of'><span class='fl'> <font class='fsize12 c-blue'>"+rs.list[i].name+"</font> <font class='fsize12 c-999 ml5'>评论：</font></span></div><div class='noter-txt mt5'><p>"+rs.list[i].review+"</p>"+
						"</div><div class='of mt5'><span class='fr'><font class='fsize12 c-999 ml5'>"+rs.list[i].revTime+"</font></span></div><div class='n-reply'><section class='n-reply-wrap'><div class='numb-box'><fieldset></fieldset></div></section><div class='mt10 pl10 pr10 pb10 commentReply303'></div></div></li>")
			}
			$('#clear').pagination({
				totalData : rs.total,
				showData : rs.pageCount,
				isHide : false,
				current : current,
				coping : true,
				homePage : '首页',
				endPage : '末页',
				prevContent : '上页',
				nextContent : '下页',
				callback : function(index) {
					var cur = index.getCurrent();
					getAllReview(cur);
				}
			});
		}
	}
	})
}
$(function(){
	getAllReview(1);
})
</script>
</body>
</html>