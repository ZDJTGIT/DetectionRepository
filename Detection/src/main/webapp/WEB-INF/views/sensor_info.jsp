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
											传感器模型
										</td>
										<td class="project-status" style="display:none">
											传感器ID（隐藏）
										</td>
										<td class="project-status" style="display:none">
											测点ID（隐藏）
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
							    
							    <label class="md_lable" for="sensorType_addSensorInfo">传感器类型:&nbsp;&nbsp;</label>
								<input class="md_input" type="text" id="sensorType_addSensorInfo" name="sensorType_addSensorInfo"><br><br>
								
							    <label class="md_lable" for="sensorId_addSensorInfo">传感器&nbsp;I&nbsp;&nbsp;D:&nbsp;&nbsp;</label>
								<input class="md_input" type="text" id="sensorId_addSensorInfo" name="sensorId_addSensorInfo"><br><br>
								
								<label class="md_lable" for="sensorModel_addSensorInfo">传感器模型:&nbsp;&nbsp;</label>
								<input class="md_input" type="text" id="sensorModel_addSensorInfo" name="sensorModel_addSensorInfo"><br><br>
								
								<label class="md_lable" for="sensorDepth_addSensorInfo">传感器深度:&nbsp;&nbsp;</label>
								<input class="md_input" type="text" id="sensorDepth_addSensorInfo" name="sensorDepth_addSensorInfo"><br>
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
							    
							    <label class="md_lable" for="sensorType_updetaSensorInfo">传感器类型:&nbsp;&nbsp;</label>
								<input class="md_input" type="text" id="sensorType_updetaSensorInfo" name="sensorType_updetaSensorInfo"><br><br>
							    
							    <label class="md_lable" for="sensorId_updetaSensorInfo">传感器&nbsp;I&nbsp;&nbsp;D:&nbsp;&nbsp;</label>
								<input class="md_input" type="text" id="sensorId_updetaSensorInfo" name="sensorId_updetaSensorInfo"><br><br>
							    
								<label class="md_lable" for="sensorModel_updetaSensorInfo">传感器模型:&nbsp;&nbsp;</label>
								<input class="md_input" type="text" id="sensorModel_updetaSensorInfo" name="sensorModel_updetaSensorInfo"><br><br>
								
								<label class="md_lable" for="sensorDepth_updetaSensorInfo">传感器深度:&nbsp;&nbsp;</label>
								<input class="md_input" type="text" id="sensorDepth_updetaSensorInfo" name="sensorDepth_updetaSensorInfo"><br>
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="offUpdetaSensorInfo" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-primary sureUpdetaSensorInfo_updetaSensorInfo">提交</button>
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
	
	//确定添加传感器，将新添加传感器数据存入数据库
	$('.sureAddSensorInfo_addSensorInfo').click(function(){
		if(!$('#form_addSensorInfo').valid()){
			return false;
		}
		var detectionPointId = '${detectionPointId}';
		var sensorId = $('#sensorId_addSensorInfo').val();
		var sensorType = $('#sensorType_addSensorInfo').val();
		var sensorModel = $('#sensorModel_addSensorInfo').val();
		var sensorDepth = $('#sensorDepth_addSensorInfo').val();
		var jsonData = '{"detectionPointId":"'
						+ detectionPointId
						+ '","sensorId":"'
						+ sensorId
						+ '","sensorType":"'
						+ sensorType
						+ '","sensorModel":"'
						+ sensorModel 
						+ '","sensorDepth":"'
						+ sensorDepth + '"}';
		$.ajax({
			   type:'post',
			   url: 'rest/sensorInfo/addSensorInfo',
			   contentType:"application/json",
			   dataType : 'json',
			   data: jsonData,
			   success: function(data){
			   		if(data){
			   			//添加成功后清空输入层以便重复使用
			   			//添加成功之后刷新页面
						$('#sensorId_addSensorInfo').val("");
						$('#sensorType_addSensorInfo').val("");
						$('#sensorModel_addSensorInfo').val("");
						$('#sensorDepth_addSensorInfo').val("");
						
		 var viewData = '<tr id='+data.sensorInfoId+'>'+
						'<td class="project-title" style="width:60px">'+
						'</td>'+
					    	'<td class="project-status" style="width:120px">'+
						'<a href="project_detail.html">'+data.sensorType+'</a><br />'+
					    '</td>'+
					    '<td class="project-title" style="width:50px">'+
						'</td>'+
						'<td class="project-status" style="width:200px">'+
							'<span class="label label-primary">'+data.sensorId+'</span>'+
						'</td>'+
						'<td class="project-title" style="width:260px">'+
							'<a href="project_detail.html">'+data.sensorDepth+'</a><br />'+
							'<small></small>'+
						'</td>'+
						'<td class="project-title" style="width:260px">'+
							'<a href="project_detail.html">'+data.sensorModel+'</a><br />'+
							'<small></small>'+
						'</td>'+
						//传感器ID（隐藏6）
						'<td class="project-status" style="display:none">'+
							'<span class="label label-primary">' + data.sensorInfoId+ '</span>'+
						'</td>'+
						//测点ID（隐藏7）
						'<td class="project-status" style="display:none">'+
							'<span class="label label-primary">' + data.detectionPointId+ '</span>'+
						'</td>'+
						'<td class="project-title" style="width:340px">'+
						'</td>'+
						'<td class="project-status style="width:120px">'+
						    '<a href="javascript:;" class="J_menuItem" onclick="updetaSensorInfo(this)" data-toggle="modal" data-target="#myModal_updetaSensorInfo">'+
								'<i class="fa fa-pencil"></i>修改&nbsp&nbsp&nbsp&nbsp'+
							'</a>'+
							'<a href="javascript:;" class="J_menuItem" onclick="deleteSensorInfo('+data.sensorInfoId+')">'+
								'<i class="fa fa-times-circle"></i>删除'+
						    '</a>'+
					   '</td>'+
					   '<td class="project-actions">'+
					   '</td>'+
					   '</tr>';
						$('#sensorInfo_tbody').append(viewData);
						$('#offAddSensorInfo').trigger("click"); 
						alert("传感器添加成功！");
			   		   	   }else {
			  			   alert("数据异常");
			   			   }
			   		       },
						error: function(){
					    alert("抱歉！您为非管理员用户，修改传感器请联系对应管理员！");
				        }
			   }); 	
	});
	    var b;
	//点击修改传感器信息，加载传感器信息到弹出层
	function updetaSensorInfo(asd){
		//在输入框加载当前测点的相关信息
		b = asd.parentNode.parentNode.rowIndex;
		var sensorType = $("table tr:eq(" + b + ") td:eq(1)").text();//传感器类型
		var sensorId = $("table tr:eq(" + b + ") td:eq(3)").text();//传感器编号
		var sensorDepth = $("table tr:eq(" + b + ") td:eq(4)").text();//传感器深度
		var sensorModel = $("table tr:eq(" + b + ") td:eq(5)").text();//传感器模型
		var sensorInfoId= $("table tr:eq(" + b + ") td:eq(6)").text();//传感器ID
		var detectionPointId = $("table tr:eq(" + b + ") td:eq(7)").text();//测点ID
		$('#sensorId_updetaSensorInfo').val(sensorId);
		$('#sensorType_updetaSensorInfo').val(sensorType);
		$('#sensorModel_updetaSensorInfo').val(sensorModel);
		$('#sensorDepth_updetaSensorInfo').val(sensorDepth); 
		$('#sensorInfoId_updetaSensorInfo').val(sensorInfoId);
		$('#detectionPointId_updetaSensorInfo').val(detectionPointId);   		
	}
	
	//点击提交，确定修改，修改的数据库存入数据库
	$('.sureUpdetaSensorInfo_updetaSensorInfo').click(function(){
		if(!$('#form_updetaSensorInfo').valid()){
			return false;
		}
		var t = b;
		var sensorType = $('#sensorType_updetaSensorInfo').val();
		var sensorId =$('#sensorId_updetaSensorInfo').val();
		var sensorDepth = $('#sensorDepth_updetaSensorInfo').val();
		var sensorModel = $('#sensorModel_updetaSensorInfo').val();
		var sensorInfoId= $('#sensorInfoId_updetaSensorInfo').val();
		var detectionPointId = $('#detectionPointId_updetaSensorInfo').val();
		var jsonData = '{"sensorType":"'
						+ sensorType
						+ '","sensorId":"'
						+ sensorId
						+ '","sensorDepth":"'
						+ sensorDepth
						+ '","sensorModel":"'
						+ sensorModel
						+ '","sensorInfoId":"'
						+ sensorInfoId 
						+ '","detectionPointId":"'
						+ detectionPointId
						+'"}';
			$.ajax({
				type:'post',
				url: 'rest/sensorInfo/updetaSensorInfo',
				contentType:"application/json",
				dataType : 'json',
				data: jsonData,
				success: function(data){
						if(data){
							//修改传感器信息成功后，实时刷新页面
							$("table tr:eq(" + b + ") td:eq(1) a").text(sensorType);//传感器类型
							$("table tr:eq(" + b + ") td:eq(3) span").text(sensorId);//传感器编号
							$("table tr:eq(" + b + ") td:eq(4) a").text(sensorDepth);//传感器深度
							$("table tr:eq(" + b + ") td:eq(5) a").text(sensorModel);//传感器模型
							$("table tr:eq(" + b + ") td:eq(6)").text(sensorInfoId);//传感器ID
							$("table tr:eq(" + b + ") td:eq(7)").text(detectionPointId);//测点ID
							$('#offUpdetaSensorInfo').trigger("click"); 
							alert("修改传感器信息成功！");
								}else 
								{
								alert("数据异常");
								}
						},
						error: function(){
						    alert("抱歉！您为非管理员用户，修改传感器请联系对应管理员！");
					      }
				   }); 
	});
	
	//点击删除，删除该传感器
	function deleteSensorInfo(sensorInfoId){
		layer.msg('玩命提示中');
		layer.confirm('确定要删除该传感器么？', {
			btn : [ '取消删除', '确定删除' ] //按钮
		}, function() {
			layer.msg('已取消', {icon : 1});
		}, function() {
			$.ajax({
				type : 'post',
				url : 'rest/sensorInfo/deleteSensorInfo',
				data : {sensorInfoId:sensorInfoId},
				success : function(data) {
					if(data=="1"){
						//删除成功后动态清除页面对应的记录
						$("#"+sensorInfoId).remove();
						layer.msg('删除成功（该提示3s后自动关闭）', {
							time : 3000, //3s后自动关闭
							btn : [ '知道了' ]
						});
					}else{
						alert("抱歉！您为非管理员用户，删除传感器请联系对应管理员！");
					}
				}
			});
		});
	}
	
	//点击搜索响应事件，模糊查询测点下所有**并展示在页面
	$('#searchSensoInfo').click(function(){
		alert("传感器搜索响应事件");
	});
	
		$(document).ready(function() {
			//测点ID
			var detectionPointId = '${detectionPointId}';
			//打开测点页面加载所属测点下的所有传感器
			  $.ajax({
		    		  type:'post',
		    	  	  url: 'rest/sensorInfo/showDetectionPointSensorInfo',
		    	  	  data: {detectionPointId:detectionPointId},
		    	  	  contextType:"application/json",
		    	  	  success: function(data){
		    	  		  //循环加载返回的测点集合
		    	  		  if(data){
		    	  			var string = "";
		    	  			$.each(data,function(idx,item){
		    	  			 string +=  '<tr id='+item.sensorInfoId+'>'+
										'<td class="project-title" style="width:60px">'+
										'</td>'+
				    	  		    	'<td class="project-status" style="width:120px">'+
										'<a href="project_detail.html">'+item.sensorType+'</a><br />'+
									    '</td>'+
									    '<td class="project-title" style="width:50px">'+
										'</td>'+
										'<td class="project-status" style="width:200px">'+
											'<span class="label label-primary">'+item.sensorId+'</span>'+
										'</td>'+
										'<td class="project-title" style="width:260px">'+
											'<a href="project_detail.html">'+item.sensorDepth+'</a><br />'+
											'<small></small>'+
										'</td>'+
										'<td class="project-title" style="width:260px">'+
											'<a href="project_detail.html">'+item.sensorModel+'</a><br />'+
											'<small></small>'+
										'</td>'+
										//传感器ID（隐藏6）
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + item.sensorInfoId+ '</span>'+
										'</td>'+
										//测点ID（隐藏7）
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + item.detectionPointId+ '</span>'+
										'</td>'+
										'<td class="project-title" style="width:340px">'+
										'</td>'+
										'<td class="project-status style="width:120px">'+
										    '<a href="javascript:;" class="J_menuItem" onclick="updetaSensorInfo(this)" data-toggle="modal" data-target="#myModal_updetaSensorInfo">'+
												'<i class="fa fa-pencil"></i>修改&nbsp&nbsp&nbsp&nbsp'+
											'</a>'+
											'<a href="javascript:;" class="J_menuItem" onclick="deleteSensorInfo('+item.sensorInfoId+')">'+
												'<i class="fa fa-times-circle"></i>删除'+
										    '</a>'+
									   '</td>'+
									   '<td class="project-actions">'+
									   '</td>'+
									   '</tr>';
				    	  		       });
		    	  			$('#sensorInfo_tbody').append(string); 		
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