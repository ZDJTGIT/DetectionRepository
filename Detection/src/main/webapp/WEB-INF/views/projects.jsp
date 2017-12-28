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
<title>项目</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/plugins/table/basic.css" rel="stylesheet">
<link href="assets/css/plugins/table/user.css" rel="stylesheet">
<link href="assets/css/plugins/layuis/layui.css" rel="stylesheet" media="all">
<style>
#trhight{
	
	height:39px;
	overflow:hidden;
}

#trhight:hover{
	box-sizing:border-box;
	height: 100%;
}
</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInUp">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox">
					<div class="ibox-title">
						<h5>所有项目</h5>
						<div class="ibox-tools">
							<button type="button" class="btn btn-primary btn-xs btn-lg" data-toggle="modal" data-target="#myModal_addProject">
						 		创建新项目 
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
									<input type="text" id="searchProject" name="searchProject" placeholder="请输入项目名称" class="input-sm form-control"> 
									<span class="input-group-btn">
										<button type="button" id="searchButton" name="searchButton" class="btn btn-sm btn-primary">
											搜索
										</button>
									</span>
								</div>
							</div>
						</div>
						<div class="project-list">
							<table class="table table-hover" id="project_table">
								<tbody id="hover_table">
								</tbody>
							</table>
							<div style="margin-top:15px; text-align:center;" id="pageComponent"></div>
						</div>
						
						<!-- Modal添加 -->
						<div class="modal fade" id="myModal_addProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						 <form id="form_addProject">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_addProject">新建项目</h4>
						      </div>
						      <div class="modal-body">
						        <label class="md_lable" for="">选择用户:</label>
								<div id="selectUser_div_addProject">
							    </div><br><br>
								<label class="md_lable" for="">项目类型:</label>
								<div id="selectProjectType_div_addProject">
							    </div><br><br>
							    <!--  <label class="md_lable" for="">项目状态:</label>
								<div id="selectProjectStatus_div_addProject">
							    </div><br><br> -->
								<label class="md_lable" for="projectName_addProject">项目名称:</label>
								<input class="md_input" type="text" id="projectName_addProject" name="projectName_addProject"><br><br>
								<!-- 项目名 -->
								<input class="md_input" type="text" style="display:none" id="projectName_addProjects" name="projectName_addProjects">
								<label class="md_lable" for="projectAddress_addProject">项目地址:</label>
								<input class="md_input" type="text" id="projectAddress_addProject" name="projectAddress_addProject"><br><br>
								<label class="md_lable" for="projectLongitude_addProject">项目经度: </label>
								<input class="md_input" type="text" id="projectLongitude_addProject" placeholder="格式：(-180)-180，小数位1-8位" name="projectLongitude_addProject"><br><br>
								<label class="md_lable" for="projectLatitude_addProject">项目纬度:</label>
								<input class="md_input" type="text" id="projectLatitude_addProject" placeholder="格式：(-90)-90，小数位1-8位" name="projectLatitude_addProject"><br><br>
								<label class="md_lable" for="projectBeginTime_addProject">开始时间:</label>
								<input class="md_input" type="text" id="projectBeginTime_addProject" name="projectBeginTime_addProject"><br><br>
								<label class="md_lable" for="projectEndTime_addProject">结束时间:</label>
								<input class="md_input" type="text" id="projectEndTime_addProject" name="projectEndTime_addProject"><br>
								<label class="md_lable" for="projectDescription_addProject">项目描述:</label>
								<textarea id="projectDescription_addProject" class="data_project_tar data_content_input_5" rows="4"></textarea>
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="offAddProject" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-primary sureAddProject_addProject">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						
						<!-- Modal编辑修改 -->
						<div class="modal fade" id="myModal_updetaProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						 <form id="form_updetaProject"> 
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_updetaProject">编辑项目信息</h4>
						      </div>
						      <div class="modal-body">
						        <label class="md_lable" for="">选择用户:</label>
								<div id="selectUser_div_updetaProject">
							    </div><br><br>
								<label class="md_lable" for="">项目类型:</label>
								<div id="selectProjectType_div_updetaProject">
							    </div><br><br>
							    <!--  <label class="md_lable" for="">项目状态:</label>
								<div id="selectProjectStatus_div_updetaProject">
							    </div><br><br> -->
							    <input class="md_input" type="text" style="display:none" id="projectId_updetaProject" name="projectId_updetaProject">
								<label class="md_lable" for="projectName_updetaProject">项目名称:</label>
								<input class="md_input" type="text" id="projectName_updetaProject" name="projectName_updetaProject"><br><br>
								<label class="md_lable" for="projectAddress_updetaProject">项目地址:</label>
								<input class="md_input" type="text" id="projectAddress_updetaProject" name="projectAddress_updetaProject"><br><br>
								<label class="md_lable" for="projectLongitude_updetaProject">项目经度:</label>
								<input class="md_input" type="text" id="projectLongitude_updetaProject" placeholder="格式：(-180)-180，小数位1-8位" name="projectLongitude_updetaProject"><br><br>
								<label class="md_lable" for="projectLatitude_updetaProject">项目纬度:</label>
								<input class="md_input" type="text" id="projectLatitude_updetaProject" placeholder="格式：(-90)-90，小数位1-8位" name="projectLatitude_updetaProject"><br><br>
								<label class="md_lable" for="projectBeginTime_updetaProject">开始时间:</label>
								<input class="md_input" type="text" id="projectBeginTime_updetaProject" name="projectBeginTime_updetaProject"><br><br>
								<label class="md_lable" for="projectEndTime_updetaProject">结束时间:</label>
								<input class="md_input" type="text" id="projectEndTime_updetaProject" name="projectEndTime_updetaProject"><br>
								<label class="md_lable" for="">项目描述:</label>
								<textarea id="projectDescription_updetaProject" class="data_project_tar data_content_input_5" rows="4"></textarea>
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="offUpdetaProject"  class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-primary sureAddProject_updetaProject">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						<input class="md_input" style="display:none" id="project_DLID" name="project_DLID" value="${userInfo.userId}">
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
	<script src="assets/js/project.js"></script>
	
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
