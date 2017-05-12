<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=9, IE=8">
<title>添加课程</title>
<link rel="shortcut icon" href="images/index/favicon.ico" type="image/x-icon">

    
    <link rel="stylesheet" type="text/css" href="css/admin/default.css">
    <link type="text/css" rel="stylesheet" href="css/admin/zTreeStyle.css">
    <link rel="stylesheet" href="css/admin/demo.css" type="text/css">

<link rel="stylesheet" href="css/admin/layui.css" media="all">
<link rel="stylesheet" href="css/admin/global.css" media="all">
<link id="layuicss-skinlayercss" rel="stylesheet" href="css/admin/layer.css" media="all">
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
var flag = ${status}
if(flag){
	alert("添加课程成功");
}else{
	alert("系统繁忙，请稍后再试");
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
</style>
<style type="text/css">
#ztree{
height:120px;
}
</style>
<link id="layuicss-laydatecss" rel="stylesheet" href="css/admin/laydate.css" media="all">
</head>
<body>
	
<fieldset class="layui-elem-field">
    <legend>
        <span>添加课程</span>
    </legend>
    <div class="layui-field-box">
        <form id="saveTeacherForm" action="addLesson" method="post" enctype="multipart/form-data" class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>课程名称</label>
                <div class="layui-input-block">
                    <input name="lessName" type="text" class="layui-input layui-input-6" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>课程类别</label>
                <div class="layui-input-block" id="input-block">
                    <input type="hidden" id="id" name="cateId" value="0">
                    <input readonly="readonly" id="subjectId" class="layui-input layui-input-6">
                    <ul id="ztreedemo" class="ztree"  style="display:none; z-index:99999; position: absolute; top: 30px; left: 0;  width:59%;border: 3px solid #ececec;">
                    </ul>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>课时数</label>
                <div class="layui-input-block ">	<!-- layui-textarea-block -->
                    <input id="num" name="classNum" onblur="show(this)" type="text" class="layui-input layui-input-6" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>课程价格</label><font color="red">系统将自动保留两位小数</font>
                <div class="layui-input-block ">	
                    <input name="price" id="price" onblur="judgePrice(this)" type="text" class="layui-input layui-input-6" lay-verify="required">
                </div>
            </div>
            
             <label class="layui-form-label layui-form-label-w"><font color="red">*</font>讲师</label>
                <div class="layui-input-block" id="input-block-teacher">
                    <input type="hidden" id="techId" name="techId" value="0">
                    <input readonly="readonly" name="tName" id="teacher" class="layui-input layui-input-6">
                    <ul id="ztree" class="ztree"  style="display:none; z-index:99999; position: absolute; top: 30px; left: 0;  width:59%;border: 3px solid #ececec;">
                    </ul>
                </div>
            <div class="layui-form-item">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>课程图片</label>
                <div class="layui-input-block">
                    <img src="/images/lesson/default.gif" id="subjcetpic" width="200px" height="200px">
                    <div class="ke-inline-block ">
                    </span>
                    <input type="file" id="loadfile" onchange="change(this)" class="ke-upload-file" name="uploadfile" accept="image/jpg,image/png,image/gif,image/JPEG">
                    <!-- </form> -->
                    </div>
                    <font class="htmlImgSize c-red">(请上传 288*288(长X宽)像素 的图片)</font>
                </div>
            </div>
            
            <div id="video_parent" class="layui-form-item" style="display: none;">
                <label class="layui-form-label layui-form-label-w"><font color="red">*</font>课程视频</label><font class="htmlImgSize c-red">(仅支持mp4格式)</font>
                <div class="layui-input-block" id="video_div"></div>
                
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
</body>
<script type="text/javascript" src="js/admin/addLesson.js"></script>
</html>