<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<style type="text/css">
#mapContent {
	height: 700px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3 col-sm-6">
				<div class="card">
					<div class="content">
						<div class="row">
							<div class="col-xs-5">
								<div class="icon-big icon-warning text-center">
									<i class="ti-server"></i>
								</div>
							</div>
							<div class="col-xs-7">
								<div class="numbers">
									<p>农田</p>
									4000亩
								</div>
							</div>
						</div>
						<div class="footer">
							<hr />
							<div class="stats">
								<i class="ti-reload"></i> 当前
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="card">
					<div class="content">
						<div class="row">
							<div class="col-xs-5">
								<div class="icon-big icon-success text-center">
									<i class="ti-wallet"></i>
								</div>
							</div>
							<div class="col-xs-7">
								<div class="numbers">
									<p>隧道</p>
									20测点
								</div>
							</div>
						</div>
						<div class="footer">
							<hr />
							<div class="stats">
								<i class="ti-calendar"></i> 一天前
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="card">
					<div class="content">
						<div class="row">
							<div class="col-xs-5">
								<div class="icon-big icon-danger text-center">
									<i class="ti-pulse"></i>
								</div>
							</div>
							<div class="col-xs-7">
								<div class="numbers">
									<p>桥梁</p>
									20测点
								</div>
							</div>
						</div>
						<div class="footer">
							<hr />
							<div class="stats">
								<i class="ti-timer"></i> 一小时前
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="card">
					<div class="content">
						<div class="row">
							<div class="col-xs-5">
								<div class="icon-big icon-info text-center">
									<i class="ti-twitter-alt"></i>
								</div>
							</div>
							<div class="col-xs-7">
								<div class="numbers">
									<p>高层建筑</p>
									20测点
								</div>
							</div>
						</div>
						<div class="footer">
							<hr />
							<div class="stats">
								<i class="ti-reload"></i> 当前
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="content" id="mapContent"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="content">
						<div id="chartHours" class="ct-chart"></div>
						<div class="footer">
							<div class="chart-legend">
								<i class="fa fa-circle text-info"></i> Open <i
									class="fa fa-circle text-danger"></i> Click <i
									class="fa fa-circle text-warning"></i> Click Second Time
							</div>
							<hr>
							<div class="stats">
								<i class="ti-reload"></i> Updated 3 minutes ago
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

$(document).ready(function(){

    demo.initAMap();

    $.notify({
        icon: 'ti-home',
        message: "欢迎来到<b>中大检测在线监控平台</b>."

    },{
        type: 'success',
        timer: 4000
    });

});

</script>
</html>