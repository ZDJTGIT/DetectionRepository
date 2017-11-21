
var projectTypeId=document.getElementById("detectionPoint_projectTypeId").value;
var projectName=document.getElementById("detectionPoint_projectName").value;

//确定添加响应事件-将测点信息存入数据库
	$(".sureAddDetection_addDetection").click(function(){
		if(!$('#form_addDetection').valid()){
			return false;
		}
		var detectionTypeId = $('#selectDetectionStatusAdd option:selected').val();//测点类型ID-
		var detectionLongitude = $('#DetectionLongitude_addDetection').val();//测点经度.
		var detectionLatitude = $('#DetectionLatitude_addDetection').val();//测点纬度.
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
		   url: 'rest/detectionPoint/addDescription',
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
				    alert("抱歉！您为非管理员用户，添加测点请联系对应管理员！");
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
		$('#ProjectName_updetaDetection').val(projectName);
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
							    alert("抱歉！您为非管理员用户，修改测点请联系对应管理员！");
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
			
			$('#ProjectName_addDetection').val(projectName);
			
			//加载添加弹出层的测点类型选项(公用新建当前项目下所有类型测点)
			$.ajax({
		    	type:'post',
			  	  url: 'rest/detectionPoint/showDetectionStatus',
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
			  /*//打开测点页面加载所属项目下的所有测点
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
		    	  	  });*/
			  
			//分页获取项目下所有测点
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
								type : 'post',
								url : 'rest/detectionPoint/showNormalProjectDetectionPoint',
								dataType : 'json',
								contentType : 'application/json',
								data : JSON.stringify(jsonData),
								success : function(data) {
									 if(data){
						  	  		    var asthtml = '';
						  	  		   	$.each(data.detectionPointList,function(idx,item){
							  	  		     asthtml += '<tr id='+item.detectionPointId+'>'+
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
						  	  		    $('#detection_tbody').html(asthtml);
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
				
			});	