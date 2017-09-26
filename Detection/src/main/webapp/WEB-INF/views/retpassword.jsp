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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detection密码找回</title>
    <meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
    <meta name="description" content="中大检测平台">

    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/zdLogo.png">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
	<link href="assets/css/animate.min.css" rel="stylesheet">
    <link href="assets/css/style.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>
<body class="gray-bg">
	<div class="middle-box text-center loginscreen  animated fadeInDown">
		<div>
            <div>
                <img alt="" src="assets/img/zdLogo.png">
                <h2 class="logo-name">Detection</h2>
            </div>
            <h3>中大检测找回密码</h3>
            <form class="m-t" role="form">
                <div class="form-group">
                    <input type="text" id="contect" name="contect" class="form-control" placeholder="请输入注册手机号或邮箱" >
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="verification" name="verification" style="width:65%; float: left" placeholder="请输入验证码" name="verification">
                	<input type="button" id="putverification" class="btn btn-primary" style="width:35%; float: left" value="发送验证码">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="password" name="password" style="margin-top:65px" placeholder="请输入新密码(6-13位数字)" >
                </div>
                <button type="button" id="submitpw" class="btn btn-primary block full-width m-b">提交</button>
                <p class="text-muted text-center"> <a href="">
                <small>手机邮箱更换了？</small></a>
                </p>
				<div class="dd">
					<span><font color="red" size="5">${error}</font></span>
				</div>
            </form>
        </div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" 
	        src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
	<script type="text/javascript">
		$('#putverification').click(function(){
			alert("正在发送验证码");
			var contect = $('#contect').val();
			$.ajax({
				  type: 'post',
	    		  url: 'rest/user/retpassword',
	    		  data: {contect:contect},
			      });
		});
		
  		$('#submitpw').click(function(){
			alert("正在提交新密码");
			
		});
	</script>
</body>
</html>