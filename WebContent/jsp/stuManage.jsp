<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
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

<!-- 添加模态框 -->
<div class="modal fade" id="model_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加学生</h4>
      </div>
      <div class="modal-body">
	       	<form class="form-horizontal" id="form_add_stu">
	  			<div class="form-group">
	    			<label for="input_s_no" class="col-sm-3 control-label">学生学号：</label>
	   				<div class="col-sm-8">
	     				<input type="text" name="s_no" class="form-control" id="input_s_no" placeholder="学号">
	  					<span class="help-block"></span>
	  				</div>
	  			</div>
	  			<div class="form-group">
	    			<label for="input_s_name" class="col-sm-3 control-label" >学生姓名：</label>
	    			<div class="col-sm-8">
	      				<input type="text" name="s_name" class="form-control" id="input_s_name" placeholder="姓名">
	    				<span class="help-block"></span>
	    			</div>
	 			</div>
	  			<div class="form-group">
	    			<label for="input_s_pwd" class="col-sm-3 control-label" >密码：</label>
	    			<div class="col-sm-8">
	      				<input type="text" name="s_pwd" class="form-control" id="input_s_pwd" placeholder="密码">
	    				<span class="help-block"></span>
	    			</div>
	 			</div>
	  			<div class="form-group" id="add_gender_radio">
	    			<label  class="col-sm-3 control-label">性别：</label>
	    			<div class="col-sm-8">
	      				<label class="radio-inline">
  							<input type="radio" name="s_gender" checked="checked" value="男">男
						</label>
						<label class="radio-inline">
  							<input type="radio" name="s_gender" value="女"> 女
						</label>
	    			</div>
	 			</div>
	 			<div class="form-group">
	    			<label for="input_s_email" class="col-sm-3 control-label" >邮箱：</label>
	    			<div class="col-sm-8">
	      				<input type="email" name="s_email" class="form-control" id="input_s_email" placeholder="邮箱">
	    				<span class="help-block"></span>
	    			</div>
	 			</div>
	 			<div class="form-group">
	    			<label for="input_s_idcard" class="col-sm-3 control-label" >身份证号：</label>
	    			<div class="col-sm-8">
	      				<input type="text" name="s_id_card" class="form-control" id="input_s_idcard" placeholder="身份证号">
	    				<span class="help-block"></span>
	    			</div>
	 			</div>
	 			<div class="form-group">
	    			<label for="input_s_phone_num" class="col-sm-3 control-label" >手机号码：</label>
	    			<div class="col-sm-8">
	      				<input type="text" name="s_phone_num" class="form-control" id="input_s_phone_num" placeholder="手机号码">
	    				<span class="help-block"></span>
	    			</div>
	 			</div>
	 			<div class="form-group">
	    			<label for="add_sel_aca" class="col-sm-3 control-label" >所在学院：</label>
	    			<div class="col-sm-8">
	      				<select  class="form-control" id="add_sel_aca" name="aca_idx">
	      				</select>
	    			</div>
	 			</div>
	 			<div class="form-group">
	    			<label for="input_s_grade" class="col-sm-3 control-label" >年级：</label>
	    			<div class="col-sm-8">
	      				<input type="number" class="form-control" id="input_s_grade" value="2015" name="s_grade" />
	    			</div>
	 			</div>
	 			<div class="form-group">
	    			<label for="add_sel_class" class="col-sm-3 control-label" >所在班级：</label>
	    			<div class="col-sm-8">
	      				<select  class="form-control" id="add_sel_class" name="b_idx">
	      				</select>
	    			</div>
	 			</div>
	 			<div class="form-group">
	    			<label for="input_s_birth" class="col-sm-3 control-label" >出生日期：</label>
	    			<div class="col-sm-8">
	      				<input type="date" class="form-control" id="birth" name="s_birth"/>
	    			</div>
	 			</div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="stu_save_btn">保存</button>
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
            <li class="active">
                <a href="/MY_EMS/jsp/stuManage.jsp">学生管理</a>
            </li>
           <li class="">
                <a href="/MY_EMS/jsp/classManage.jsp">班级管理</a>
            </li>
            <li class="">
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
    	<div class="col-md-6">
         	<form class="form-inline" id="mo_stu_search">
         		<label style="font-size: 16px" >选择学院:</label>
         		<select style="width: 150px;height: 30px" name="aca_idx" id="mo_aca_sel"></select>
         		<input type="number" placeholder="输入年级" style="width: 150px;height: 30px;margin-left: 5px" name="s_grade" id="mo_s_grade">
         		<label style="font-size: 16px" >选择班级:</label>
         		<select style="width: 150px;height: 30px" name="b_idx" id="mo_b_sel"></select>
         	</form>
         </div>
    	
     	<div class="col-md-4">
         	<form class="form-inline" style="margin-left: 15px">
         		<label style="font-size: 15.5px">精准搜索学生：</label>
              <input id="search_stu" class="form-control input search-query glyphicon glyphicon-search" placeholder="搜索学生（输入学号或姓名）" type="text" style="height: 35px;width: 200px"/>
              <button type="button" class="btn btn-info" id="btn_search">
              	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>查找
              </button>
         	</form>
         </div>
         <div class="col-md-2">
         	 <button type="submit" class="btn btn-primary" id="stu_add">
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
                 	学生学号
              </th>
              <th>
                	  学生姓名
              </th>
              <th>
                  	密码
              </th>
              <th>
                  	性别
              </th>
              <th>
                  	邮箱
              </th>
              <th>
                  	身份证号
              </th>
              <th>
                  	手机号
              </th>
               <th>
                  	所在学院
              </th>
              <th>
                  	年级
              </th>
              <th>
                  	所在班级
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
     	<div class="col-md-4" id="page_nav">
		</div>
		<!-- <button class="btn btn-info" style="margin-left: 30px">学生补选课程</button> -->
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
		to_PageWithJson(1)
	});
	
	function to_PageWithJson(pn) {
		$.ajax({
			url:"/MY_EMS/student/getAllStusWithJson.do",
			data:"pn="+pn,
			type:"GET",
			success:function(result){
				result=JSON.parse(result);//用parse()函数对返回的数据进行了处理，使其转换为json对象
				buildTable(result);
				bulidPageInfo(result);
				bulidPageNav(result);
			}
		});
	}

	function buildTable(result) {
		$('#tbody').empty();
		var stus=result.extend.pageInfo.list;
		console.log(stus);
		$.each(stus,function(index,item){
			var checkBoxTd=$("<td><input type='checkbox' class='check_item' /></td>");
			
			var delete_btn=$('<button></button>').addClass("btn btn-danger btn-sm btn_delete")
			.append($("<span></span>")
			.addClass('glyphicon glyphicon-trash')
			.append('删除'));
			delete_btn.attr("del_id",item.s_no);
			var btn_td=$('<td></td>').append(delete_btn)
			
			var s_no=$('<td></td>').append(item.s_no);
			var s_name=$('<td></td>').append(item.s_name);
			var s_pwd=$('<td></td>').append(item.s_pwd);
			var s_gender=$('<td></td>').append(item.s_gender);
			var s_id_card=$('<td></td>').append(item.s_id_card);
			var s_phone_num=$('<td></td>').append(item.s_phone_num);
			var s_email=$('<td></td>').append(item.s_email);
			var aca_name=$('<td></td>').append(item.aca_name);
			var b_name=$('<td></td>').append(item.b_name);
			var s_grade=$('<td></td>').append(item.s_grade);
			
			$('<tr></tr>').append(checkBoxTd).append(s_no).
							append(s_name).append(s_pwd).
							append(s_gender).append(s_email).append(s_id_card).
							append(s_phone_num).append(aca_name).append(s_grade)
							.append(b_name).append(btn_td)
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
	
	myUtils.loadAcaSel("#mo_aca_sel");
	
	
	$("#stu_add").click(function () {
		$("#form_add_stu")[0].reset();//清空表单
		clean_form();
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
	$("#stu_save_btn").click(function () {
		//数据校验
		var data_stu=$("#form_add_stu").serialize();
		data_stu = decodeURIComponent(data_stu,true); //中文乱码解决办法
		clean_form();
		$.ajax({
			type:"post",
			url:"/MY_EMS/student/addStu.do",
			data:data_stu,
			success:function(result){
				result=JSON.parse(result);
				if(result.code==200){
					$("#model_add").modal("hide");
					to_PageWithJson(9999);
				}else{
					if(undefined!=result.extend.error_map.s_no){
						validata_form($("#input_s_no"),"error",result.extend.error_map.s_no);
					}
					if(undefined!=result.extend.error_map.s_name){
						validata_form($("#input_s_name"),"error",result.extend.error_map.s_name);
					}
					if(undefined!=result.extend.error_map.s_pwd){
						validata_form($("#input_s_pwd"),"error",result.extend.error_map.s_pwd);
					}
					if(undefined!=result.extend.error_map.s_email){
						validata_form($("#input_s_email"),"error",result.extend.error_map.s_email);
					}
					if(undefined!=result.extend.error_map.s_id_card){
						validata_form($("#input_s_id_card"),"error",result.extend.error_map.s_id_card);
					}
					if(undefined!=result.extend.error_map.s_phone_num){
						validata_form($("#input_s_phone_num"),"error",result.extend.error_map.s_phone_num);
					}
				}
			},
			error: function () {
				validata_form($("#input_s_no"),"error","学号重复，请确认后再添加！");
			}
		}); 
	});
	
	//单个删除
	$(document).on("click",".btn_delete",function(){
		var stu_name=$(this).parents("tr").find("td:eq(2)").text();
		var stu_no=$(this).attr("del_id");
		if(confirm("确认要删除【"+stu_name+"】吗？")){
			//确认true
			$.ajax({
				url:"/MY_EMS/student/benchDel.do?stu_nos="+stu_no,
				type:"get",
				success:function(result){
					result=JSON.parse(result);
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
		if(confirm("确认要删除选中学生吗？")){
			$.ajax({
				url:"/MY_EMS/student/benchDel.do?stu_nos="+del_idxs,
				type:"get",
				success: function (result) {
					result=JSON.parse(result);
					alert(result.message);
					to_PageWithJson(current_page);
				}
			});
		}
	}); 
	
	$("#btn_search").click(function () {//模糊查询学生,学号和姓名都可以
		var stu=$("#search_stu").val();
		$.ajax({
			url:"/MY_EMS/student/search.do?stu="+stu,
			type:"get",
			success:function(result){
				result=JSON.parse(result);//用parse()函数对返回的数据进行了处理，使其转换为json对象
				buildTable(result);
				bulidPageInfo(result);
				bulidPageNav(result);
			}			
		});
	});
	
	function loadClassSel(ele1,ele2,ele3) {
		$(ele3).empty();
		var aca_idx=$(ele1).val();
		var grade_val=$(ele2).val();
		$.ajax({
			url:"/MY_EMS/myClass/getBanJi.do?aca_idx="+aca_idx+"&b_grade="+grade_val,
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
	
	function eleChange(ele_id,flag) {//当id 为 ele_id的元素值改变时回调方法，重新加载班级选择下拉框
		if(flag){
			$(ele_id).change(function () {
				loadClassSel("#mo_aca_sel","#mo_s_grade","#mo_b_sel");
				var data_stu=$("#mo_stu_search").serialize();
				data_stu = decodeURIComponent(data_stu,true); //中文乱码解决办法/发送请求，重新加载页面
				$.ajax({
					url:"/MY_EMS/student/moSearch.do",
					data:data_stu,
					type:"post",
					success:function(result){
						result=JSON.parse(result);
						buildTable(result);
						bulidPageInfo(result);
						bulidPageNav(result);
					}
				});
			});
		}else{
			$(ele_id).change(function () {
				loadClassSel("#add_sel_aca","#input_s_grade","#add_sel_class");
			});
		}
			
	}
	eleChange("#add_sel_aca");
	eleChange("#input_s_grade");
	eleChange("#mo_aca_sel",true);
	eleChange("#mo_s_grade",true);
	
	function clean_form() {
		error_clean($("#input_s_no"));
		error_clean($("#input_s_name"));
		error_clean($("#input_s_pwd"));
		error_clean($("#input_s_email"));
		error_clean($("#input_s_id_card"));
		error_clean($("#input_s_phone_num"));
	}
</script>
</html>