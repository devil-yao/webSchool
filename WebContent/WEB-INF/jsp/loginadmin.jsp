<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Meta -->
<meta charset="utf-8" http-equiv="Content-Type" />
<!-- End of Meta -->
<!-- Page title -->
<title>后台登录 - 智慧树人教育网站</title>
<!-- End of Page title -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<!-- Libraries -->
<link type="text/css" href="css/admin/login.css" rel="stylesheet" />
<script type="text/javascript" src = "js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src = "js/login/gVerify.js"></script>
</head>
<body>
	<div id="container">
		<div class="logo">
			<a href="index" target="_blank" title="智慧树人教育网站">
				<img src="images/logo.png" width="200" alt="智慧树人教育网站" />
			</a>
		</div>
	</div>

	<div class="b-box">
		<div id="container">
			<div id="box">
				<h2>网校后台管理系统</h2>
				<form action="adminLoginConfig" method="POST" id="loginForm">
					<p class="main">
						<label>用户名: </label>
						<input id="sysName" name="loginName" value="${sysName}" placeholder="输入用户名" />
						<label>密码: </label>
						<input id="sysPwd" type="password" name="loginPwd" placeholder="输入密码">
					</p>
					<p class="main">
						<label>验证码: </label>
						<input id="vcode" name="randomCode" onkeyup="enterSubmit(event)" placeholder="验证码" style="width: 105px;"  maxlength="4"/>
						<span class="yzm-pic" id = "code">
							<!-- //验证码 -->
						</span>
					</p>
					<p class="space">
						<input type="button" id="log" onclick="judegLogin()" value="登录" class="login" />
						<span id = "error">${message}</span> 
					</p>
				</form>
			</div>
			<div class="login-foot">
				<span>
					Powered By <a target="_blank" href="index" style="color: #666;">智慧树人教育网站</a>
				</span>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
			function enterSubmit(event) {
				var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
				if (keyCode == 13) {
					judegLogin();
					return false;
				}
			}
$(function(){
	code = new GVerify({
		id:"code"
	});
})
	function judegLogin(){
		var flag = ${empty sys_status} 
		 if( !flag){
			alert("该管理员账号已被封停");
			return false;
		} 
		
		$("#error").text("");
		var name = $("#sysName").val();
		if(name == null || name == ""){
			$("#error").text("用户名不能为空");
			return false;
		}
		var pwd = $("#sysPwd").val();
		if(pwd == null || pwd == ""){
			$("#error").text("密码不能为空");
			return false;
		}
		var codeVal = $("#vcode").val();
		if(codeVal == null || codeVal == ""){
			$("#error").text("请先输入验证码");
			return false;
		}
		
		if(code.validate(codeVal)){
			$("#loginForm").submit();
			return true;
		}else{
			$("#error").text("验证码错误");
			return false;
		}
	}
		
</script>
</html>