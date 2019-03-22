/**
 * 方法工具
 */

var myUtils={
		loadAcaSel:function(ele_id){//向下拉列表加入学院信息
			$(ele_id).empty();
			$.ajax({
				type: "post",
	            url: "../Aca/getAll.do",
	            success: function (data,status) {
	            	data=JSON.parse(data);
	            	$.each(data,function(index,item){
	            		var optionEle=$("<option></option>").append(item.aca_name).attr("value",item.aca_idx);
	            		optionEle.appendTo(ele_id);
	            	});
	            }
			});
		},

		stringToJson: function(str) {
			var str0=str.split("[")[1].split("]")[0];//得到【】内的内容
			return '{'+str0+'}'
		}
	
}
