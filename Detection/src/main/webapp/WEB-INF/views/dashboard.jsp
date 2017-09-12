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
<head></head>
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
									<p>湘潭农田</p>
									4000亩
								</div>
							</div>
						</div>
						<div class="footer">
							<hr />
							<div class="stats">
								<i class="ti-reload"></i> Updated now
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
									<p>测点数量</p>
									40个测点
								</div>
							</div>
						</div>
						<div class="footer">
							<hr />
							<div class="stats">
								<i class="ti-calendar"></i> Last day
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
									<p>异常数量</p>
									23
								</div>
							</div>
						</div>
						<div class="footer">
							<hr />
							<div class="stats">
								<i class="ti-timer"></i> In the last hour
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
									<p>当前情况</p>
									+45
								</div>
							</div>
						</div>
						<div class="footer">
							<hr />
							<div class="stats">
								<i class="ti-reload"></i> Updated now
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">

			<div class="col-md-12">
				<div class="card">
					<div class="header">
						<h4 class="title">水位变化</h4>
						<p class="category">24 Hours performance</p>
					</div>
					<div class="content">
						<div id="waterlevel" style="height: 500px">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<div class="header">
							<h4 class="title">PH变化</h4>
							<p class="category">24 Hours performance</p>
						</div>
						<div class="content">
							<div id="ph" style="height: 300px;"></div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card ">
						<div class="header">
                            <h4 class="title">镉变化</h4>
                            <p class="category">24 Hours performance</p>
                        </div> 
						<div class="content">
							<div id="cadmium" style="height: 300px"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- 李茂平做的表修改 -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="content">
							<div class="header">
								<h4 class="title">测点数据表</h4>
								<div style="float: right;">
									<button type="button">导出到Excel</button>
								</div>
								<br> <br>
								<div>
									<p class="category">
									<div>
										<div style="float: left;">
											显示&ensp; <select style="width: 140px; height: 30px">
												<option>8</option>
												<option>16</option>
												<option>All</option>
											</select>&ensp; 项结果
										</div>
										<div style="float: right;">
											<div style="float: left;">
												<input type="text" class="form-control border-input"
													placeholder="请输入搜索内容">
											</div>
											<div style="float: right; margin: 0px 0px 0px 10px;">
												<button class="btn btn-default btn-block">搜索</button>
											</div>
										</div>
									</div>
									
								</div>
							</div>
							<div class="content table-responsive table-full-width">
								<table class="table table-striped">
									<!-- <table class="table table-bordered"> -->
									<thead>
										<tr>
											<th>测点编号</th>
											<th>测点位置</th>
											<th>实时水深</th>
											<th>实时PH值</th>
											<th>实时镉含量</th>
											<th>实时状态值</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Dakota Rice</td>
											<td>$36,738</td>
											<td>Niger</td>
											<td>Oud-Turnhout</td>
											<td>正常</td>
										</tr>
										<tr>
											<td>2</td>
											<td>Minerva Hooper</td>
											<td>$23,789</td>
											<td>Curaçao</td>
											<td>Sinaai-Waas</td>
											<td>正常</td>
										</tr>
										<tr>
											<td>3</td>
											<td>Sage Rodriguez</td>
											<td>$56,142</td>
											<td>Netherlands</td>
											<td>Baileux</td>
											<td>正常</td>
										</tr>
										<tr>
											<td>4</td>
											<td>Philip Chaney</td>
											<td>$38,735</td>
											<td>Korea, South</td>
											<td>Overland Park</td>
											<td>正常</td>
										</tr>
										<tr>
											<td>5</td>
											<td>Doris Greene</td>
											<td>$63,542</td>
											<td>Malawi</td>
											<td>Feldkirchen in Kärnten</td>
											<td>正常</td>
										</tr>
										<tr>
											<td>6</td>
											<td>Mason Porter</td>
											<td>$78,615</td>
											<td>Chile</td>
											<td>Gloucester</td>
											<td>正常</td>
										</tr>
										<tr>
											<td>7</td>
											<td>Mason Porter</td>
											<td>$78,615</td>
											<td>Chile</td>
											<td>Gloucester</td>
											<td>正常</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div align="center">
								<ul class="pagination">
									<li><a href="#">&laquo;</a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
	<script src="echarts-2.2.7/doc/example/www/js/echarts.js"></script>
	<script src = "echarts-2.2.7/js/dashboard.js"></script>
	<script type="text/javascript">
		water();
		ph();
		cadmium();
		$(document).ready(function() {
		
			demo.initChartist();
		
			$.notify({
				icon : 'ti-gift',
				message : "欢迎进入我的项目 ."
		
			}, {
				type : 'success',
				timer : 4000
			});
		
		});
	</script>

</html>
