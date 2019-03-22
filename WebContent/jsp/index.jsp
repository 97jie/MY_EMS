<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="../css/bootstrap.css" type="text/css" rel="stylesheet">
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <style>
        html,body{
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }

        #head{
            background: #7fb7b6;
            text-align: center;
            height:20%;
        }
        #div_body{
            /*background: #cecfd2;*/
            height: 60%;
        }
        #foot{
            background: #7fb7b6;
            height: 20%;
        }
        label{
            font-size: medium;
        }
        a{
            font-size: medium;
        }
        form{
        	padding-left: 100px;
        	padding-top: 15px;
        }
    </style>
</head>
<body style="background-color: #337ab7">
	<div class="container-fluid" style="background-color: #dff0d8">
	    <div class="row-fluid" style="margin-top: 30px">
            <div class="span12">
                <h1 contenteditable="true" class="text-info" style="font-weight: bold;padding-left: 50px">作业管理系统</h1>
            </div>
	        <hr  width="90%" align="left" style="height:3px;margin-top: 40px;background-color: #0f0f0f" />
	    </div>
    <div class="row-fluid" style="margin-top: 100px">
        <div class="col-lg-6" style="padding-bottom: 50px">
                <img src="../image/login.jpg" style="width: 400px;margin-left: 100px"/>
        </div>
        <div class="col-lg-6" >
        	<form class="form-horizontal" id="form">
	            <div class="form-group">
	                <label for="s_no" class="col-sm-2 control-label" id="label_num">学号:</label>
	                <div class="col-sm-5">
	                    <input type="text" placeholder="学号:" class="form-control" id="no" name="s_no">
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-2 control-label">密码:</label>
	                <div class="col-sm-5">
	                    <input type="password" placeholder="密码:" class="form-control" name="s_pwd" id="pwd">
	                </div>
	            </div>
			</form>
            <div class="form-inline has-warning" style="margin-top: 10px;padding-left: 200px">
                <div class="radio " class="col-lg-4">
                    <label>
                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                      		  教师登录
                    </label>
                 </div>
                &nbsp;&nbsp;
                <div class="radio"class="col-lg-4">
                    <label>
                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2" checked >
                        		学生登录
                    </label>
                </div>
            </div>
            <div class="form-group col-lg-8 col-lg-offset-2  has-warning" style="margin-top: 20px;margin-bottom: 30px">
                    <button class="btn btn-warning col-md-offset-2" id="login" style="width: 220px">登录</button>
                   <!--  <a href="#" style="padding-top: 15px;padding-left: 100px">忘记密码?</a> -->
            </div>
       
        </div>
    </div>
    </div>
</body>
    <script>
        var r1=document.getElementById("optionsRadios1");
        var r2=document.getElementById("optionsRadios2");
        var num=document.getElementById("no");
        r1.onclick=function (ev) {
            var label_num=document.getElementById("label_num");
            label_num.innerHTML="工号:";
            num.placeholder="工号";
            $("#no").attr("name","t_no");
            $("#pwd").attr("name","t_pwd");
        }
        r2.onclick=function (ev) {
            var label_num=document.getElementById("label_num");
            label_num.innerHTML="学号:"
            num.placeholder="学号"
            $("#no").attr("name","s_no");
            $("#pwd").attr("name","s_pwd");
        }

        $(document).on("click","#login",function(){
            if (r1.checked) {//教师登录
            	$("#no").attr("name","t_no");
                $("#pwd").attr("name","t_pwd");
                data = decodeURIComponent(data,true); //中文乱码解决办法
                var data=$("#form").serialize();
            	$.ajax({
            		url:"/MY_EMS/teacher/teaLogin.do",
            		data:data,
            		type:"post",
            		 success:function(result){
                		result=JSON.parse(result);
                	 	if(result.code==100){
                	 		alert("用户名或密码错误!");
                	 	}else{
                	 		window.location.href="/MY_EMS/jsp/teaMain.jsp";
                	 	}
                	 }
            	});
            } else {
            	 $("#no").attr("name","s_no");
                 $("#pwd").attr("name","s_pwd");
                 data = decodeURIComponent(data,true); //中文乱码解决办法
                 var data=$("#form").serialize();
            	$.ajax({
            		url:"/MY_EMS/student/stuLogin.do",
            		data:data,
            		type:"post",
            		 success:function(result){
                		result=JSON.parse(result);
                	 	if(result.code==100){
                	 		alert("用户名或密码错误!");
                	 	}else{
                	 		window.location.href="/MY_EMS/jsp/stuMain.jsp";
                	 	}
                	 }
            	});
            }
        });
        
       
    </script>
