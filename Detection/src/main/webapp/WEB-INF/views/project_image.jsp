<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<link href="assets/js/plugins/layui/css/layui.css" rel="stylesheet" media="all">
<style type="text/css">
	.project-title img,.item img{
    	width: 100%;
	    height: 100%;
	    object-fit:cover;
	}
</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInUp">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox">
					<div class="ibox-title">
						<h5>${projectName}</h5>
						<div class="ibox-tools">
							<button type="button" class="btn btn-primary btn-xs btn-lg" data-toggle="modal" data-target="#addImageModel">
						 		添加图片记录
							</button>
						</div>
					</div>
					<div class="ibox-content">
						<div class="project-list">
							<table class="table table-striped table-hover" id="image_table">
								<thead>
									<tr>
										<th class="project-title" style="width:160px">
											<a href="javascript:;">测点类型</a>
										</th>
										<th class="project-title" style="width:500px">
											<a href="javascript:;">热点图</a>
										</th>
										<shiro:hasPermission name="image:upload:*">
											<th class="project-title" style="width:110px">
												<a href="javascript:;">操作</a>
											</th>
										</shiro:hasPermission>
										<th class="project-title" style="width:500px">
											<a href="javascript:;">现场图</a>
										</th>
										<shiro:hasPermission name="image:upload:*">
											<th class="project-title" style="width:110px">
												<a href="javascript:;">操作</a>
											</th>
										</shiro:hasPermission>
									</tr>	
								</thead>
								<tbody id="image_tbody"></tbody>
							</table>
						</div>
						<!-- Modal修改热点图-->
						<div class="modal fade" id="updateHeatImageModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 160px">
						 <form id="updateHeatForm">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content" style="">
						      <div class="modal-header">
						        <button type="button" class="close imageCloseBtn">&times;</button>
						        <h4 class="modal-title" id="myModalLabel_updetaimage">修改图片</h4>
						      </div>
						      <div class="modal-body">
						        <label class="md_lable" for="detectionTypeNameHeat">检测指标:</label>
						        <input class="md_input" type="text" readonly id="detectionTypeNameHeat" name="detectionTypeNameHeat"><br><br>						        
						        <input class="md_input" type="text" style="display:none" id="imageIdHeat" name="imageIdHeat">								
								<label class="md_lable" for="">添加热点图:</label><span>(重新上传会覆盖原有已上传图片)</span>
								<div id="uploadSingleComponent">
									<div class="layui-upload">
										<div class="layui-upload-list">
											<img class="layui-upload-img" id="showHeat" src="assets/img/test2.png" style="height: 172px;width: 300px">
											<p id="showErrorHeat"></p>
								    	</div>
										<button type="button" class="layui-btn" id="uploadHeat">选择文件</button> 
									</div>
								</div>								
						      </div>
						      <div class="modal-footer">
						      	<button type="button" class="btn btn-default realImageCloseBtn" style="display:none" data-dismiss="modal"></button>
						      	<button type="button" class="btn btn-default imageCloseBtn"><i class="layui-icon">&#x1007;</i>关闭</button>
						        <button type="button" class="btn btn-primary updateImageUrl" id="heatBtn"><i class="layui-icon">&#xe67c;</i>上传</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						
						<!-- Modal修改现场图-->
						<div class="modal fade" id="updatePhysicalImageModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 60px">
						 <form id="updatePhysicalForm">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content" style="">
						      <div class="modal-header">
						        <button type="button" class="close imageCloseBtn">&times;</button>
						        <h4 class="modal-title" id="myModalLabel_updetaimage">修改图片</h4>
						      </div>
						      <div class="modal-body">
						        <label class="md_lable" for="detectionTypeNamePhysical">检测指标:</label>
						        <input class="md_input" type="text" readonly id="detectionTypeNamePhysical" name="detectionTypeNamePhysical"><br><br>						        
						        <input class="md_input" type="text" style="display:none" id="imageIdPhysical" name="imageIdPhysical">						        
							    <label class="md_lable" for="">添加现场图:</label><span>(重新上传会覆盖原有已上传图片)</span>
							    <div id="uploadMultipleComponent">
							    	<div class="layui-upload-list">
										<table class="layui-table">
								    		<thead>
								        		<tr>
								        			<th>预览图</th>
								        			<th>大小</th>
								        			<th>状态</th>
								        			<th>操作</th>
								      			</tr>
								      		</thead>
								      		<tbody id="demoList"></tbody>
								    	</table>
							    	</div>
									<button type="button" class="layui-btn" id="uploadPhysical">选择文件</button>  
						     	 </div>
						      </div>
						      <div class="modal-footer">
						      	<button type="button" class="btn btn-default realImageCloseBtn" style="display:none" data-dismiss="modal"></button>
						        <button type="button" class="btn btn-default imageCloseBtn"><i class="layui-icon">&#x1007;</i>关闭</button>
						        <button type="button" class="btn btn-primary updateImageUrl" id="physicalBtn"><i class="layui-icon">&#xe67c;</i>上传</button>
						      </div>
						    </div>
						  </div>
						 </form>
						</div>
						
						<!-- Modal添加图片-url为空-->
						<div class="modal fade" id="addImageModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="padding-top: 160px">				
						  <div class="modal-dialog" role="document">
						    <div class="modal-content" style="">
						      <div class="modal-header">
						        <button type="button" class="close closeAddImageBtn">&times;</button>
						        <h4 class="modal-title" id="myModalLabel_updetaimage">添加图片信息</h4>
						      </div>
						      <div class="modal-body">
						        <label class="md_lable" for="">检测指标:</label>
								<div id="selectDetectionTypeDiv">
									<select class="md_input" id="selectDetectionType" name="selectDetectionType"></select>
							    </div>								 
						      </div>
						      <div class="modal-footer">
						      	<button type="button" class="btn btn-default realCloseAddImageBtn" style="display:none" data-dismiss="modal">关闭</button>
						      	<button type="button" class="btn btn-default closeAddImageBtn">关闭</button>
						        <button type="button" class="btn btn-primary addImageModel">提交</button>
						      </div>
						    </div>
						  </div>
						 <!-- </form> -->
						</div>		
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/layui.all.js" charset="utf-8"></script>
	<script src="assets/js/content.js"></script>
	<script src="assets/js/plugins/validate/jquery.validate.js"></script>
	<script src="assets/js/customerValidate.js"></script>	
	<script>		
	//添加图片记录
	$(".addImageModel").click(function(){
		var detectionTypeId = $('#selectDetectionType option:selected').val();
		var isDetectionTypeExist = false;
		$('#image_tbody tr').each(function(idx,item){
			if($(this).attr('name') == detectionTypeId){
				isDetectionTypeExist = true;
				return false;
			}
		});
		if(isDetectionTypeExist){
			alert("该种检测指标的图片已存在");
			return;
		}
		
		$.ajax({
	   		  type:'post',
	   	  	  url: 'rest/image/addImage',
	   	  	  data: '{"projectId":${projectId},"userId":${userId},"projectTypeId":${projectTypeId},"detectionTypeId":'+detectionTypeId+'}',
	   	  	  contentType:'application/json',
	   	  	  success: function(data){
		   	  		if(data){
		   	  			var detectionTypeName;
		   	  			$('#selectDetectionType option').each(function(idx,item){
		   					if($(this).val() == data.detectionTypeId){
		   						detectionTypeName = $(this).text();
		   					}
		   				});
		   	  			var powerHeat="",powerPhysical="";
		   	  			//权限控制
	    	  			if($('#image_table thead tr th').length >= 5){
	    	  				powerHeat = '<td class="project-title" style="width:110px"><a href="javascript:;" class="J_menuItem" style="color:#337ab7" onclick="updateImage(this,true)"  data-toggle="modal" data-target="#updateHeatImageModel"><i class="layui-icon">&#xe681;</i>上传</a><br /></td>';
	    	  				powerPhysical = '<td class="project-status" style="width:110px"><a href="javascript:;" class="J_menuItem" style="color:#337ab7" onclick="updateImage(this,false)"  data-toggle="modal" data-target="#updatePhysicalImageModel"><i class="layui-icon">&#xe681;</i>上传</a><br /></td>';
	    	  			}
	    	  	   		string = '<tr name="'+data.detectionTypeId+'"><td class="project-title" style="width:160px" name="'+data.imageId+'">'+detectionTypeName+'</td>'+				    	  		    	
							'<td class="project-title" style="width:500px">'+
								'<img alt="未上传图片" id="h'+data.imageId+'" src="assets/img/test1.png" style="padding:0">'+
							'</td>'+ powerHeat +							
			    	  		'<td class="project-title" style="width:500px">'+
			    	  			'<img alt="未上传图片" id="p'+data.imageId+'" src="assets/img/test1.png" style="padding:0">'+
							'</td>'+ powerPhysical + '</tr>';									   
	    	  			$('#image_tbody').append(string);
	    	  			$('#realCloseAddImageBtn').trigger("click"); 
			   	 		layer.msg('添加成功（该提示1s后自动关闭）', {
							time : 1000, //1s后自动关闭
							btn : [ '知道了' ]
						});
	   	  	  		}else{
	   	  		  		alert("添加失败");
	   	  		  		$('.realCloseAddImageBtn').trigger("click"); 
			  		}
	   	  	  }
		   });		
	});
	
	//加载添加弹出层的检测指标选项(所有项目公用所有检测指标)
	$.ajax({
    	  type:'post',
	  	  url: 'rest/sysDictionary/queryType',
	  	  data: {typeCode:2},	 
	  	  success: function(data){
	  		 if(data){
	  		    var stringUpdeta = '';
	  		    var stringAdd = '';
	  		    $.each(data,function(idx,SysDictionary){
	  		    	stringAdd += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
	  		    });
	  		    $('#selectDetectionType').append(stringAdd);
	  		 }else{
	  		    alert("数据异常");
	  		 }
	  	  },
	  	  error: function(){
			alert("数据加载失败");
		  }
     });
		
	function carouselImage(item){
		var imageDivStr = '';
		if(item.physicalImageUrl){
			var indexOlStr = '<div class="carousel slide carousel-trigger" data-ride="carousel" data-interval="2000" id="carousel'+item.imageId+'"><ol class="carousel-indicators">';
			var indexDivStr = '<div class="carousel-inner">';
			var imgUrlArray = item.physicalImageUrl.split(',');
			$.each(imgUrlArray,function(index,value){
				if(index == 0){
					indexOlStr += '<li data-slide-to="0" data-target="#carousel'+item.imageId+'" class="active"></li>';
					indexDivStr += '<div class="item active">';
				}else{
					indexOlStr += '<li data-slide-to="'+index+'" data-target="#carousel'+item.imageId+'"></li>';
					indexDivStr += '<div class="item">';
				}
				indexDivStr += '<img alt="image" class="img-responsive" src="'+value+'" style="margin: 0 auto;"></div>';
			});
			indexOlStr += '</ol>';
			indexDivStr += '</div>';
			imageDivStr += indexOlStr + indexDivStr + '<a data-slide="prev" href="carousel.html#carousel'+item.imageId+'" class="left carousel-control"><span class="icon-prev"></span></a><a data-slide="next" href="carousel.html#carousel'+item.imageId+'" class="right carousel-control"><span class="icon-next"></span></a></div>';
		}else{
			imageDivStr = '<img alt="未上传图片" id="p'+item.imageId+'" src="assets/img/test1.png" style="padding:0">';
		}	
		return imageDivStr;
	}
	
	
		//点击修改图片时 ，填充一些标识性的值到对应Model中
		function updateImage(obj, isHeat){			
		 	var $trSeclected = $(obj).parent().parent();		 
		 	if(isHeat){
			 	$('#detectionTypeNameHeat').val($trSeclected.find('td:eq(0)').text());			
			 	$('#imageIdHeat').val($trSeclected.find('td:eq(0)').attr('name'));			 
			 	$('#showHeat').attr("src",$trSeclected.find('td:eq(1) img').attr('src'));
			 	//调用单图片上传方法
				uploadSingleImage('#uploadHeat','rest/image/uploadSingleImage?imageId=',$('#imageIdHeat').val(),'#showHeat','#showErrorHeat','#heatBtn');
		 	}else{
			 	$('#detectionTypeNamePhysical').val($trSeclected.find('td:eq(0)').text());			 
			 	$('#imageIdPhysical').val($trSeclected.find('td:eq(0)').attr('name'));			 	
			 	$('#demoList').html('');
			 	//调用多图片上传方法
			 	uploadMultipleImage('#uploadPhysical','rest/image/uploadMultipleImage?imageId='+$('#imageIdPhysical').val(),'#physicalBtn', function(){
			 		//更新物理图的url路径
			 		$.get("rest/image/updatePhysicalUrl", { imageId: $('#imageIdPhysical').val()}/* , function(data){
			 			if(data){
			 				$('#h'+data.imageId).parent().next().next().html(carouselImage(data));
			 				$('#h'+data.imageId).parent().next().next().next().find('a').text('重新上传');
			 			}			 			
			 		} */);					
			 	});
		 	}
		}
	
		$(document).ready(function() {
	
			//打开测点页面加载所属项目下的所有图片
			$.ajax({
		    	type:'post',
		    	url: 'rest/image/showProjectImage',
		    	data: {projectId:'${projectId}'},
		    	contextType:"application/json",
		    	success: function(data){
		    	  	//循环加载返回的监测类型集合
		    	  	if(data){
		    	  		var string = "",operationHeatStr = "重新上传",operationPhysicalStr = "重新上传",powerHeat="",powerPhysical="";
		    	  		$.each(data,function(idx,item){		      			
		    	  			if(!item.heatImageUrl){
		    	  				item.heatImageUrl = "assets/img/test1.png";
		    	  				operationHeatStr = "上传";
		    	  			}
		    	  			if(!item.physicalImageUrl){
		    	  				operationPhysicalStr = "上传";
		    	  			}
		    	  			//权限控制
		    	  			if($('#image_table thead tr th').length >= 5){
		    	  				powerHeat = '<td class="project-title" style="width:110px"><a href="javascript:;" class="J_menuItem" style="color:#337ab7" onclick="updateImage(this,true)"  data-toggle="modal" data-target="#updateHeatImageModel"><i class="layui-icon">&#xe681;</i>'+operationHeatStr+'</a><br /></td>';
		    	  				powerPhysical = '<td class="project-status" style="width:110px"><a href="javascript:;" class="J_menuItem" style="color:#337ab7" onclick="updateImage(this,false)"  data-toggle="modal" data-target="#updatePhysicalImageModel"><i class="layui-icon">&#xe681;</i>'+operationPhysicalStr+'</a><br /></td>';
		    	  			}
		    	  			string += '<tr name="'+item.detectionTypeId+'"><td class="project-title" style="width:160px" name="'+item.imageId+'">'+item.detectionTypeName+'</td>'+				    	  		    	
								'<td class="project-title" style="width:500px">'+
									'<img alt="未上传图片" id="h'+item.imageId+'" src="'+item.heatImageUrl+'" style="padding:0">'+
								'</td>'+ powerHeat +							
				    	  		'<td class="project-title" style="width:500px">'+
				    	  			carouselImage(item) +
								'</td>'+ powerPhysical + '</tr>';									   
								   									    
				    		});
		    	  		$('#image_tbody').append(string);
		    	  	}
		    	}
		    });						
			
			//关闭模态框，重新加载页面
			$('.imageCloseBtn').click(function(){				
				$('.realImageCloseBtn').trigger("click");				
				/* var uploadSingleComponent = '<div class="layui-upload"><div class="layui-upload-list">'+
											'<img class="layui-upload-img" id="showHeat" src="assets/img/test2.png" style="height:172px; width:300px">'+
											'<p id="showErrorHeat"></p></div><button type="button" class="layui-btn" id="uploadHeat">选择文件</button></div>';
				var uploadMultipleComponent = '<div class="layui-upload-list"><table class="layui-table"><thead><tr><th>预览图</th>'+
												'<th>大小</th><th>状态</th><th>操作</th></tr></thead><tbody id="demoList"></tbody></table></div>'+
												'<button type="button" class="layui-btn" id="uploadPhysical">选择文件</button></div>';							
																				
				$('#uploadSingleComponent').html(uploadSingleComponent);
				$('#uploadMultipleComponent').html(uploadMultipleComponent); */
				layer.load(2, {
					shade: [0.1,'#fff'] //0.1透明度的白色背景
			    });
				$.get('rest/project_image/${projectId}:${userId}:${projectName}:${projectTypeId}', function(data) {
	                 $('#content-main').html(data);
	            });
				layer.closeAll('loading');
			});
			
			//关闭模态框
			$('.closeAddImageBtn').click(function(){				
				$('.realCloseAddImageBtn').trigger("click");				
			});
		});			
	
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>