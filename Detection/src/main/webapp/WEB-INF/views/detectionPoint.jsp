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
<title>测点信息</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/plugins/table/basic.css" rel="stylesheet">
<link href="assets/css/plugins/table/user.css" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInUp">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox">
					<div class="ibox-title">
					<!-- 接受项目页面传过来的projectId查找数据展示 -->
						<h5>${projectName}</h5>
						<div class="ibox-tools">
							<button type="button" class="btn btn-primary btn-xs btn-lg" data-toggle="modal" data-target="#myModal_addDetection">
						 		添加测点
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
									<input type="text" id="searchDetectionPoint_input" name="searchDetectionPoint_input" placeholder="请输入测点名称" class="input-sm form-control"> 
									<span class="input-group-btn">
										<button type="button" id="searchDetectionPoint" name="searchDetectionPoint" class="btn btn-sm btn-primary">
											搜索
										</button>
									</span>
								</div>
							</div>
						</div>
						<div class="project-list">
							<table class="table table-hover" id="detection_table">
								<tbody id="detection_tbody">
										<tr>
										<td class="project-title" style="width:60px">
										</td>
				    	  		    	<td class="project-title" style="width:120px">
				    	  		    		<a href="javascript:;">检测因素</a>
									    </td>
									    <td class="project-title" style="width:50px">
										</td>
										<td class="project-title" style="width:200px">
											<a href="javascript:;">测点名称</a>
										</td>
										<td class="project-title" style="width:140px">
											<a href="javascript:;">测点描述</a>
										</td>
										<td class="project-title" style="width:140px">
											<a href="javascript:;">测点经度</a>
										</td>
										<td class="project-title" style="width:140px">
											<a href="javascript:;">测点纬度</a>
										</td>
										<td class="project-title" style="width:400px">
										</td>
										<td class="project-title" style="width:150px">
											<a href="javascript:;">传感器信息</a>
										</td>
										<td class="project-title" style="width:150px">
										    <a href="javascript:;">测点操作栏</a>
									    </td>
									    <td class="project-actions">
									    </td>
									   </tr>
								</tbody>
							</table>
						</div>
						
						<!-- Modal添加测点 -->
						<div class="modal fade" id="myModal_addDetection" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 140px">
						 <form id="form_addDetection">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_addDetection">新建测点</h4>
						      </div>
						      <div class="modal-body">
						      
								<label class="md_lable" for="">测点类型:</label>
								<div id="selectDetectionType_div_addDetection">
									<select class="md_input" id="selectDetectionStatusAdd" name="selectDetectionStatusAdd">
									</select>
							    </div>
							    
							    <label class="md_lable" style="display:none" for="ProjectName_addDetection">项目名称:</label>
								<input class="md_input" style="display:none" type="text" id="ProjectName_addDetection" name="ProjectName_addDetection"><br><br>
							    
								<label class="md_lable" for="DetectionName_addDetection">测点名称:</label>
								<input class="md_input" type="text" id="DetectionName_addDetection" name="DetectionName_addDetection"><br><br>
								
								<label class="md_lable" for="DetectionLongitude_addDetection">测点经度:</label>
								<input class="md_input" type="text" id="DetectionLongitude_addDetection" placeholder="格式：(-180)-180，小数位1-8位" name="DetectionLongitude_addDetection"><br><br>
								
								<label class="md_lable" for="DetectionLatitude_addDetection">测点纬度:</label>
								<input class="md_input" type="text" id="DetectionLatitude_addDetection" placeholder="格式：(-90)-90，小数位1-8位" name="DetectionLatitude_addDetection"><br><br>
								
								<label class="md_lable" for="DetectionDescription_addDetection">测点描述:</label>
								<textarea id="DetectionDescription_addDetection" class="data_project_tar data_content_input_5" rows="4"></textarea>
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="offAddDetection" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-primary sureAddDetection_addDetection">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						
						<!-- Modal编辑测点信息 -->
						<div class="modal fade" id="myModal_updetaDetection" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 140px">
						 <form id="form_updetaDetection">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_updetaDetection">修改测点</h4>
						      </div>
						      <div class="modal-body">
						      
								<label class="md_lable" for="">测点类型:</label>
								<div id="selectDetectionType_div_updetaDetection">
									<select class="md_input" id="selectDetectionStatusUpdeta" name="selectDetectionStatusUpdeta">
									</select>
							    </div>
							    
							    <input class="md_input" type="text" style="display:none" id="DetectionPointId_updetaDetection" name="DetectionPointId_updetaDetection">
							    
								<input class="md_input" style="display:none" type="text" id="ProjectName_updetaDetection" name="ProjectName_updetaDetection"><br><br>
							    
								<label class="md_lable" for="DetectionName_updetaDetection">测点名称:</label>
								<input class="md_input" type="text" id="DetectionName_updetaDetection" name="DetectionName_updetaDetection"><br><br>
								
								<label class="md_lable" for="DetectionLongitude_updetaDetection">测点经度:</label>
								<input class="md_input" type="text" id="DetectionLongitude_updetaDetection" placeholder="格式：(-180)-180，小数位1-8位" name="DetectionLongitude_updetaDetection"><br><br>
								
								<label class="md_lable" for="DetectionLatitude_updetaDetection">测点纬度:</label>
								<input class="md_input" type="text" id="DetectionLatitude_updetaDetection" placeholder="格式：(-90)-90，小数位1-8位" name="DetectionLatitude_updetaDetection"><br><br>
								
								<label class="md_lable" for="DetectionDescription_updetaDetection">测点描述:</label>
								<textarea id="DetectionDescription_updetaDetection" class="data_project_tar data_content_input_5" rows="4"></textarea>
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="offUpdetaDetection" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-primary sureAddDetection_updetaDetection">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						<input class="md_input" style="display:none" id="detectionPoint_projectTypeId" name="detectionPoint_projectTypeId" value="${projectTypeId}">
				<input class="md_input" style="display:none" id="detectionPoint_projectName" name="detectionPoint_projectName" value="${projectName}">
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
	<script src="assets/js/detacttion_point.js"></script>
	
	<script>
		//系统自带
		$("#loading-example-btn").click(function() {
			btn = $(this);
			simpleLoad(btn, true);
			simpleLoad(btn, false)
		})
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