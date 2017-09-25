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
<title>操作日志表</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/plugins/footable/footable.core.css" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>操作日志表</h5>

						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="#">选项 01</a></li>
								<li><a href="#">选项 02</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">

						<table class="footable table table-stripped toggle-arrow-tiny"
							data-page-size="8">
							<thead>
								<tr>
									<th>公司</th>
									<th>用户名</th>
									<th>操作时间</th>
									<th>设备类型</th>
									<th>操作内容</th>
									<th>操作参数</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>中大检测</th>
									<th>罗杰</th>
									<th>2017/7/27 13:16:41</th>
									<th>Windows系统</th>
									<th>登陆</th>
									<th>无</th>
								</tr>
								<tr>
									<th>中大检测</th>
									<th>罗杰</th>
									<th>2017/7/27 13:18:41</th>
									<th>Ios手机</th>
									<th>登陆</th>
									<th>无</th>
								</tr>
								<tr>
									<th>中大检测</th>
									<th>罗杰</th>
									<th>2017/7/27 13:19:41</th>
									<th>未知设备</th>
									<th>退出登陆</th>
									<th>无</th>
								</tr>
								<tr>
									<th>中大检测</th>
									<th>令狐冲</th>
									<th>2017/7/27 13:19:41</th>
									<th>未知设备</th>
									<th>退出登陆</th>
									<th>无</th>
								</tr>
								<tr>
									<th>中大检测</th>
									<th>杨过</th>
									<th>2017/7/27 13:19:41</th>
									<th>未知设备</th>
									<th>退出登陆</th>
									<th>无</th>
								</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>报表管理</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="#">选项 01</a></li>
								<li><a href="#">选项 02</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<table class="footable table table-stripped toggle-arrow-tiny"
							data-page-size="8">
							<thead>
								<tr>
									<th>报表名称</th>
									<th>生成时间</th>
									<th>操作人</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>五一广场水位变动报告</th>
									<th>2017/7/27 13:19:42</th>
									<th>罗杰</th>
									<th>导出</th>
								</tr>
								<tr>
									<th>五一广场水位变动报告</th>
									<th>2017/7/27 13:19:42</th>
									<th>罗杰</th>
									<th>导出</th>
								</tr>
								<tr>
									<th>中大检测水位变动报告</th>
									<th>2017/7/27 13:21:42</th>
									<th>罗杰</th>
									<th>导出</th>
								</tr>
								<tr>
									<th>中大检测水位变动报告</th>
									<th>2017/7/27 13:21:42</th>
									<th>罗杰</th>
									<th>导出</th>
								</tr>
								<tr>
									<th>中大检测水位变动报告</th>
									<th>2017/7/27 13:21:42</th>
									<th>罗杰</th>
									<th>导出</th>
								</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/plugins/footable/footable.all.min.js"></script>
	<script src="assets/js/content.js"></script>
	<script>
		$(document).ready(function() {
			$(".footable").footable();
			$(".footable2").footable()
		});
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
