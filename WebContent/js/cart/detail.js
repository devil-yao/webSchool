$(function(){
	getDetail(1)
	productCount();
});

function getDetail(cur){
	$("#shopping").empty();
	$("#shopping").append("<tr><td class='title_1' colspan='1'><input id='allCheckBox' type='checkbox' onclick='selectAll()' />全选</td><td class='title_2' colspan='2'>课程详情</td><td class='title_4'>价格（元）</td><td class='title_5'>开课时间</td><td class='title_6'>状态</td><td class='title_7'>操作</td></tr><tr><td colspan='8' class='line'></td></tr>");
	
	$.ajax({
		url:"mycart",
		type:"post",
		data:{"current":cur,"pageCount":"6"},
		dataType:"json",
		async:false,
		success:function(rs){
//			rs = eval(rs);
			if(rs != "null" && rs.list.length > 0){
				for (var i = 0;i < rs.list.length;i++){
					
					$("#shopping").append("<tr><td colspan='8' class='shopInfo'> 教师：<a href='tech?techId="+rs.list[i].techId+"'>"+rs.list[i].teachName+"</a></td></tr>"+ 
							"<tr id='"+rs.list[i].cartId+"'><td class='cart_td_1'><input type='hidden' value = '"+rs.list[i].classId+"' class='"+rs.list[i].cartId+"'><input name='cartCheckBox' onchange='productCount()' type='checkbox' value='"+rs.list[i].cartId+"' onclick='selectSingle()' /></td><td class='cart_td_2'>" +
							"<img src='/images/lesson/"+rs.list[i].head+"' style='cursor: pointer;' width='100px' height='80px' alt='lesson'/></td>" +
							"<td class='cart_td_3'><a href='lessonDetail?classId="+rs.list[i].classId+"'>"+rs.list[i].lessonName+"</a><br />" +
							"<td class='cart_td_5'>"+parseFloat(rs.list[i].price).toFixed(2)+"</td>" +
							"<td class='cart_td_6'>即买即看</td>" +
							"<td class='cart_td_7'>"+rs.list[i].status+"</td>" +
							"<td class='cart_td_8'><a href='javascript:deleteRow("+rs.list[i].cartId+");'>删除</a></td></tr>"+
							"<div id='cart"+rs.list[i].cartId+"' style='display: inline-table;' > </div>"
							);
				}
				$("#shopping").append("<tr><td  colspan='3'><a href='javascript:deleteSelectRow()'><img src='images/cart/taobao_del.jpg' alt='delete'/></a></td>" +
				"<td colspan='5' class='shopend'>商品总价（不含运费）：<label id='total' class='yellow'></label> 元<br /><input name='' type='image' src='images/cart/taobao_subtn.jpg' onclick = 'pay()' /></td></tr>");
				
				$("#clear").pagination({
					totalData : rs.total,
					showData : rs.pageCount,
					isHide : true,
					current : cur,
					coping : true,
					homePage : '首页',
					endPage : '末页',
					prevContent : '上页',
					nextContent : '下页',
					callback : function(index) {
						var cur = index.getCurrent();
						getDetail(cur);
					}
				})
				
			}
			
		}
	});
}

