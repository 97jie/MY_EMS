<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员首页</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
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
<div class="container-fluid" style="height: 75%">
    <div class="row-fluid">
        <div class="col-md-12" style="margin-top: 30px">
            <ul class="nav nav-pills">
                 <li class="active">
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
	            <li class="">
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
            <hr  width="90%" align="left" style="height:3px; margin-top: 40px;background-color: #0f0f0f" />
            <h1 style="font-weight: bolder;color: #2e6da4;text-align: center;margin-top: 100px" >
                			管理员您好！
            </h1>
            <h1 style="font-weight: bolder;color: #2e6da4;text-align: center;margin-top: 100px" >
                		欢迎使用作业管理系统！
            </h1>
        </div>
    </div>
</div>
<div class="footer navbar-fixed-bottom" id="footer" style="background-color: #adbfff;height: 12%">
   <div style="margin-top: 78px">
		<h4 style="text-align: center">©2019&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我们：6654331</h4>
	</div>
</div>
</body>
</html>