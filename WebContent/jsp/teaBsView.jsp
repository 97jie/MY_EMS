<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课程详情页</title>
	 <link  rel="stylesheet" type="text/css" href="../css/bootstrap.css" >
     <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/Common.js" type="text/javascript"></script>
    <script src="../js/jquery-form.js" type="text/javascript"></script>
    <style>
        html,body{
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
            background-color: #dff0d8;
        }
        th{
        	text-align: center;
			color: #827788;       	
        }
        h4{
        	color: #916F83;
        }
        td{
        	text-align: center;
        	font-style: oblique;
        	color:#AA8855;
        }
        a:link{
       		 text-decoration: none; font-family: 微软雅黑;
        }
         a:hover{text-decoration: underline; color:#09f; }
    </style>
</head>
<body>
	<script type="text/javascript">
    var tea_session='<%=session.getAttribute("tea")%>';
	if(tea_session=='null'){
		alert("请先登录！");
		window.location.href="/MY_EMS/jsp/index.jsp";
	} 
</script>
<div class="modal fade" id="model_teaHw_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">发布新作业</h4>
      </div>
      <div class="modal-body">
	       	<form class="form-horizontal" id="form_ht_pub" method="post" enctype="multipart/form-data">
	       		<input type="text" name="bc_idx" hidden="true" value="${bc_idx}">
	       		<input type="text" name="t_no" hidden="true" id="input_t_no">
	  			<div class="form-group">
	    			<label for="ht_name_add" class="col-sm-3 control-label">作业名称：</label>
	   				<div class="col-sm-8">
	     				<input type="text" placeholder="作业名称" class="form-control" name="ht_name" id="ht_name_add">
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="ht_path_add" class="col-sm-3 control-label">作业附件：</label>
	   				<div class="col-sm-8">
	     				<input type="file" name="file" id="ht_path_add">
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="ht_weight_add" class="col-sm-3 control-label">作业权重：</label>
	   				<div class="col-sm-8">
	     				<input type="number" placeholder="作业权重" class="form-control" name="ht_weight" id="ht_weight_add">
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="ht_over_time_add" class="col-sm-3 control-label">提交截止日期：</label>
	   				<div class="col-sm-8">
	     				<input type="date" class="form-control" name="ht_over_time" id="ht_over_time_add">
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="ht_bz_info_add" class="col-sm-3 control-label">作业备注信息信息：</label>
	   				<div class="col-sm-8">
	     				<textarea class="form-control-static" id="ht_bz_info_add" name="ht_bz_info" style="width: 360px"></textarea>
	  				</div>
	  			</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal" id="hw_pub">发布</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>

	<div class="container-fluid" style="height: 75%">
    	<div class="col-md-12" style="margin-top: 20px">
    		<ul class="nav nav-pills">
    			<li>
    				<h4 style="color: #00CCFF;" id="title"></h4>
    			</li>
    			<li class="dropdown pull-right">
	                <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="font-size: 17px;color: #5EA287" id="dropDown_tea"><strong class="caret"></strong></a>
	                <ul class="dropdown-menu">
	                    <li>
	                        <a href="#">个人信息</a>
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
	    	<div style="margin-bottom: 30px">
	    		<div class="col-md-12">
	    			<div class="col-md-9">
	    				<h4>已发布作业</h4>
	    			</div>
	    			<div class="col-md-3">
	    				 <button class="btn btn-success" id="btn_hw_pub">
			              	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>发布新作业
			            </button>
	    			</div>
	    		</div>
	    		<table class="table table-hover table-striped table-bordered">
	    			<thead>
	    				<tr>
	    					<th style="text-align: center;width: 150px">作业名称</th>
	    					<th style="text-align: center;width: 150px">作业权重</th>
	    					<th style="text-align: center;width: 150px">作业发布日期</th>
	    					<th style="text-align: center;width: 150px">作业截止日期</th>
	    					<th style="text-align: center;width: 150px">作业附件</th>
	    					<th style="text-align: center;width: 150px">作业状态</th>
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
		var tea;
		var bc_idx;
		var current_page;
		$(function () {
			tea=JSON.parse(tea_session);//得到自定义的 tea对象
			var str_tea=tea.aca_name+"-"+tea.t_name+"老师";
			$("#dropDown_tea").text(str_tea);
			$("#title").text("${c_name}课程详情页");
			bc_idx=${bc_idx};
			to_PageWithJson(1); 
		});
		
		function to_PageWithJson(pn) {
			$.ajax({
				url:"/MY_EMS/ht/getAllWithJson.do?bc_idx="+bc_idx,
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
			$.each(hts,function(index,item){
				/* var c_info= */
				var $name_a=$('<a></a>');
				var $weight_a=$('<a></a>');
				$name_a.text(item.ht_name).attr('href',"/MY_EMS/jsp/teaViewHs.jsp?ht_idx="+item.ht_idx).attr("target","_blank");
				$weight_a.text(item.ht_weight).attr('ht_idx',item.ht_idx).attr('class','weight_a');
				
				var td1=$('<td></td>').append($name_a);
				var td2=$('<td></td>').append($weight_a);
				var td3=$('<td></td>').append(item.ht_pub_time);
				var td4=$('<td></td>').append(item.ht_over_time);
				var $file_a=$('<a></a>').text(item.file_name).attr('href',"/MY_EMS/ht/htDownLoad.do?ht_idx="+item.ht_idx);
				var td5=$('<td></td>').append($file_a);
				var td6=$('<td></td>').attr("align","center").text(item.ht_zt);
				$('<tr></tr>').append(td1).append(td2).append(td3).append(td4).append(td5).
					append(td6).appendTo("#tbody");
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
		
		$("#btn_hw_pub").click(function () {
			$("#input_t_no").val(tea.t_no);
			$("#model_teaHw_add").modal({
				backdrop:"static"
			});
		});
		
		$("#hw_pub").click(function () {
			$("#form_ht_pub").ajaxSubmit({
				 type : 'post',
				 url:"/MY_EMS/ht/pubHt.do",
				 success : function(data) { //请求成功后处理函数。
					 $("#model_teaHw_add").modal("hide");
		               alert("作业发布成功！");
		               to_PageWithJson(9999);
		            }
			});
		})
		
		$(document).on("click",".weight_a",function(){
			new_weight=prompt("请输入修改后的权重:",$(this).text())
			if(isNaN(new_weight)){
				alert("请输入数字！");
			}else if(new_weight===null){
				return;
			}else{
				ht_idx=$(this).attr("ht_idx");
				$(this).text(new_weight);
				$.ajax({
					url:"/MY_EMS/ht/updateWeight.do?ht_idx="+ht_idx+"&ht_weight="+new_weight,
					type:"get",
					success : function() { //请求成功后处理函数。
		               alert("作业权重修改成功！");
		               to_PageWithJson(current_page);
					}
				}); 
			}
			
		});
</script>
</html>