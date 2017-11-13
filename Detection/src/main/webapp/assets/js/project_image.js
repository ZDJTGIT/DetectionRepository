var projectId=document.getElementById("project_image_projectId").value;
	//上传图片响应事件
	 $(function(){
			var upload = layui.upload;
			
			//heatImageUr上传
			var uploadHeat = upload.render({
					elem: '#uploadHeat',
					url: 'rest/image/uploadImg',
					before: function(obj){
					//预读本地文件示例，不支持ie8
					obj.preview(function(index, file, result){
						$('#showHeat').attr('src', result); //图片链接（base64）
					});
				},
				//上传成功回调函数
				done: function(res){
					//如果上传失败
					if(res.code > 0){
						return layer.msg(res.msg);
					}else{
						$('#showHeat').attr('src', res.data);
					}
					//上传成功
				},
				//上传失败回调函数
				error: function(){
					//演示失败状态，并实现重传
					var demoText = $('#demoText1');
					demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
					demoText.find('.demo-reload').on('click', function(){
						uploadHeat.upload();
					});
				}
			});
			
			//physicalImageUrl上传
			var uploadPhysical = upload.render({
				elem: '#uploadPhysical',
				url: 'rest/image/uploadImg',
				before: function(obj){
				//预读本地文件示例，不支持ie8
				obj.preview(function(index, file, result){
					$('#showPhysical').attr('src', result); //图片链接（base64）
				});
			}
			,done: function(res){
				//如果上传失败
				if(res.code > 0){
				return layer.msg(res.msg);
				}else{
					$('#showPhysical').attr('src', res.data);
				}
				//上传成功
			}
			,error: function(){
				//演示失败状态，并实现重传
				var demoText = $('#demoText2');
				demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
				demoText.find('.demo-reload').on('click', function(){
					uploadPhysical.upload();
				});
			}
		});

	});
	
	//点击模态框关闭按钮触发事件
	$('.imageCloseBtn').click(function(){
		$('.offDeleteImage').trigger("click");
		$.ajax({
			type:'get',
			url: 'rest/image/removeImage',		
			data: {imageUrl:$(this).parent().prev().find('img').attr('src')}			
		});
	});
	
	//点击添加图片加载当前测点类型图片
	
	//确定添加图片(修改编辑)
	 $('.sureAddDetection_updetaImage').click(function(){
		 var jsonData;
		 	if($(this).attr('name') == 'heatBtn'){
		 		jsonData = '{"imageId":"'+ $('#imageId_updetaHeat').val() + '","heatImageUrl":"'+ $('#showHeat').attr('src') + '"}';
		 	}else{
		 		jsonData = '{"imageId":"'+ $('#imageId_updetaPhysical').val() + '","physicalImageUrl":"'+ $('#showPhysical').attr('src') + '"}';
		 	}
			
			$.ajax({
				type:'post',
				url: 'rest/image/updetaImage',
				contentType:"application/json",
				dataType : 'json',
				data: jsonData,
				success: function(data){
						if(data){
							//修改成功后吧页面及时刷新
							if(data.heatImageUrl){
								$('#h'+data.imageId).attr("src",data.heatImageUrl); 
							}
							if(data.physicalImageUrl){
								$('#p'+data.imageId).attr("src",data.physicalImageUrl); 
							}
							$('.offDeleteImage').trigger("click"); 
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
	
	 function  updetaThresHold(asd, isHeat){
		 var b = asd.parentNode.parentNode.rowIndex;
		 var detectionTypeId = $("table tr:eq(" + b + ") td:eq(1)").text();
		 var imageId = $("table tr:eq(" + b + ") td:eq(5)").text();
		 if(isHeat){
			 $('#detectionTypeName_updetaHeat').val(detectionTypeId);
			 $('#imageId_updetaHeat').val(imageId);
			 $('#showHeat').attr("src",$("table tr:eq(" + b + ") td:eq(2)").find('img').attr('src')); 
		 }else{
			 $('#detectionTypeName_updetaPhysical').val(detectionTypeId);
			 $('#imageId_updetaPhysical').val(imageId);
			 $('#showPhysical').attr("src",$("table tr:eq(" + b + ") td:eq(4)").find('img').attr('src'));
		 }
		 //打开页面获取当前页面图片
	    $.ajax({
    		  type:'post',
    	  	  url: 'rest/image/showThisProjectImaged',
    	  	  data: {imageId:imageId},
    	  	  contextType:"application/json",
    	  	  success: function(data){
    	  		  //循环加载返回的测点集合
    	  		  if(data){
    	  			
    	  		  }
    	  		  },
    	  	  });
	 }
	
		$(document).ready(function() {
			
			//打开测点页面加载所属项目下的所有图片
			$.ajax({
		    	type:'post',
		    	url: 'rest/image/showProjectImage',
		    	data: {projectId:projectId},
		    	contextType:"application/json",
		    	success: function(data){
		    	  	//循环加载返回的监测类型集合
		    	  	if(data){
		    	  		var string = "";
		    	  		$.each(data,function(idx,item){
		    	  				
		    	  			 string += '<tr><td class="project-title" style="width:160px" id="'+item.imageId+'">'+item.detectionTypeName+'</td>'+				    	  		    	
									'<td class="project-title" style="width:500px">'+
									    '<img alt="未上传图片" id="h'+item.imageId+'" src="'+item.heatImageUrl+'" style="height:110px; width:300px">'+
									'</td>'+
									'<td class="project-title" style="width:110px">'+
										'<a href="javascript:;" class="J_menuItem" style="color:#337ab7" onclick="updateImage(this, true)"  data-toggle="modal" data-target="#myModal_updetaHeatImage">修改</a><br />'+
									'</td>'+
				    	  		    '<td class="project-title" style="width:500px">'+
				    	  		    	'<img alt="未上传图片" id="p'+item.imageId+'" src="'+item.physicalImageUrl+'" style="height:110px; width:300px">'+
									'</td>'+									   
									'<td class="project-status" style="width:110px">'+
										'<a href="javascript:;" class="J_menuItem" style="color:#337ab7" onclick="updateImage(this, false)"  data-toggle="modal" data-target="#myModal_updetaPhysicalImage">修改</a><br />'+
									'</td></tr>';
									   									    
				    	  	});
		    	  			$('#image_tbody').append(string); 		
		    	  	}
		    	}
		    });
			
		});			