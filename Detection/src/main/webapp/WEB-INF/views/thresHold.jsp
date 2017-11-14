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
<title>阀值</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/plugins/table/basic.css" rel="stylesheet">
<link href="assets/css/plugins/table/user.css" rel="stylesheet">
<!-- ---样式影响超链接样式，颜色变黑 -->
<link href="assets/css/plugins/layuis/layui.css" rel="stylesheet" media="all">
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
							<button type="button" class="btn btn-primary btn-xs btn-lg" data-toggle="modal" data-target="#myModal_addThresHold">
						 		添加阀值
							</button>
						</div>
					</div>
					<div class="ibox-content">
						<!--div class="row m-b-sm m-t-sm">
							<div class="col-md-11">
								<div class="input-group">
									<input type="text" id="searchProject" name="searchProject" placeholder="请输入测点名称" class="input-sm form-control"> 
									<span class="input-group-btn">
										<button type="button" id="searchButton" name="searchButton" class="btn btn-sm btn-primary">
											搜索
										</button>
									</span>
								</div>
							</div>
						</div-->
						<div class="project-list">
							<table class="table table-hover" id="thresHold_table">
								<tbody id="thresHold_tbody">
								<!-- 表头 -->
									<tr>
										<td class="project-title" style="width:160px">
											<a href="javascript:;">测点类型</a>
										</td>
										<td class="project-title" style="width:160px">
											<a href="javascript:;">阀值类型</a>
										</td>
										<td class="project-title" style="width:160px">
											<a href="javascript:;">最小警戒值</a>
										</td>
										<td class="project-title" style="width:160px">
											<a href="javascript:;">最大警戒值</a>
										</td>
										<td class="project-title" style="width:160px">
											<a href="javascript:;">最小意外值</a>
										</td>
										<td class="project-title" style="width:160px">
											<a href="javascript:;">最大意外值</a>
										</td>
										<td class="project-title" style="width:160px">
											<a href="javascript:;">操作栏</a>
										</td>
										<td class="project-actions">
									    </td>
									</tr>					
								</tbody>
							</table>
						</div>
						
						<!-- Modal添加阀值 -->
						<div class="modal fade" id="myModal_addThresHold" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 160px">
						 <form id="form_addThresHold">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content" style="">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_addThresHold">添加阀值</h4>
						      </div>
						      <div class="modal-body">
						      
						        <label class="md_lable" for="">测点类型:</label>
								<div id="selectDetectionType_div_addThresHold">
									<select class="md_input" style="margin-left: 85px;" id="selectDetectionType_addThresHold" name="selectDetectionStatus_addThresHold">
									</select>
							    </div><br><br>
							    
							    <label class="md_lable" for="">阀值类型:</label>
								<div id="selectThresHoldType_div_addThresHold">
									<select class="md_input" style="margin-left: 85px;" id="selectThresHoldType_addThresHold" name="selectThresHoldType_addThresHold">
									</select>
							    </div><br><br>
						      	
						        <label class="md_lable" for="maxThresholdValue_add">最大警戒值:</label>
								<input class="md_input" style="margin-left: 85px;" type="text" id="maxThresholdValue_add" name="maxThresholdValue_add"><br><br>
								<label class="md_lable" for="minThresholdValue_add">最小警戒值:</label>
								<input class="md_input" style="margin-left: 85px;" type="text" id="minThresholdValue_add" name="minThresholdValue_add"><br><br>
								<label class="md_lable" for="maxDrasticThresholdValue_add">最大意外值:</label>
								<input class="md_input" style="margin-left: 85px;" type="text" id="maxDrasticThresholdValue_add" name="maxDrasticThresholdValue_add"><br><br>
								<label class="md_lable" for="minDrasticThresholdValue_add">最小意外值:</label>
								<input class="md_input" style="margin-left: 85px;" type="text" id="minDrasticThresholdValue_add" name="minDrasticThresholdValue_add">
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="offAddThresHold" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-primary sureAddThresHold_addThresHold">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						
						<!-- Modal修改阀值 -->
						<div class="modal fade" id="myModal_updetaThresHold" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 160px">
						 <form id="form_updetaThresHold">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content" style="">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_updetaThresHold">修改阀值</h4>
						      </div>
						      <div class="modal-body">
						      
						        <label class="md_lable" for="">测点类型:</label>
								<div id="selectDetectionType_div_updetaThresHold">
									<select class="md_input" style="margin-left: 85px;" id="selectDetectionType_updetaThresHold" name="selectDetectionStatus_updetaThresHold">
									</select>
							    </div><br><br>
							    
							    <label class="md_lable" for="">阀值类型:</label>
								<div id="selectThresHoldType_div_addThresHold">
									<select class="md_input" style="margin-left: 85px;" id="selectThresHoldType_updetaThresHold" name="selectThresHoldType_updetaThresHold">
									</select>
							    </div><br><br>
							     
							    <input class="md_input" type="text" style="display:none" id="thresHoldId_updetaThresHold" name="thresHoldId_updetaThresHold">
							    <input class="md_input" type="text" style="display:none" id="detectionTypeId_updetaThresHold" name="detectionTypeId_updetaThresHold">
							    <input class="md_input" type="text" style="display:none" id="thresholdTypeId_updetaThresHold" name="thresholdTypeId_updetaThresHold">
						       
						        <label class="md_lable" for="maxThresholdValue_updeta">最大警戒值:</label>
								<input class="md_input" style="margin-left: 85px;" type="text" id="maxThresholdValue_updeta" name="maxThresholdValue_updeta"><br><br>
								<label class="md_lable" for="minThresholdValue_updeta">最小警戒值:</label>
								<input class="md_input" style="margin-left: 85px;" type="text" id="minThresholdValue_updeta" name="minThresholdValue_updeta"><br><br>
								<label class="md_lable" for="maxDrasticThresholdValue_updeta">最大意外值:</label>
								<input class="md_input" style="margin-left: 85px;" type="text" id="maxDrasticThresholdValue_updeta" name="maxDrasticThresholdValue_updeta"><br><br>
								<label class="md_lable" for="minDrasticThresholdValue_updeta">最小意外值:</label>
								<input class="md_input" style="margin-left: 85px;" type="text" id="minDrasticThresholdValue_updeta" name="minDrasticThresholdValue_updeta">
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="offUpdetaThresHold" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-primary sureUpdetaThresHold_UpdetaThresHold">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						<input class="md_input" style="display:none" id="thres_hold_projectId" name="thres_hold_projectId" value="${projectId}">
						<input class="md_input" style="display:none" id="thres_hold_projectTypeId" name="thres_hold_projectTypeId" value="${projectTypeId}">
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
	<script src="assets/js/thres_hold.js"></script>
	
	<script>
		//系统自带
		$("#loading-example-btn").click(function() {
				btn = $(this);
				simpleLoad(btn, true);
				simpleLoad(btn, false)
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