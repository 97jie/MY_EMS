<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生课程作业详情页</title>
	 <link  rel="stylesheet" type="text/css" href="../css/bootstrap.css" >
	 <link  rel="stylesheet" type="text/css" href="../css/myCss.css" >
     <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/Common.js" type="text/javascript"></script>
    <script src="../js/jquery-form.js" type="text/javascript"></script>
</head>
<body>
	<script type="text/javascript">
    var stu_session='<%=session.getAttribute("stu")%>';
	if(stu_session=='null'){
		alert("请先登录！");
		window.location.href="/MY_EMS/jsp/index.jsp";
	} 
</script>
<div class="modal fade" id="model_hs_upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">上传作业</h4>
      </div>
      <div class="modal-body">
	       	<form class="form-horizontal" id="form_hs_pub" method="post" enctype="multipart/form-data">
	       		<input type="text" name="ht_idx" hidden="true" id="input_ht_idx">
	       		<input type="text" name="s_no" hidden="true" id="input_s_no">
	  			<div class="form-group">
	    			<label for="ht_name_add" class="col-sm-3 control-label">作业名称：</label>
	   				<div class="col-sm-8">
	     				<input type="text" placeholder="作业名称" class="form-control" name="hs_name" id="hs_name_add">
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="ht_path_add" class="col-sm-3 control-label">作业附件：</label>
	   				<div class="col-sm-8">
	     				<input type="file" name="file" id="ht_path_add">
	  				</div>
	  			</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal" id="hw_pub">
        	<span class="glyphicon glyphicon-open"></span>上传</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>

	<div class="container-fluid" style="height: 75%">
    	<div class="col-md-12" style="margin-top: 20px">
    		<ul class="nav nav-pills">
    			<li><img src="../image/stu_logo.png" />
    			<li>
    				<h3 style="color: #00CCFF;" id="title"></h3>
    			</li>
    			<li class="dropdown pull-right">
	                <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="font-size: 17px;color: #5EA287" id="dropDown_stu"><strong class="caret"></strong></a>
	                <ul class="dropdown-menu">
	                    <li>
	                        <a href="/MY_EMS/jsp/stuInfo.jsp">个人信息</a>
	                    </li>
	                    <li>
	                        <a href="/MY_EMS/student/login_out.do">退出登录</a>
	                    </li>
	                </ul>
            	</li>
    		</ul>
    		<hr width="90%" align="left" style="height:3px;margin-top: 20px;background-color: #0f0f0f" />
    	</div>
    	<div class="row-fluid">
	    	<div class="col-md-12" style="margin-bottom: 30px">
	    		<div class="col-md-12">
	    			<div class="col-md-6">
	    				<h4>本课程已发布作业</h4>
	    			</div>
	    			<div class="col-md-3 col-md-offset-3">
	    				 <button type="button" class="btn btn-warning" data-dismiss="modal" id="into_chat">
        					<span class="glyphicon glyphicon-log-in"></span> 本课程讨论区</button>
	    			</div>
	    		</div>
	    		<table class="table table-hover table-striped table-bordered">
	    			<thead>
	    				<tr>
	    					<th style="text-align: center">作业名称</th>
	    					<th style="text-align: center">发布日期</th>
	    					<th style="text-align: center">截止日期</th>
	    					<th style="text-align: center">作业权重</th>
	    					<th style="text-align: center">作业附件</th>
	    					<th style="text-align: center">作业备注</th>
	    					<th style="text-align: center">作业状态</th>
	    					<th style="text-align: center">分数</th>
	    					<th style="text-align: center">提交作业</th>
	    					
	    				</tr>
	    			</thead>
	    			<tbody id="tbody">
	         		</tbody>
	    		</table>
	    		<div class="row-fluid">
		     	<!-- 分页信息 -->
			     	<div class="col-md-6" id="page_info">
			        </div> 
			     	<div class="col-md-6" id="page_nav">
				</div>
	     </div>
		    	</div>
	    </div>
    </div>
    <div class="footer navbar-fixed-bottom" id="footer" style="background-color: #adbfff;height: 15%">
	   <div style="margin-top: 78px">
			<h4 style="text-align: center">©2019&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我们：6654331</h4>
		</div>
	</div>
