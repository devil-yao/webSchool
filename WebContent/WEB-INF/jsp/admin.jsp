<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9, IE=8">
<title>智慧树人教育网站后台</title>
	<link rel="shortcut icon" href="images/index/favicon.ico" type="image/x-icon">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" href="css/admin/layui.css" media="all">
<link rel="stylesheet" href="css/admin/global.css" media="all">
<link id="layuicss-skinlayercss" rel="stylesheet" href="css/admin/layer.css" media="all">
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
</style>
<link id="layuicss-skincodecss" rel="stylesheet" href="css/admin/code.css" media="all">
<link id="layuicss-laydatecss" rel="stylesheet" href="css/admin/laydate.css" media="all"></head>
<body>
	
<div class="layui-layout layui-layout-admin">
	<div class="layui-header header header-demo">
		<div class="layui-main">
			<a class="logo" href="index">
				<img src="images/logo.png">
			</a>
			<ul class="layui-nav layui-right-header-item larry-header-item" lay-filter="">
				<li class="layui-nav-item first">
					<a class="current" href="javascript:void(0)">
						<!-- <i class="iconfont icon-jiaoseguanli2"></i> -->
						<cite>${admin.sysName }</cite>
					<!-- <span class="layui-nav-more"></span> --></a>
					<!-- <dl class="layui-nav-child layui-anim layui-anim-upbit">
						<dd>
							
						</dd>
						</dl> -->
				</li>
				<li class="layui-nav-item">
					<a class="current" href="outlogin">
						<!-- <i class="iconfont icon-exit"></i> -->
						退出
					</a>
				</li>
			<!-- <span class="layui-nav-bar" style="left: 10px; top: 62px; width: 125px; opacity: 1;"></span> --></ul>
		</div>
	</div>
	
	<div class="layui-side layui-bg-black">
		<div class="layui-side-scroll">
			<ul class="layui-nav layui-nav-tree site-demo-nav" lay-filter="leftnav" id="ui-sMenu"><li class="layui-nav-item layui-nav-itemed lefta">
			<a class="m-l-f-a" href="javascript:">系统管理<span class="layui-nav-more"></span></a>
				<dl class="layui-nav-child">
						<dd>
							<a href="userList" title="学员列表" target="comment">学员列表</a>
						</dd>
						<dd>
							<a href="teacherList" target="comment" title="讲师列表">讲师列表</a>
						</dd>
						<dd>
							<a href="addTech" target="comment" title="添加讲师">添加讲师</a>
						</dd>
						<dd>
							<a href="lessAdd" target="comment" title="添加课程" >添加课程</a>
						</dd>
						<dd>
							<a href="addQuestion" target="comment" title="添加题目">添加试题</a>
						</dd>
				</dl>
				</li>
<span class="layui-nav-bar" style="top: 22.5px; height: 0px; opacity: 0;"></span></ul>

		</div>
	</div>
	<div class="layui-body site-demo">
		<div class="layui-tab layui-tab-card headertab" lay-allowclose="true" lay-filter="admintab" style="min-height: 538px;">
			<ul class="layui-tab-title">

			<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
			<iframe name="comment" src="adminIndex" width="100%" height="100%" scrolling="yes" frameborder="no" border="0" style="height: 459px;margin-top: 30px;"></iframe>
			</div>
			</div>
		</div>
	</div>
	<div class="layui-footer footer footer-demo">
		<div class="layui-main">
			<p>
				Powered by <a href="index" target="_blank">智慧树人教育网站</a>
			</p>
		</div>
	</div>
	<div class="site-tree-mobile layui-hide">
		<i class="layui-icon"></i>
	</div>
	<div class="site-mobile-shade"></div>
	
</div>


</body></html>