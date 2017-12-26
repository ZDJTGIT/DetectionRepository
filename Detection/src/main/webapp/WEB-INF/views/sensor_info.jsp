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
						<h5>${detectionName}</h5>
						<div class="ibox-tools">
							<button type="button" class="btn btn-primary btn-xs btn-lg" data-toggle="modal" data-target="#myModal_addSensorInfo">
						 		添加传感器
							</button>
						</div>
					</div>
					<div class="ibox-content">
						<div class="project-list">
							<table class="table table-hover" id="sensorInfo_table">
								<tbody id="sensorInfo_tbody">
								 <tr>
										<td class="project-title" style="width:60px">
										</td>
				    	  		    	<td class="project-title" style="width:120px">
											<a href="javascript:;">传感器类型</a>
									    </td>
									    <td class="project-title" style="width:50px">
										</td>
										<td class="project-title" style="width:200px">
											<a href="javascript:;">传感器编号</a>
										</td>
										<td class="project-title" style="width:260px">
											<a href="javascript:;">传感器深度(m)</a>
										</td>
										<td class="project-title" style="width:260px">
											传感器型号
										</td>
										<td class="project-status" style="display:none">
											传感器ID（隐藏）
										</td>
										<td class="project-status" style="display:none">
											测点ID（隐藏）
										</td>
										<td class="project-title" style="width:260px">
											采集器编号
										</td>
										<td class="project-title" style="width:340px">
										</td>
										<td class="project-title" style="width:120px">
											<a href="javascript:;">&nbsp;&nbsp;&nbsp;&nbsp;操作栏</a>
										</td>
										<td class="project-actions">
									    </td>
									   </tr>
								
								</tbody>
							</table>
						</div>
						
						<!-- Modal添加传感器 -->
						<div class="modal fade" id="myModal_addSensorInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 160px">
						 <form id="form_addSensorInfo">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_addSensorInfo">添加传感器</h4>
						      </div>
						      <div class="modal-body">
							    
							    <input class="md_input" type="text" style="display:none" id="projectId_addSensorInfo" name="projectId_addSensorInfo">
							    
							    <label class="md_lable" for="sensorType_addSensorInfo">传感器类型:</label>
								<input class="md_input" type="text" id="sensorType_addSensorInfo" name="sensorType_addSensorInfo"><br><br>
								
							    <label class="md_lable" for="sensorId_addSensorInfo">传感器&nbsp;I&nbsp;&nbsp;D:</label>
								<input class="md_input" type="text" id="sensorId_addSensorInfo" name="sensorId_addSensorInfo"><br><br>
								
								<label class="md_lable" for="sensorModel_addSensorInfo">传感器型号:</label>
								<input class="md_input" type="text" id="sensorModel_addSensorInfo" name="sensorModel_addSensorInfo"><br><br>
								
								<label class="md_lable" for="sensorDepth_addSensorInfo">传感器深度:</label>
								<input class="md_input" type="text" id="sensorDepth_addSensorInfo" name="sensorDepth_addSensorInfo"><br><br>
								
								<label class="md_lable" for="terminalsInfoNum_addSensorInfo">采集器编号:</label>
								<input class="md_input" type="text" id="terminalsInfoNum_addSensorInfo" name="terminalsInfoNum_addSensorInfo"><br><br>
								
								<label class="md_lable" for="terminalsInfoAisle_addSensorInfo">采集器通道:</label>
								<input class="md_input" type="text" id="terminalsInfoAisle_addSensorInfo" name="terminalsInfoAisle_addSensorInfo"><br>
								
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="offAddSensorInfo" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-primary sureAddSensorInfo_addSensorInfo">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						
						<!-- Modal编辑传感器信息 -->
						<div class="modal fade" id="myModal_updetaSensorInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 160px">
						 <form id="form_updetaSensorInfo">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_updetaSensorInfo">修改传感器信息</h4>
						      </div>
						      <div class="modal-body">
						        <input class="md_input" type="text" style="display:none" id="sensorInfoId_updetaSensorInfo" name="sensorInfoId_updetaSensorInfo">
						      
							    <input class="md_input" type="text" style="display:none" id="detectionPointId_updetaSensorInfo" name="detectionPointId_updetaSensorInfo">
							   
							    <input class="md_input" type="text" style="display:none" id="projectId_updetaSensorInfo" name="projectId_updetaSensorInfo">
							   
							    <label class="md_lable" for="sensorType_updetaSensorInfo">传感器类型:</label>
								<input class="md_input" type="text" id="sensorType_updetaSensorInfo" name="sensorType_updetaSensorInfo"><br><br>
							    
							    <label class="md_lable" for="sensorId_updetaSensorInfo">传感器&nbsp;I&nbsp;&nbsp;D:</label>
								<input class="md_input" type="text" id="sensorId_updetaSensorInfo" name="sensorId_updetaSensorInfo"><br><br>
							    
								<label class="md_lable" for="sensorModel_updetaSensorInfo">传感器型号:</label>
								<input class="md_input" type="text" id="sensorModel_updetaSensorInfo" name="sensorModel_updetaSensorInfo"><br><br>
								
								<label class="md_lable" for="sensorDepth_updetaSensorInfo">传感器深度:</label>
								<input class="md_input" type="text" id="sensorDepth_updetaSensorInfo" name="sensorDepth_updetaSensorInfo"><br><br>
								
								<label class="md_lable" for="terminalsInfoNum_updetaSensorInfo">采集器编号:</label>
								<input class="md_input" type="text" id="terminalsInfoNum_updetaSensorInfo" name="terminalsInfoNum_updetaSensorInfo"><br><br>
								
								<label class="md_lable" for="terminalsInfoAisle_updetaSensorInfo">采集器通道:</label>
								<input class="md_input" type="text" id="terminalsInfoAisle_updetaSensorInfo" name="terminalsInfoAisle_updetaSensorInfo"><br>
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="offUpdetaSensorInfo" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-primary sureUpdetaSensorInfo_updetaSensorInfo">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						<input class="md_input" style="display:none" id="project_sensor_info_projectId" name="project_sensor_info_projectId" value="${detectionPointId}">
					 	<input class="md_input" style="display:none" id="sensorinfo_projectId" name="sensorinfo_projectId" value="${projectId}">
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
	
	<!-- external jquery -->
	<script src="assets/js/sensor_info.js"></script>
	
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>