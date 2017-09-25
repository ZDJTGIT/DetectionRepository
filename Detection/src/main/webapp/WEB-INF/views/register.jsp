<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<title>注册</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">

<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="assets/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="assets/css/animate.min.css" rel="stylesheet">
<link href="assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<script>
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
</script>

</head>

<body class="gray-bg">

	<div class="middle-box text-center loginscreen   animated fadeInDown">
		<div>
			<div>
				<img src="assets/img/zdLogo.png"  alt="图片未加载">
                <h1 class="logo-name">Detection</h1>
			</div>
			<h3>欢迎注册中大检测平台账户</h3>
			<p>创建一个中大检测新账户</p>
			<form class="m-t" role="form"
				action="http://www.zi-han.net/theme/hplus/login.html">
				<div class="form-group">
					<input type="text"  class="form-control" placeholder="请输入用户名（例：中大检测）"
						required="">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="请设置您的密码(6-16个字符，区分大小写)"
						required="">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="请输入您的邮箱地址(例：1234567890@qq.com)"
						required="">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="请输入您常用的手机号码"
						required="">
				</div>
				<div class="input-group">
                    <input type="text"  id="input_color"  placeholder="输入验证码" class="form-control">
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                                            获取验证码
                    </button>
                    </span>
                </div>
				<br>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="选填：公司名称(默认：中大检测)"
						required="">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="选填：联系人(默认：罗杰)"
						required="">
				</div>
				<div class="form-group text-left">
					<div class="checkbox i-checks">
						<label class="no-padding"> <input type="checkbox"><i></i>
							我同意注册协议
						</label>
					</div>
				</div>
				<button type="submit" class="btn btn-primary block full-width m-b">注
					册</button>

				<p class="text-muted text-center">
					<small>已经有账户了？</small><a href="login.html">点此登录</a>
				</p>

			</form>
		</div>
	</div>
	<script src="assets/js/jquery.min.js?v=2.1.4"></script>
	<script src="assets/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="assets/js/plugins/iCheck/icheck.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			})
		});
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
