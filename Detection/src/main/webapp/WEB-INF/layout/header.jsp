<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>header</title>
</head>
<body>
	<header class="navbar navbar-default">
		<div class="logo">
			<a href="#" class="simple-text"> <img src="assets/img/zdLogo.png"
				alt="logo" class="logo">
			</a>
		</div>
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
					<span class="icon-bar bar3"></span>
				</button>
				<a class="navbar-brand" href="#">中国大检测数据在线监控平台</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="ti-drupal"></i>
							<p>${userInfo.status}</p>
					</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class="ti-bell"></i> <!--  <p class="notification">5</p> -->
							<span class="badge">5</span>
							<p>消息</p> <b class="caret caret_jt"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">消息 1</a></li>
							<li><a href="#">消息 2</a></li>
							<li><a href="#">消息 3</a></li>
							<li><a href="#">消息 4</a></li>
							<li><a href="#">其它 消息</a></li>
						</ul></li>
					<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="ti-user"></i>
							<p>${userInfo.name}</p> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="rest/page/login">切换账户</a></li>
							<li><a href="rest/user/logout">退出</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</header>
</body>
</html>