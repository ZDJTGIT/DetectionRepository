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


<title>用户&告警联系人信息表</title>
<meta name="keywords" content="">
<meta name="description"
	content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="assets/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="assets/css/animate.min.css" rel="stylesheet">
<link href="assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>用户详细信息列表</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_data_tables.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="table_data_tables.html#">添加联系人</a></li>
								<li><a href="table_data_tables.html#">删除联系人</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-5 m-b-xs">
								<p>详细记录用户各项基本信息</p>
								<!-- 添加联系人功能可删除 -->
								<button class="btn btn-sm btn-white">添加联系人</button>
							</div>
							<div class="col-sm-4 m-b-xs">
								<div data-toggle="buttons" class="btn-group">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="input-group">
									<input type="text" placeholder="请输入关键词"
										class="input-sm form-control"> <span
										class="input-group-btn">
										<button type="button" class="btn btn-sm btn-primary">
											搜索</button>
									</span>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>序号</th>
									    <th>账户</th>
									    <th>用户名</th>
									    <th>系统名称</th>
									    <th>用户角色</th>
									    <th>邮箱</th>
										<th>手机号码</th>
										<th>所属公司</th>
										<th>创建时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>055</th>
										<th>mmmy</th>
										<th>罗杰</th>
										<th>农田自动检测系统</th>
										<th>系统管理员</th>
										<th>794948489@qq.com</th>
										<th>18546474587</th>
										<th>中大检测</th>
										<th>2017/7/27 13:19:41</th>
										<td><a href="table_basic.html#"><i
												class="fa fa-check text-navy"></i></a></td>
									</tr>
									<tr>
										<th>541</th>
										<th>mmmy</th>
										<th>李茂平</th>
										<th>农田自动检测系统</th>
										<th>管理员</th>
										<th>8786454@qq.com</th>
										<th>13547944754</th>
										<th>中大检测分公司</th>
										<th>2017/7/27 13:19:41</th>
										<td><a href="table_basic.html#"><i
												class="fa fa-check text-navy"></i></a></td>
									</tr>
									<tr>
										<th>666</th>
										<th>wwws</th>
										<th>貂蝉</th>
										<th>农田自动检测系统</th>
										<th>普通用户</th>
										<th>8786454@qq.com</th>
										<th>13547944754</th>
										<th>中大检测分公司</th>
										<th>2017/7/27 13:19:41</th>
										<td><a href="table_basic.html#"><i
												class="fa fa-check text-navy"></i></a></td>
									</tr>
									<tr>
										<th>999</th>
										<th>cccy</th>
										<th>嫦娥</th>
										<th>农田自动检测系统</th>
										<th>告警联系人</th>
										<th>8786454@qq.com</th>
										<th>13547944754</th>
										<th>中大检测分公司</th>
										<th>2017/7/27 13:19:41</th>
										<td><a href="table_basic.html#"><i
												class="fa fa-check text-navy"></i></a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>告警联系人列表</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_basic.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="table_basic.html#">添加联系人</a></li>
								<li><a href="table_basic.html#">删除联系人</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-5 m-b-xs">
								<p>系统数据告警时系统自动与相关联系人建立联系。</p>
								<button class="btn btn-sm btn-white">添加联系人</button>
							</div>
							<div class="col-sm-4 m-b-xs">
								<div data-toggle="buttons" class="btn-group">
									<label class="btn btn-sm btn-white"> <input
										type="radio" id="option1" name="options">隧道
									</label> <label class="btn btn-sm btn-white active"> <input
										type="radio" id="option2" name="options">农田
									</label> <label class="btn btn-sm btn-white"> <input
										type="radio" id="option3" name="options">桥梁
									</label><label class="btn btn-sm btn-white"> <input
										type="radio" id="option4" name="options">公路
									</label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="input-group">
									<input type="text" placeholder="请输入关键词"
										class="input-sm form-control"> <span
										class="input-group-btn">
										<button type="button" class="btn btn-sm btn-primary">
											搜索</button>
									</span>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th></th>
										<th>接收人</th>
									    <th>接收告警类型</th>
									    <th>接收方式</th>
									    <th>手机号</th>
									    <th>邮箱</th>
									    <th>短信接收告警级别</th>
									    <th>邮件接收告警级别</th>
									    <th>操作</th>
									    </tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox" checked class="i-checks"
											name="input[]"></td>
										<th>罗杰</th>
									    <th>农田水位告警</th>
									    <th>短信接收</th>
									    <th>15456547878</th>
									    <th>888888@qq.com</th>
									    <th>3</th>
									    <th>2</th>
										<td><a href="table_basic.html#"><i
												class="fa fa-check text-navy"></i></a></td>
									</tr>
									<tr>
										<td><input type="checkbox" checked class="i-checks"
											name="input[]"></td>
										<th>张无忌</th>
									    <th>农田水位告警</th>
									    <th>短信接收</th>
									    <th>15456547878</th>
									    <th>888888@qq.com</th>
									    <th>2</th>
									    <th>1</th>
										<td><a href="table_basic.html#"><i
												class="fa fa-check text-navy"></i></a></td>
									</tr>
									<tr>
										<td><input type="checkbox" checked class="i-checks"
											name="input[]"></td>
										<th>猪八戒</th>
									    <th>农田PH/铬含量异常告警</th>
									    <th>短信接收</th>
									    <th>15456547878</th>
									    <th>8877788@qq.com</th>
									    <th>3</th>
									    <th>2</th>
										<td><a href="table_basic.html#"><i
												class="fa fa-check text-navy"></i></a></td>
									</tr>
									<tr>
										<td><input type="checkbox" checked class="i-checks"
											name="input[]"></td>
										<th>蜘蛛侠</th>
									    <th>农田PH/铬含量异常告警</th>
									    <th>邮件接收</th>
									    <th>15456547878</th>
									    <th>8666788@qq.com</th>
									    <th>1</th>
									    <th>1</th>
										<td><a href="table_basic.html#"><i
												class="fa fa-check text-navy"></i></a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<script src="assets/js/jquery.min.js?v=2.1.4"></script>
	<script src="assets/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="assets/js/plugins/peity/jquery.peity.min.js"></script>
	<script src="assets/js/content.min.js?v=1.0.0"></script>
	<script src="assets/js/plugins/iCheck/icheck.min.js"></script>
	<script src="assets/js/demo/peity-demo.min.js"></script>
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


<!-- Mirrored from www.zi-han.net/theme/hplus/table_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:01 GMT -->
</html>
