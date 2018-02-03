
var detectionPointId=document.getElementById("project_sensor_info_projectId").value;
//把当前项目ID放置到添加和修改采集器的地方projectId_addSensorInfo
var projectId=document.getElementById("sensorinfo_projectId").value;
$('#projectId_addSensorInfo').val(projectId);
$('#projectId_updetaSensorInfo').val(projectId);
	//确定添加传感器，将新添加传感器数据存入数据库
	$('.sureAddSensorInfo_addSensorInfo').click(function(){
		if(!$('#form_addSensorInfo').valid()){
			return false;
		}
		var sensorId = $('#sensorId_addSensorInfo').val();
		var sensorType = $('#sensorType_addSensorInfo').val();
		var sensorModel = $('#sensorModel_addSensorInfo').val();
		var sensorDepth = $('#sensorDepth_addSensorInfo').val();
		var smuId = $('#terminalsInfoNum_addSensorInfo').val();
		var smuCmsChannel = $('#terminalsInfoAisle_addSensorInfo').val();
		var jsonData = '{"detectionPointId":"'
						+ detectionPointId
						+ '","sensorId":"'
						+ sensorId
						+ '","sensorType":"'
						+ sensorType
						+ '","sensorModel":"'
						+ sensorModel 
						+ '","smuId":"'
						+ smuId 
						+ '","smuCmsChannel":"'
						+ smuCmsChannel 
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
				   			if(data.errorMessage){
				   				layer.msg('添加失败,测点数据已经存在['+data.errorMessage+']（该提示10s后自动关闭）', {
									time : 10000, //1s后自动关闭
									btn : [ '知道了' ]
								});
				   			}else{
				   			//添加成功后清空输入层以便重复使用
					   			//添加成功之后刷新页面
								$('#sensorId_addSensorInfo').val("");
								$('#sensorType_addSensorInfo').val("");
								$('#sensorModel_addSensorInfo').val("");
								$('#sensorDepth_addSensorInfo').val("");
								$('#terminalsInfoNum_addSensorInfo').val("");
								$('#terminalsInfoAisle_addSensorInfo').val("");
								
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
								'<td class="project-title" style="width:260px">'+
									'<span class="label label-primary">'+data.smuId+'</span>'+
								'</td>'+
								//传感器ID（隐藏9）
								'<td class="project-status" style="display:none">'+
									'<span class="label label-primary">' + data.smuCmsChannel+ '</span>'+
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
								layer.msg('添加成功（该提示1s后自动关闭）', {
									time : 1000, //1s后自动关闭
									btn : [ '知道了' ]
								});
					   		   	   
				   			};
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
		var smuId = $("table tr:eq(" + b + ") td:eq(8)").text();//采集器ID
		var smuCmsChannel = $("table tr:eq(" + b + ") td:eq(9)").text();//采集器通道
		
		$('#sensorId_updetaSensorInfo').val(sensorId);
		$('#sensorType_updetaSensorInfo').val(sensorType);
		$('#sensorModel_updetaSensorInfo').val(sensorModel);
		$('#sensorDepth_updetaSensorInfo').val(sensorDepth); 
		$('#sensorInfoId_updetaSensorInfo').val(sensorInfoId);
		$('#detectionPointId_updetaSensorInfo').val(detectionPointId); 
		$('#projectId_updetaSensorInfo').val(projectId);
		$('#terminalsInfoNum_updetaSensorInfo').val(smuId);
		$('#terminalsInfoAisle_updetaSensorInfo').val(smuCmsChannel);
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
		var smuId = $('#terminalsInfoNum_updetaSensorInfo').val();
		var smuCmsChannel = $('#terminalsInfoAisle_updetaSensorInfo').val();
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
						+ '","smuId":"'
						+ smuId 
						+ '","smuCmsChannel":"'
						+ smuCmsChannel 
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
								if(data.errorMessage){
										layer.msg('添加失败,测点数据已经存在['+data.errorMessage+']（该提示10s后自动关闭）', {
											time : 10000, //1s后自动关闭
											btn : [ '知道了' ]
										});
								}else{
									//修改传感器信息成功后，实时刷新页面
									$("table tr:eq(" + b + ") td:eq(1) a").text(sensorType);//传感器类型
									$("table tr:eq(" + b + ") td:eq(3) span").text(sensorId);//传感器编号
									$("table tr:eq(" + b + ") td:eq(4) a").text(sensorDepth);//传感器深度
									$("table tr:eq(" + b + ") td:eq(5) a").text(sensorModel);//传感器模型
									$("table tr:eq(" + b + ") td:eq(6)").text(sensorInfoId);//传感器ID
									$("table tr:eq(" + b + ") td:eq(7)").text(detectionPointId);//测点ID
									$("table tr:eq(" + b + ") td:eq(8) span").text(smuId);//采集器ID
									$("table tr:eq(" + b + ") td:eq(9)").text(smuCmsChannel);//采集器通道
									$('#offUpdetaSensorInfo').trigger("click"); 
									layer.msg('修改成功（该提示1s后自动关闭）', {
										time : 1000, //1s后自动关闭
										btn : [ '知道了' ]
									});
								}
							
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
	
		$(document).ready(function() {
			//打开测点页面加载所属测点下的所有传感器
			  $.ajax({
		    		  type:'post',
		    	  	  url: 'rest/sensorInfo/showDetectionPointSensorInfo',
		    	  	  data: {detectionPointId:detectionPointId},
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
										'<td class="project-title" style="width:260px">'+
											'<span class="label label-primary">'+item.smuId+'</span>'+
										'</td>'+
										//传感器ID（隐藏9）
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + item.smuCmsChannel+ '</span>'+
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