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
						<!--div class="ibox-tools">
							<button type="button" class="btn btn-primary btn-xs btn-lg" data-toggle="modal" data-target="#myModal_addDetection">
						 		添加测点
							</button>
						</div-->
					</div>
					<div class="ibox-content">
						<div class="row m-b-sm m-t-sm">
							<div class="col-md-1">
								<button type="button" id="loading-example-btn" class="btn btn-white btn-sm">
									<i class="fa fa-refresh"></i> 刷新
								</button>
							</div>
							<!--div class="col-md-11">
								<div class="input-group">
									<input type="text" id="searchProject" name="searchProject" placeholder="请输入测点名称" class="input-sm form-control"> 
									<span class="input-group-btn">
										<button type="button" id="searchButton" name="searchButton" class="btn btn-sm btn-primary">
											搜索
										</button>
									</span>
								</div>
							</div-->
						</div>
						<div class="project-list">
							<table class="table table-hover" id="detection_table">
								<tbody id="detection_tbody">
								<!-- 表头 -->
									<tr>
										<td class="project-title" style="width:160px">
											测点类型
										</td>
										<td class="project-title" style="width:160px">
											最小警戒值
										</td>
										<td class="project-title" style="width:160px">
											最大警戒值
										</td>
										<td class="project-title" style="width:500px">
											热点图
										</td>
										<td class="project-title" style="width:500px">
											物理图
										</td>
										<td class="project-title" style="width:160px">
											操作栏
										</td>
										<td class="project-actions">
									    </td>
									</tr>					
								</tbody>
							</table>
						</div>
						
						<!-- Modal修改预值和图片 -->
						<div class="modal fade" id="myModal_updetaThresHold" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						 <form id="form_updetaThresHold">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_updetaDetection">修改阀值和图片</h4>
						      </div>
						      <div class="modal-body">
						        <label class="md_lable" for="detectionTypeName">测点类型:</label>
						        <input class="md_input" type="text" readonly id="detectionTypeName" name="detectionTypeName"><br><br>
						        <label class="md_lable" for="maxThresholdValue">最大警戒值:</label>
								<input class="md_input" type="text" id="maxThresholdValue" name="maxThresholdValue"><br><br>
								<label class="md_lable" for="minThresholdValue">最小警戒值:</label>
								<input class="md_input" type="text" id="minThresholdValue" name="minThresholdValue"><br><br>
								
								<label class="md_lable" for="">添加热点图:</label>
							    <div class="layui-upload-list">
									<img class="layui-upload-img" id="demo1" src="assets/img/test2.png">
									<p id="demoText1"></p>
							    </div>
								<button type="button" class="layui-btn" id="test1">上传</button><br><br>  
								
							    <label class="md_lable" for="">添加物理图:</label>
							    <div class="layui-upload-list">
									<img class="layui-upload-img" id="demo2" src="assets/img/test2.png">
									<p id="demoText2"></p>
							    </div>
								<button type="button" class="layui-btn" id="test2">上传</button>  
								<input class="md_input" style="display:none" type="text" id="detectionTypeId" name="detectionTypeId"><br><br>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						        <button type="button" class="btn btn-primary sureAddDetection_updetaThresHold">提交</button>
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
	// ---五个，一个cssBUG，一个页面刷新，三个是图片问题
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
	
	//点击修改图片和预值，加载数据到弹出层----图片打开即显示
	function updetaThresHold(asd){
		var b = asd.parentNode.parentNode.rowIndex;
		var detectionPointType = $("table tr:eq(" + b + ") td:eq(0)").text();
		var maxThresholdValue = $("table tr:eq(" + b + ") td:eq(1)").text();
		var minThresholdValue = $("table tr:eq(" + b + ") td:eq(2)").text();
		var detectionTypeId = $("table tr:eq(" + b + ") td:eq(5)").text();
		//---取出数据库的路径地址
		var heatImageUrl  ;
		var physicalImageUrl ;
		$('#detectionTypeName').val(detectionPointType);
		$('#maxThresholdValue').val(maxThresholdValue);
		$('#minThresholdValue').val(minThresholdValue);
		$('#detectionTypeId').val(detectionTypeId);
		//---展示到弹出层
	}
	
	//点击提交修改图片和预值到数据库
	$('.sureAddDetection_updetaThresHold').click(function(){
		var projectName = '${projectName}';
		var detectionTypeId = $('#detectionTypeId').val();
		var maxThresholdValue = $('#maxThresholdValue').val();
		var minThresholdValue = $('#minThresholdValue').val();
		var heatImageUrl = $('#demo1').attr('src');//热点图
		var physicalImageUrl = $('#demo2').attr('src');//物理图
		var jsonData = '{"detectionTypeId":"'
						+ detectionTypeId
						+ '","projectName":"'
						+ projectName
						+ '","maxThresholdValue":"'
						+ maxThresholdValue
						+ '","minThresholdValue":"'
						+ minThresholdValue 
						+ '","heatImageUrl":"'
						+ heatImageUrl
						+ '","physicalImageUrl":"'
						+ physicalImageUrl + '"}';
			$.ajax({
			type:'post',
			url: 'rest/project/updetaThreshold',
			contentType:"application/json",
			dataType : 'json',
			data: jsonData,
			success: function(data){
					if(data){
						//为了可以重复修改，所有修改成功之后把缓存的ID清除
						//---修改成功后吧页面及时刷新，展示的图片刷新
						$('#detectionTypeId').val("");
						alert("警戒值和项目图片设置成功！");
							}else {
								  alert("数据异常");
							      }
							}
			}); 	
	});
	
		$(document).ready(function() {
			//项目ID
			var projectId = '${projectId}';
			//打开测点页面加载所属项目下的所有测点
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
									    	+item.minThresholdValue+
										'</td>'+
				    	  		    	'<td class="project-title" style="width:160px">'+
				    	  		    		+item.maxThresholdValue+
									    '</td>'+
									    '<td class="project-title" style="width:500px">'+
									    	'<img alt="未上传图片" src="'+item.heatImageUrl+'" style="height:110px; width:300px">'+
										'</td>'+
				    	  		    	'<td class="project-title" style="width:500px">'+
				    	  		    		'<img alt="未上传图片" src="'+item.physicalImageUrl+'" style="height:110px; width:300px">'+
									    '</td>'+
									    '<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + item.detectionTypeId + '</span>'+
										'</td>'+
										'<td class="project-status" style="width:160px">'+
											'<a href="javascript:;" class="J_menuItem" onclick="updetaThresHold(this)"  data-toggle="modal" data-target="#myModal_updetaThresHold">编辑修改</a><br />'+
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