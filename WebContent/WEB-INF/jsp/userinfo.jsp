<%@page import="com.dwh.tech.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User user = (User) session.getAttribute("user");
%>
<jsp:include page="head.jsp" />
<!DOCTYPE HTML>
<!--[if lt IE 7]>      <html class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9, IE=8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>我的资料</title>
<link rel="shortcut icon" href="images/index/favicon.ico"
	type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
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
<body class="W-body">

	<div class="in-wrap">
		<div class="h-mobile-mask"></div>

		<div class="main-warp">
			<div class="main-infor">
				<div class="bg-fa of">
					<!-- /个人中心 主体 开始 -->
					<section class="container">
						<div class="u-body mt30">
							<menu class="col-20 fl uMenu">
								<section class="of u-left-top">
									<div class="u-face-pic">
										<img src="/images/${user.head}" alt="用户头像"
											class="userImgPhoto">

									</div>
									<div class="hLh20 txtOf mt10">
										<span class="c-master f-fM fsize16">Hi~</span>
									</div>
									<h4 class="hLh30 txtOf c-master mt5">
										<a href="javascript:void(0)"
											class="fsize14 c-333 userNameClass"><%=user.getLogin_name()%></a>
									</h4>
								</section>
								<div>
									<ul id="navList" class="uM-list">

										<li><a href="javascript:void(0)" title="个人资料"
											onclick="showInfo()"> <em
												class="icon24 uM-grzl-ico uM-list-ico mr5">&nbsp;</em>
											<tt class="vam">个人资料</tt>
										</a></li>
										<li><a href="javascript:void(0)" title="密码设置"
											onclick="showPwd()"> <em
												class="icon24 uM-mmsz-ico uM-list-ico mr5">&nbsp;</em>
											<tt class="vam">密码设置</tt>
										</a></li>
										<li><a href="javascript:void(0)" title="我的订单"
											onclick="showOrder()"> <em
												class="icon24 uM-mmsz-ico uM-list-ico mr5">&nbsp;</em>
											<tt class="vam">我的订单</tt>
										</a></li>

									</ul>
								</div>
							</menu>
							<!-- /公共左侧菜单 结束 -->
							<!-- 左侧，结束 -->

							<article class="col-80 fl">
								<div class="u-r-cont">
									<section>
										<div class="">
											<section class="u-r-tit-all">
												<h2 class="unFw">
													<span class="f-fH current" id="myinfo" > 我的信息</span>
													<span class="f-fH current" id="mypwd" style="display: none;"> 密码修改</span>
													<span class="f-fH current" id="myorder" style="display: none;"> 我的订单</span>
												</h2>
											</section>
											<div class="u-r-all-box" id="p_tCont">
												<!--修改头像，开始-->
												<div class="u-account-box" id="info">
													<div class="clearfix">
														<section class="fl u-acc-l">
															<div class="tac ur-titpic">
																<span class="u-r-t-picin"> <img id="img"
																	src="/images/${user.head}">
																</span>
															</div>
															<form id="updateInfo" method="post"
																enctype="multipart/form-data">
																<div class="tac ur-titbtn">
																	<input type="file" id="file" name="file"
																		style="display: none;"
																		accept="image/jpg,image/jpeg,image/png" /><br /> <a><label
																		for="file" id="label">修改头像</label></a>
																</div>
															</form>
														</section>
														<form id="update" method="post">
															<div class="fl u-acc-bottom">
																<ol class="u-account-li tac">
																	<li><label class="u-a-title"> <span
																			class="fsize16 c-999">手机号</span>
																	</label> <input id="phone" type="text" class="u-a-inpt"
																		name="phone" maxlength="11" value="${user.phone}">
																		<br />
																	<span id="tel_span" class=""></span></li>
																	<li><label class="u-a-title"> <span
																			class="fsize16 c-999">昵 称</span>
																	</label> <input id="changeShowName" type="text"
																		class="u-a-inpt" name="loginName"
																		value="${user.login_name}"> <br />
																	<span id="name"></span></li>
																	<li><label class="u-a-title"> <span
																			class="fsize16 c-999">性 别</span>
																	</label>
																		<div
																			style="display: inline-block; border: 0px; width: 155px;">
																			<input type="radio" name="sex" value='男'
																				<%if (user.getSex().equals("男")) {%>
																				checked="checked" <%}%>><span
																				class="fsize16 c-999">男</span>
																		</div>
																		<div
																			style="display: inline-block; border: 0px; width: 160px;">
																			<input type="radio" name="sex" value="女"
																				<%if (user.getSex().equals("女")) {%>
																				checked="checked" <%}%>><span
																				class="fsize16 c-999">女</span>
																		</div></li>
																<%-- 	<li><label class="u-a-title"> <span
																			class="fsize16 c-999">邮 箱</span>
																	</label> <input type="text" class="u-a-inpt" name="email"
																		id="u-email" value="${user.email}"
																		placeholder="请输入邮箱补全信息"> <br />
																	<span id="sp_email"></span></li> --%>
																</ol>
																<!-- <div class="mt10 hLh30 tac fsize14 c-333 f-fM">注：完善信息方便找回密码，账户更安全。</div> -->
																<section class="u-o-right mt50 tac">
																	<a class="cou-kscp big-all-btn"
																		href="javascript:void(0)" onclick="updateUserInfo()">更
																		新 资 料</a>
																</section>
															</div>
														</form>
													</div>
												</div>

												<!--修改密码，开始-->
												<div class="u-account-box undis" id="password"
													style="display: none">
													<form method="post" name="pwdForm" id="pwdForm">
														<ol class="u-account-li tac">
															<li><label class="u-a-title"> <span
																	class="fsize16 c-999">旧密码</span>
															</label> <input type="password" id="oldPassword" class="u-a-inpt"
																name="oldPassword" maxlength="16"> <span
																class="u-a-error" id="span_old"></span></li>
															<li><label class="u-a-title"> <span
																	class="fsize16 c-999">新密码</span>
															</label> <input id="pwd" type="password" class="u-a-inpt"
																name="newPassword" maxlength="16"> <span
																class="u-a-error" id="span-pwd"></span></li>
															<li><label class="u-a-title"> <span
																	class="fsize16 c-999">新密码确认</span>
															</label> <input id="confirmPwd" type="password" class="u-a-inpt"
																name="confirmPwd" maxlength="16"> <span
																class="u-a-error" id="span-confirmPwd"></span></li>
														</ol>
													</form>
													<section class="u-o-right mt50 tac">
														<a href="javascript:void(0)" title="修 改 密 码"
															class="cou-kscp big-all-btn mr20" onclick="updatePwd();">修
															改 密 码</a>
													</section>
												</div>
												<!--修改密码，结束-->
												<!-- 个人订单，开始 -->
											<div >
												<div class="u-order-wrap">
												<dl id="order" style="display: none;">
												</dl>
												</div>
											</div>
						<!-- 个人订单，结束-->						
											</div>
										</div>
									</section>
									<!-- /我的资料 -->
								</div>
							</article>
							<!-- /右侧内容区 结束 -->
							<!-- /右侧内容区 结束 -->
							<div class="clear"></div>
						</div>
					</section>
					<!-- /个人中心 主体 结束 -->
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="js/userinfo/userinfo.js"></script>
<script type="text/javascript" src="js/userinfo/pwd.js"></script>
<script type="text/javascript" src = "js/jquery.pagination.min.js"></script>
</html>
