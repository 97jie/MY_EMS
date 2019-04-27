<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>课程管理</title>
    <link  rel="stylesheet" type="text/css" href="../css/bootstrap.css" >
    <link  rel="stylesheet" type="text/css" href="../css/myCss.css" >
     <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/Common.js" type="text/javascript"></script>
    <style>
        html,body{
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
            background-color: #dff0d8;
        }
    </style>
</head>
<body>
<script type="text/javascript">
    var ad_session='<%=session.getAttribute("admin")%>';
	if(ad_session=='null'){
		alert("请先登录！");
		window.location.href="adminLogin.jsp";
	} 
</script>
<!-- 课程添加模态框 -->
<div class="modal fade" id="model_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加课程</h4>
      </div>
      <div class="modal-body">
	       	<form class="form-horizontal" id="form_add_course">
	  			<div class="form-group">
	    			<label for="add_c_name" class="col-sm-3 control-label">课程名称：</label>
	   				<div class="col-sm-8">
	      				<input type="text" class="form-control" id="add_c_name" name="c_name" />
	      				<span class="help-block"></span>
	    			</div>
	  			</div>
	 			<div class="form-group">
	    			<label for="add_sel_aca" class="col-sm-3 control-label" >开设学院：</label>
	    			<div class="col-sm-8">
	      				<select  class="form-control" id="add_sel_aca" name="aca_idx">
	      				</select>
	    			</div>
	 			</div>
	 			<div class="form-group">
	    			<label for="input_info" class="col-sm-3 control-label" style="margin-top: 25px ">课程信息：</label>
	    			<div class="col-sm-8">
	      				<textarea name="c_info" rows="3" class="col-sm-12" placeholder="课程基本信息" id="input_info"></textarea>
	    				<span class="help-block"></span>
	    			</div>
	 			</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="c_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>
<!-- 班级课程添加模态框 -->
<div class="modal fade" id="model_bc_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加班级课程</h4>
      </div>
      <div class="modal-body">
	       	<form class="form-horizontal" id="form_add_bc">
	       		<input type="hidden" name="c_idx" id="add_c_idx">
	  			<div class="form-group">
	    			<label for="static_c_name" class="col-sm-3 control-label">课程名称：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_c_name"></p>
	  				</div>
	  			</div>
	 			<div class="form-group">
	    			<label for="add_sel_tea" class="col-sm-3 control-label" >教授教师：</label>
	    			<div class="col-sm-8">
	      				<select  class="form-control" id="add_sel_tea" name="t_no">
	      				</select>
	      				<span class="help-block"></span>
	    			</div>
	 			</div>
	 			<div class="form-group">
	    			<label for="add_b_grade" class="col-sm-3 control-label" >年级：</label>
	    			<div class="col-sm-8">
	      				<input type="number" class="form-control" id="add_b_grade" value="2015" name="b_grade" />
	    			</div>
	 			</div>
	 			<div class="form-group">
	    			<label for="add_sel_ban" class="col-sm-3 control-label" >课程班级：</label>
	    			<div class="col-sm-8">
	      				<select  class="form-control" id="add_sel_ban" name="b_idx">
	      				</select>
	      				<span class="help-block"></span>
	    			</div>
	 			</div>
	 			
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="bc_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>

