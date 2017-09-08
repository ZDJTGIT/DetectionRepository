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
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96" href="assets/img/zdLogo.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>登录到Decetion</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- Bootstrap core CSS     -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<!-- Animation library for notifications   -->
<link href="assets/css/animate.min.css" rel="stylesheet"/>
<!--  Paper Dashboard core CSS    -->
<link href="assets/css/paper-dashboard.css" rel="stylesheet"/>
<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="assets/css/demo.css" rel="stylesheet" />
<!--  Fonts and icons     -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
<link href="assets/css/themify-icons.css" rel="stylesheet">
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN LOGO -->
<div class="logo">
	<img src="assets/img/zdLogo.png" alt=""/>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<body style="background: url(assets/img/background/backgroud-3.jpg);" class="blur" >
    <nav class="navbar navbar-transparent navbar-absolute">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href=""><font><font>中大检测自动检测</font></font></a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                       <a href=""><font><font>
                            注册
                        </font></font></a>
                    </li>
                    <li>
                       <a href=""><font><font>
                            首页
                        </font></font></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- 登录层 -->
    <div class="content" style="position:absolute;left:50%;margin-left:-600px;top:50%;margin-top:-300px;">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                	<!-- BEGIN LOGIN FORM -->
                    <form method="post" action="rest/user/login">
                        <div class="card" >
                            <div style="text-align: center;">
                            <br>
                                <h3 class="card-title"><font><font>登录</font></font></h3>
                                <br>
                            </div>
                            <div class="form-group">
                                <label ><font style="color: #010101">&ensp;用户名</font></label>
                                <input type="text" name="name" placeholder="请输入用户名" class="form-control input-no-border">
                            </div>
                            <div class="form-group">
                                <label ><font style="color: #010101">&ensp;密码</font></label>
                                &ensp;<input type="password" name="password" placeholder="请输入密码" class="form-control input-no-border">
                            </div>
                            <div class="card-footer text-center">
                                <button type="submit" class="btn btn-fill btn-wd "><font><font>我们走吧</font></font></button>
                                <div class="forgot">
                                    <a href=""><font><font>忘记密码了吗？</font></font></a>
                                </div>
                                <br>
                            </div>
                        </div>
                        <div class="dd">
							<span><font color="red" size="5">${error}</font></span>
						</div>
                    </form>
                    <!-- END LOGIN FORM -->
                </div>
            </div>
        </div>
    </div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright">
	 2017 &copy; Detection by zhongda
</div>
</body>
</html>