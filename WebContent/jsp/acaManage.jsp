<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学院管理</title>
    <link  rel="stylesheet" type="text/css" href="../css/bootstrap.css" >
     <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
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
    /* alert(ad_session.split("=")[1].split(",")[0]) */
	if(ad_session=='null'){
		alert("请先登录！");
		window.location.href="adminLogin.jsp";
	} 
</script>

<!-- 学院修改模态框 -->
<div class="modal fade" id="model_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">学院修改</h4>
      </div>
      <div class="modal-body">
	       	<form class="form-horizontal" id="form_edit_aca">
	       		<input type="hidden" name="aca_idx" id="edit_aca_idx">
	  			<div class="form-group">
	    			<label for="aca_name_edit" class="col-sm-3 control-label">学院名称：</label>
	   				<div class="col-sm-8">
	     				<p class="form-control-static" id="static_aca_name"></p>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="input_info_edit" class="col-sm-3 control-label" style="margin-top: 25px ">学院信息：</label>
	    			<div class="col-sm-8">
	      				<textarea name="aca_info" rows="3" class="col-sm-12" placeholder="学院信息" id="input_info_edit"></textarea>
	    				<span class="help-block"></span>
	    			</div>
	 			</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="aca_update_btn">更新</button>
      </div>
    </div>
  </div>
</div>

