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
							    <label class="md_lable" for="">项目状态:</label>
								<div id="selectProjectStatus_div_addProject">
							    </div><br><br>
								<label class="md_lable" for="projectName_addProject">项目名称:</label>
								<input class="md_input" type="text" id="projectName_addProject" name="projectName_addProject"><br><br>
								<!-- 项目名 -->
								<input class="md_input" type="text" style="display:none" id="projectName_addProjects" name="projectName_addProjects">
								<label class="md_lable" for="projectAddress_addProject">项目地址:</label>
								<input class="md_input" type="text" id="projectAddress_addProject" name="projectAddress_addProject"><br><br>
								<label class="md_lable" for="projectLongitude_addProject">项目经度:</label>
								<input class="md_input" type="text" id="projectLongitude_addProject" name="projectLongitude_addProject"><br><br>
								<label class="md_lable" for="projectLatitude_addProject">项目纬度:</label>
								<input class="md_input" type="text" id="projectLatitude_addProject" name="projectLatitude_addProject"><br><br>
								<label class="md_lable" for="projectBeginTime_addProject">开始时间:</label>
								<input class="md_input" type="text" id="projectBeginTime_addProject" name="projectBeginTime_addProject"><br><br>
								<label class="md_lable" for="projectEndTime_addProject">结束时间:</label>
								<input class="md_input" type="text" id="projectEndTime_addProject" name="projectEndTime_addProject"><br>
								<label class="md_lable" for="projectDescription_addProject">项目描述:</label>
								<textarea id="projectDescription_addProject" class="data_project_tar data_content_input_5" rows="4"></textarea>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
							     <label class="md_lable" for="">项目状态:</label>
								<div id="selectProjectStatus_div_updetaProject">
							    </div><br><br>
							    <input class="md_input" type="text" style="display:none" id="projectId_updetaProject" name="projectId_updetaProject">
								<label class="md_lable" for="projectName_updetaProject">项目名称:</label>
								<input class="md_input" type="text" id="projectName_updetaProject" name="projectName_updetaProject"><br><br>
								<label class="md_lable" for="projectAddress_updetaProject">项目地址:</label>
								<input class="md_input" type="text" id="projectAddress_updetaProject" name="projectAddress_updetaProject"><br><br>
								<label class="md_lable" for="projectLongitude_updetaProject">项目经度:</label>
								<input class="md_input" type="text" id="projectLongitude_updetaProject" name="projectLongitude_updetaProject"><br><br>
								<label class="md_lable" for="projectLatitude_updetaProject">项目纬度:</label>
								<input class="md_input" type="text" id="projectLatitude_updetaProject" name="projectLatitude_updetaProject"><br><br>
								<label class="md_lable" for="projectBeginTime_updetaProject">开始时间:</label>
								<input class="md_input" type="text" id="projectBeginTime_updetaProject" name="projectBeginTime_updetaProject"><br><br>
								<label class="md_lable" for="projectEndTime_updetaProject">结束时间:</label>
								<input class="md_input" type="text" id="projectEndTime_updetaProject" name="projectEndTime_updetaProject"><br>
								<label class="md_lable" for="">项目描述:</label>
								<textarea id="projectDescription_updetaProject" class="data_project_tar data_content_input_5" rows="4"></textarea>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-primary sureAddProject_updetaProject">提交</button>
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
	<script src="assets/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="assets/js/customerValidate.js"></script>
	<script src="assets/js/plugins/laydate/laydate.js" charset="utf-8"></script>
	<script src="assets/js/layui.all.js" charset="utf-8"></script>
	<script>
	
		//传字符串型时间转化为时间
		 function stringToData(strin){
			var beginArray = strin.split(" ");
	    	var dateArray = beginArray[0].split("-");
	    	var timeArray = beginArray[1].split(":");
	    	var date = new Date(dateArray[0], dateArray[1]-1, dateArray[2], timeArray[0], timeArray[1], timeArray[2]);
	    	return date.getTime();
		}
		
		//设置上传图片显示的大小
		function creatImg(imgRUL){  
		    var textHtml = "<img src='"+imgRUL+"'width='170px' height='100px'/>";  
		    $(".ge_pic_icon_Infor").html(textHtml);  
		}  
		 
		//上传图片响应事件
		 $(function(){
				var upload = layui.upload;
				
				//heatImageUr上传
				var uploadInst1 = upload.render({
						elem: '#test1',
						url: 'rest/threshold/uploadImg',
						before: function(obj){
						//预读本地文件示例，不支持ie8
						obj.preview(function(index, file, result){
							//alert(result);
							$('#demo1').attr('src', result); //图片链接（base64）
						});
					},
					//上传成功回调函数
					done: function(res){
						//如果上传失败
						if(res.code > 0){
							return layer.msg('上传失败');
						}else{
							$('#demo1').attr('src', res.path);
						}
						//上传成功
					},
					//上传失败回调函数
					error: function(){
						//演示失败状态，并实现重传
						var demoText = $('#demoText1');
						demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
						demoText.find('.demo-reload').on('click', function(){
							uploadInst1.upload();
						});
					}
				});
				
				//physicalImageUrl上传
				var uploadInst2 = upload.render({
					elem: '#test2',
					url: 'rest/threshold/uploadImg',
					before: function(obj){
					//预读本地文件示例，不支持ie8
					obj.preview(function(index, file, result){
						$('#demo2').attr('src', result); //图片链接（base64）
					});
				}
				,done: function(res){
					//如果上传失败
					if(res.code > 0){
					return layer.msg('上传失败');
					}else{
						$('#demo2').attr('src', res.path);
					}
					//上传成功
				}
				,error: function(){
					//演示失败状态，并实现重传
					var demoText = $('#demoText2');
					demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
					demoText.find('.demo-reload').on('click', function(){
						uploadInst2.upload();
					});
				}
			});

			 });
	
		$(document).ready(function() {
			
			//日期范围限制
	        var start = {
	            elem: '#projectBeginTime_addProject',
	            format: 'YYYY-MM-DD hh:mm:ss',
	            min: '1900-06-16 23:59:59', //设定最小日期为当前日期laydate.now()
	            max: '2099-06-16 23:59:59', //最大日期
	            istime: true,
	            istoday: false,
	            choose: function (datas) {
	                end.min = datas; //开始日选好后，重置结束日的最小日期
	                end.start = datas //将结束日的初始值设定为开始日
	            }
	        };
	        var end = {
	            elem: '#projectEndTime_addProject',
	            format: 'YYYY-MM-DD hh:mm:ss',
	            min: '1900-06-16 23:59:59',
	            max: '2099-06-16 23:59:59',
	            istime: true,
	            istoday: false,
	            choose: function (datas) {
	                start.max = datas; //结束日选好后，重置开始日的最大日期
	            }
	        };
	        laydate(start);
	        laydate(end);
	        
	      //日期范围限制
	        var start = {
	            elem: '#projectBeginTime_updetaProject',
	            format: 'YYYY-MM-DD hh:mm:ss',
	            min: '1900-06-16 23:59:59', //设定最小日期为当前日期laydate.now()
	            max: '2099-06-16 23:59:59', //最大日期
	            istime: true,
	            istoday: false,
	            choose: function (datas) {
	                end.min = datas; //开始日选好后，重置结束日的最小日期
	                end.start = datas //将结束日的初始值设定为开始日
	            }
	        };
	        var end = {
	            elem: '#projectEndTime_updetaProject',
	            format: 'YYYY-MM-DD hh:mm:ss',
	            min: '1900-06-16 23:59:59',
	            max: '2099-06-16 23:59:59',
	            istime: true,
	            istoday: false,
	            choose: function (datas) {
	                start.max = datas; //结束日选好后，重置开始日的最大日期
	            }
	        };
	        laydate(start);
	        laydate(end);
			
			//获取当前登陆用户ID
			var dlId = '${userInfo.userId}';
			//系统自带
			$("#loading-example-btn").click(function() {
				btn = $(this);
				simpleLoad(btn, true);
				simpleLoad(btn, false)
			})
 
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
	    	   //新建项目时加载项目状态
	    	    $.ajax({
	    	    	type:'post',
		    	  	  url: 'rest/project/showProjectStatus',
		    	  	  data: {userId:dlId},
		    	  	  contextType:"application/json",
		    	  	  success: function(data){
		    	  		       if(data){
		    	  		    	var string = '<select class="md_input" id="selectProjectStatus" name="selectProjectStatus">';
		    	  		    	$.each(data,function(idx,SysDictionary){
		    	  		    	    string += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
		    	  		    	});
		    	  		       string += '</select>';
		    	  		       $('#selectProjectStatus_div_addProject').append(string);
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
		    	//编辑项目加载项目状态，默认显示选中项目状态
		    	   $.ajax({
		    		   type:'post',
			    	  	  url: 'rest/project/showProjectStatus_selected',
			    	  	  data: {userId:dlId},
			    	  	  contextType:"application/json",
			    	  	  success: function(data){
			    	  		       if(data){
			    	  		    	var string = '<select class="md_input" id="selectProjectStatus_selected" name="selectProjectStatus_selected">';
			    	  		    	$.each(data,function(idx,SysDictionary){
			    	  		    	    string += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
			    	  		    	});
			    	  		       string += '</select>';
			    	  		       $('#selectProjectStatus_div_updetaProject').append(string);
			    	  		       }else{
			    	  		    	alert("数据异常");
			    	  		       }
			    	  	  },
			    	  	  error: function(){
			  			    alert("数据加载失败");
			  		      }
		    	   });
		});
		       var b;
		 //修改编辑项目时加载编辑框内所有元素
		 function updetaProject(s){
			   b = s.parentNode.parentNode.rowIndex;
	    	   //获取选中的项目信息加载到编辑框
	    	   var projectId = $("table tr:eq(" + b + ") td:eq(0)").text();//项目ID--6
	    	   var projectTypeId = $("table tr:eq(" + b + ") td:eq(1)").text();//项目类型ID--10
	    	   var projectLongitude = $("table tr:eq(" + b + ") td:eq(2)").text();//经度--4
	    	   var projectLatitude = $("table tr:eq(" + b + ") td:eq(3)").text();//纬度--5
	    	   var projectAddress = $("table tr:eq(" + b + ") td:eq(4)").text();//项目地址_String--1
	    	   var projectStatusString =  $("table tr:eq(" + b + ") td:eq(5)").text();//项目状态
	    	   var projectName = $("table tr:eq(" + b + ") td:eq(6)").text();//项目名--2
	    	   var projectDescription = $("table tr:eq(" + b + ") td:eq(9)").text();//项目描述--3
	    	   var projectStatus =  $("table tr:eq(" + b + ") td:eq(10)").text();//项目状态_int--9
	    	   var projectBeginTime =  $("table tr:eq(" + b + ") td:eq(11)").text();//开始时间--7
	    	   var projectEndTime =  $("table tr:eq(" + b + ") td:eq(12)").text();//结束时间--8
	    /* 	   alert(projectAddress);
	    	   alert(projectName);
	    	   alert(projectDescription);
	    	   alert(projectLongitude);
	    	   alert(projectLatitude);
	    	   alert(projectId);
	    	   alert(projectBeginTime);
	    	   alert(projectEndTime);
	    	   alert(projectStatus);
	    	   alert(projectTypeId); */
			   $('#projectAddress_updetaProject').val(projectAddress);
	       	   $('#projectName_updetaProject').val(projectName);
	       	   $('#projectDescription_updetaProject').val(projectDescription);
	       	   $('#projectLongitude_updetaProject').val(projectLongitude);
	       	   $('#projectLatitude_updetaProject').val(projectLatitude);
	       	   $('#projectId_updetaProject').val(projectId);
		       $('#projectBeginTime_updetaProject').val(projectBeginTime);
			   $('#projectEndTime_updetaProject').val(projectEndTime);
	       	   $("#selectProjectStatus_selected option[value='"+projectStatus+"']").attr("selected","selected");
	       	   //修改项目时显示当前选中项目的所属用户和项目类型
	       	   $.ajax({
		   		  type:'post',
		   	  	  url: 'rest/project/showSelectUserAndProjectType',
		   	  	  data: {projectId:projectId,projectTypeId:projectTypeId},
		   	  	  contextType:"application/json",
		   	  	  success: function(data){
		   	  	    $("#selectProjectType_selected option[value='"+data.sysDictionary.dicId+"']").prop("selected",true);
		   	    	$("#selectUserType_selected option[value='"+data.userId+"']").prop("selected",true);
		   	  	  }
			   });
	       	   /*$.ajax({
		   		  type:'post',
		   	  	  url: 'rest/project/showSelectProjectStatus',
		   	  	  data: {projectStatusString:projectStatusString},
		   	  	  contextType:"application/json",
		   	  	  success: function(data){
		   	  	    $("#selectProjectType_selected option[value='"+data.sysDictionary.dicId+"']").attr("selected","selected");
		   	    	$("#selectUserType_selected option[value='"+data.userId+"']").attr("selected","selected");
		   	  	  }
			   });*/
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
		
	   	//确定修改项目响应事件
   		$(".sureAddProject_updetaProject").click(function(){
   		    //修改项目验证
			if(!$('#form_updetaProject').valid()){
				return false;
			}
   		       var t = b;
   			   var userIds = $("#selectUser_div_updetaProject option:selected").val();
   			   var projectTypeIds = $("#selectProjectType_div_updetaProject option:selected").val();
   			   var projectNames = $("#projectName_updetaProject").val();
   			   var projectAddresss = $("#projectAddress_updetaProject").val();
   			   var projectDescriptions = $("#projectDescription_updetaProject").val();
   			   var projectLongitudes = $("#projectLongitude_updetaProject").val();
   			   var projectLatitudes = $("#projectLatitude_updetaProject").val();
   			   var projectIds = $("#projectId_updetaProject").val();
   			   var projectBeginTimes = $('#projectBeginTime_updetaProject').val();
   			   var projectEndTimes = $('#projectEndTime_updetaProject').val();
   			   var projectStatuss = $("#selectProjectStatus_div_updetaProject option:selected").val();
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
   								+ '","projectBeginTime":"'
   								+ projectBeginTimes
   								+ '","projectEndTime":"'
   								+ projectEndTimes
   								+ '","projectLongitude":"'
   								+ projectLongitudes
   								+ '","projectLatitude":"'
   								+ projectLatitudes
   								+ '","projectStatus":"'
   								+ projectStatuss
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
   		   	  		    //修改成功后当前页面的当前项目修改
			    	   $("table tr:eq(" + t + ") td:eq(5) span").text(data.projectStatusString);//项目状态_String
			    	   $("table tr:eq(" + t + ") td:eq(6) a").text(data.projectName);//项目名
			    	   $("table tr:eq(" + t + ") td:eq(9) small").text(data.projectDescription);//项目描述
			    	   $("table tr:eq(" + t + ") td:eq(7) small").text(data.projectBeginTime);//创建时间
			    	   
			    	   var nowTime = new Date().getTime();
	  		    	   var beginTime = stringToData(data.projectBeginTime);
	  		    	   var endTime = stringToData(data.projectEndTime);
	  		    	   var percentage=0;;
	  		    	   if(nowTime > endTime){
	  		    		   percentage=100;
	  		    	   }else if(nowTime < beginTime){
	  		    		   percentage=0;
	  		    	   }else{
	  		    		   percentage = ((nowTime-beginTime)/(endTime-beginTime)*100).toFixed(2); 
	  		    	   }	  		    
			    	   $("table tr:eq(" + t + ") td:eq(8) small").text("当前进度： "+percentage+"%");//当前进度
			    	   $("table tr:eq(" + t + ") td:eq(8) .progress-bar").css("width",percentage+"%");//当前进度
			    	   
			    	   alert("修改成功！");
   		   	  		  }else {
  						alert("抱歉！您为非管理员用户，修改项目信息请联系对应管理员！");
   					  }
   		   	  	  },
   	       	 	  error: function(){
   	       	 		alert("权限不足，修改项目信息请联系相关管理员");
   	  		      }
   			  }); 
   		}); 
	   	
		//确认添加项目响应事件
		$(".sureAddProject_addProject").click(function(){
			//添加项目验证
			if(!$('#form_addProject').valid()){
				return false;
			}
			var userId = $("#selectUser_div_addProject option:selected").val();
			var projectTypeId = $("#selectProjectType_div_addProject option:selected").val();
			var projectStatus = $("#selectProjectStatus_div_addProject option:selected").val();
			var projectName = $("#projectName_addProject").val();
			var projectAddress = $("#projectAddress_addProject").val();
			var projectDescription = $("#projectDescription_addProject").val();
			var projectLongitude = $("#projectLongitude_addProject").val();
			var projectLatitude = $("#projectLatitude_addProject").val();
			var projectBeginTime = $("#projectBeginTime_addProject").val();
			var projectEndTime = $("#projectEndTime_addProject").val();
			$("#projectName_addProjects").val(projectName);
			var jsonData = '{"userId":"'
							+ userId
							+ '","projectTypeId":"'
							+ projectTypeId
							+ '","projectName":"'
							+ projectName
							+ '","projectStatus":"'
							+ projectStatus
							+ '","projectAddress":"'
							+ projectAddress
							+ '","projectBeginTime":"'
							+ projectBeginTime
							+ '","projectEndTime":"'
							+ projectEndTime
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
						alert("项目添加成功！");
						var nowTime = new Date().getTime();
	  		    		var beginTime = stringToData(data.projectBeginTime);
	  		    		var endTime = stringToData(data.projectEndTime);
	  		    		var percentage=0;;
	  		    		if(nowTime > endTime){
	  		    			percentage=100;
	  		    		}else if(nowTime < beginTime){
	  		    			percentage=0;
	  		    		}else{
	  		    			percentage = ((nowTime-beginTime)/(endTime-beginTime)*100).toFixed(2); 
	  		    		}
	  		    		
					    var viewData = '<tr id="project_'+ data.projectId +'" style="height:100px">'+
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
											'<span class="label label-primary">' + data.projectStatusString + '</span>'+
										'</td>'+
										'<td class="project-title" style="width:150px">'+
											'<a href="javascript:;">' + data.projectName + '</a><br />'+
										'</td>'+
										'<td class="project-title" style="width:200px">'+
											'<a href="javascript:;">创建时间</a><br />'+
											'<small>' + data.projectBeginTime + '</small>'+
								    	'</td>'+
										'<td class="project-completion" style="width:320px">'+
											'<small>当前进度： '+percentage+'%</small>'+
											'<div class="progress progress-mini">'+
												'<div style="width: '+percentage+'%;" class="progress-bar"></div>'+
											'</div>'+
										'</td>'+
										'<td class="project-title" style="width:300px">'+
											'<a href="javascript:;">项目描述</a><br />'+
											'<p id="trhight">' + item.projectDescription + '</p>'+
										'</td>'+
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + data.projectStatus + '</span>'+
								    	'</td>'+
								    	'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + data.projectBeginTime + '</span>'+
									    '</td>'+
									    '<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + data.projectEndTime + '</span>'+
								    	'</td>'+
								    	'<td class="project-title" style="width:20px">'+
										'</td>'+
										'<td class="project-title" style="width:140px">'+
											'<a href="javascript:;">项目告警信息(0)</a><br />'+
										'</td>'+
										'<td class="project-title" style="width:20px">'+
										'</td>'+
										
										'<td class="project-status" style="width:80px">'+
										//打开页面即传item.pojectId过去
										'<a href="rest/detectionPoint/'+data.projectTypeId+':'+data.projectName+'" class="J_menuItem" name="测点">'+
											 '测点'+
										'</a>'+
										'</td>'+
										'<td class="project-status" style="width:80px">'+
										//打开页面即传data.pojectId过去
											'<a href="rest/thresHold/'+data.projectId+':'+data.projectName+'" class="J_menuItem" name="阀值">'+
												'阀值 '+
											'</a>'+
										'</td>'+
										'<td class="project-status" style="width:80px">'+
										//打开页面即传data.pojectId过去
											'<a href="rest/image/'+data.projectId+':'+data.projectName+'" class="J_menuItem" name="图片">'+
												'图片 '+
											'</a>'+
										'</td>'+
										'<td class="project-actions">'+
										    '<a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">'+
												'<i class="fa fa-pencil"></i> 修改 '+
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
									$('#projectBeginTime_addProject').val("");
									$('#projectEndTime_addProject').val("");
									//新建测点时加载测点类型-不同项目不同测点类型(通过项目value判定)
									
						    	    $.ajax({
						    	    	type:'post',
							    	  	  url: 'rest/project/showDetectionStatus',
							    	  	  data: {projectTypeId:data.projectTypeId},
							    	  	  contextType:"application/json",
							    	  	  success: function(data){
							    	  		       if(data){
							    	  		    	var string = '<select class="md_input" id="selectDetectionStatus" name="selectDetectionStatus">';
							    	  		    	$.each(data,function(idx,SysDictionary){
							    	  		    	    string += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
							    	  		    	});
							    	  		       string += '</select>';
							    	  		       $('#selectDetection_div_addDetection').append(string);
							    	  		       $('#selectDetection_div_addDetections').append(string);
							    	  		       }else{
							    	  		    	alert("数据异常");
							    	  		       }
							    	  	  },
							    	  	  error: function(){
							  			    alert("数据加载失败");
							  		      }
						    	     });
									
                           }else{
                            	alert("抱歉！您为非管理员用户，添加项目请联系对应管理员！");
                            	$('#projectAddress_addProject').val("");
        						$('#projectName_addProject').val("");
        						$('#projectDescription_addProject').val("");
        						$('#projectLongitude_addProject').val("");
        						$('#projectLatitude_addProject').val("");
        						$('#projectBeginTime_addProject').val("");
        						$('#projectEndTime_addProject').val("");
						    }
						} else {
							alert("数据异常");
						}
					}
				});
		});
		
		//删除项目
		function deleteProject(projectId){
			layer.msg('玩命提示中');
			layer.confirm('确定要删除该项目么？(包括项目下所有测点和传感器)', {
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
						}else{
							alert("抱歉！您为非管理员用户，删除项目请联系对应管理员！");
						}
					}
				});
			});
		}
		
		$(function(){
			(function(){
				//分页请求后台获取数据函数 , 参数jsonData为查询条件集合json数据 , loadLaypage是分页组件函数
				function projectPageAjax(jsonData, loadLaypage){
					 //显示loading提示
	                 var loading = layer.load(2, {
	                	  shade: [0.1,'#fff'] //0.1透明度的白色背景
	                 });
					 $.ajax({
							type : 'post',
							url : 'rest/project/projectPageList',
							dataType : 'json',
							contentType : 'application/json',
							data : JSON.stringify(jsonData),
							success : function(data) {
								 if(data){
					  	  		    var asthtml = '';
					  	  		    var reStr = '<td class="project-status" style="display:none"><span class="label label-primary">';
					  	  		   	$.each(data.projectList,function(idx,item){
					  	  		    	var nowTime = new Date().getTime();
					  	  		    	var beginTime = stringToData(item.projectBeginTime);
					  	  		    	var endTime = stringToData(item.projectEndTime);
					  	  		    	var percentage=0;;
					  	  		    	if(nowTime > endTime){
					  	  		    		percentage=100;
					  	  		    	}else if(nowTime < beginTime){
					  	  		    		percentage=0;
					  	  		    	}else{
					  	  		    		percentage = ((nowTime-beginTime)/(endTime-beginTime)*100).toFixed(2); 
					  	  		    	}
					  	  		    	/*  asthtml += '<tr id="project_'+ item.projectId +'" style="height:200px>'+
					  	  		    				reStr + item.projectId + '</span></td>'+
					  	  		    				reStr + item.projectTypeId + '</span></td>'+
					  	  		    				reStr + item.projectLongitude + '</span></td>'+
					  	  		    				reStr + item.projectLatitude + '</span></td>'+
					  	  		    				reStr + item.projectAddress + '</span></td>'+
													'<td class="project-status" style="width:80px">'+
														'<span class="label label-primary">' + item.projectStatusString + '</span>'+
													'</td>'+
													'<td class="project-title" style="width:150px">'+
														'<a href="javascript:;">' + item.projectName + '</a><br />'+
													'</td>'+
													'<td class="project-title" style="width:200px">'+
														'<a href="javascript:;">创建时间</a><br />'+
														'<small>' + item.projectBeginTime + '</small>'+
													'</td>'+
													'<td class="project-completion" style="width:320px">'+
														'<small>当前进度： '+percentage+'%</small>'+
														'<div class="progress progress-mini">'+
															'<div style="width: '+percentage+'%;" class="progress-bar"></div>'+
														'</div>'+
													'</td>'+
													'<td class="project-title" style="width:260px">'+
														'<a href="javascript:;">项目描述</a><br />'+
														'<small>' + item.projectDescription + '</small>'+
													'</td>'+
													reStr + item.projectStatus + '</span></td>'+
													reStr + item.projectBeginTime + '</span></td>'+
													reStr + item.projectEndTime + '</span></td>'+
													'<td class="project-title" style="width:140px">'+
														'<a href="javascript:;">告警次数(<i class="fa fa-bell"></i>'+ item.alarmCount +')</a><br />'+
													'</td>'+
													'<td class="project-title" style="width:20px"></td>'+
													'<td class="project-status" style="width:80px">'+
														//打开页面即传item.projectName过去
														'<a href="rest/detectionPoint/'+item.projectTypeId+':'+item.projectName+'" class="J_menuItem" name="测点">测点</a>'+
													'</td>'+
													'<td class="project-status" style="width:80px">'+
														//打开页面即传item.pojectId过去
														'<a href="rest/thresHold/'+item.projectId+':'+item.projectName+':'+item.projectTypeId+'" class="J_menuItem" name="阀值">阀值 </a>'+
													'</td>'+
													'<td class="project-status" style="width:80px">'+
														//打开页面即传item.pojectId过去
														'<a href="rest/project_image/'+item.projectId+':'+item.projectName+'" class="J_menuItem" name="图片">图片 </a>'+
													'</td>'+
													'<td class="project-actions">'+
														'<a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">'+
															'<i class="fa fa-times-circle"></i> 修改 '+
														'</a>'+
														'<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ item.projectId +')">'+
															'<i class="fa fa-times-circle"></i> 删除 '+
														'</a>'+
													'</td>'+
												'</tr>';  */
												
												 asthtml += '<tr id="project_'+ item.projectId +'" style="height:100px">'+
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
																'<span class="label label-primary">' + item.projectStatusString + '</span>'+
															'</td>'+
															'<td class="project-title" style="width:150px">'+
																'<a href="javascript:;">' + item.projectName + '</a><br />'+
															'</td>'+
															'<td class="project-title" style="width:200px">'+
																'<a href="javascript:;">创建时间</a><br />'+
																'<small>' + item.projectBeginTime + '</small>'+
													    	'</td>'+
															'<td class="project-completion" style="width:320px">'+
																'<small>当前进度： '+percentage+'%</small>'+
																'<div class="progress progress-mini">'+
																	'<div style="width: '+percentage+'%;" class="progress-bar"></div>'+
																'</div>'+
															'</td>'+
															'<td class="project-title" style="width:300px">'+
																'<a href="javascript:;">项目描述</a><br />'+
																'<p id="trhight">' + item.projectDescription + '</p>'+
															'</td>'+
															'<td class="project-status" style="display:none">'+
																'<span class="label label-primary">' + item.projectStatus + '</span>'+
													    	'</td>'+
													    	'<td class="project-status" style="display:none">'+
																'<span class="label label-primary">' + item.projectBeginTime + '</span>'+
														    '</td>'+
														    '<td class="project-status" style="display:none">'+
																'<span class="label label-primary">' + item.projectEndTime + '</span>'+
													    	'</td>'+
													    	'<td class="project-title" style="width:20px">'+
															'</td>'+
															'<td class="project-title" style="width:140px">'+
																'<a href="javascript:;">项目告警信息(0)</a><br />'+
															'</td>'+
															'<td class="project-title" style="width:20px">'+
															'</td>'+
															'<td class="project-status" style="width:80px">'+
															//打开页面即传item.projectName过去
																'<a href="rest/detectionPoint/'+item.projectTypeId+':'+item.projectName+'" class="J_menuItem" name="测点">测点</a>'+
															'</td>'+
															'<td class="project-status" style="width:80px">'+
																//打开页面即传item.pojectId过去
																'<a href="rest/thresHold/'+item.projectId+':'+item.projectName+':'+item.projectTypeId+'" class="J_menuItem" name="阀值">阀值 </a>'+
															'</td>'+
															'<td class="project-status" style="width:80px">'+
																//打开页面即传item.pojectId过去
																'<a href="rest/project_image/'+item.projectId+':'+item.projectName+'" class="J_menuItem" name="图片">图片 </a>'+
															'</td>'+
																'<td class="project-actions">'+
															    '<a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">'+
																	'<i class="fa fa-pencil"></i> 修改 '+
																'</a>'+
																'<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ item.projectId +')">'+
																	'<i class="fa fa-times-circle"></i> 删除 '+
															    '</a>'+
															'</td>'+
														'</tr>'; 
					  	  		    					});
					  	  		    $('#hover_table').html(asthtml); 		
					  	  		    if(loadLaypage){ //如果该参数有值
										loadLaypage(data.total, jsonData); //有查询条件时请求数据，需重新初始化分页组件
									}
									//加载完成后隐藏loading提示
				                   	layer.close(loading);
					  	  		}else{
					  	  		    alert("数据异常");
					  	  		}
							},
							error : function() {
								alert("数据加载失败");
							}
						});
				 }
				 
			
				 //初始化分页组件函数
				 function loadLaypage(dataTotal, jsonData){
					 var laypage = layui.laypage;
					 laypage.render({
						 elem: 'pageComponent', //分页组件div的id
						 count: dataTotal, //记录总条数
						 limit: jsonData.pageSize, //每页显示的条数
						 limits:[jsonData.pageSize, 10, 20, 30, 40, 50], //每页条数的选择项
					     groups: 5, //连续显示分页数
					     layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],
					     jump: function(obj, first){  //触发分页后的回调
					         if(!first){ //一定要加此判断，否则初始时会无限刷新
					        	 jsonData.pageNum = obj.curr;
					 			 jsonData.pageSize = obj.limit;
					 			 projectPageAjax(jsonData); //分页请求后台函数  参数jsonData查询条件参数
					         }
					     }
					 });
				 }
				
				 $('#searchButton').click(function(){
						var jsonData = {};
						if($('#searchProject').val()){
							jsonData.projectName = $('#searchProject').val();
						}
						jsonData.pageNum = 1;
						jsonData.pageSize = 6;
						projectPageAjax(jsonData, loadLaypage);
					});
				 //首次加载页面触发查询按钮初始化列表（无查询参数）
				 $('#searchButton').trigger("click");
			})();
		});
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
