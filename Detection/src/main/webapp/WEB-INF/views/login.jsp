<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>登录到Decetion</title>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="assets/css/mylogin.css">
<script type="text/javascript" src="assets/plugin/jquery-1.10.2.js"></script>
<script type="text/javascript" src="assets/js/login.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->

<!-- BEGIN LOGIN -->
<body>
    <div class="container" style="width: 100%">

		<div class="row" >
			<div class="col-lg-6 col-lg-myself">
				<ul class="list-inline " style="margin-left: 20%;">
					<li>
						<img src="assets/img/zdLogo.png"  alt="图片未加载">
					</li>
					<li>
						<p class="text-left fontzd">中大检测自动检测平台</p>
					</li>
				</ul>
			</div>
			<div class="col-lg-6 col-lg-myself">
				<ul class="list-inline" style="margin-left: 50%">
					<li>
						<p><a href="#" class="a-fontstyle" >注册</a></p>
					</li>
					<li>
						<p ><a href="rest/page/dashboard" class="a-fontstyle" >首页</a></p>
					</li>
				</ul>
			</div>
		</div>
		<div class="row" >
			<div class="row rowlogin" >
				<h3><font class="fontlogin">登 录</font></h3>
				<!-- BEGIN LOGIN FORM -->
				<form class="form-horizontal" method="post" action="rest/user/login">
						<div class="row rowuser" >
							<label  >账号</label>
						</div>
						 <div class="row rowuser">
						      <input type="text" class="inputuser" name="name" value="admin" style="" id="name" placeholder="请输入账号" size="30">
						 </div>
						<div class="row rowpassword" >
							<label  >密码</label>
						</div>
						 <div class="row rowuser">
						      <input type="password" name="password" value="123456" class="inputuser" id="password" placeholder="请输入密码" size="30">
						 </div>
						 <div class="row rowpassword" >
						 	<div style="text-align: center;">
						 		<input type="submit" style="font-size: 15px" class="btn btn-fill btn-wd "  value="我们走">
						 	</div>
						 </div>
						 <div class="dd">
							<span><font color="red" size="5">${error}</font></span>
						</div>
				</form>
				<!-- END LOGIN FORM -->
				<div class="row rowuser" >
					<div class="fogetpassword-div">
						<p class="text-center a-fogetpassword"><a href="#" >忘记密码了吗?</a></p>
					</div>
				</div>
			</div>
		</div>
		<!-- END LOGIN -->
		<!-- BEGIN COPYRIGHT -->
		<div class="row row-bottomdiv" >
				<p class="text-center" style="color: #FFFFFF">2017 &copy; Detection by zhongda</p>
		</div>
	</div>
	
</body>
</html>