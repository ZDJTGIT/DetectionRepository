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
						</div>
						
						<!-- Modal添加 -->
						<div class="modal fade" id="myModal_addProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						 <form id="form_addProject">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">新建项目</h4>
						      </div>
						      <div class="modal-body">
						        <label class="md_lable" for="">选择用户:</label>
								<div id="selectUser_div_addProject">
							    </div><br><br>
								<label class="md_lable" for="">项目类型:</label>
								<div id="selectProjectType_div_addProject">
							    </div><br><br>
								<label class="md_lable" for="projectName_addProject">项目名称:</label>
								<input class="md_input" type="text" id="projectName_addProject" name="projectName_addProject"><br><br>
								<label class="md_lable" for="projectAddress_addProject">项目地址:</label>
								<input class="md_input" type="text" id="projectAddress_addProject" name="projectAddress_addProject"><br><br>
								<label class="md_lable" for="projectLongitude_addProject">项目经度:</label>
								<input class="md_input" type="text" id="projectLongitude_addProject" name="projectLongitude_addProject"><br><br>
								<label class="md_lable" for="projectLatitude_addProject">项目纬度:</label>
								<input class="md_input" type="text" id="projectLatitude_addProject" name="projectLatitude_addProject"><br>
								<label class="md_lable" for="projectDescription_addProject">项目描述:</label>
								<textarea id="projectDescription_addProject" class="data_project_tar data_content_input_5" rows="4"></textarea>
						      </div>
						      <div class="modal-footer">
						        <button type="button" style="padding: 6px 12px" class="btn btn-primary btn-xs btn-lg" data-toggle="modal" data-target="#myModal_addDetection">
						                    下一步</button>
						        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" id="sureAddProject_addProject" name="sureAddProject_addProject" class="btn btn-primary">提交</button>
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
						        <h4 class="modal-title" id="myModalLabel">编辑项目信息</h4>
						      </div>
						      <div class="modal-body">
						        <label class="md_lable" for="">选择用户:</label>
								<div id="selectUser_div_updetaProject">
							    </div><br><br>
								<label class="md_lable" for="">项目类型:</label>
								<div id="selectProjectType_div_updetaProject">
							    </div><br><br>
							    <input class="md_input" type="text" style="display:none" id="projectId_updetaProject" name="projectId_updetaProject">
								<label class="md_lable" for="projectName_updetaProject">项目名称:</label>
								<input class="md_input" type="text" id="projectName_updetaProject" name="projectName_updetaProject"><br><br>
								<label class="md_lable" for="projectAddress_updetaProject">项目地址:</label>
								<input class="md_input" type="text" id="projectAddress_updetaProject" name="projectAddress_updetaProject"><br><br>
								<label class="md_lable" for="projectLongitude_updetaProject">项目经度:</label>
								<input class="md_input" type="text" id="projectLongitude_updetaProject" name="projectLongitude_updetaProject"><br><br>
								<label class="md_lable" for="projectLatitude_updetaProject">项目纬度:</label>
								<input class="md_input" type="text" id="projectLatitude_updetaProject" name="projectLatitude_updetaProject"><br>
								<label class="md_lable" for="">项目描述:</label>
								<textarea id="projectDescription_updetaProject" class="data_project_tar data_content_input_5" rows="4"></textarea>
						      </div>
						      <div class="modal-footer">
						        <button type="button" style="padding: 6px 12px" class="btn btn-primary btn-xs btn-lg" data-toggle="modal" data-target="#myModal_updetaDetection">
						                    下一步</button>
						        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" id="sureAddProject_updetaProject" name="sureAddProject_updetaProject" class="btn btn-primary">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						
						<!-- Modal添加-下一步-添加测点 -->
						<div class="modal fade" id="myModal_addDetection" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						 <form id="form_addDetection">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">添加项目测点</h4>
						      </div>
						      <div class="modal-body">
						        <!--label class="md_lable" for="">选择用:</label>
								<div id="selectUser_div_updetaProjects">
							    </div><br><br>
								<label class="md_lable" for="">项目类:</label>
								<div id="selectProjectType_div_updetaProjects">
							    </div><br><br-->
								<label class="md_lable" for="detectionName_add">测点名称:</label> 
								<input class="md_input" type="text" id="detectionName_add" name="detectionName_add"><br><br>
								<label class="md_lable" for="detectionNum_add">测点编号:</label>
								<input class="md_input" type="text" id="detectionNum_add" name="detectionNum_add"><br><br>
								<label class="md_lable" for="detectionLongitude_add">测点经度:</label>
								<input class="md_input" type="text" id="detectionLongitude_add" name="detectionLongitude_add"><br><br>
								<label class="md_lable" for="detectionLatitude_add">测点纬度:</label>
								<input class="md_input" type="text" id="detectionLatitude_add" name="detectionLatitude_add"><br>
								<label class="md_lable" for="">测点描述:</label>
								<textarea id="detectionDescription_add" class="data_project_tar data_content_input_5" rows="4"></textarea>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" id="sureAddDetection" name="sureAddDetection" class="btn btn-primary">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						
						<!-- Modal修改-下一步-编辑修改测点 -->
						<div class="modal fade" id="myModal_updetaDetection" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						 <form id="form_updetaDetection">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">修改项目测点</h4>
						      </div>
						      <div class="modal-body">
						        <!--label class="md_lable" for="">选择用:</label>
								<div id="selectUser_div_updetaProjects">
							    </div><br><br>
								<label class="md_lable" for="">项目类:</label>
								<div id="selectProjectType_div_updetaProjects">
							    </div><br><br-->
								<label class="md_lable" for="detectionName_updeta">测点名称:</label>
								<input class="md_input" type="text" id="detectionName_updeta" name="detectionName_updeta"><br><br>
								<label class="md_lable" for="detectionNum_updeta">测点编号:</label>
								<input class="md_input" type="text" id="detectionNum_updeta" name="detectionNum_updeta"><br><br>
								<label class="md_lable" for="detectionLongitude_updeta">测点经度:</label>
								<input class="md_input" type="text" id="detectionLongitude_updeta" name="detectionLongitude_updeta"><br><br>
								<label class="md_lable" for="detectionLatitude_updeta">测点纬度:</label>
								<input class="md_input" type="text" id="detectionLatitude_updeta" name="detectionLatitude_updeta"><br>
								<label class="md_lable" for="">测点描述:</label>
								<textarea id="detectionDescription_updeta" class="data_project_tar data_content_input_5" rows="4"></textarea>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" id="sureUpdetaDetection" name="sureUpdetaDetection" class="btn btn-primary">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/content.js"></script>
	<script src="assets/js/customerValidate.js"></script>
	<script src="assets/js/plugins/validate/jquery.validate.min.js"></script>
	<script>
		$(document).ready(function() {
			//获取当前登陆用户ID
			var dlId = '${userInfo.userId}';
			//系统自带
			$("#loading-example-btn").click(function() {
				btn = $(this);
				simpleLoad(btn, true);
				simpleLoad(btn, false)
			})
			
			//根据当前登陆用户加载项目（管理员加载所有项目，其他用户加载用户下对应项目）
	    	  $.ajax({
	    		  type:'post',
	    	  	  url: 'rest/project/showUsersProject',
	    	  	  data: {userId:dlId},
	    	  	  contextType:"application/json",
	    	  	  success: function(data){
	    	  		         if(data){
	    	  		       // var start = new Date();
	    	  		    	 var  asthtml="";
	    	  		    	 
	    	  		    	 $.each(data,function(idx,item){
	    	  		    	  asthtml += '<tr id="project_'+ item.projectId +'">'+
				    	  		    	//'<td class="project-status" style="width:120px">'+
										//'<a href="project_detail.html">' + item.sysDictionary.itemName+'</a><br />'+
									    //'</td>'+
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + item.projectId + '</span>'+
										'</td>'+
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + item.projectTypeId + '</span>'+
										'</td>'+
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + item.projectLongitude + '</span>'+
										'</td>'+
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + item.projectLatitude + '</span>'+
										'</td>'+
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + item.projectAddress + '</span>'+
									    '</td>'+
									    
										'<td class="project-status" style="width:80px">'+
											'<span class="label label-primary">' + item.projectStatus + '</span>'+
										'</td>'+
										'<td class="project-title" style="width:150px">'+
											'<a href="project_detail.html">' + item.projectName + '</a><br />'+
										'</td>'+
										'<td class="project-title" style="width:200px">'+
											'<small>创建于 '+item.projectTime+'</small>'+
									    '</td>'+
										'<td class="project-completion" style="width:460px">'+
											'<small>当前进度： '+idx+'8%</small>'+
											'<div class="progress progress-mini">'+
												'<div style="width: '+idx+'8%;" class="progress-bar"></div>'+
											'</div>'+
										'</td>'+
										'<td class="project-title" style="width:360px">'+
											'<small>' + item.projectDescription + '</small>'+
										'</td>'+
										'<td class="project-title" style="width:140px">'+
										'<a href="project_detail.html">项目告警信息('+ item.messageCount +')</a><br />'+
										'</td>'+
										'<td class="project-actions">'+
											'<a href="rest/project_detail" class="J_menuItem">'+
												'<i class="fa fa-folder"></i>'+
												'查看 '+
											'</a>'+
										    '<a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">'+
												'<i class="fa fa-times-circle"></i> 编辑 '+
											'</a>'+
											'</a>'+
										    '<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ item.projectId +')">'+
												'<i class="fa fa-times-circle"></i> 删除 '+
										    '</a>'+
										'</td>'+
									'</tr>';
	    	  		    	 });
	        	  		    	
	    	  		    	$('#hover_table').append(asthtml); 		
	    	  		    	
	    	  		       }else{
	    	  		    	alert("数据异常");
	    	  		       }
	    	  	  },
	    	  	  error: function(){
	  			    alert("数据加载失败");
	  		      }
	    	  });
	    	 
	    	  //新建项目时加载用户信息
	    	  //用户信息暂且使用全部加载-之后改成按用户类型查找
	    	  //超级管理员和管理员不加载，不能创建自己的项目
	 		 $.ajax({
	    		  type:'post',
	    	  	  url: 'rest/project/showUser',
	    	  	  data: {userId:dlId},
	    	  	  contextType:"application/json",
	    	  	  success: function(data){
	    	  		       if(data){
	    	  		    	var string = '<select class="md_input" id="selectUser" name="selectUser">';
	    	  		    	$.each(data,function(idx,user){
	    	  		    	    string += '<option value="'+user.userId+'">'+ user.userName +'</option>';
	    	  		    	});
	    	  		       string += '</select>';
	    	  		       $('#selectUser_div_addProject').append(string);
	    	  		       }else{
	    	  		    	alert("数据异常");
	    	  		       }
	    	  	  },
	    	  	  error: function(){
	  			    alert("数据加载失败");
	  		      }
	    	     });
	    	   //新建项目时加载项目类型信息
		 		$.ajax({
		    		  type:'post',
		    	  	  url: 'rest/project/showProjectType',
		    	  	  data: {userId:dlId},
		    	  	  contextType:"application/json",
		    	  	  success: function(data){
		    	  		       if(data){
		    	  		    	var string = '<select class="md_input" id="selectProjectType" name="selectProjectType">';
		    	  		    	$.each(data,function(idx,SysDictionary){
		    	  		    	    string += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
		    	  		    	});
		    	  		       string += '</select>';
		    	  		       $('#selectProjectType_div_addProject').append(string);
		    	  		       }else{
		    	  		    	alert("数据异常");
		    	  		       }
		    	  	  },
		    	  	  error: function(){
		  			    alert("数据加载失败");
		  		      }
		    	     });
	    	   
		 		//编辑项目加载用户，默认显示选中用户
		    	   $.ajax({
		    		   type:'post',
			    	  	  url: 'rest/project/showUserType_selected',
			    	  	  data: {userId:dlId},
			    	  	  contextType:"application/json",
			    	  	  success: function(data){
			    	  		       if(data){
			    	  		    	var string = '<select class="md_input" id="selectUserType_selected" name="selectUserType_selected">';
			    	  		    	$.each(data,function(idx,user){
			    	  		    	    string += '<option value="'+user.userId+'">'+ user.userName +'</option>';
			    	  		    	});
			    	  		       string += '</select>';
			    	  		       $('#selectUser_div_updetaProject').append(string);
			    	  		       }else{
			    	  		    	alert("数据异常");
			    	  		       }
			    	  	  },
			    	  	  error: function(){
			  			    alert("数据加载失败");
			  		      }
		    	   });
		    	     //编辑项目加载项目类型，默认显示选中项目类型
		    	   $.ajax({
		    		   type:'post',
			    	  	  url: 'rest/project/showProjectType_selected',
			    	  	  data: {userId:dlId},
			    	  	  contextType:"application/json",
			    	  	  success: function(data){
			    	  		       if(data){
			    	  		    	var string = '<select class="md_input" id="selectProjectType_selected" name="selectProjectType_selected">';
			    	  		    	$.each(data,function(idx,SysDictionary){
			    	  		    	    string += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
			    	  		    	});
			    	  		       string += '</select>';
			    	  		       $('#selectProjectType_div_updetaProject').append(string);
			    	  		       }else{
			    	  		    	alert("数据异常");
			    	  		       }
			    	  	  },
			    	  	  error: function(){
			  			    alert("数据加载失败");
			  		      }
		    	   });
		});
		
		 //修改编辑项目时加载编辑框内所有元素
		 function updetaProject(s){
			   var b = s.parentNode.parentNode.rowIndex;
	    	     //获取选中的项目信息加载到编辑框
	    	   var projectId = $("table tr:eq(" + b + ") td:eq(0)").text();//项目ID
	    	   var projectTypeId = $("table tr:eq(" + b + ") td:eq(1)").text();//项目类型ID
	    	   var projectLongitude = $("table tr:eq(" + b + ") td:eq(2)").text();//经度
	    	   var projectLatitude = $("table tr:eq(" + b + ") td:eq(3)").text();//纬度
	    	   var projectAddress = $("table tr:eq(" + b + ") td:eq(4)").text();//项目地址
	    	   var projectName = $("table tr:eq(" + b + ") td:eq(6)").text();//项目名
	    	   var projectDescription = $("table tr:eq(" + b + ") td:eq(9)").text();//项目描述
			   $('#projectAddress_updetaProject').val(projectAddress);
	       	   $('#projectName_updetaProject').val(projectName);
	       	   $('#projectDescription_updetaProject').val(projectDescription);
	       	   $('#projectLongitude_updetaProject').val(projectLongitude);
	       	   $('#projectLatitude_updetaProject').val(projectLatitude);
	       	   $('#projectId_updetaProject').val(projectId);
	       	   //修改项目时显示当前选中项目的所属用户和项目类型
	       	   $.ajax({
		   		  type:'post',
		   	  	  url: 'rest/project/showSelectUserAndProjectType',
		   	  	  data: {projectId:projectId,projectTypeId:projectTypeId},
		   	  	  contextType:"application/json",
		   	  	  success: function(data){
		   	  	    $("#selectProjectType_selected option[value='"+data.sysDictionary.dicId+"']").attr("selected","selected");
		   	    	$("#selectUserType_selected option[value='"+data.userId+"']").attr("selected","selected");
		   	  	  }
			  });
  	     }
		
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
		
		//确认修改测点响应事件
   		$('#sureUpdetaDetection').click(function(){
   			alert("修改成功！");
   		});
		
	   	//确定修改项目响应事件
   		$('#sureAddProject_updetaProject').click(function(){
   		    //修改项目验证
			if(!$('#form_updetaProject').valid()){
				return false;
			}
   			   var userIds = $("#selectUser_div_updetaProject option:selected").val();
   			   var projectTypeIds = $("#selectProjectType_div_updetaProject option:selected").val();
   			   var projectNames = $("#projectName_updetaProject").val();
   			   var projectAddresss = $("#projectAddress_updetaProject").val();
   			   var projectDescriptions = $("#projectDescription_updetaProject").val();
   			   var projectLongitudes = $("#projectLongitude_updetaProject").val();
   			   var projectLatitudes = $("#projectLatitude_updetaProject").val();
   			   var projectIds = $("#projectId_updetaProject").val();
   	       	   var jsonData = '{"userId":"'
   					       		+ userIds
   					       		+ '","projectId":"'
								+ projectIds
   								+ '","projectTypeId":"'
   								+ projectTypeIds
   								+ '","projectName":"'
   								+ projectNames
   								+ '","projectAddress":"'
   								+ projectAddresss
   								+ '","projectLongitude":"'
   								+ projectLongitudes
   								+ '","projectLatitude":"'
   								+ projectLatitudes
   								+ '","projectDescription":"'
   								+ projectDescriptions + '"}';
   	       	 //确定修改，将数据插入数据库 
   	       	 $.ajax({
   		   		  type:'post',
   		   	  	  url: 'rest/project/selectProject',
   		   	  	  contentType:"application/json",
   		   	  	  dataType : 'json',
   		   	  	  data: jsonData,
   		   	  	  success: function(data){
   		   	  		  if(data){
   		   	  		    alert("修改成功！");
   		   	  		  }else {
  						alert("数据异常");
   					  }
   		   	  	  }
   			  }); 
   		}); 
		
	   	//确认添加测点响应事件
   		$('#sureAddDetection').click(function(){
   			alert("添加成功！");
   		    $('#detectionName_add').val("");
			$('#detectionNum_add').val("");
			$('#detectionLongitude_add').val("");
			$('#detectionLatitude_add').val("");
			$('#detectionDescription_add').val("");
   		});
	   	
		//确认添加项目响应事件
		$('#sureAddProject_addProject').click(function(){
			//添加项目验证
			if(!$('#form_addProject').valid()){
				return false;
			}
			var userId = $("#selectUser_div_addProject option:selected").val();
			var projectTypeId = $("#selectProjectType_div_addProject option:selected").val();
			var projectName = $("#projectName_addProject").val();
			var projectAddress = $("#projectAddress_addProject").val();
			var projectDescription = $("#projectDescription_addProject").val();
			var projectLongitude = $("#projectLongitude_addProject").val();
			var projectLatitude = $("#projectLatitude_addProject").val();
			var jsonData = '{"userId":"'
							+ userId
							+ '","projectTypeId":"'
							+ projectTypeId
							+ '","projectName":"'
							+ projectName
							+ '","projectAddress":"'
							+ projectAddress
							+ '","projectLongitude":"'
							+ projectLongitude
							+ '","projectLatitude":"'
							+ projectLatitude
							+ '","projectDescription":"'
							+ projectDescription + '"}';
			$.ajax({
				type : 'post',
				url : 'rest/project/addProject',
				contentType : 'application/json',
				dataType : 'json',
				data : jsonData,
				success : function(data) {
					if(data) {
						if(data.userId!=2){
						alert("添加成功！");
					    var viewData = '<tr id="project_'+ data.projectId +'">'+
	    	  		    	//'<td class="project-status" style="width:120px">'+
							//'<a href="project_detail.html">' + item.sysDictionary.itemName+'</a><br />'+
						    //'</td>'+
						    '<td class="project-status" style="display:none">'+
								'<span class="label label-primary">' + data.projectId + '</span>'+
							'</td>'+
							'<td class="project-status" style="display:none">'+
								'<span class="label label-primary">' + data.projectTypeId + '</span>'+
							'</td>'+
							'<td class="project-status" style="display:none">'+
								'<span class="label label-primary">' + data.projectLongitude + '</span>'+
							'</td>'+
							'<td class="project-status" style="display:none">'+
								'<span class="label label-primary">' + data.projectLatitude + '</span>'+
							'</td>'+
							'<td class="project-status" style="display:none">'+
								'<span class="label label-primary">' + data.projectAddress + '</span>'+
							'</td>'+
							'<td class="project-status" style="width:80px">'+
								'<span class="label label-primary">' + data.projectStatus + '</span>'+
							'</td>'+
							'<td class="project-title" style="width:150px">'+
								'<a href="project_detail.html">' + data.projectName + '</a><br />'+
							'</td>'+
							'<td class="project-title" style="width:200px">'+
								'<small>创建于 '+data.projectTime+'</small>'+
					    	'</td>'+
							'<td class="project-completion" style="width:460px">'+
								'<small>当前进度： 88%</small>'+
								'<div class="progress progress-mini">'+
									'<div style="width: 88%;" class="progress-bar"></div>'+
								'</div>'+
							'</td>'+
							'<td class="project-title" style="width:360px">'+
								'<a href="project_detail.html">项目描述</a><br />'+
								'<small>' + data.projectDescription + '</small>'+
							'</td>'+
							'<td class="project-title" style="width:140px">'+
							'<a href="project_detail.html">项目告警信息(0)</a><br />'+
							'</td>'+
							'<td class="project-actions">'+
								'<a href="rest/project_detail" class="J_menuItem">'+
									'<i class="fa fa-folder"></i>'+
									'查看 '+
								'</a>'+
							    '<a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">'+
									'<i class="fa fa-pencil"></i> 编辑 '+
								'</a>'+
								'<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ data.projectId +')">'+
									'<i class="fa fa-times-circle"></i> 删除 '+
							    '</a>'+
							'</td>'+
						'</tr>';
					    $('#hover_table').append(viewData);
					    $('#projectAddress_addProject').val("");
						$('#projectName_addProject').val("");
						$('#projectDescription_addProject').val("");
						$('#projectLongitude_addProject').val("");
						$('#projectLatitude_addProject').val("");
                           }else{
                            	alert("抱歉！您为非管理员用户，添加项目请联系对应管理员！");
                            	$('#projectAddress_addProject').val("");
        						$('#projectName_addProject').val("");
        						$('#projectDescription_addProject').val("");
        						$('#projectLongitude_addProject').val("");
        						$('#projectLatitude_addProject').val("");
						    }
						} else {
							alert("数据异常");
						}
					}
				});
		});
		//搜索项目响应事件
		$('#searchButton').click(function(){
			var keyword = $('#searchProject').val();
			var userid = '${userInfo.userId}';
			$('#myModal').hide();
			$.ajax({
				  type:'post',
	    	  	  url: 'rest/project/keywordSearchProject',
	    	  	  data: {keyWord:keyword,userId:userid},
	    	  	  contextType:"application/json",
				  success : function(data) {
					if (data) {
						$("#project_table tbody").html("");
						$.each(data,function(idx,item){
							   var viewData = '<tr id="project_'+ item.projectId +'">'+
					    	  		    	//'<td class="project-status" style="width:120px">'+
											//'<a href="project_detail.html">' + item.sysDictionary.itemName+'</a><br />'+
										    //'</td>'+
										    '<td class="project-status" style="display:none">'+
												'<span class="label label-primary">' + item.projectId + '</span>'+
											'</td>'+
											'<td class="project-status" style="display:none">'+
												'<span class="label label-primary">' + item.projectTypeId + '</span>'+
											'</td>'+
											'<td class="project-status" style="display:none">'+
												'<span class="label label-primary">' + item.projectLongitude + '</span>'+
											'</td>'+
											'<td class="project-status" style="display:none">'+
												'<span class="label label-primary">' + item.projectLatitude + '</span>'+
											'</td>'+
											'<td class="project-status" style="display:none">'+
												'<span class="label label-primary">' + item.projectAddress + '</span>'+
										    '</td>'+
											'<td class="project-status" style="width:80px">'+
												'<span class="label label-primary">' + item.projectStatus + '</span>'+
											'</td>'+
											'<td class="project-title" style="width:150px">'+
												'<a href="project_detail.html">' + item.projectName + '</a><br />'+
											'</td>'+
											'<td class="project-title" style="width:200px">'+
												'<small>创建于 '+item.projectTime+'</small>'+
								    		'</td>'+
											'<td class="project-completion" style="width:460px">'+
												'<small>当前进度： '+idx+'8%</small>'+
												'<div class="progress progress-mini">'+
													'<div style="width: '+idx+'8%;" class="progress-bar"></div>'+
												'</div>'+
											'</td>'+
											'<td class="project-title" style="width:360px">'+
												'<a href="project_detail.html">项目描述</a><br />'+
												'<small>' + item.projectDescription + '</small>'+
											'</td>'+
											'<td class="project-title" style="width:140px">'+
											'<a href="project_detail.html">项目告警信息('+ item.messageCount +')</a><br />'+
											'</td>'+
											'<td class="project-actions">'+
												'<a href="rest/project_detail" class="J_menuItem">'+
													'<i class="fa fa-folder"></i>'+
													'查看 '+
												'</a>'+
											    '<a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">'+
													'<i class="fa fa-pencil"></i> 编辑 '+
												'</a>'+
												'<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ item.projectId +')">'+
													'<i class="fa fa-times-circle"></i> 删除 '+
											    '</a>'+
											'</td>'+
										'</tr>';
					                   $('#hover_table').append(viewData);
						});
					} else {
						alert("数据异常");
					}
				},
				error : function() {
					alert("查找失败");
				}
			});
		});
		//删除项目
		function deleteProject(projectId){
			layer.msg('玩命提示中');
			layer.confirm('确定要删除该用户么？', {
				btn : [ '取消删除', '确定删除' ] //按钮
			}, function() {
				layer.msg('已取消', {icon : 1});
			}, function() {
				$.ajax({
					type : 'post',
					url : 'rest/project/deleteProject',
					data : {projectId:projectId},
					success : function(data) {
						if(data=="1"){
							$("#project_"+projectId).remove();
							layer.msg('删除成功（该提示3s后自动关闭）', {
								time : 3000, //3s后自动关闭
								btn : [ '知道了' ]
							});
						}
					}
				});
			});
		}
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