<!-- 学院添加模态框 -->
<div class="modal fade" id="model_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加学院</h4>
      </div>
      <div class="modal-body">
	       	<form class="form-horizontal" id="form_add_aca">
	  			<div class="form-group">
	    			<label for="input_name" class="col-sm-3 control-label">学院名称：</label>
	   				<div class="col-sm-8">
	     				<input type="text" name="aca_name" class="form-control" id="input_name" placeholder="名称">
	  					<span class="help-block"></span>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="input_info" class="col-sm-3 control-label" style="margin-top: 25px ">学院信息：</label>
	    			<div class="col-sm-8">
	      				<textarea name="aca_info" rows="3" class="col-sm-12" placeholder="学院信息" id="input_info"></textarea>
	    				<span class="help-block"></span>
	    			</div>
	 			</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="aca_save_btn">保存</button>
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
            <li class="active">
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
            <li class="">
                <a href="/MY_EMS/jsp/courseManage.jsp">课程管理</a>
            </li>
            <li class="">
                <a href="/MY_EMS/jsp/courseManage.jsp">班级课程管理</a>
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
              <input id="search_aca" class="input search-query glyphicon glyphicon-search" placeholder="搜索学院" type="text" style="height: 35px;width: 200px"/>
              	<!-- button 的type属性不能为submit，否则执行完ajax会刷新页面 ，大坑-->
              <button type="button" class="btn btn-primary" id="btn_search">
              	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>查找
              </button>
         	</form>
         </div>
         <div class="col-md-2">
         	 <button type="submit" class="btn btn-primary" id="aca_add">
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
              <th>
                 	学院idx
              </th>
              <th width="300px">
                	  学院名称
              </th>
              <th width="600px">
                  	学院信息
              </th>
              <th>
                  	修改|
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
			url:"/MY_EMS/Aca/getAllAcasWithJson.do",
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
		var acas=result.extend.pageInfo.list;
		$.each(acas,function(index,item){
			var checkBoxTd=$("<td><input type='checkbox' class='check_item' /></td>");
			
			var edit_btn=$('<button></button>').addClass("btn btn-success btn-sm btn_edit")
			.append($("<span></span>")
			.addClass('glyphicon glyphicon-pencil')
			.append('编辑'));
			edit_btn.attr("edit_id",item.aca_idx);
			
			var delete_btn=$('<button></button>').addClass("btn btn-danger btn-sm btn_delete")
			.append($("<span></span>")
			.addClass('glyphicon glyphicon-trash')
			.append('删除'));
			delete_btn.attr("del_id",item.aca_idx);
			
			var btn_td=$('<td></td>').append(edit_btn).append(" ").append(delete_btn)
			/* alert(item.aca_idx); */
			var aca_idx=$('<td></td>').append(item.aca_idx);
			var aca_name=$('<td></td>').append(item.aca_name);
			var aca_info=$('<td></td>').append(item.aca_info);
			$('<tr></tr>').append(checkBoxTd).append(aca_idx).append(aca_name).append(aca_info)
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
	
	$("#aca_add").click(function () {
		$("#form_add_aca")[0].reset();
		error_clean($("#input_info"));
		error_clean($("#input_name"));
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
	$("#aca_save_btn").click(function () {
		//数据校验
		var data_aca=$("#form_add_aca").serialize();
		data_aca = decodeURIComponent(data_aca,true); //中文乱码解决办法
		$.ajax({
			type:"post",
			url:"/MY_EMS/Aca/addAca.do",
			data:data_aca,
			success:function(result){
				result=JSON.parse(result);
				if(result.code==200){
					$("#model_add").modal("hide");
					to_PageWithJson(9999);
				}else{
					if(undefined!=result.extend.error_map.aca_info){
						validata_form($("#input_info"),"error",result.extend.error_map.aca_info);
					}
					if(undefined!=result.extend.error_map.aca_name){
						validata_form($("#input_name"),"error",result.extend.error_map.aca_name);
					}
				}
			}
		}); 
	});
	
	$("#input_name").change(function () {
		var val=this.value;
		$.ajax({
			url:"/MY_EMS/Aca/checkAca.do",
			data:"aca_name="+val,
			type:"POST",
			success:function(result){
				var re=JSON.parse(result);
				if(re.code==100){
					alert("学院名称重复！");
					$("#input_name").parent().addClass("has-error");
					$("#aca_save_btn")[0].disabled=false;
				}
			}
			
		});
	});
	
	//编辑功能
	$(document).on("click",".btn_edit",function(){
		var aca_idx=$(this).attr("edit_id");
		getAcaByIdx(aca_idx);
		$("#edit_aca_idx").val(aca_idx);
		
		$("#model_edit").modal({
			backdrop:"static"
		});
	});
	
	function getAcaByIdx(aca_idx){
		$.ajax({
			url:"/MY_EMS/Aca/getAca.do?aca_idx="+aca_idx,
			type:"GET",
			success:function(result){
				result=JSON.parse(result);
				var acaData=result.extend.aca;
				$("#static_aca_name").text(acaData.aca_name);
				$("#input_info_edit").val(acaData.aca_info);
			}
		});
	}
	
	$("#aca_update_btn").click(function(){
		var data_aca=$("#form_edit_aca").serialize();
		data_aca = decodeURIComponent(data_aca,true); //中文乱码解决办法
		$.ajax({
			url:"/MY_EMS/Aca/savaAca.do",
			type:"POST",
			data:data_aca,
			success:function(result){
				result=JSON.parse(result);
				alert(result.message);
				$("#model_edit").modal("hide");
				to_PageWithJson(current_page);
			}
		});
	});
	
	//单个删除
	$(document).on("click",".btn_delete",function(){
		var aca_name=$(this).parents("tr").find("td:eq(2)").text();
		var aca_idx=$(this).attr("del_id");
		if(confirm("确认要删除【"+aca_name+"】吗？")){
			//确认true
			$.ajax({
				url:"/MY_EMS/Aca/benchDel.do?aca_idxs="+aca_idx,
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
			del_idxs+=$(this).parents("tr").find("td:eq(1)").text()+"-";
		});
		del_idxs=del_idxs.substring(0,del_idxs.length-1);
		if(confirm("确认要删除选中学院吗？")){
			$.ajax({
				url:"/MY_EMS/Aca/benchDel.do?aca_idxs="+del_idxs,
				type:"get",
				success: function (result) {
					result=JSON.parse(result);
					alert(result.message);
					to_PageWithJson(current_page);
				}
			});
		}
	}); 
	
	$("#btn_search").click(function () {//模糊查询学院
		var aca_name=$("#search_aca").val();
		$.ajax({
			url:"/MY_EMS/Aca/searchByName.do?aca_name="+aca_name,
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