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
							<table class="table table-hover" id="image_table">
								<tbody id="image_tbody">
								 <!-- 表头 -->
									<tr>
									    <td class="project-title" style="width:60px">
										</td>
										<td class="project-title" style="width:160px">
											<a href="javascript:;">测点类型</a>
										</td>
										<td class="project-title" style="width:500px">
											<a href="javascript:;">热点图</a>
										</td>
										<td class="project-title" style="width:500px">
											<a href="javascript:;">现场图</a>
										</td>
										<td class="project-title" style="width:60px">
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
						<!-- Modal修改图片-->
						<div class="modal fade" id="myModal_updetaimage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 160px">
						 <form id="form_updetaThresHold">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content" style="">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel_updetaimage">修改阀值</h4>
						      </div>
						      <div class="modal-body">
						        <label class="md_lable" for="detectionTypeName_updetaimage">测点类型:</label>
						        <input class="md_input" type="text" readonly id="detectionTypeName_updetaimage" name="detectionTypeName_updetaimage"><br><br>
						        
						        <input class="md_input" type="text" style="display:none" id="imageId_updetaimage" name="imageId_updetaimage">
								
								<label class="md_lable" for="">添加热点图:</label>
							    <div class="layui-upload-list">
									<img class="layui-upload-img" id="demo1" src="assets/img/test2.png">
									<p id="demoText1"></p>
							    </div>
								<button type="button" class="layui-btn" id="test1">上传</button><br><br>  
								
							    <label class="md_lable" for="">添加现场图:</label>
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
	
	//上传图片响应事件
	 $(function(){
			var upload = layui.upload;
			
			//heatImageUr上传
			var uploadInst1 = upload.render({
					elem: '#test1',
					url: 'rest/image/uploadImg',
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
				url: 'rest/image/uploadImg',
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
	
	//点击添加图片加载当前测点类型图片
	
	//确定添加图片(修改编辑)
	 $('.sureAddDetection_updetaThresHold').click(function(){
		    
		 	var heatImageUrl = $('#demo1').attr('src');//热点图
			var physicalImageUrl = $('#demo2').attr('src');//现场图
			var imageId = $('#imageId_updetaimage').val();//ID
			var jsonData = '{"imageId":"'
							+ imageId
							+ '","heatImageUrl":"'
							+ heatImageUrl 
							+ '","physicalImageUrl":"'
							+ physicalImageUrl 
							+ '"}';
			$.ajax({
				type:'post',
				url: 'rest/image/updetaImage',
				contentType:"application/json",
				dataType : 'json',
				data: jsonData,
				success: function(data){
						if(data){
							//修改成功后吧页面及时刷新
							$('#h'+data.imageId).attr("src",data.heatImageUrl); 
							$('#p'+data.imageId).attr("src",data.physicalImageUrl); 
							alert("项目图片设置成功！");
								}else {
									  alert("数据异常");
								      }
								},
								error: function(){
									  alert("抱歉！您为非管理员用户，上传项目图片请联系对应管理员");
								}
				}); 	
			
	 });
	
	 function  updetaThresHold(asd){
		 var b = asd.parentNode.parentNode.rowIndex;
		 var detectionTypeId = $("table tr:eq(" + b + ") td:eq(1)").text();
		 var imageId = $("table tr:eq(" + b + ") td:eq(4)").text();
		 $('#detectionTypeName_updetaimage').val(detectionTypeId);
		 $('#imageId_updetaimage').val(imageId);
	 }
	
		$(document).ready(function() {
			var projectId = '${projectId}';
			//打开测点页面加载所属项目下的所有图片
			  $.ajax({
		    		  type:'post',
		    	  	  url: 'rest/image/showProjectImaged',
		    	  	  data: {projectId:projectId},
		    	  	  contextType:"application/json",
		    	  	  success: function(data){
		    	  		  //循环加载返回的测点集合
		    	  		  if(data){
		    	  			var string = "";
		    	  			$.each(data,function(idx,item){
		    	  			  string += '<tr>'+
				    	  			 	'<td class="project-title" style="width:60px">'+
										'</td>'+
				    	  		    	'<td class="project-title" style="width:160px">'+
				    	  		    		''+item.detectionTypeName+''+
									    '</td>'+
									    '<td class="project-title" style="width:500px">'+
									    	'<img alt="未上传图片" id="h'+item.imageId+'" src="'+item.heatImageUrl+'" style="height:110px; width:300px">'+
										'</td>'+
				    	  		    	'<td class="project-title" style="width:500px">'+
				    	  		    		'<img alt="未上传图片" id="p'+item.imageId+'" src="'+item.physicalImageUrl+'" style="height:110px; width:300px">'+
									    '</td>'+
									    '<td class="project-title" style="display:none">'+
    	  		    						+item.imageId+
					    				'</td>'+
									    '<td class="project-title" style="width:60px">'+
										'</td>'+
										'<td class="project-status" style="width:160px">'+
											'<a href="javascript:;" class="J_menuItem" style="color:#337ab7" onclick="updetaThresHold(this)"  data-toggle="modal" data-target="#myModal_updetaimage">修改</a><br />'+
									    '</td>'+
									    '<td class="project-actions">'+
									    '</td>'+
										'</tr>';
				    	  		  });
		    	  			$('#image_tbody').append(string); 		
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