<div class="container-fluid" style="height: 75%">
    <div class="col-md-12" style="margin-top: 30px">
        <ul class="nav nav-pills">
            <li >
                <a href="/MY_EMS/jsp/adminMain.jsp">首页</a>
            </li>
            <li class="">
                <a href="/MY_EMS/jsp/acaManage.jsp">学院管理</a>
            </li>
            <li class="">
                <a href="/MY_EMS/jsp/teaManage.jsp">教师管理</a>
            </li>
            <li class="">
                <a href="/MY_EMS/jsp/stuManage.jsp">学生管理</a>
            </li>
            <li class="">
                <a href="/MY_EMS/jsp/classManage.jsp">班级管理</a>
            </li>
            <li class="active">
                <a href="/MY_EMS/jsp/courseManage.jsp">课程管理</a>
            </li>
            <li class="dropdown pull-right">
                <a href="#" data-toggle="dropdown" class="dropdown-toggle" style="font-size: 17px">管理员<strong class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="/MY_EMS/jsp/adminInfo.jsp">个人信息</a>
                    </li>
                    <li>
                        <a href="/MY_EMS/admin/login_out.do">退出登录</a>
                    </li>
                </ul>
            </li>
        </ul>
        <hr  width="90%" align="left" style="height:3px;margin-top: 40px;background-color: #0f0f0f" />
    </div>
    <div class="row-fluid" style="margin-bottom: 30px">
    	<div class="col-md-12">
     	<div class="col-md-3">
         	<form class="form-search" style="margin-left: 20px">
              <input id="search_c" class="input search-query glyphicon glyphicon-search" placeholder="搜索课程（输入课程号或课程名称）" type="text" style="height: 35px;width: 200px"/>
              	<!-- button 的type属性不能为submit，否则执行完ajax会刷新页面 ，大坑-->
              <button type="button" class="btn btn-info" id="btn_search">
              	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>查找
              </button>
         	</form>
         </div>
         <div class="col-md-2">
         	 <button type="submit" class="btn btn-primary" id="c_add">
              	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加
           </button>
         	<button class="btn btn-danger" id="del_all">
           				<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
            </button>
         </div>
         <div class="col-md-2 col-md-offset-5">
         	<button class="btn btn-success" id="btn_add_bc">
           		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加班级课程
            </button></div>
        </div>
    </div>
    <div class="col-md-7">
	 	<table class="table table-hover table-striped table-bordered">
	         <thead>
	          <tr>
	              <th>
	                 	<input type="checkbox" id="check_all">
	              </th>
	              <th width="300px">
	                	  课程名称
	              </th>
	              <th width="300px">
	                	  开设学院
	              </th>
	              <th width="500px">
	                  	课程基本信息
	              </th>
	              <th>
	                	查看
	              </th>
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
	  <div class="col-md-5">
	  	<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title" id="panel_title">班级课程详情</h3>
				<input type="hidden" id="view_c_idx">
			</div>
			<div class="panel-body row pre-scrollable" style="padding-top: 0px">
				<table class="table table-hover table-striped table-bordered">
					<thead>
			          <tr>
			              <th>
			                	课程教师
			              </th>
			              <th >
			                	  课程班级
			              </th>
			              <th>
			                	删除
			              </th>
			          </tr>
	         		</thead>
	         		<tbody id="tbody_2">
	         		</tbody>
				</table>
			</div>
		</div>
	  </div>
</div>
<div class="footer navbar-fixed-bottom" id="footer" style="background-color: #adbfff;height: 8%">
    <div style="margin-top: 78px">
		<h4 style="text-align: center">©2019&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我们：6654331</h4>
	</div>
</div>
</body>