</body>
<script type="text/javascript">
		var stu;
		var bc_idx;
		var current_page;
		$(function () {
			var stu=JSON.parse(stu_session);//得到自定义的 stu对象
			$("#input_s_no").val(stu.s_no);
			var str_stu=stu.s_grade+"级"+stu.b_name+"-"+stu.s_name;
			$("#dropDown_stu").text(str_stu);
			$("#title").text("${c_name}课程作业详情页");
			bc_idx=${bc_idx};
			to_PageWithJson(1); 
		});
		
		function to_PageWithJson(pn) {
			$.ajax({
				url:"/MY_EMS/hs/getAllWithJson.do?bc_idx="+bc_idx,
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					result=JSON.parse(result);//用parse()函数对返回的数据进行了处理，使其转换为js对象
					buildTable(result);		  //得到数据后构建表格
					bulidPageInfo(result);	  //构建分页信息
					bulidPageNav(result);	   ///构建分页导航
				}
			});
		}
		
		function buildTable(result) {
			$('#tbody').empty();
			var hts=result.extend.pageInfo.list;
			console.log(hts);
			$.each(hts,function(index,item){
				var ht_name=$('<td></td>').append(item.ht_name);
				var ht_pub_time=$('<td></td>').append(item.ht_pub_time);
				var ht_over_time=$('<td></td>').append(item.ht_over_time);
				var ht_weight=$('<td></td>').append(item.ht_weight);
				var ht_path;
				if('null'==item.file_name){
					ht_path=$('<td></td>').append("无附件！")
				}else{
					$file_a=$('<a></a>').text(item.file_name);
					$file_a.attr('href',"/MY_EMS/ht/htDownLoad.do?ht_idx="+item.ht_idx);
					ht_path=$('<td></td>').append($file_a);
				}
				var ht_bz_info=$('<td></td>').append(item.ht_bz_info);
				var ht_zt=$('<td></td>').append(item.ht_zt);
				var hs_score;
				var hs_pub_hs;
				if("未提交"==item.extra_1){
					hs_score=$('<td></td>').append("无分数")
					if('作业进行中'==item.ht_zt){//可以上传附件
						$btn_upFile=$("<button></button>").attr("class","btn-xs btn-success btn_upFile").attr("ht_idx",item.ht_idx);
						$span=$("<span></span>").attr("class","glyphicon glyphicon-open").text("上传");
						hs_pub_hs=$("<td></td>").append($btn_upFile.append($span));
					}else{//学生不能再上传附件
						hs_pub_hs=$('<td></td>').css("clolr","red").append("已截止提交");
					}
				}else{//提交了没打分
					hs_score=$('<td></td>').append(item.extra_1);
					hs_pub_hs=$('<td></td>').css("clolr","#80F680").append("已成功提交");
				}
				$('<tr></tr>').append(ht_name).append(ht_pub_time).
					append(ht_over_time).append(ht_weight).append(ht_path).
					append(ht_bz_info).append(ht_zt).append(hs_score).append(hs_pub_hs).
					appendTo("#tbody");
			});
		}
		
		function bulidPageInfo(result) {
			$('#page_info').empty();
			$('#page_info').append("当前第"+result.extend.pageInfo.pageNum+"页，共有"+
					result.extend.pageInfo.pages+"页，一共有"+
		        	result.extend.pageInfo.total+"条记录");
			
			current_page=result.extend.pageInfo.pageNum;
		}
		
		//构建分页导航
		function bulidPageNav(result) {
			$('#page_nav').empty();
			var ul=$('<ul></ul>').addClass('pagination');
			var firstPageLi=$('<li></li>').append($('<a></a>').append("首页").attr('href',"#"));
			firstPageLi.click(function () {
				to_PageWithJson(1);
			})
			
			var prePageLi=$('<li></li>').append($('<a></a>').append("&laquo;"));
			prePageLi.click(function () {
				to_PageWithJson(result.extend.pageInfo.pageNum-1);
			})
			
			if(result.extend.pageInfo.hasPreviousPage==false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}
			
			var nextPageLi=$('<li></li>').append($('<a></a>').append("&raquo;"));
			nextPageLi.click(function () {
				to_PageWithJson(result.extend.pageInfo.pageNum+1);
			})
			
			var lastPageLi=$('<li></li>').append($('<a></a>').append("尾页").attr('href',"#"));
			lastPageLi.click(function () {
				to_PageWithJson(result.extend.pageInfo.lastPage);
			})
			
			if(result.extend.pageInfo.hasNextPage==false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}
			
			ul.append(firstPageLi).append(prePageLi);
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numLi=$('<li></li>').append($('<a></a>').append(item).attr('href',"#"));
				if(result.extend.pageInfo.pageNum==item){
					numLi.addClass("active");
				}
				numLi.click(function () {
					to_PageWithJson(item);
				})
				ul.append(numLi);
			});
			ul.append(nextPageLi).append(lastPageLi);
			
			var nav_page=$('<nav></nav>').append(ul);
			
			nav_page.appendTo("#page_nav");
		}
		
		$(document).on("click",".btn_upFile",function(){
			$("#input_ht_idx").val($(this).attr("ht_idx"));
			$("#model_hs_upload").modal({
				backdrop:"static"
			});
		});
		
		$("#hw_pub").click(function () {
			if(confirm("确定要上传吗？")){
				$("#form_hs_pub").ajaxSubmit({
					 type : 'post',
					 url:"/MY_EMS/hs/pubHs.do",
					 success : function(data) { //请求成功后处理函数。
						 data=JSON.parse(data);
					 	 if(data.code==200){
							 $("#model_hs_upload").modal("hide");
				               alert("作业上传成功！");
				               to_PageWithJson(current_page);
				         }else{
					 		 alert("请选择要上传的作业文件！")
					 	 }
					 }
				});
			}
		})
		
		$(document).on("click",".weight_a",function(){
			new_weight=prompt("请输入修改后的权重:",$(this).text())
			if(isNaN(new_weight)){
				alert("请输入数字！");
			}else{
				ht_idx=$(this).attr("ht_idx");
				$(this).text(new_weight);
				
				$.ajax({
					url:"/MY_EMS/ht/updateWeight.do?ht_idx="+ht_idx+"&ht_weight="+new_weight,
					type:"get"
				}); 
			}
		});
		
		$("#into_chat").click(function () {
			window.open('/MY_EMS/zt/viewZt.do?bc_idx='+bc_idx);
		});
</script>
</html>