<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=9, IE=8">
<title>修改讲师信息</title>
<link rel="shortcut icon" href="images/index/favicon.ico" type="image/x-icon">

    
    <link rel="stylesheet" type="text/css" href="css/admin/default.css">
    <link type="text/css" rel="stylesheet" href="css/admin/zTreeStyle.css">
    <link rel="stylesheet" href="css/admin/demo.css" type="text/css">

<link rel="stylesheet" href="css/admin/layui.css" media="all">
<link rel="stylesheet" href="css/admin/global.css" media="all">
<link id="layuicss-skinlayercss" rel="stylesheet" href="css/admin/layer.css" media="all">
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="js/admin/update.js"></script>
<script type="text/javascript">
var flag = ${operater}
if(flag){
	alert("修改成功");
}else{
	alert("修改讲师失败");
}
</script>
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
</style><link id="layuicss-laydatecss" rel="stylesheet" href="css/admin/laydate.css" media="all">
</head>
<body>
	
<fieldset class="layui-elem-field">
    <legend>
        <span>修改讲师</span>
    </legend>
    <div class="layui-field-box">
        <form id="saveTeacherForm" action="updateTeacher" method="post" enctype="multipart/form-data" class="layui-form">
            <input type="hidden" value="${tech.id }" name="userid">
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>讲师名称</label>
                <div class="layui-input-block">
                    <input name="techName" type="text" value="${tech.login_name }" class="layui-input layui-input-6" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>讲师专业</label>
                <div class="layui-input-block" id="input-block">
                    <input type="hidden" id="id" name="cateId" value="${tech.cateId }">
                    <input readonly="readonly" id="subjectId" value="${tech.cateName }" onclick="showSubjectList()" class="layui-input layui-input-6">
                    <ul id="ztreedemo" class="ztree"  style="display:none; z-index:99999; position: absolute; top: 30px; left: 0;  width:59%;border: 3px solid #ececec;">
                    </ul>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>讲师简介</label>
                <div class="layui-input-block layui-textarea-block">
                    <textarea class="layui-textarea" id="career" lay-verify="required" name="career">${tech.dec}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>联系方式</label>
                <div class="layui-input-block layui-textarea-block">
                    <input name="phone" type="text" value="${tech.phone }" class="layui-input layui-input-6" maxlength="11" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w">讲师头像</label>
                <div class="layui-input-block">
                    <img src="/images/${tech.head }" id="subjcetpic" width="200px" height="200px">
                    <div class="ke-inline-block ">
                    </span>
                    <input type="file" id="loadfile" onchange="change(this)" class="ke-upload-file" name="uploadfile" accept="image/jpg,image/png,image/gif,image/JPEG">
                    <!-- </form> -->
                    </div>
                    <font class="htmlImgSize c-red">(请上传 288*288(长X宽)像素 的图片)</font>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <a class="layui-btn layui-btn-danger" title="提 交" onclick="sub()" lay-submit="" lay-filter="teacherFormSubmit">提 交</a>
                    <a class="layui-btn layui-btn-primary" title="返 回" href="javascript:history.go(-1);">返 回</a>
                </div>
            </div>
        </form>
    </div>
</fieldset>


</body></html>