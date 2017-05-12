<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- saved from url=(0069)http://wx.inxedu.com/admin/order/showorderlist?queryOrder.userId=1411 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=9, IE=8">
<title>订单管理列表</title>
<link rel="shortcut icon" href="http://wx.inxedu.com/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/admin/layui.css" media="all">
<link rel="stylesheet" href="css/admin/global.css" media="all">
<link id="layuicss-skinlayercss" rel="stylesheet" href="css/admin/layer.css" media="all">
<link id="layuicss-laydatecss" rel="stylesheet" href="css/admin/laydate.css" media="all">
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
.layui-form select {
	display: block;
	border: 0.8px grey solid;
	margin-top: 7px;
}
</style>
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
</head>
<body>
	
<fieldset class="layui-elem-field">
    <legend>
        <span>订单管理列表</span>
    </legend>
    <div class="layui-field-box">

        <form action="order_0" class="layui-form" id="searchForm">
            <div class="layui-form-item ">
                <label class="layui-form-label">订单号</label>
                <div class="layui-input-inline">
                    <input class="layui-input" placeholder="订单号" name="orderNo">
                </div>
                <label class="layui-form-label">学员ID</label>
                <div class="layui-input-inline">
                    <input class="layui-input" placeholder="学员Id" name="showName">
                </div>
                <label class="layui-form-label">状态</label>
                <div class="layui-input-inline">
                    <select name="states" id="states">
                        <option value="0">全部</option>
                        <option value="2">已支付</option>
                        <option value="1">未支付</option>
                    </select>
                </div>
                <a title="查询订单" onclick="$(&#34;#searchForm&#34;).submit();" class="layui-btn layui-btn-small layui-btn-danger" href="javascript:void(0)">
                    查询
                </a>
                <a title="返回" onclick="history.go(-1)" class="layui-btn layui-btn-small layui-btn-danger" href="javascript:void(0)">
                    返回
                </a>
            </div>


        </form>
        <table class="layui-table">
            <thead>
            <tr>
                <td align="center">订单号</td>
                <td align="center">创建时间</td>
                <td align="center">学员昵称</td>
                <td align="center">金额</td>
                <td align="center">状态</td>
            </tr>
            </thead>
            <tbody>
	           <c:forEach items="${ orderListAll}" var="var">
	            <tr>
                <td align="center">${var.orderNo}</td>
                <td align="center">${var.payTime} </td>
                <td align="center">${var.user.login_name }</td>
                <td align="center">${var.lesson.price}</td>
                <td align="center">${var.des }</td>
            </tr>
	           </c:forEach>
            </tbody>
        </table>
        <div id="adminCommonPage" style="text-align:center"></div>

</div>
</fieldset>


</body></html>