<script type="text/javascript">

	var current_page;
	$(function () {
		to_PageWithJson(1)//页面刚加载就发送Ajax请求来构建界面动态元素（表格内容，分页信息）
	});
	
	function to_PageWithJson(pn) {
		$.ajax({
			url:"/MY_EMS/course/getAllWithJson.do",
			data:"pn="+pn,
			type:"GET",
			success:function(result){
				result=JSON.parse(result);//用parse()函数对返回的数据进行了处理，使其转换为js对象
				buildTable(result);		  //得到数据后构建表格
				bulidPageInfo(result);	  //构建分页信息
				bulidPageNav(result);	  //构建分页导航
			}
		});
	}

	function buildTable(result) {
		$('#tbody').empty();
		var cs=result.extend.pageInfo.list;
		$.each(cs,function(index,item){
			var checkBoxTd=$("<td><input type='checkbox' class='check_item' /></td>");
			
			var delete_btn=$('<button></button>').addClass("btn btn-info btn-sm btn_view")
			.append($("<span></span>")
			.addClass('glyphicon glyphicon-eye-open')
			.append('查看'));
			delete_btn.attr("view_id",item.c_idx).attr("aca_idx",item.aca_idx);
			
			var btn_td=$('<td></td>').append(delete_btn);
			var c_name=$('<td></td>').append(item.c_name);
			var aca_name=$('<td></td>').append(item.aca_name);
			var c_info=$('<td></td>').append(item.c_info);
			$('<tr></tr>').append(checkBoxTd).append(c_name).append(aca_name).append(c_info)
							.append(btn_td)
							.appendTo("#tbody");
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
	
	$("#c_add").click(function () {
		$("#form_add_course")[0].reset();
		error_clean($("#add_c_name"));
		error_clean($("#input_info"));
		myUtils.loadAcaSel("#add_sel_aca");
		$("#model_add").modal({
			backdrop:"static"
		});
	});
	
	function error_clean($ele) {
		$ele.parent().removeClass("has-success has-error");
		$ele.next("span").text("");
	}
	
	function validata_form($ele,status,msg){//显示表单错误信息
		error_clean($ele);
		if("success"==status){
			$ele.parent().addClass("has-success");
			$ele.next('span').text("");
		}else{
			$ele.parent().addClass("has-error");
			$ele.next('span').text(msg);
		}
	}
	//添加事件
	$("#c_save_btn").click(function () {
		//数据校验
		var data_c=$("#form_add_course").serialize();
		data_c = decodeURIComponent(data_c,true); //中文乱码解决办法
		$.ajax({
			type:"post",
			url:"/MY_EMS/course/addCourse.do",
			data:data_c,
			success:function(result){
				result=JSON.parse(result);
				if(result.code==200){
					$("#model_add").modal("hide");
					to_PageWithJson(9999);
				}else{
					if(undefined!=result.extend.error_map.c_name){
						validata_form($("#add_c_name"),"error",result.extend.error_map.c_name);
					}
					if(undefined!=result.extend.error_map.c_info){
						validata_form($("#input_info"),"error",result.extend.error_map.c_info);
					}
				}
			}
		}); 
	});
	
	//单个查看
	$(document).on("click",".btn_view",function(){
		var c_name=$(this).parents("tr").find("td:eq(1)").text();
		var c_idx=$(this).attr("view_id");
		loadPanel(c_name,c_idx);
	});
	function loadPanel(c_name,c_idx) {
		$("#tbody_2").empty();
		if(undefined==c_idx){
			c_idx=$("#view_c_idx").val();
		}
		$("#view_c_idx").val(c_idx);
		if(undefined!=c_name){
			$("#panel_title").text(c_name+" 课程");
		}
		$.ajax({
			url:"/MY_EMS/banCourse/viewBs.do?c_idx="+c_idx,
			type:"get",
			success:function(result){
				result=JSON.parse(result);
				var list3=result.extend.list3;
				var list1=result.extend.list1;
				$.each(result.extend.list2,function(index,item){
					var td1=$('<td></td>').append(item.t_name);
					var td2=$('<td></td>').append(list3[index]);
					var delete_btn=$('<button></button>').addClass("btn btn-danger btn-sm btn_del")
					.append($("<span></span>")
					.addClass('glyphicon glyphicon-trash')
					.append('删除'));
					delete_btn.attr("del_id",list1[index].bc_idx);
					var btn_td=$('<td></td>').append(delete_btn);
					
					$('<tr></tr>').append(td1).append(td2).append(btn_td)
					.appendTo("#tbody_2");
				});
				
			}
		});
	}
	
	//全选
	$("#check_all").click(function () {
		var check_status=$(this).prop("checked");
		$(".check_item").prop("checked",check_status);
	});
	
	$(document).on("click",".check_item",function(){
		var len=$(".check_item:checked").length;
		$("#check_all").prop("checked",len==$(".check_item").length);
	});
	
	$("#del_all").click(function () {
		var del_idxs="";
		$.each($(".check_item:checked"),function(){
			del_idxs+=$(this).parents("tr").find("td:eq(4)").find("button:eq(0)").attr("view_id")+"-";
		});
		del_idxs=del_idxs.substring(0,del_idxs.length-1);
		if(del_idxs.length==0){
			alert("请选择要删除的课程");
			return;
		}
		if(confirm("确认要删除选中学院吗？")){
			$.ajax({
				url:"/MY_EMS/course/benchDel.do?c_idxs="+del_idxs,
				type:"get",
				success: function (result) {
					result=JSON.parse(result);
					alert(result.message);
					to_PageWithJson(current_page);
				}
			});
		}
	}); 
	
	$("#btn_search").click(function () {//模糊查询课程
		var c_name=$("#search_c").val();
		$.ajax({
			url:"/MY_EMS/course/search.do?c="+c_name,
			type:"get",
			success:function(result){
				result=JSON.parse(result);//用parse()函数对返回的数据进行了处理，使其转换为json对象
				buildTable(result);
				bulidPageInfo(result);
				bulidPageNav(result);
			}			
		});
	});
	$("#btn_add_bc").click(function () {
		var checked_item=$(".check_item:checked");
		if(checked_item.length==0){
			alert("请先勾选一条课程记录！");
			return;
		}else if(checked_item.length>1){
			alert("只能勾选一条课程记录！");
			return;
		}else{
			var c_idx=checked_item.parents("tr").find("td:eq(4)").find("button:eq(0)").attr("view_id");
			var c_name=checked_item.parents("tr").find("td:eq(1)").text();
			var aca_idx=checked_item.parents("tr").find("td:eq(4)").find("button:eq(0)").attr("aca_idx");
			$("#form_add_bc")[0].reset();
			$("#add_c_idx").val(c_idx);
			$("#static_c_name").text(c_name);
			loadTeaSel(aca_idx,"#add_sel_tea");//加载教师下拉框
			loadClassSel("#add_b_grade","#add_sel_ban");//加载班级下拉框
			
			$("#model_bc_add").modal({
				backdrop:"static"
			});
		}
		
	});
	
	function loadClassSel(ele2,ele3) {
		$(ele3).empty();
		var grade_val=$(ele2).val();
		$.ajax({
			url:"/MY_EMS/myClass/getBanJi.do?b_grade="+grade_val,
			type:"get",
			success:function(result){
				result=JSON.parse(result);
				var data=result.extend.data;
				$.each(data,function(index,item){
            		var optionEle=$("<option></option>").append(item.b_name).attr("value",item.b_idx);
            		optionEle.appendTo(ele3);
            	});
			}
		});
	}
	function loadTeaSel(aca_idx,ele) {
		$(ele).empty();
		$.ajax({
			url:"/MY_EMS/teacher/getTeaByAca.do?aca_idx="+aca_idx,
			type:"get",
			success:function(result){
				result=JSON.parse(result);
				var data=result.extend.data;
				$.each(data,function(index,item){
            		var optionEle=$("<option></option>").append(item.t_name).attr("value",item.t_no);
            		optionEle.appendTo(ele);
            	});
			}
		});
	}
	
	$("#bc_save_btn").click(function () {
		var data_bc=$("#form_add_bc").serialize();
		data_bc = decodeURIComponent(data_bc,true); //中文乱码解决办法
		$.ajax({
			type:"post",
			url:"/MY_EMS/banCourse/addBc.do",
			data:data_bc,
			success:function(result){
				result=JSON.parse(result);
				if(result.code==200){
					$("#model_bc_add").modal("hide");
					loadPanel($("#static_c_name").text(),$("#add_c_idx").val());//刷新panel
				}else{
					if(undefined!=result.extend.error_map.b_idx){
						validata_form($("#add_sel_ban"),"error",result.extend.error_map.b_idx);
					}
					if(undefined!=result.extend.error_map.t_no){
						validata_form($("#add_sel_tea"),"error",result.extend.error_map.t_no);
					}
				}
			}
		}); 
	})
	
	//单个删除
	$(document).on("click",".btn_del",function(){
		var bc_idx=$(this).attr("del_id");
		if(confirm("确认要删除该班级课程吗？")){
			//确认true
			$.ajax({
				url:"/MY_EMS/banCourse/delBc.do?bc_idx="+bc_idx,
				type:"get",
				success:function(result){
					loadPanel();
				}
			});
		}
	});
	
	$("#add_b_grade").change(function () {
		loadClassSel(this,"#add_sel_ban");
	});
</script>
</html>