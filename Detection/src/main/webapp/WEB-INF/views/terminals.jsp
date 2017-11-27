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
<title>采集器信息</title>
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
						<h5>${projectName}</h5>
						<div class="ibox-tools">
							<button type="button" class="btn btn-primary btn-xs btn-lg" data-toggle="modal" data-target="#myModal_addSensorInfo">
						 		添加采集器
							</button>
						</div>
					</div>
					<div class="ibox-content">
						<div class="project-list">
							<table class="table table-hover" id="terminals_table">
								 <tr>
										<td class="project-title" style="width:30px">
										</td>
				    	  		    	<td class="project-title" style="width:120px">
											创建时间
									    </td>
									    <td class="project-title" style="width:50px">
										</td>
										<td class="project-title" style="width:200px">
											更新时间
										</td>
										<td class="project-title" style="width:260px">
											采集器编号
										</td>
										<td class="project-title" style="width:260px">
											信号强度
										</td>
										<td class="project-title" style="width:260px">
											采集器状态
										</td>
										<td class="project-title" style="width:260px">
											电压
										</td>
										<td class="project-title" style="width:260px">
											采集时间间隔
										</td>
										<td class="project-title" style="width:140px">
										</td>
										<td class="project-title" style="width:120px">
											<a href="javascript:;">&nbsp;&nbsp;&nbsp;&nbsp;操作栏</a>
										</td>
										<td class="project-actions">
									    </td>
									</tr>
								<tbody id="terminals_tbody">
								</tbody>
							</table>
						</div>
						
						<!-- Modal添加采集器 -->
						<div class="modal fade" id="myModal_addSensorInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 160px">
						 <form id="form_addSensorInfo">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_addSensorInfo">添加采集器</h4>
						      </div>
						      <div class="modal-body">
							    <label class="md_lable" for="sensorType_addSensorInfo">采集器编号:&nbsp;&nbsp;</label>
								<input class="md_input" type="text" id="sensorType_addSensorInfo" name="sensorType_addSensorInfo">
						      </div>
						      <div class="modal-footer">
						        <button type="button" id="offAddSensorInfo" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-primary sureAddSensorInfo_addSensorInfo">提交</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						
						<!-- Modal编辑采集器信息 -->
						<div class="modal fade" id="myModal_updetaSensorInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 160px">
						 <form id="form_updetaSensorInfo">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_updetaSensorInfo">修改采集器</h4>
						      </div>
						      <div class="modal-body">
						        <input class="md_input" type="text" style="display:none" id="sensorInfoId_updetaSensorInfo" name="sensorInfoId_updetaSensorInfo">
							    <label class="md_lable" for="sensorType_updetaSensorInfo">采集器编号:&nbsp;&nbsp;</label>
								<input class="md_input" type="text" id="sensorType_updetaSensorInfo" name="sensorType_updetaSensorInfo">
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
	<script src="assets/js/terminals.js"></script>
	
	<script>
		//alert("未添加采集器表，此页面暂时不做");
		var projectId = ${projectId};
		var projectName = ${projectName};
		//分页获取项目下所有采集器
		$(function(){(function(){
			
			var jsonData = {};
			jsonData.projectName = projectName;
			jsonData.pageNum = 1;
			jsonData.pageSize = 6;
			
			//初始化分页组件函数
			 function loadLaypage(dataTotal, jsonData){
				 var laypage = layui.laypage;
				 laypage.render({
					 elem: 'pageComponent_n', //分页组件div的id
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
			
			//分页请求后台获取数据函数 , 参数jsonData为查询条件集合json数据 , loadLaypage是分页组件函数
			function projectPageAjax(jsonData,loadLaypage){
				 //显示loading提示
                 var loading = layer.load(2, {
                	  shade: [0.1,'#fff'] //0.1透明度的白色背景
                 });
				 $.ajax({
					 type:'post',
						url: 'rest/terminals/showProjectTerminals',
						contentType:"application/json",
						dataType : 'json',
						data: {projectId:projectId},
						success : function(data) {
							 if(data){
				  	  		    var asthtml = '';
				  	  		   	$.each(data.terminalsInfoList,function(idx,item){
				  	  		   	asthtml +=  '<tr>'+
											'<td class="project-title" style="width:30px">'+
											'</td>'+
					    	  		    	'<td class="project-title" style="width:120px">'+
												+创建时间+
										    '</td>'+
										    '<td class="project-title" style="width:50px">'+
											'</td>'+
											'<td class="project-title" style="width:200px">'+
												+更新时间+
											'</td>'+
											'<td class="project-title" style="width:260px">'+
												+采集器编号+
											'</td>'+
											'<td class="project-title" style="width:260px">'+
												+信号强度+
											'</td>'+
											'<td class="project-title" style="width:260px">'+
												+采集器状态+
											'</td>'+
											'<td class="project-title" style="width:260px">'+
												+电压+
											'</td>'+
											'<td class="project-title" style="width:260px">'+
												+采集时间间隔+
											'</td>'+
											'<td class="project-title" style="width:140px">'+
											'</td>'+
											'<td class="project-title" style="width:120px">'+
												'<a href="javascript:;">&nbsp;&nbsp;&nbsp;&nbsp;操作栏</a>'+
											'</td>'+
											'<td class="project-actions">'+
										    '</td>'+
										'</tr>';
				  	  		   	});
				  	  		    $('#terminals_tbody').html(asthtml);
								//加载完成后隐藏loading提示
			                   	layer.close(loading);
			                   	if(loadLaypage){
			                   		loadLaypage(data.total,jsonData);
			                   	}
				  	  		}else{
				  	  		    alert("数据异常");
				  	  		}
						},
						error : function() {
							alert("数据加载失败");
						}
					});
			 }
			projectPageAjax(jsonData,loadLaypage);
		})();
		});
		
	</script>
	
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>