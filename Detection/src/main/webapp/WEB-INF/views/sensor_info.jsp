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
<title>传感器信息</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/plugins/table/basic.css" rel="stylesheet">
<link href="assets/css/plugins/table/user.css" rel="stylesheet">
</head>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInUp">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox">
					<div class="ibox-title">
						<h5>测点2-5</h5>
						<div class="ibox-tools">
							<button type="button" class="btn btn-primary btn-xs btn-lg" data-toggle="modal" data-target="#myModal_addProject">
						 		添加传感器
							</button>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row m-b-sm m-t-sm">
							<div class="col-md-1">
								<button type="button" id="loading-example-btn" class="btn btn-white btn-sm">
									<i class="fa fa-refresh"></i> 刷新
								</button>
							</div>
							<div class="col-md-11">
								<div class="input-group">
									<input type="text" id="searchProject" name="searchProject" placeholder="请输入传感器名称" class="input-sm form-control"> 
									<span class="input-group-btn">
										<button type="button" id="searchButton" name="searchButton" class="btn btn-sm btn-primary">
											搜索
										</button>
									</span>
								</div>
							</div>
						</div>
						<div class="project-list">
							<table class="table table-hover" id="">
								<tbody id="">
								
										 <tr>
											<td class="project-title" style="width:60px">
											</td>
					    	  		    	<td class="project-status" style="width:120px">
											<a href="project_detail.html">水深检测传感器</a><br />
										    </td>
										    <td class="project-title" style="width:50px">
											</td>
											<td class="project-status" style="width:200px">
												<span class="label label-primary">传感器编号：CGQ-3</span>
											</td>
											<td class="project-title" style="width:360px">
												<a href="project_detail.html">传感器深度(m)：0.24</a><br />
												<small></small>
											</td>
											<td class="project-title" style="width:500px">
											</td>
											<td class="project-actions">
											    <a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">
													<i class="fa fa-pencil"></i>编辑传感器信息
												</a>
												<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ item.projectId +')">
													<i class="fa fa-times-circle"></i>移除传感器
											    </a>
										   </td>
										</tr>
										<tr>
											<td class="project-title" style="width:60px">
											</td>
					    	  		    	<td class="project-status" style="width:120px">
											<a href="project_detail.html">水深检测传感器</a><br />
										    </td>
										    <td class="project-title" style="width:50px">
											</td>
											<td class="project-status" style="width:200px">
												<span class="label label-primary">传感器编号：CGQ-5</span>
											</td>
											<td class="project-title" style="width:360px">
												<a href="project_detail.html">传感器深度(m)：0.27</a><br />
												<small></small>
											</td>
											<td class="project-title" style="width:500px">
											</td>
											<td class="project-actions">
											    <a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">
													<i class="fa fa-pencil"></i>编辑传感器信息
												</a>
												<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ item.projectId +')">
													<i class="fa fa-times-circle"></i>移除传感器
											    </a>
										   </td>
										</tr>
										<tr>
											<td class="project-title" style="width:60px">
											</td>
					    	  		    	<td class="project-status" style="width:120px">
											<a href="project_detail.html">水深检测传感器</a><br />
										    </td>
										    <td class="project-title" style="width:50px">
											</td>
											<td class="project-status" style="width:200px">
												<span class="label label-primary">传感器编号：CGQ-6</span>
											</td>
											<td class="project-title" style="width:360px">
												<a href="project_detail.html">传感器深度(m)：0.14</a><br />
												<small></small>
											</td>
											<td class="project-title" style="width:500px">
											</td>
											<td class="project-actions">
											    <a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">
													<i class="fa fa-pencil"></i>编辑传感器信息
												</a>
												<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ item.projectId +')">
													<i class="fa fa-times-circle"></i>移除传感器
											    </a>
										   </td>
										</tr>
										<tr>
											<td class="project-title" style="width:60px">
											</td>
					    	  		    	<td class="project-status" style="width:120px">
											<a href="project_detail.html">水深检测传感器</a><br />
										    </td>
										    <td class="project-title" style="width:50px">
											</td>
											<td class="project-status" style="width:200px">
												<span class="label label-primary">传感器编号：CGQ-7</span>
											</td>
											<td class="project-title" style="width:360px">
												<a href="project_detail.html">传感器深度(m)：0.4</a><br />
												<small></small>
											</td>
											<td class="project-title" style="width:500px">
											</td>
											<td class="project-actions">
											    <a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">
													<i class="fa fa-pencil"></i>编辑传感器信息
												</a>
												<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ item.projectId +')">
													<i class="fa fa-times-circle"></i>移除传感器
											    </a>
										   </td>
										</tr>
										<tr>
											<td class="project-title" style="width:60px">
											</td>
					    	  		    	<td class="project-status" style="width:120px">
											<a href="project_detail.html">水深检测传感器</a><br />
										    </td>
										    <td class="project-title" style="width:50px">
											</td>
											<td class="project-status" style="width:200px">
												<span class="label label-primary">传感器编号：CGQ-8</span>
											</td>
											<td class="project-title" style="width:360px">
												<a href="project_detail.html">传感器深度(m)：-0.08</a><br />
												<small></small>
											</td>
											<td class="project-title" style="width:500px">
											</td>
											<td class="project-actions">
											    <a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">
													<i class="fa fa-pencil"></i>编辑传感器信息
												</a>
												<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ item.projectId +')">
													<i class="fa fa-times-circle"></i>移除传感器
											    </a>
										   </td>
										</tr>
										<tr>
											<td class="project-title" style="width:60px">
											</td>
					    	  		    	<td class="project-status" style="width:120px">
											<a href="project_detail.html">水深检测传感器</a><br />
										    </td>
										    <td class="project-title" style="width:50px">
											</td>
											<td class="project-status" style="width:200px">
												<span class="label label-primary">传感器编号：CGQ-10</span>
											</td>
											<td class="project-title" style="width:360px">
												<a href="project_detail.html">传感器深度(m)：0.24</a><br />
												<small></small>
											</td>
											<td class="project-title" style="width:500px">
											</td>
											<td class="project-actions">
											    <a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">
													<i class="fa fa-pencil"></i>编辑传感器信息
												</a>
												<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ item.projectId +')">
													<i class="fa fa-times-circle"></i>移除传感器
											    </a>
										   </td>
										</tr>
										<tr>
											<td class="project-title" style="width:60px">
											</td>
					    	  		    	<td class="project-status" style="width:120px">
											<a href="project_detail.html">水深检测传感器</a><br />
										    </td>
										    <td class="project-title" style="width:50px">
											</td>
											<td class="project-status" style="width:200px">
												<span class="label label-primary">传感器编号：CGQ-11</span>
											</td>
											<td class="project-title" style="width:360px">
												<a href="project_detail.html">传感器深度(m)：0.21</a><br />
												<small></small>
											</td>
											<td class="project-title" style="width:500px">
											</td>
											<td class="project-actions">
											    <a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">
													<i class="fa fa-pencil"></i>编辑传感器信息
												</a>
												<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ item.projectId +')">
													<i class="fa fa-times-circle"></i>移除传感器
											    </a>
										   </td>
										</tr>
										<tr>
											<td class="project-title" style="width:60px">
											</td>
					    	  		    	<td class="project-status" style="width:120px">
											<a href="project_detail.html">水深检测传感器</a><br />
										    </td>
										    <td class="project-title" style="width:50px">
											</td>
											<td class="project-status" style="width:200px">
												<span class="label label-primary">传感器编号：CGQ-14</span>
											</td>
											<td class="project-title" style="width:360px">
												<a href="project_detail.html">传感器深度(m)：0.14</a><br />
												<small></small>
											</td>
											<td class="project-title" style="width:500px">
											</td>
											<td class="project-actions">
											    <a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">
													<i class="fa fa-pencil"></i>编辑传感器信息
												</a>
												<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ item.projectId +')">
													<i class="fa fa-times-circle"></i>移除传感器
											    </a>
										   </td>
										</tr>
								
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/content.js"></script>
	<script src="assets/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="assets/js/customerValidate.js"></script>
	<script src="assets/js/plugins/laydate/laydate.js" charset="utf-8"></script>
	<script src="assets/js/layui.all.js" charset="utf-8"></script>
	<script>
	
		$(document).ready(function() {
			
			//系统自带
			$("#loading-example-btn").click(function() {
				btn = $(this);
				simpleLoad(btn, true);
				simpleLoad(btn, false)
			})
		});			
		
		//系统自带
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