<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <% String
path = request.getContextPath(); String basePath =
request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title></title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />

<!-- Bootstrap core CSS     -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="assets/css/paper-dashboard.css" rel="stylesheet" />


<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="assets/css/demo.css" rel="stylesheet" />


<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="assets/css/themify-icons.css" rel="stylesheet">
<!--style="background: url(assets/img/background/backgroud-3.jpg);" -->

</head>
<body>
	<!--头层-->
	<div id="header">
		<br> &ensp;&ensp;&ensp;&ensp;&ensp; <img
			src="assets/img/zdlogo.png"> <a style="font-size: 26px"
			href=""><font><font color="#FFFFFF">中大检测自动检测</font></font></a>
	</div>

	</div>
	<div id="header_s">
		<br>
		<ul class="nav navbar-nav navbar-right">
			<li><a style="font-size: 26px" href=""><font><font
						color="#FFFFFF"> 登陆 </font></font></a></li>
			<li><a style="font-size: 26px" href=""><font><font
						color="#FFFFFF"> 首页 </font></font></a></li>
		</ul>
	</div>
	<div id="last"></div>
	<!--注册层-->
	<div id="section">
		<div id="innaf">
			<h3>注册</h3>
			<br>
			<div class="form-group">
				<input type="input" id="input_color" placeholder="请设置您的用户名(例：中大检测)"
					class="form-control input-no-border">
			</div>
			<div class="form-group">
				<input type="password" id="input_color"
					placeholder="请设置您的密码(6-16个字符，区分大小写)"
					class="form-control input-no-border">
			</div>
			<div class="form-group">
				<input type="input" id="input_color"
					placeholder="请输入您的邮箱地址(例：1234567890@qq.com)"
					class="form-control input-no-border">
			</div>
			<div class="form-group">
				<input type="input" id="input_color" placeholder="请输入您常用的手机号码"
					class="form-control input-no-border">
			</div>
			<div class="input-group">
				<input type="text" id="input_color" placeholder="输入验证码"
					class="form-control"> <span class="input-group-btn">
					<button class="btn btn-default" type="button">获取验证码</button>
				</span>
			</div>
			<!-- /input-group -->
			<div class="form-group">
				<input type="input" id="input_color" placeholder="选填：公司名称(默认：中大检测)"
					class="form-control  input-no-border">
			</div>
			<div class="form-group">
				<input type="input" id="input_color" placeholder="选填：联系人(默认：罗杰)"
					class="form-control input-no-border">
			</div>
			<div id="app">
				&ensp; &ensp; <input type="checkbox" id="checkbox" v-model="checked">
				<label for="checkbox" style="font-size: 13px">我已同意<a href="">《出去吃饭一定要坑老大君子协议》</a></label>
			</div>
			<div class="card-footer text-center">
				<button type="submit" id="button_color" class="btn btn-fill btn-wd ">
					<font><font>确认注册</font></font>
				</button>
			</div>
		</div>
</body>