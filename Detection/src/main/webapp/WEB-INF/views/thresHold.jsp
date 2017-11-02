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
<title>预值和图片</title>
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
										<!--td class="project-title" style="width:500px">
											热点图
										</td>
										<td class="project-title" style="width:500px">
											物理图
										</td-->
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
									<select class="md_input" id="selectDetectionType_addThresHold" name="selectDetectionStatus_addThresHold">
									</select>
							    </div><br><br>
							    
							    <label class="md_lable" for="">阀值类型:</label>
								<div id="selectThresHoldType_div_addThresHold">
									<select class="md_input" id="selectThresHoldType_addThresHold" name="selectThresHoldType_addThresHold">
									</select>
							    </div><br><br>
						      	
						        <label class="md_lable" for="maxThresholdValue_add">最大警戒值:</label>
								<input class="md_input" type="text" id="maxThresholdValue_add" name="maxThresholdValue_add"><br><br>
								<label class="md_lable" for="minThresholdValue_add">最小警戒值:</label>
								<input class="md_input" type="text" id="minThresholdValue_add" name="minThresholdValue_add"><br><br>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
									<select class="md_input" id="selectDetectionType_updetaThresHold" name="selectDetectionStatus_updetaThresHold">
									</select>
							    </div><br><br>
							    
							    <label class="md_lable" for="">阀值类型:</label>
								<div id="selectThresHoldType_div_addThresHold">
									<select class="md_input" id="selectThresHoldType_updetaThresHold" name="selectThresHoldType_updetaThresHold">
									</select>
							    </div><br><br>
							     
							    <input class="md_input" type="text" style="display:none" id="thresHoldId_updetaThresHold" name="thresHoldId_updetaThresHold">
							    <input class="md_input" type="text" style="display:none" id="detectionTypeId_updetaThresHold" name="detectionTypeId_updetaThresHold">
							    <input class="md_input" type="text" style="display:none" id="thresholdTypeId_updetaThresHold" name="thresholdTypeId_updetaThresHold">
						       
						        <label class="md_lable" for="maxThresholdValue_updeta">最大警戒值:</label>
								<input class="md_input" type="text" id="maxThresholdValue_updeta" name="maxThresholdValue_updeta"><br><br>
								<label class="md_lable" for="minThresholdValue_updeta">最小警戒值:</label>
								<input class="md_input" type="text" id="minThresholdValue_updeta" name="minThresholdValue_updeta"><br><br>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-primary sureUpdetaThresHold_UpdetaThresHold">提交</button>
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
	 
	//点击提交添加阀值到数据库
	$('.sureAddThresHold_addThresHold').click(function(){
		if(!$('#form_addThresHold').valid()){
			return false;
		}
		var projectId = '${projectId}';//传项目ID可以查其他所有未传ID
		var detectionTypeId = $('#selectDetectionType_addThresHold option:selected').val();//测点类型ID
		var thresholdTypeId = $('#selectThresHoldType_addThresHold option:selected').val();//阀值类型ID
		var maxThresholdValue = $('#maxThresholdValue_add').val();//
		var minThresholdValue = $('#minThresholdValue_add').val();//
		var jsonData = '{"projectId":"'
						+ projectId
						+ '","detectionTypeId":"'
						+ detectionTypeId
						+ '","thresholdTypeId":"'
						+ thresholdTypeId
						+ '","maxThresholdValue":"'
						+ maxThresholdValue
						+ '","minThresholdValue":"'
						+ minThresholdValue 
						+'"}';
			$.ajax({
			type:'post',
			url: 'rest/threshold/addThresHold',
			contentType:"application/json",
			dataType : 'json',
			data: jsonData,
			success: function(data){
					if(data.thresholdId==0){
							alert("重复添加阀值，请认真核对测点类型和阀值类型后再添加!");
					}else{
							$('#minThresholdValue_add').val("");
							$('#maxThresholdValue_add').val("");
			  var viewData ='<tr>'+
					    	'<td class="project-title" style="width:160px">'+
					    		''+$('#selectDetectionType_addThresHold option:selected').text()+''+
						    '</td>'+
						    '<td class="project-title" style="width:160px">'+
						    	''+$('#selectThresHoldType_addThresHold option:selected').text()+''+
							'</td>'+
						    	'<td class="project-title" style="width:160px">'+
						    		+data.minThresholdValue+
						    '</td>'+
						    '<td class="project-title" style="width:160px">'+
					    			+data.maxThresholdValue+
					    	'</td>'+
							'<td class="project-title" style="display:none">'+
									+data.thresholdId+
							'</td>'+
							'<td class="project-title" style="display:none">'+
				  				+data.detectionTypeId+
					    	'</td>'+
					    	'<td class="project-title" style="display:none">'+
				  				+data.thresholdTypeId+
				    		'</td>'+
							'<td class="project-status" style="width:160px">'+
								'<a href="javascript:;" class="J_menuItem" style="color:#337ab7" onclick="updetaThresHold(this)"  data-toggle="modal" data-target="#myModal_updetaThresHold">编辑修改</a><br />'+
						    '</td>'+
						    '<td class="project-actions">'+
						    '</td>'+
							'</tr>';
							$('#thresHold_tbody').append(viewData);				
						    alert("插入成功");
							}
							},
							error: function(){
								  alert("抱歉！您为非管理员用户，添加阀值请联系对应管理员");
							}
			}); 	
	});
		var b;
	//点击修改阀值，加载数据到弹出层
	function updetaThresHold(asd){
		b = asd.parentNode.parentNode.rowIndex;
		var minThresholdValue = $("table tr:eq(" + b + ") td:eq(2)").text();
		var maxThresholdValue = $("table tr:eq(" + b + ") td:eq(3)").text();
		var thresholdId = $("table tr:eq(" + b + ") td:eq(4)").text();
		var detectionTypeId = $("table tr:eq(" + b + ") td:eq(5)").text();
		var thresholdTypeId = $("table tr:eq(" + b + ") td:eq(6)").text();
		//输入框加载
		$('#minThresholdValue_updeta').val(minThresholdValue);
		$('#maxThresholdValue_updeta').val(maxThresholdValue);
		$('#thresHoldId_updetaThresHold').val(thresholdId);
		$('#detectionTypeId_updetaThresHold').val(detectionTypeId);
		$('#thresholdTypeId_updetaThresHold').val(thresholdTypeId);
		//下拉框加载
		$('#selectDetectionType_updetaThresHold option').removeProp("selected");
		$('#selectThresHoldType_updetaThresHold option').removeProp("selected");
	  	$("#selectDetectionType_updetaThresHold option[value='"+detectionTypeId+"']").prop("selected",true);
	  	$("#selectThresHoldType_updetaThresHold option[value='"+thresholdTypeId+"']").prop("selected",true);
	  	 
	}
	
	//点击提交修改阀值到数据库
	$('.sureUpdetaThresHold_UpdetaThresHold').click(function(){
		if(!$('#form_updetaThresHold').valid()){
			return false;
		}
		var t = b;
		var projectId = '${projectId}';
		var detectionTypeId =  $('#selectDetectionType_updetaThresHold option:selected').val();//测点类型ID
		var thresholdTypeId =  $('#selectThresHoldType_updetaThresHold option:selected').val();//阀值类型ID
		var thresholdId = $('#thresHoldId_updetaThresHold').val();
		var maxThresholdValue = $('#maxThresholdValue_updeta').val();
		var minThresholdValue = $('#minThresholdValue_updeta').val();
		var jsonData = '{"thresholdId":"'
						+ thresholdId
						+ '","projectId":"'
						+ projectId
						+ '","detectionTypeId":"'
						+ detectionTypeId
						+ '","thresholdTypeId":"'
						+ thresholdTypeId
						+ '","maxThresholdValue":"'
						+ maxThresholdValue
						+ '","minThresholdValue":"'
						+ minThresholdValue 
						+'"}';
			$.ajax({
			type:'post',
			url: 'rest/project/updetaThreshold',
			contentType:"application/json",
			dataType : 'json',
			data: jsonData,
			success: function(data){
					if(data.thresholdId==0){
							alert("重复添加阀值，请认真核对测点类型和阀值类型后再添加!");
						}else{
						//修改成功后吧页面及时刷新
						$("table tr:eq(" + t + ") td:eq(0)").text($('#selectDetectionType_updetaThresHold option:selected').text());//测点类型名称
						$("table tr:eq(" + t + ") td:eq(1)").text($('#selectThresHoldType_updetaThresHold option:selected').text());//阀值类型名称
						$("table tr:eq(" + t + ") td:eq(2)").text(data.minThresholdValue);//最小警戒值
						$("table tr:eq(" + t + ") td:eq(3)").text(data.maxThresholdValue);//最大警戒值
						alert("修改阀值成功！");
						}
						},
						error: function(){
							  alert("抱歉！您为非管理员用户，修改阀值请联系对应管理员");
						}
			}); 	
	});
	
		$(document).ready(function() {
			//项目ID
			var projectId = '${projectId}';
			var projectTypeId = '${projectTypeId}';
			//加载添加弹出层的测点类型选项
			$.ajax({
		    	type:'post',
			  	  url: 'rest/threshold/showDetectionType',
			  	  data: {projectTypeId:projectTypeId},
			  	  contextType:"application/json",
			  	  success: function(data){
			  		       if(data){
			  		    	var stringAdd = '';
			  		    	var stringUpdeta = '';
			  		    	$.each(data,function(idx,SysDictionary){
			  		    		stringAdd += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
			  		    		stringUpdeta += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
			  		    	});
			  		    	$('#selectDetectionType_addThresHold').append(stringAdd);
				  		    $('#selectDetectionType_updetaThresHold').append(stringUpdeta);
			  		       }else{
			  		    	alert("数据异常");
			  		       }
			  	  },
			  	  error: function(){
					    alert("数据加载失败");
				      }
		     });
			
			//加载添加弹出层的阀值类型选项
			$.ajax({
		    	type:'post',
			  	  url: 'rest/threshold/showThresHoldType',
			  	  data: {projectId:projectId},
			  	  contextType:"application/json",
			  	  success: function(data){
			  		 if(data){
			  		    	var stringAdd = '';
			  		    	var stringUpdeta = '';
			  		    	$.each(data,function(idx,SysDictionary){
			  		    		stringAdd += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
			  		    		stringUpdeta += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
			  		    	}); 
			  		       $('#selectThresHoldType_addThresHold').append(stringAdd);
			  		       $('#selectThresHoldType_updetaThresHold').append(stringUpdeta);
			  		       }else{
			  		    	alert("数据异常");
			  		       }
			  	  },
			  	  error: function(){
					    alert("数据加载失败");
				      }
		     });
			
			//打开测点页面加载所属项目下的所有阀值
			  $.ajax({
		    		  type:'post',
		    	  	  url: 'rest/threshold/showProjectThreshold',
		    	  	  data: {projectId:projectId},
		    	  	  contextType:"application/json",
		    	  	  success: function(data){
		    	  		  //循环加载返回的测点集合
		    	  		  if(data){
		    	  			var string = "";
		    	  			$.each(data,function(idx,item){
		    	  			  string += '<tr>'+
				    	  		    	'<td class="project-title" style="width:160px">'+
				    	  		    		''+item.detectionTypeName+''+
									    '</td>'+
									    '<td class="project-title" style="width:160px">'+
									    	''+item.thresHoldTypeName+''+
										'</td>'+
				    	  		    	'<td class="project-title" style="width:160px">'+
				    	  		    		+item.minThresholdValue+
									    '</td>'+
									    '<td class="project-title" style="width:160px">'+
			    	  		    			+item.maxThresholdValue+
								    	'</td>'+
										'<td class="project-title" style="display:none">'+
	    	  		    					+item.thresholdId+
						    			'</td>'+
										'<td class="project-title" style="display:none">'+
		    	  		    				+item.detectionTypeId+
								    	'</td>'+
								    	'<td class="project-title" style="display:none">'+
		    	  		    				+item.thresholdTypeId+
							    		'</td>'+
										'<td class="project-status" style="width:160px">'+
											'<a href="javascript:;" class="J_menuItem" style="color:#337ab7" onclick="updetaThresHold(this)"  data-toggle="modal" data-target="#myModal_updetaThresHold">编辑修改</a><br />'+
									    '</td>'+
									    '<td class="project-actions">'+
									    '</td>'+
										'</tr>';
				    	  		  });
		    	  			$('#thresHold_tbody').append(string); 		
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