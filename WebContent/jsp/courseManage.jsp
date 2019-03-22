<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>课程管理</title>
    <link  rel="stylesheet" type="text/css" href="../css/bootstrap.css" >
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
                        <a href="#">个人信息</a>
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
     	<div class="col-md-8">
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
    </div>
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
                	  删除
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
<div class="footer navbar-fixed-bottom" id="footer" style="background-color: #adbfff;height: 15%">
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
			
			var delete_btn=$('<button></button>').addClass("btn btn-danger btn-sm btn_delete")
			.append($("<span></span>")
			.addClass('glyphicon glyphicon-trash')
			.append('删除'));
			delete_btn.attr("del_id",item.c_idx);
			
			var btn_td=$('<td></td>').append(delete_btn)
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
	
	//单个删除
	$(document).on("click",".btn_delete",function(){
		var c_name=$(this).parents("tr").find("td:eq(1)").text();
		var c_idx=$(this).attr("del_id");
		if(confirm("确认要删除【"+c_name+"】吗？")){
			//确认true
			$.ajax({
				url:"/MY_EMS/course/benchDel.do?c_idxs="+c_idx,
				type:"get",
				success:function(result){
					result=JSON.parse(result);
					alert(result.message);
					to_PageWithJson(current_page);
				}
			});
		}
	});
	
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
			del_idxs+=$(this).parents("tr").find("td:eq(4)").find("button:eq(1)").attr("del_id")+"-";
		});
		del_idxs=del_idxs.substring(0,del_idxs.length-1);
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
</script>
</html>