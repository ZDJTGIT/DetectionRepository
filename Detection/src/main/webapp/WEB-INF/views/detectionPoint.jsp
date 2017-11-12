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
								
								<label class="md_lable" for="DetectionLatitude_addDetection">测点经度:</label>
								<input class="md_input" type="text" id="DetectionLatitude_addDetection" placeholder="格式：(-180)-180，小数位1-5位" name="DetectionLatitude_addDetection"><br><br>
								
								<label class="md_lable" for="DetectionLongitude_addDetection">测点纬度:</label>
								<input class="md_input" type="text" id="DetectionLongitude_addDetection" placeholder="格式：(-90)-90，小数位1-5位" name="DetectionLongitude_addDetection"><br><br>
								
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
							    
							    <label class="md_lable" style="display:none" for="ProjectName_updetaDetection">项目名称:</label>
								<input class="md_input" style="display:none" type="text" id="ProjectName_uppdetaDetection" name="ProjectName_uppdetaDetection"><br><br>
							    
								<label class="md_lable" for="DetectionName_updetaDetection">测点名称:</label>
								<input class="md_input" type="text" id="DetectionName_updetaDetection" name="DetectionName_updetaDetection"><br><br>
								
								<label class="md_lable" for="DetectionLongitude_updetaDetection">测点经度:</label>
								<input class="md_input" type="text" id="DetectionLongitude_updetaDetection" placeholder="格式：(-180)-180，小数位1-5位" name="DetectionLongitude_updetaDetection"><br><br>
								
								<label class="md_lable" for="DetectionLatitude_updetaDetection">测点纬度:</label>
								<input class="md_input" type="text" id="DetectionLatitude_updetaDetection" placeholder="格式：(-90)-90，小数位1-5位" name="DetectionLatitude_updetaDetection"><br><br>
								
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
	//确定添加响应事件-将测点信息存入数据库
	$(".sureAddDetection_addDetection").click(function(){
		if(!$('#form_addDetection').valid()){
			return false;
		}
		var projectName = '${projectName}';
		var detectionTypeId = $('#selectDetectionStatusAdd option:selected').val();//测点类型ID-
		var detectionLatitude = $('#DetectionLongitude_addDetection').val();//测点经度.
		var detectionLongitude = $('#DetectionLatitude_addDetection').val();//测点纬度.
		var detectionName = $('#DetectionName_addDetection').val();//测点名.
		var detectionDescription = $('#DetectionDescription_addDetection').val();//测点描述.
		var jsonData = '{"projectName":"'
						+ projectName
						+ '","detectionTypeId":"'
						+ detectionTypeId
						+ '","detectionLatitude":"'
						+ detectionLatitude
						+ '","detectionLongitude":"'
						+ detectionLongitude 
						+ '","detectionName":"'
						+ detectionName
						+ '","detectionDescription":"'
						+ detectionDescription + '"}';
	$.ajax({
		   type:'post',
		   url: 'rest/project/addDescription',
		   contentType:"application/json",
		   dataType : 'json',
		   data: jsonData,
		   success: function(data){
		   		if(data){
		   			//添加成功后清空输入层以便重复使用
		   			//添加成功之后刷新页面
					$('#DetectionLongitude_addDetection').val("");
					$('#DetectionLatitude_addDetection').val("");
					$('#DetectionName_addDetection').val("");
					$('#DetectionDescription_addDetection').val("");
	 var viewData = '<tr id='+data.detectionPointId+'>'+
					'<td class="project-title" style="width:60px">'+
					'</td>'+
	  		    	'<td class="project-status" style="width:120px">'+
						''+data.itemName+''+
				    '</td>'+
				    '<td class="project-title" style="width:50px">'+
					'</td>'+
					'<td class="project-title" style="width:200px">'+
						''+data.detectionName+''+
					'</td>'+
					'<td class="project-title" style="width:140px">'+
						''+data.detectionDescription+''+
					'</td>'+
					'<td class="project-title" style="width:140px">'+
						''+data.detectionLongitude+''+
					'</td>'+
					'<td class="project-title" style="width:140px">'+
						''+data.detectionLatitude+''+
					'</td>'+
					//测点ID（隐藏7）
					'<td class="project-status" style="display:none">'+
						'<span class="label label-primary">' + data.detectionPointId+ '</span>'+
					'</td>'+
					//测点类型ID（隐藏8）
					'<td class="project-status" style="display:none">'+
						'<span class="label label-primary">' + data.detectionTypeId+ '</span>'+
					'</td>'+
					'<td class="project-title" style="width:400px">'+
					'</td>'+
					'<td class="project-status" style="width:150px">'+
					//打开传感器页面，传测点ID和测点名称
						'<a href="rest/sensor_info/'+data.detectionPointId+':'+data.detectionName+'" class="J_menuItem" name="传感器信息">'+
							'&nbsp&nbsp&nbsp&nbsp'+'进入'+
						'</a>'+
					'</td>'+
					'<td class="project-status"  style="width:150px">'+
					    '<a href="javascript:;" class="J_menuItem" onclick="updetaDetectionPoint(this)" data-toggle="modal" data-target="#myModal_updetaDetection">'+
							'<i class="fa fa-pencil"></i>修改'+
						'</a>'+
						'<a href="javascript:;" class="J_menuItem" onclick="deleteDetectionPoint('+data.detectionPointId+')">'+
							'<i class="fa fa-times-circle"></i> 删除'+
					    '</a>'+
				    '</td>'+
				    '<td class="project-actions">'+
				    '</td>'+
				   '</tr>';
					$('#detection_tbody').append(viewData);
					$('#offAddDetection').trigger("click"); 
					layer.msg('添加成功（该提示1s后自动关闭）', {
						time : 1000, //1s后自动关闭
						btn : [ '知道了' ]
					});
		   		   	}else {
		  			alert("数据异常");
		   			}
		   		},
		   	  	error: function(){
				    alert("抱歉！您为非管理员用户，删除测点请联系对应管理员！");
			    }
		   }); 	
	});
	
	//修改测点信息，点击加载选中的测点的信息
	    var b;
	function updetaDetectionPoint(asd){
		//在输入框加载当前测点的相关信息
		b = asd.parentNode.parentNode.rowIndex;
		var detectionPointType = $("table tr:eq(" + b + ") td:eq(1)").text();//测点类型名称
		var detectionTypeId = $("table tr:eq(" + b + ") td:eq(8)").text();//测点类型ID.
		var detectionName = $("table tr:eq(" + b + ") td:eq(3)").text();//测点名称.
		var detectionDescription = $("table tr:eq(" + b + ") td:eq(4)").text();//测点描述.
		var detectionLongitude= $("table tr:eq(" + b + ") td:eq(5)").text();//测点经度.
		var detectionLatitude = $("table tr:eq(" + b + ") td:eq(6)").text();//测点纬度.
		var detectionPointId = $("table tr:eq(" + b + ") td:eq(7)").text();//测点ID.
		$('#DetectionName_updetaDetection').val(detectionName);
		$('#DetectionDescription_updetaDetection').val(detectionDescription);
		$('#DetectionLongitude_updetaDetection').val(detectionLongitude);
		$('#DetectionLatitude_updetaDetection').val(detectionLatitude);
		$('#DetectionPointId_updetaDetection').val(detectionPointId);
		
		//默认选中当前测点的测点类型
		$.ajax({
	   		  type:'post',
	   	  	  url: 'rest/detectionPoint/showSelectDetectionType',
	   	  	  data: {detectionTypeId:detectionTypeId},
	   	  	  contextType:"application/json",
	   	  	  success: function(data){
	   	  		$('#selectDetectionStatusUpdeta option').removeProp("selected");
	   	  	    $("#selectDetectionStatusUpdeta option[value='"+data.dicId+"']").prop("selected",true);
	   	  	  }
		   });
	}
	
	//确定修改，将修改的测点信息存入数据库
	$('.sureAddDetection_updetaDetection').click(function(){
		    if(!$('#form_updetaDetection').valid()){
				return false;
			} 
		    var t = b;
		    var detectionTypeId =  $('#selectDetectionStatusUpdeta option:selected').val();//测点类型ID
		    var projectName = '${projectName}';
		    var detectionLatitude = $('#DetectionLatitude_updetaDetection').val();
		    var detectionLongitude = $('#DetectionLongitude_updetaDetection').val();
		    var detectionName = $('#DetectionName_updetaDetection').val();
		    var detectionDescription = $('#DetectionDescription_updetaDetection').val();
		    var detectionPointId = $('#DetectionPointId_updetaDetection').val();
		    //传的projectName在控制层通过name查ID插入
			var jsonData = '{"detectionTypeId":"'
							+ detectionTypeId
							+ '","detectionPointId":"'
							+ detectionPointId
							+ '","projectName":"'
							+ projectName
							+ '","detectionLatitude":"'
							+ detectionLatitude
							+ '","detectionLongitude":"'
							+ detectionLongitude 
							+ '","detectionName":"'
							+ detectionName
							+ '","detectionDescription":"'
							+ detectionDescription
							+'"}';
			$.ajax({
				type:'post',
				url: 'rest/detectionPoint/updetaDetectionPoint',
				contentType:"application/json",
				dataType : 'json',
				data: jsonData,
				success: function(data){
						if(data){
							//修改测点信息成功后，实时刷新页面
							$("table tr:eq(" + t + ") td:eq(1)").text($('#selectDetectionStatusUpdeta option:selected').text());//测点类型名称
							$("table tr:eq(" + t + ") td:eq(8)").text(detectionTypeId);//测点类型ID.
							$("table tr:eq(" + t + ") td:eq(3)").text(detectionName);//测点名称.
							$("table tr:eq(" + t + ") td:eq(4)").text(detectionDescription);//测点描述.
							$("table tr:eq(" + t + ") td:eq(5)").text(detectionLongitude);//测点经度.
							$("table tr:eq(" + t + ") td:eq(6)").text(detectionLatitude);//测点纬度.
							$('#offUpdetaDetection').trigger("click"); 
							layer.msg('修改成功（该提示1s后自动关闭）', {
								time : 1000, //1s后自动关闭
								btn : [ '知道了' ]
							});
								}else {
									  alert("数据异常");
								      }
								},
							error: function(){
							    alert("抱歉！您为非管理员用户，删除测点请联系对应管理员！");
						    }
				}); 	
	});
	
	//删除测点，删除包括测点下的所有传感器以及测点事件
	function deleteDetectionPoint(detectionPointId){
		layer.msg('玩命提示中');
		layer.confirm('确定要删除该测点么？(包括测点下所有传感器)', {
			btn : [ '取消删除', '确定删除' ] //按钮
		}, function() {
			layer.msg('已取消', {icon : 1});
		}, function() {
			$.ajax({
				type : 'post',
				url : 'rest/detectionPoint/deleteDetectionPoint',
				data : {detectionPointId:detectionPointId},
				success : function(data) {
					if(data=="1"){
						//删除成功后动态清除页面对应的记录
						$("#"+detectionPointId).remove();
						layer.msg('删除成功（该提示3s后自动关闭）', {
							time : 3000, //3s后自动关闭
							btn : [ '知道了' ]
						});
					}else{
						alert("抱歉！您为非管理员用户，删除测点请联系对应管理员！");
					}
				}
			});
		});
	}
	
	//点击搜索响应事件，模糊查询项目ID下所有测点名称并展示在页面
	$('#searchDetectionPoint').click(function(){
		var keyWord = $('#searchDetectionPoint_input').val();
		var projectName = '${projectName}';
		$.ajax({
			type:'post',
			url: 'rest/detectionPoint/keywordSearchDetectionPoint',
			dataType : 'json',
			data: {keyWord:keyWord,projectName:projectName},
			success: function(data){
					if(data){
						    $("#detection_table tbody").html("");
						   $.each(data,function(idx,item){
								 var viewData = '<tr id='+item.detectionPointId+'>'+
												'<td class="project-title" style="width:60px">'+
												'</td>'+
								  		    	'<td class="project-status" style="width:120px">'+
													''+item.itemName+''+
											    '</td>'+
											    '<td class="project-title" style="width:50px">'+
												'</td>'+
												'<td class="project-title" style="width:200px">'+
													''+item.detectionName+''+
												'</td>'+
												'<td class="project-title" style="width:140px">'+
													''+item.detectionDescription+''+
												'</td>'+
												'<td class="project-title" style="width:140px">'+
													''+item.detectionLongitude+''+
												'</td>'+
												'<td class="project-title" style="width:140px">'+
													''+item.detectionLatitude+''+
												'</td>'+
												//测点ID（隐藏7）
												'<td class="project-status" style="display:none">'+
													'<span class="label label-primary">' + item.detectionPointId+ '</span>'+
												'</td>'+
												//测点类型ID（隐藏8）
												'<td class="project-status" style="display:none">'+
													'<span class="label label-primary">' + item.detectionTypeId+ '</span>'+
												'</td>'+
												'<td class="project-title" style="width:400px">'+
												'</td>'+
												'<td class="project-status" style="width:150px">'+
												//打开传感器页面，传测点ID和测点名称
													'<a href="rest/sensor_info/'+item.detectionPointId+':'+item.detectionName+'" class="J_menuItem" name="传感器信息">'+
														'&nbsp&nbsp&nbsp&nbsp'+'进入'+
													'</a>'+
												'</td>'+
												'<td class="project-status"  style="width:150px">'+
												    '<a href="javascript:;" class="J_menuItem" onclick="updetaDetectionPoint(this)" data-toggle="modal" data-target="#myModal_updetaDetection">'+
														'<i class="fa fa-pencil"></i>修改'+
													'</a>'+
													'<a href="javascript:;" class="J_menuItem" onclick="deleteDetectionPoint('+item.detectionPointId+')">'+
														'<i class="fa fa-times-circle"></i> 删除'+
												    '</a>'+
											    '</td>'+
											    '<td class="project-actions">'+
											    '</td>'+
											   '</tr>';   
						          $('#detection_tbody').append(viewData);
							});
							}else {
								  alert("数据异常");
							      }
							}
			}); 	
	});
	
		$(document).ready(function() {
			//项目类型ID,项目名称
			var projectName = '${projectName}';
			var projectTypeId = '${projectTypeId}';
			
			$('#ProjectName_addDetection').val(projectName);
			
			//加载添加弹出层的测点类型选项(公用新建当前项目下所有类型测点)
			$.ajax({
		    	type:'post',
			  	  url: 'rest/project/showDetectionStatus',
			  	  data: {projectTypeId:projectTypeId},
			  	  contextType:"application/json",
			  	  success: function(data){
			  		       if(data){
			  		    	var stringUpdeta = '';
			  		    	var stringAdd = '';
			  		    	$.each(data,function(idx,SysDictionary){
			  		    		stringUpdeta += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
			  		    		stringAdd += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
			  		    	});
			  		       $('#selectDetectionStatusAdd').append(stringAdd);
			  		       $('#selectDetectionStatusUpdeta').append(stringUpdeta);
			  		       }else{
			  		    	alert("数据异常");
			  		       }
			  	  },
			  	  error: function(){
					    alert("数据加载失败");
				      }
		     });
			
			//打开测点页面加载所属项目下的所有测点
			  $.ajax({
		    		  type:'post',
		    	  	  url: 'rest/detectionPoint/showProjectDetectionPoint',
		    	  	  data: {projectName:projectName},
		    	  	  contextType:"application/json",
		    	  	  success: function(data){
		    	  		  //循环加载返回的测点集合
		    	  		  if(data){
		    	  			var string = "";
		    	  			$.each(data,function(idx,item){
		    	  			  string += '<tr id='+item.detectionPointId+'>'+
										'<td class="project-title" style="width:60px">'+
										'</td>'+
				    	  		    	'<td class="project-status" style="width:120px">'+
											''+item.itemName+''+
									    '</td>'+
									    '<td class="project-title" style="width:50px">'+
										'</td>'+
										'<td class="project-title" style="width:200px">'+
											''+item.detectionName+''+
										'</td>'+
										'<td class="project-title" style="width:140px">'+
											''+item.detectionDescription+''+
										'</td>'+
										'<td class="project-title" style="width:140px">'+
											''+item.detectionLongitude+''+
										'</td>'+
										'<td class="project-title" style="width:140px">'+
											''+item.detectionLatitude+''+
										'</td>'+
										//测点ID（隐藏7）
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + item.detectionPointId+ '</span>'+
										'</td>'+
										//测点类型ID（隐藏8）
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + item.detectionTypeId+ '</span>'+
										'</td>'+
										'<td class="project-title" style="width:400px">'+
										'</td>'+
										'<td class="project-status" style="width:150px">'+
										//打开传感器页面，传测点ID和测点名称
											'<a href="rest/sensor_info/'+item.detectionPointId+':'+item.detectionName+'" class="J_menuItem" name="传感器信息">'+
												'&nbsp&nbsp&nbsp&nbsp'+'进入'+
											'</a>'+
										'</td>'+
										'<td class="project-status"  style="width:150px">'+
										    '<a href="javascript:;" class="J_menuItem" onclick="updetaDetectionPoint(this)" data-toggle="modal" data-target="#myModal_updetaDetection">'+
												'<i class="fa fa-pencil"></i>修改'+
											'</a>'+
											'<a href="javascript:;" class="J_menuItem" onclick="deleteDetectionPoint('+item.detectionPointId+')">'+
												'<i class="fa fa-times-circle"></i> 删除'+
										    '</a>'+
									    '</td>'+
									    '<td class="project-actions">'+
									    '</td>'+
									   '</tr>';
				    	  		  });
		    	  			$('#detection_tbody').append(string); 		
		    	  		  }
		    	  		  },
		    	  	  });
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