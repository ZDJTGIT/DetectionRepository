<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
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


<title>告警信息表</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="assets/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">

<!-- jqgrid-->
<link href="assets/css/plugins/jqgrid/ui.jqgridffe4.css?0820"
	rel="stylesheet">

<link href="assets/css/animate.min.css" rel="stylesheet">
<link href="assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">

<style>
/* Additional style to fix warning dialog position */
#alertmod_table_list_2 {
	top: 900px !important;
}
</style>

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content  animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>告警处理表</h5>
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
									<td>设备名称</td>
									<td>设备编号</td>
									<td>参数名</td>
									<td>告警描述</td>
									<td>告警时间</td>
									<td>所属系统</td>
									<td>告警等级</td>
									<td>操作</td>
								</tr>
							</thead>
							<tbody>
								<tr class="gradeX">
									<td>深部位移监测装置</td>
									<td>JCZ1</td>
									<td>深部位移位置</td>
									<td>位移位置过大</td>
									<td>2017/7/27 13:16:41</td>
									<td>中大边坡在线自动监测系统</td>
									<td>2</td>
									<td>已处理</td>
								</tr>
								<tr class="gradeX">
									<td>深部位移监测装置</td>
									<td>JCZ2</td>
									<td>深部位移位置</td>
									<td>位移位置过大</td>
									<td>2017/7/24 11:16:41</td>
									<td>中大边坡在线自动监测系统</td>
									<td>2</td>
									<td>已处理</td>
								</tr>
								<tr class="gradeX">
									<td>深部位移监测装置</td>
									<td>JCZ2</td>
									<td>深部位移位置</td>
									<td>位移位置过大</td>
									<td>2017/7/28 13:26:21</td>
									<td>中大边坡在线自动监测系统</td>
									<td>2</td>
									<td>已处理</td>
								</tr>
								<tr class="gradeC">
									<td>深部位移监测装置</td>
									<td>JCZ3</td>
									<td>深部位移位置</td>
									<td>位移位置过大</td>
									<td>2017/9/17 13:16:41</td>
									<td>中大边坡在线自动监测系统</td>
									<td>3</td>
									<td>未处理</td>
								</tr>
								<tr class="gradeA">
									<td>雨量计</td>
									<td>JY01</td>
									<td>降雨量</td>
									<td>降雨量过大</td>
									<td>2017/7/27 13:16:41</td>
									<td>中大边坡在线自动监测系统</td>
									<td>3</td>
									<td>已处理</td>
								</tr>
								<tr class="gradeA">
									<td>雨量计</td>
									<td>JY01</td>
									<td>降雨量</td>
									<td>降雨量过大</td>
									<td>2017/7/27 14:16:41</td>
									<td>中大边坡在线自动监测系统</td>
									<td>2</td>
									<td>已处理</td>
								</tr>
								<tr class="gradeA">
									<td>雨量计</td>
									<td>JY01</td>
									<td>降雨量</td>
									<td>降雨量过大</td>
									<td>2017/7/27 15:16:41</td>
									<td>中大边坡在线自动监测系统</td>
									<td>1</td>
									<td>已处理</td>
								</tr>
								<tr class="gradeA">
									<td>雨量计</td>
									<td>JY01</td>
									<td>降雨量</td>
									<td>降雨量过大</td>
									<td>2017/8/12 13:16:41</td>
									<td>中大边坡在线自动监测系统</td>
									<td>3</td>
									<td>已处理</td>
								</tr>
								<tr class="gradeA">
									<td>雨量计</td>
									<td>JY01</td>
									<td>降雨量</td>
									<td>降雨量过大</td>
									<td>2017/8/14 13:16:41</td>
									<td>中大边坡在线自动监测系统</td>
									<td>3</td>
									<td>已处理</td>
								</tr>
								<tr class="gradeA">
									<td>渗压计</td>
									<td>JCZ1</td>
									<td>地下水水位</td>
									<td>水位过低</td>
									<td>2017/7/27 13:16:41</td>
									<td>中大边坡在线自动监测系统</td>
									<td>3</td>
									<td>已处理</td>
								</tr>
								<tr class="gradeA">
									<td>渗压计</td>
									<td>JCZ1</td>
									<td>地下水水位</td>
									<td>水位过低</td>
									<td>2017/7/29 13:16:41</td>
									<td>中大边坡在线自动监测系统</td>
									<td>2</td>
									<td>已处理</td>
								</tr>
								<tr class="gradeA">
									<td>渗压计</td>
									<td>JCZ1</td>
									<td>地下水水位</td>
									<td>水位过高</td>
									<td>2017/8/20 14:16:41</td>
									<td>中大边坡在线自动监测系统</td>
									<td>3</td>
									<td>已处理</td>
								</tr>
								<tr class="gradeA">
									<td>渗压计</td>
									<td>JCZ1</td>
									<td>地下水水位</td>
									<td>水位过高</td>
									<td>2017/9/16 18:16:41</td>
									<td>中大边坡在线自动监测系统</td>
									<td>2</td>
									<td>未处理</td>
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
	<script src="assets/js/content.js"></script>
	<script>
		$(document).ready(function() {
			$(".dataTables-example").dataTable({"searching" : false});
		});
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>


<!-- Mirrored from www.zi-han.net/theme/hplus/table_data_tables.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:02 GMT -->
</html>
