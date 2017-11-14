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
<title>图片信息</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/plugins/table/basic.css" rel="stylesheet">
<link href="assets/css/plugins/table/user.css" rel="stylesheet">
<link href="assets/css/plugins/layuis/layui.css" rel="stylesheet" media="all">
</head>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInUp">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox">
					<div class="ibox-title">
						<h5>${projectName}</h5>
					</div>
					<div class="ibox-content">
						<div class="project-list">
							<table class="table table-striped table-hover" id="image_table">
								<thead>
									<tr>
										<th class="project-title" style="width:160px">
											<a href="javascript:;">测点类型</a>
										</th>
										<th class="project-title" style="width:500px">
											<a href="javascript:;">热点图</a>
										</th>
										<th class="project-title" style="width:110px">
											<a href="javascript:;">操作</a>
										</th>
										<th class="project-title" style="width:500px">
											<a href="javascript:;">现场图</a>
										</th>
										<th class="project-title" style="width:110px">
											<a href="javascript:;">操作</a>
										</th>
									</tr>	
								</thead>
								<tbody id="image_tbody"></tbody>
							</table>
						</div>
						<!-- Modal修改热点图-->
						<div class="modal fade" id="myModal_updetaHeatImage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 160px">
						 <form id="form_updetaHeat">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content" style="">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_updetaimage">修改图片</h4>
						      </div>
						      <div class="modal-body">
						        <label class="md_lable" for="detectionTypeName_updetaHeat">测点类型:</label>
						        <input class="md_input" type="text" readonly id="detectionTypeName_updetaHeat" name="detectionTypeName_updetaHeat"><br><br>
						        
						        <input class="md_input" type="text" style="display:none" id="imageId_updetaHeat" name="imageId_updetaHeat">
								
								<label class="md_lable" for="">添加热点图:</label>								
								<div class="layui-upload">
									<div class="layui-upload-list">
										<img class="layui-upload-img" id="showHeat" src="assets/img/test2.png" style="height:110px; width:300px">
										<p id="demoText"></p>
								    </div>
									<button type="button" class="layui-btn" id="uploadHeat">上传</button><br><br>  
								</div>
								<input class="md_input" style="display:none" type="text" id="detectionTypeId_Heat" name="detectionTypeId_Heat"><br><br>
						      </div>
						      <div class="modal-footer">
						      	<button type="button" class="btn btn-default offDeleteImage" style="display:none" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-default imageCloseBtn">关闭</button>
						        <button type="button" class="btn btn-primary sureAddDetection_updetaImage" name="heatBtn">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						<!-- Modal修改现场图-->
						<div class="modal fade" id="myModal_updetaPhysicalImage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 160px">
						 <form id="form_updetaPhysical">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content" style="">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_updetaimage">修改图片</h4>
						      </div>
						      <div class="modal-body">
						        <label class="md_lable" for="detectionTypeName_updetaPhysical">测点类型:</label>
						        <input class="md_input" type="text" readonly id="detectionTypeName_updetaPhysical" name="detectionTypeName_updetaPhysical"><br><br>
						        
						        <input class="md_input" type="text" style="display:none" id="imageId_updetaPhysical" name="imageId_updetaPhysical">
						        
							    <label class="md_lable" for="">添加现场图:</label>
							    <div class="layui-upload-list">
									<img class="layui-upload-img" id="showPhysical" src="assets/img/test2.png" style="height:110px; width:300px">
									<p id="demoText2"></p>
							    </div>
								<button type="button" class="layui-btn" id="uploadPhysical">上传</button>  
								
								<input class="md_input" style="display:none" type="text" id="detectionTypeId_Physical" name="detectionTypeId_Physical"><br><br>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default offDeleteImage" style="display:none" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-default imageCloseBtn">关闭</button>
						        <button type="button" class="btn btn-primary sureAddDetection_updetaImage" name="physicalBtn">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						<input class="md_input" style="display:none" id="project_image_projectId" name="project_image_projectId" value="${projectId}">
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
	<script src="assets/js/project_image.js"></script>
	
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>