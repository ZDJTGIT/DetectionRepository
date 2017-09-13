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


<title>详细检验数据检测分析</title>
<meta name="keywords" content="">
<meta name="description"
	content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

<!-- Data Tables -->
<link href="assets/css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">

<link href="assets/css/animate.min.css" rel="stylesheet">
<link href="assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>
							历史检测信息表
						</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_data_tables.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="table_data_tables.html#">选项1</a></li>
								<li><a href="table_data_tables.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
					    <div class="">
							<a onclick="fnClickAddRow();" href="javascript:void(0);"
								class="btn btn-primary ">添加行</a>
						</div>
						<table
							class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<td>测点编号</td>
									<td>采集器</td>
									<td>测点详细位置</td>
									<td>传感器编号</td>
									<td>传感器状态</td>
									<td>水深(cm)</td>
									<td>PH值</td>
									<td>镉含量(mg/kg)</td>
									<td>日期</td>
								</tr>
							</thead>
							<tbody>
								<tr class="gradeX">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeC">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeC">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeX">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeC">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeC">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeA">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeX">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeX">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeX">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeC">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeC">
									<td>01</td>
									<td>1102</td>
									<td>中大检测</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
								</tr>
								<tr class="gradeU">
									<td>02</td>
									<td>1101</td>
									<td>湖南大学</td>
									<td>018</td>
									<td>1</td>
									<td>5.6</td>
									<td>7.5</td>
									<td>0.05</td>
									<td>2017/7/27 13:16:40</td>
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
						<h5>异常数据分析表</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_data_tables.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="table_data_tables.html#">选项1</a></li>
								<li><a href="table_data_tables.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="">
							<a onclick="fnClickAddRow();" href="javascript:void(0);"
								class="btn btn-primary ">添加行</a>
						</div>
						<table class="table table-striped table-bordered table-hover "
							id="editable">
							<thead>
								<tr>
									<td>可疑检测点编号</td>
									<td>可疑监测点</td>
									<td>异常数据</td>
									<td>异常原因分析</td>
									<td>时间</td>
								</tr>
							</thead>
							<tbody>
								<tr class="gradeX">
									<td>013</td>
									<td>中大广场</td>
									<td>水位：30</td>
									<td>设备故障</td>
									<td>2017/7/27 13:19:41</td>
								</tr>
								<tr class="gradeC">
									<td>014</td>
									<td>五一广场</td>
									<td>水位：340</td>
									<td>设备故障</td>
									<td>2017/7/27 13:19:41</td>
								</tr>
								<tr class="gradeA">
									<td>584</td>
									<td>北京大学</td>
									<td>PH值：13</td>
									<td>设备故障</td>
									<td>2017/7/27 13:19:41</td>
								</tr>
								<tr class="gradeA">
									<td>584</td>
									<td>北京大学</td>
									<td>PH值：13</td>
									<td>设备故障</td>
									<td>2017/7/27 13:19:41</td>
								</tr>
								<tr class="gradeA">
									<td>584</td>
									<td>北京大学</td>
									<td>PH值：13</td>
									<td>设备故障</td>
									<td>2017/7/27 13:19:41</td>
								</tr>
								<tr class="gradeA">
									<td>584</td>
									<td>北京大学</td>
									<td>PH值：13</td>
									<td>设备故障</td>
									<td>2017/7/27 13:19:41</td>
								</tr>
								<tr class="gradeA">
									<td>584</td>
									<td>北京大学</td>
									<td>PH值：13</td>
									<td>设备故障</td>
									<td>2017/7/27 13:19:41</td>
								</tr>
								<tr class="gradeA">
									<td>584</td>
									<td>北京大学</td>
									<td>PH值：13</td>
									<td>设备故障</td>
									<td>2017/7/27 13:19:41</td>
								</tr>
								<tr class="gradeA">
									<td>584</td>
									<td>北京大学</td>
									<td>PH值：13</td>
									<td>设备故障</td>
									<td>2017/7/27 13:19:41</td>
								</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/jquery.min.js?v=2.1.4"></script>
	<script src="assets/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="assets/js/plugins/jeditable/jquery.jeditable.js"></script>
	<script src="assets/js/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/plugins/dataTables/dataTables.bootstrap.js"></script>
	<script src="assets/js/content.min.js?v=1.0.0"></script>
	<script>
		$(document)
				.ready(
						function() {
							$(".dataTables-example").dataTable();
							var oTable = $("#editable").dataTable();
							oTable
									.$("td")
									.editable(
											"http://www.zi-han.net/theme/example_ajax.php",
											{
												"callback" : function(sValue, y) {
													var aPos = oTable
															.fnGetPosition(this);
													oTable.fnUpdate(sValue,
															aPos[0], aPos[1])
												},
												"submitdata" : function(value,
														settings) {
													return {
														"row_id" : this.parentNode
																.getAttribute("id"),
														"column" : oTable
																.fnGetPosition(this)[2]
													}
												},
												"width" : "90%",
												"height" : "100%"
											})
						});
		function fnClickAddRow() {
			$("#editable").dataTable()
					.fnAddData(
							[ "Custom row", "New row", "New row", "New row",
									"New row" ])
		};
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>


<!-- Mirrored from www.zi-han.net/theme/hplus/table_data_tables.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:02 GMT -->
</html>
