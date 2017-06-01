<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9, IE=8">
<title>讲师列表</title>
<link rel="shortcut icon" href="images/index/favicon.ico"
	type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/admin/global.css">
<link rel="stylesheet" href="css/admin/layer.css">
<link rel="stylesheet" href="css/admin/layui.css">
<style type="text/css">
.layui-form select {
	display: block;
	margin-top: 6px;
}
		*{ margin:0; padding:0; list-style:none;}
		a{ text-decoration:none;}
		a:hover{ text-decoration:none;cursor:pointer;}
		#clear{padding: 15px 20px;text-align: left;color: #ccc;text-align: center}
		#clear a{display: inline-block;color: #428bca;display: inline-block;height: 25px;	line-height: 25px;	padding: 0 10px;border: 1px solid #ddd;	margin: 0 2px;border-radius: 4px;vertical-align: middle;}
		#clear a:hover{text-decoration: none;border: 1px solid #428bca;}
		#clear span.current{display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;color: #fff;background-color: #428bca;	border: 1px solid #428bca;border-radius: 4px;vertical-align: middle;}
		#clear span.disabled{	display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;	color: #bfbfbf;background: #f2f2f2;border: 1px solid #bfbfbf;border-radius: 4px;vertical-align: middle;}
</style>
<script type="text/javascript" src = "js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src = "js/jquery.pagination.min.js"></script>
</head>
<body>
	<fieldset class="layui-elem-field">
		<legend> 讲师列表 </legend>
		<div class="layui-field-box">
			<form id="searchForm" class="layui-form">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">讲师名称</label>
						<div class="layui-input-inline">
							<input id="teacherNme" placeholder="讲师名" class="layui-input"
								name="teacherNme" type="text">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">授课类别</label>
						<div class="layui-input-inline">
							<select id="typeValue" name="lessontype" lay-filter="select">
								<option selected="selected" value="0">请选择</option>
							</select>
						</div>
					</div>
					<div class="layui-inline">
						<a title="查找用户" onclick="getTech(1)" class="layui-btn layui-btn-small layui-btn-danger">查找</a>
					</div>
				</div>

			</form>
			<table class="layui-table" cellspacing="0" cellpadding="0" border="0">
				<thead>
					<tr>
						<td width="10%" align="center">名称</td>
						<td width="30%" align="center">简介</td>
						<td align="center">联系方式</td>
						<td align="center">授课类型</td>
						<td width="200" align="center">操作</td>
					</tr>
				</thead>

				<tbody id="tbody">

				</tbody>
			</table>
			<div id="adminCommonPage" style="text-align: center"></div>
			<div id="clear"></div>

		</div>
	</fieldset>
	<script type="text/javascript">
$(function(){
	$.ajax({
		url:"getCate",
		type:"post",
		dataType:"json",
		async:false,
		success:function(rs){
			/* "cateName":"Java ","id":1,"parentId":0 */
			if(rs != null && rs.length>0){
				for(var i = 0;i<rs.length;i++){
					$("#typeValue").append("<option value='"+rs[i].id+"'>"+rs[i].cateName+"</option>")
				}
			}else{
				$("#typeValue").css("display","none");
			}
		}
	})
	
	getTech(1);
})
function getTech(current){
	$.ajax({
		url:"adminGetTeacher",
		type:"post",
		data:{"current":current,"pageCount":8,"teacherNme":$("#teacherNme").val(),"lessontype":$("#typeValue").val()},
		dataType:"json",
		success:function(rs){
			$("#tbody").empty()
			if(rs != null && rs.list != null && rs.list.length != 0){
				
				for(var i = 0;i<rs.list.length;i++){
					$("#tbody").append("<tr class='odd'><td align='center'>"+rs.list[i].login_name+"</td><td align='center'>"+rs.list[i].dec+"</td><td align='center'>"+rs.list[i].phone+"</td><td align='center'>"+rs.list[i].cateName+"</td><td align='center'><a href='myLesson?techId="+rs.list[i].id+"' class='layui-btn layui-btn-small' type='button'>查看课程</a>&nbsp;<a href='updateInfo?techId="+rs.list[i].id+"'><button class='layui-btn layui-btn-small' type='button'>修改</button></a></td></tr>")
				}
				$('#clear').pagination({
					totalData : rs.total,
					showData : rs.pageCount,
					isHide : true,
					current : current,
					coping : true,
					homePage : '首页',
					endPage : '末页',
					prevContent : '上页',
					nextContent : '下页',
					callback : function(index) {
						var cur = index.getCurrent();
						getTech(cur)
					}
				});
			}
			
		}
	})
}
</script>
</body>
</html>