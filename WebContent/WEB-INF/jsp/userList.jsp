<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0043)http://wx.inxedu.com/admin/user/getuserList -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9, IE=8">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<title>学员列表</title>
<link rel="stylesheet" href="css/admin/laydata.css">
<link rel="stylesheet" href="css/admin/layer.css">
<link rel="stylesheet" href="css/admin/layui.css">
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
td{
width: 10%;
}
.layui-form select{
display: block;
border:0.8px grey solid;
margin-top:7px;
}
</style>
<script type="text/javascript" src = "js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src = "js/admin/userList.js"></script>
</head>
<body>
	
	<fieldset class="layui-elem-field">
		<legend>
			学员列表
		</legend>
		<div class="layui-field-box">
			<form id="searchForm" class="layui-form">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">学员ID</label>
						<div class="layui-input-inline">
							<input placeholder="学员ID" type="text" name="userId" value="" class="layui-input" onkeyup="this.value=this.value.replace(/\D/g,&#39;&#39;)">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">账号</label>
						<div class="layui-input-inline">
							<input placeholder="账号" type="text" name="keyWord" value="" class="layui-input">
						</div>
					</div>
					<div class="layui-inline"> 
						<label class="layui-form-label">状态</label>
						<div class="layui-input-inline">
							<select name="isavalible" >
								<option value="0">全部</option>
								<option value="4">正常</option>
								<option value="5">冻结</option>
							</select>
							<!-- <div class="layui-unselect layui-form-select"><div class="layui-select-title"><input type="text" placeholder="全部" value="全部" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div><dl class="layui-anim layui-anim-upbit"><dd lay-value="0" class="layui-this">全部</dd><dd lay-value="4" class="">正常</dd><dd lay-value="5" class="">冻结</dd></dl></div> -->
						</div>
					</div>
					<div class="layui-inline">
						<input type="button" onclick="init()" class="layui-btn layui-btn-small layui-btn-danger" value="查询">
					</div>
				</div>

				<table class="layui-table" lay-even="" lay-skin="row">
					<thead>
					<tr>
						<td align="center">ID</td>
						<td align="center">账号</td>
						<!-- <td align="center">邮箱</td> -->
						<td align="center">手机号</td>
						<td align="center">状态</td>
						<td align="center" width="40%">操作</td>
					</tr>
					</thead>

					<tbody id="tbody">
					
					</tbody>
				</table>
			</form>
			<div id="page" style="text-align:center"></div>

</div>
	</fieldset>


</body></html>