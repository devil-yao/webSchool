<%@page import="oracle.net.aso.s"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>登录--智慧树人教育网站</title>
<link rel="stylesheet" href="css/login/style.css">
<link rel="shortcut icon" href="images/index/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/index/reset.css">
<link rel="stylesheet" type="text/css" href="css/index/global.css">
<link rel="stylesheet" type="text/css" href="css/index/web.css">
<link rel="stylesheet" type="text/css" href="css/index/theme.css">
<link href="css/index/mw_320_768.css" rel="stylesheet" type="text/css" media="screen and (min-width: 320px) and (max-width: 768px)"></head>
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
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
			<aside class="h-r-search">
				<!-- <div class="pr h-r-s-box-cx">
					<form action="http://wx.inxedu.com/front/showcoulist" method="post" id="headerformSearch">
						<label class="h-r-s-box"><input type="text" value="" id="headerSearchName" name="queryCourse.courseName" placeholder="搜索...">
						<button class="s-btn" type="submit"> <em class="icon18">&nbsp;</em> </button></label>
					</form>
				</div> -->
			</aside>
		</div>
		
		<div class="clear mobile-clear"></div>
	</section>
</header>

<div class="cotn_principal">
  <div class="cont_centrar">
    <div class="cont_login">
      <div class="cont_forms" >
         <div class="cont_img_back_"> <img src="images/po.jpg"/> </div> 
         <form>
	        <div class="cont_form_login">
	          <h2>登录</h2>
	          <p style="color:red;" id="error"></p>
	          <input type="text" id="phone" name="phone" placeholder="phone/loginName" />
	          <span class="phone"></span>
	          <input type="password" id="password" name="password" maxlength="16" placeholder="Password" />
	          <span class="password"></span>
	          <input class="captch" id="capcha" type="text" onblur="confirm(this)" placeholder="captcha" style = "width:170px;" /><div id="contain" ></div>
	          <span id="cp"></span>
	          <button class="btn_login" type="button" id="submitlogin">登录</button>
	          <p class="cash">-----没有账号-----</p>
	          <a class="btn_sign_up" onClick="cambiar_sign_up()">注册</a>
	        </div>
	        </form>
        <div class="cont_form_sign_up">
          <h2>注册</h2>
          <input type="text" placeholder="phone" id="tel" maxlength="11" onblur="telConfirm()" />
          <span id="tel_span"></span>
          <input type="text" id="loginName" onblur="namesConfirm(this)" placeholder="loginName" />
          <span id="name"></span>
          <input type="password" maxlength="16" id="reg_pwd" placeholder="Password" />
           <span id="reg_span"></span>
          <input class="captch" id="confirmPassword" maxlength="16" type="password" placeholder="Confirm Password" onblur="confirmpwd()" />
           <span id="confirm"></span>
          <button class="btn_sign_up" onClick="regin()">注册</button>
          <p class="cash">-----已有账号-----</p>
          <a class="btn_login" onClick="cambiar_login()">登录</a>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/login/index.js"></script>
<script src="js/login/regin.js"></script>
<script src="js/login/login.js"></script>
<script src="js/login/gVerify.js"></script>
</body>
</html>
