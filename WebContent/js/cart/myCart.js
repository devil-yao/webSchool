
/*自动计算商品的总金额、总共节省的金额和积分*/
function productCount(){
	var total=0.00;      //商品金额总计
	 $("[type='checkbox']:checked").each(function (i, t){
		 if(t.value != "on"){
			var price = $("#"+t.value)[0].getElementsByTagName("td")[3].innerHTML*1;
			total+=price;
		 }
	 })
	
//     /*访问ID为shopping表格中所有的行数*/
//	var myTableTr=document.getElementById("shopping").getElementsByTagName("tr"); 
//	if(myTableTr.length>0){
//	for(var i=1;i<myTableTr.length;i++){/*从1开始，第一行的标题不计算*/
//	    if(myTableTr[i].getElementsByTagName("td").length>2){ //最后一行不计算
//		price=myTableTr[i].getElementsByTagName("td")[3].innerHTML*1;
//		total+=price;
////		myTableTr[i].getElementsByTagName("td")[5].innerHTML=price;
//		}
//	}
	document.getElementById("total").innerHTML=parseFloat(total).toFixed(2);
//	
//	}
}
//window.onload=productCount;

/*复选框全选或全不选效果*/
function selectAll(){
	var oInput=document.getElementsByName("cartCheckBox");
 for (var i=0;i<oInput.length;i++){
 	    oInput[i].checked=document.getElementById("allCheckBox").checked;
	}
 productCount();
}
	
/*根据单个复选框的选择情况确定全选复选框是否被选中*/
function selectSingle(){
	var k=0;
	var oInput=document.getElementsByName("cartCheckBox");
	 for (var i=0;i<oInput.length;i++){
	   if(oInput[i].checked==false){
		  k=1;
		  break;
	    }
	}
	if(k==0){
		document.getElementById("allCheckBox").checked=true;
		}
	else{
		document.getElementById("allCheckBox").checked=false;
		}
}

/*删除单行商品*/
function deleteRow(rowId){
	deleteCart(rowId);
//	var Index=document.getElementById(rowId).rowIndex; //获取当前行的索引号
//	document.getElementById("shopping").deleteRow(Index);
//	document.getElementById("shopping").deleteRow(Index-1);
	productCount();
	}

/*删除选中行的商品*/
function deleteSelectRow(){
	var oInput=document.getElementsByName("cartCheckBox");
	var Index;
	 for (var i=oInput.length-1;i>=0;i--){
	   if(oInput[i].checked==true){
		   deleteCart(oInput[i].value);
	    }
	}
	productCount();
	}

//cartId
function deleteCart(cartId){
	$.ajax({
		url:"deleteCart",
		type:"post",
		data:{"cartId":cartId},
		success:function(rs){
			location.reload();
		},
		error:function(){
			alert("系统繁忙，请稍后再试");
		}
	})
}

function pay(){
	var s = 0;
	var oInput=document.getElementsByName("cartCheckBox");
	for (var i=oInput.length-1;i>=0;i--){
		   if(oInput[i].checked==true){
			   s++;
			   }
		   }
	if(s>0){
		var b = confirm("确认支付?");
		if(!b){
			return false;
		}
	}else{
		return false;
	}
//	var Index;
	var count  = 0;
	var flag = 0;
	 for (var i=oInput.length-1;i>=0;i--){
	   if(oInput[i].checked==true){
		   count++;
		   $.ajax({
			   url:"payCart",
				type:"post",
				async:false,
				data:{"cartId":oInput[i].value,
						"classId":$("."+oInput[i].value).val()
					},
				success:function(rs){
					if(rs == 'true'){
						flag++;
					location.reload();
					}
				},
				error:function(){
					alert("系统繁忙，请稍后再试");
				} 
		   })
	    }
	}
	 if(count == flag){
		 alert("支付成功，快去学习吧")
	 }
	productCount();
	}	