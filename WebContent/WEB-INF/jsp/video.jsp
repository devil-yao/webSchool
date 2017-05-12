<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>播放大厅--智慧树人教育网站</title>
	<!--[if lt IE 9]><script src="http://wx.inxedu.com/static/inxweb/js/html5.js"></script><![endif]-->
	<style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
.	en-markup-crop-options {
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
<style type="text/css" media="screen">
#flashContent {display:block;text-align:left;}
</style>
<style type="text/css">
video::-webkit-media-controls-enclosure {
    overflow:hidden;
}
video::-webkit-media-controls-panel {
     width: calc(100% + 30px); 
}
a:HOVER{
cursor: pointer;
}
</style>
</head>
<body>
<div id="videoarea_xhijM"></div>
	<section class="new-pl-vi-box pr">
		<article class="n-p-v-bottom clearfix">
			<div class="pr n-p-vb-in">
				<div class="n-p-v-b-lt">
					<section class="playBox" id="videoPlay" style="height: 499px;">

<div id="play" style="width: 100%;height: 100%">
 <video onended="changeVideo(1)" id="video_player" autoplay="autoplay"  height='100%' width='100%' controls preload="auto" >
<embed id="video_embed" onended="changeVideo(1)" autoplay="true" controller="true"  height='100%' width='100%' allowscriptaccess="always" allowfullscreen="true"></emben>
</video> 


	</div>	
	</section>
				</div>
				<article class="video-open-btn" id="o-c-btn">
					<a href="javascript:void(0);" title="展开" class="">&nbsp;</a>
				</article>
				<div class="n-p-v-b-rt">
					<section class="n-p-v-b-rt-in" style="height: 499px;">
						<section class="p-h-r-title">
							<ol id="p-h-r-title">
								<li class="current">
									<a class="course_mulu" href="javascript: void(0)" title="课程目录">课程目录</a>
								</li>
							</ol>
							<div class="clear"></div>
						</section>
						<div id="chapter" class="p-h-r-list">
							<menu id="lh-menu" class="lh-menu" tabindex="5000" style= "overflow: hidden; outline: none; height: 439px;">
								<ul>
									<!-- 视频 而且没有父级-->
											<li class="lh-menu-stair">
												<ul id="chapterList" class="lh-menu-ol no-parent-node">
													
													<c:forEach items="${videos}" var="video" varStatus="status">
													<li class="lh-menu-second current-2" data-url="${video.url }" data-post="${video.post }" >
														<div class="l-m-stitle clearfix">
															<span class="fr mr20"></span>
																	<span class="">
													<!-- <em class="lh-p-icon-yp icon20">&nbsp;</em> -->
													</span>
															<a id="playKpointId24${status.index }" data-url="${video.url }" data-post="${video.post }" onclick="video(this)" class="cou-tit-txt">
																	${status.index+1}.${video.chapterName }</a>
														</div>
													</li>
													</c:forEach>
													
												</ul>
											</li>
										<!-- 视频 而且没有父级-->
										</ul>
							</menu>
						</div>
						<div id="note" class="undis">
							<div class="video-bj-warp" id="notesContext"><div class="mt10">
	
</body>
<script type="text/javascript">
function video(video) {
	var url = video.getAttribute("data-url");
	var post = video.getAttribute("data-post");
$("#video_player").attr("src","/images/"+url); 
$("#video_embed").attr("src","/images/"+url); 
$("#video_player").attr("poster","/images/lesson/"+post); 
}

$(function(){
	var vide = document.getElementById("playKpointId240")
	video(vide)
})
function changeVideo(index){
	var total = $("#chapterList li").length;
	if(index < total){
		var url = $("#chapterList li")[index].getAttribute("data-url");
		var post = $("#chapterList li")[index].getAttribute("data-post")
	 	$("#video_player").attr("src","/images/"+url); 
		$("#video_embed").attr("src","/images/"+url); 
		$("#video_player").attr("poster","/images/lesson/"+post); 
	}
}
</script>
</html>