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
<title>项目详情</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="shortcut icon" href="favicon.ico">
<!-- <link href="assets/css/plugins/layuis/layui.css" rel="stylesheet" media="all"> -->
</head>
<body class="gray-bg">
		<div class="col-sm-12">
			<div class="wrapper wrapper-content animated fadeInUp">
				<div class="col-sm-12">
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-12">
								<div class="m-b-md">
									<h2>${projectName}</h2>
								</div>
								<dl class="dl-horizontal">
								<dt>项目状态：&nbsp;&nbsp;&nbsp;</dt>
									<dd id="dd_projectStatus">
								    </dd>
								</dl>
								<dl class="dl-horizontal">
								<dt>当前进度：&nbsp;&nbsp;&nbsp;</dt>
									<dd id="dd_schedule">
										<div class="progress progress-striped active m-b-sm">
											<div id="schedule_div" style="width: 62.63%;" class="progress-bar"></div>
										</div>
										<small>当前已完成项目总进度的 <strong id="schedule_strong">62.63%</strong></small>
									</dd>
								</dl>
							</div>
						</div>
						<!-- <div class="row">
							<div class="col-sm-1">
							</div>
							<div class="col-sm-2">
								<dl class="dl-horizontal">
									<dt>测点记录：&nbsp;&nbsp;&nbsp;</dt>
									<dd id="dd_detectionPointCont">0</dd>
									<dt>阀值记录：&nbsp;&nbsp;&nbsp;</dt>
									<dd id="dd_thresHoldCont">0</dd>
									<dt>图片记录：&nbsp;&nbsp;&nbsp;</dt>
									<dd id="dd_imageCont">0</dd>
									<dt>传感器记录：</dt>
									<dd id="dd_sensorInfoCont">0</dd>
								</dl>
							</div>
							<div class="col-sm-7" id="cluster_info">
								<dl class="dl-horizontal">
									<dt>创建时间：</dt>
									<dd id="dd_beginTime">2017-05-10 00:00:00</dd>
									<dt>结束时间：</dt>
									<dd id="dd_endTime">2018-02-25 19:14:24</dd>
									<dt>项目地点：</dt>
									<dd id="dd_address">湖南长沙</dd>
									<dt>项目经度：</dt>
									<dd id="dd_Longitude">12''45'</dd>
									<dt>项目纬度：</dt>
									<dd id="dd_Latitude">13''14</dd>
								</dl>
							</div>
						</div> -->
						<div class="row">
							<div class="col-sm-1" style="width:5%">
							</div>
							<div class="col-sm-6" id="project_content">
								<div class="ibox-content">
			                        <div class="echarts" id="project_column_div" style="height: 260px">
			                        </div>
			                    </div>
							</div>
						</div>
						<div class="row m-t-sm">
							<div class="col-sm-12">
								<div class="panel blank-panel">
									<div class="panel-heading">
										<div class="panel-options">
											<ul class="nav nav-tabs">
												<li><a href="project_detail.html#tab-1"
													data-toggle="tab">测点</a></li>
												<li class=""><a href="project_detail.html#tab-5"
													data-toggle="tab">采集器</a></li>
												<li class=""><a href="project_detail.html#tab-2"
													data-toggle="tab">传感器</a></li>
												<li class=""><a href="project_detail.html#tab-6"
													data-toggle="tab">结构健康</a></li>
												<li class=""><a href="project_detail.html#tab-4"
													data-toggle="tab">阀值</a></li>
												<!-- <li><a href="project_detail.html#tab-3"
													data-toggle="tab">图片</a></li> -->
											</ul>
										</div>
									</div>

									<div class="panel-body">
										<div class="tab-content">
											<div class="tab-pane active" id="tab-1">
												<div class="feed-activity-list">
													<table class="table table-striped" id="detail_tab_1">
													<thead>
														<tr>
															<th>名称</th>
															<th>类型</th>
															<th>经度</th>
															<th>纬度</th>
															<th>描述</th>
														</tr>
													</thead>
													<tbody id="tbody_detectionPoint">
													</tbody>
													</table>
													<div style="margin-top:15px; text-align:center;" id="pageComponent_1"></div>
												</div>
											</div>
											<!-- 采集器，未更新，4,5写死展示 -->
											<div class="tab-pane" id="tab-5">
												<div class="feed-activity-list">
													<table class="table table-striped">
													<thead>
														<tr>
															<th>采集器编号</th>
															<th>创建时间</th>
															<th>更新时间</th>
															<th>采集器信号强度</th>
															<th>采集时间间隔</th>
															<th>采集器状态</th>
															<th>采集器电压</th>
														</tr>
													</thead>
													<tbody id="tbody_terminals">
													</tbody>
													</table>
													<div style="margin-top:15px; text-align:center;" id="pageComponent_terminals"></div>
												</div>
											</div>
											<div class="tab-pane" id="tab-2">
												<table class="table table-striped">
													<thead>
														<tr>
															<th>所属测点</th>
															<th>编号</th>
															<th>类型</th>
															<th>模型</th>
															<th>深度</th>
														</tr>
													</thead>
													<tbody id="tbody_sensorInfo">
													</tbody>
												</table>
												<div style="margin-top:15px; text-align:center;" id="pageComponent_2"></div>
											</div>
											<div class="tab-pane" id="tab-6">
												<div class="feed-activity-list">
													<table class="table table-striped">
													<thead>
														<tr>
															<th>测点ID</th>
															<th>采集器编号</th>
															<th>传感器ID</th>
															<th>告警类型</th>
															<th>告警内容</th>
															<th>产生时间</th>
															<th>告警等级</th>
															<th>同类消息产生次数</th>
															<th>处理</th>
														</tr>
													</thead>
													<tbody id="tbody_alarm">
													</tbody>
													</table>
													<div style="margin-top:15px; text-align:center;" id="pageComponent_3"></div>
												</div>
											</div>
											<div class="tab-pane" id="tab-4">
												<table class="table table-striped">
													<thead>
														<tr>
															<th>测点类型</th>
															<th>阀值类型</th>
															<th>最小警戒值</th>
															<th>最大警戒值</th>
															<th>最小意外剧烈变化幅度大的值</th>
															<th>最大意外剧烈变化幅度大的值</th>
														</tr>
													</thead>
													<tbody id="tbody_thresHold">
													</tbody>
												</table>
											</div>
											<!-- <div class="tab-pane" id="tab-3">
												<table class="table table-striped">
													<thead>
														<tr>
															<th>测点类型</th>
															<th>热点图</th>
															<th>现场图</th>
														</tr>
													</thead>
													<tbody id="tbody_image">
													</tbody>
												</table>
											</div> -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<input class="md_input" style="display:none" id="project_detail_projectId" name="project_detail_projectId" value="${projectId}">
				<input class="md_input" style="display:none" id="project_detail_projectName" name="project_detail_projectName" value="${projectName}">
			</div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/content.js"></script>
	<script src="assets/js/plugins/echarts/echarts-all.js"></script>
	<script src="assets/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="assets/js/customerValidate.js"></script>
	<script src="assets/js/plugins/laydate/laydate.js" charset="utf-8"></script>
	<script src="assets/js/layui.all.js" charset="utf-8"></script>
	
	<!-- external jquery -->
	<script src="assets/js/project_detail.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loading-example-btn").click(function() {
				btn = $(this);
				simpleLoad(btn, true);
				simpleLoad(btn, false)
			})
		});
		function simpleLoad(btn, state) {
			if (state) {
				btn.children().addClass("fa-spin");
				btn.contents().last().replaceWith(" Loading")
			} else {
				setTimeout(function() {
					btn.children().removeClass("fa-spin");
					btn.contents().last().replaceWith(" Refresh")
				}, 2000)
			}
		};
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
