<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9, IE=8">
<title>课程列表</title>
<link rel="shortcut icon" href="images/index/favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="css/admin/global.css" media="all">
<link rel="stylesheet" href="css/admin/layer.css" media="all">
<link rel="stylesheet" href="css/admin/layui.css" media="all">
<style type="text/css">
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
		<legend>
			课程列表
		</legend>
		<div class="layui-field-box">
				<table class="layui-table" lay-even="" lay-skin="row">
					<thead>
					<tr>
						<td align="center">课程编号</td>
						<td align="center">课程名</td>
						<td align="center">浏览数</td>
						<td align="center">购买数</td>
						<td align="center">讲师</td>
						<td align="center">价格</td>
						<td align="center">类别</td>
					</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>
			<div id="adminCommonPage" style="text-align:center"></div>
			<div id="clear"></div>
	</div>
	</fieldset>
</body>
<script type="text/javascript">
$(function(){
	getLesson(1);
})
function getLesson(current){
	$.ajax({
		url:"adminGetmyLesson",
		type:"post",
		data:{"current":current,"pageCount":8,"techId":<%=request.getParameter("techId")%>},
		dataType:"json",
		success:function(rs){
			if(rs != null && rs.list != null && rs.list.length != 0){
				/* {"cateId":2,"classId":1,"className":"HTML5开发","classNum":4,"classTime":"每周四下午","numBuy":1,"numLook":156,"picture":"default.gif","price":139,"techId":2,"techName":"呵呵"} */
				$("#tbody").empty()
				for(var i = 0;i<rs.list.length;i++){
					 $("#tbody").append("<tr class='odd'><td align='center'>"+rs.list[i].classId+"</td><td align='center'>"+rs.list[i].className+"</td><td align='center'>"+rs.list[i].numLook+"</td><td align='center'>"+rs.list[i].numBuy+"</td><td align='center'>"+rs.list[i].techName+"</td><td align='center'>"+rs.list[i].price+"</td><td align='center'>"+rs.list[i].cateName+"</td></tr>") 
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
						getLesson(cur)
					}
				});
			}
			
		}
	})
}
</script>
</html>