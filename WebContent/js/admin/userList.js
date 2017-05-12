function init(){
$.ajax({
		url:"getParam",
		data:$("#searchForm").serialize(),
		type:"post",
		dataType:"json",
		success:function(rs){
			$("#tbody").empty();
			if(rs != null && rs.length > 0){
				for(var i = 0;i<rs.length;i++){
				$("#tbody").append("<tr class='odd'> <td align='center'>"+rs[i].id+"</td> <td align='center'>"+rs[i].login_name+"</td>" +
						"<td align='center'>"+rs[i].phone+"</td>" +
								"<td align='center' class='status'>"+(rs[i].status == 4?"正常":"被冻结")+"</td><td align='center'>" +
						"<button onclick='window.location.href=&#34;order_"+rs[i].id+"&#34;' class='layui-btn layui-btn-small' type='button'>查看订单</button>" +
						"<button onclick='update(this,"+(rs[i].status == 4?"1":"2")+")' value='"+rs[i].id+"' class='layui-btn layui-btn-small' type='button'>"+(rs[i].status == 4?"冻结":"解冻")+"</button></td></tr>")
			}
			}
		}
})
}

function enterSubmit(event) {
	var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
	if (keyCode == 13) {
		init();
		return false;
	}
}

$(function(){
	init();
})
//type:1冻结 2：解冻
function update(btn,type){
	$.ajax({
		url:"updateStatus",
		data:{"userId":btn.value,"type":type},
		type:"post",
		success:function(rs){
			if(rs == "success"){
				init();
				alert("修改成功");
			}else{
				alert("修改失败");
			}
		},
		error:function(){
			alert("系统异常，请稍后再试")
		}
		
	})
}
