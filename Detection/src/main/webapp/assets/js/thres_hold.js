 
var projectId=document.getElementById("thres_hold_projectId").value;
var projectTypeId=document.getElementById("thres_hold_projectTypeId").value;
	//点击提交添加阀值到数据库
	$('.sureAddThresHold_addThresHold').click(function(){
		if(!$('#form_addThresHold').valid()){
			return false;
		}
		var detectionTypeId = $('#selectDetectionType_addThresHold option:selected').val();//测点类型ID
		var thresholdTypeId = $('#selectThresHoldType_addThresHold option:selected').val();//阀值类型ID
		var maxThresholdValue = $('#maxThresholdValue_add').val();//
		var minThresholdValue = $('#minThresholdValue_add').val();// 
		var maxDrasticThresholdValue = $('#maxDrasticThresholdValue_add').val();
		var minDrasticThresholdValue = $('#minDrasticThresholdValue_add').val();
		var jsonData = '{"projectId":"'
						+ projectId
						+ '","detectionTypeId":"'
						+ detectionTypeId
						+ '","thresholdTypeId":"'
						+ thresholdTypeId
						+ '","minDrasticThresholdValue":"'
						+ minDrasticThresholdValue
						+ '","maxDrasticThresholdValue":"'
						+ maxDrasticThresholdValue
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
							$('#maxDrasticThresholdValue_add').val("");
							$('#minDrasticThresholdValue_add').val("");
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
				    		'</td>'+
						    '<td class="project-title" style="width:160px">'+
						    		+data.minDrasticThresholdValue+
						    '</td>'+
						    '<td class="project-title" style="width:160px">'+
					    			+data.maxDrasticThresholdValue+
					    	'</td>'+
							'<td class="project-status" style="width:160px">'+
								'<a href="javascript:;" class="J_menuItem" style="color:#337ab7" onclick="updetaThresHold(this)"  data-toggle="modal" data-target="#myModal_updetaThresHold">编辑修改</a><br />'+
						    '</td>'+
						    '<td class="project-actions">'+
						    '</td>'+
							'</tr>';
							$('#thresHold_tbody').append(viewData);
							$('#offAddThresHold').trigger("click"); 
							layer.msg('添加成功（该提示1s后自动关闭）', {
								time : 1000, //1s后自动关闭
								btn : [ '知道了' ]
							});
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
		var minDrasticThresholdValue = $("table tr:eq(" + b + ") td:eq(7)").text();
		var maxDrasticThresholdValue = $("table tr:eq(" + b + ") td:eq(8)").text();
		//输入框加载 
		$('#minDrasticThresholdValue_updeta').val(minDrasticThresholdValue);
		$('#maxDrasticThresholdValue_updeta').val(maxDrasticThresholdValue);
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
		var detectionTypeId =  $('#selectDetectionType_updetaThresHold option:selected').val();//测点类型ID
		var thresholdTypeId =  $('#selectThresHoldType_updetaThresHold option:selected').val();//阀值类型ID
		var thresholdId = $('#thresHoldId_updetaThresHold').val();
		var maxThresholdValue = $('#maxThresholdValue_updeta').val();
		var minThresholdValue = $('#minThresholdValue_updeta').val();
		var minDrasticThresholdValue = $('#minDrasticThresholdValue_updeta').val();
		var maxDrasticThresholdValue = $('#maxDrasticThresholdValue_updeta').val();
		var jsonData = '{"thresholdId":"'
						+ thresholdId
						+ '","projectId":"'
						+ projectId
						+ '","detectionTypeId":"'
						+ detectionTypeId
						+ '","thresholdTypeId":"'
						+ thresholdTypeId
						+ '","minDrasticThresholdValue":"'
						+ minDrasticThresholdValue
						+ '","maxDrasticThresholdValue":"'
						+ maxDrasticThresholdValue
						+ '","maxThresholdValue":"'
						+ maxThresholdValue
						+ '","minThresholdValue":"'
						+ minThresholdValue 
						+'"}';
			$.ajax({
			type:'post',
			url: 'rest/threshold/updetaThreshold',
			contentType:"application/json",
			dataType : 'json',
			data: jsonData,
			success: function(data){
					if(data.thresholdId==0){
							alert("阀值重复，请认真核对测点类型和阀值类型后再添加!");
						}else{
						//修改成功后吧页面及时刷新
						$("table tr:eq(" + t + ") td:eq(0)").text($('#selectDetectionType_updetaThresHold option:selected').text());//测点类型名称
						$("table tr:eq(" + t + ") td:eq(1)").text($('#selectThresHoldType_updetaThresHold option:selected').text());//阀值类型名称
						$("table tr:eq(" + t + ") td:eq(2)").text(data.minThresholdValue);//最小警戒值
						$("table tr:eq(" + t + ") td:eq(3)").text(data.maxThresholdValue);//最大警戒值
						$("table tr:eq(" + t + ") td:eq(7)").text(data.minDrasticThresholdValue);//最小警戒值
						$("table tr:eq(" + t + ") td:eq(8)").text(data.maxDrasticThresholdValue);//最大警戒值
						$('#offUpdetaThresHold').trigger("click"); 
						layer.msg('修改成功（该提示1s后自动关闭）', {
							time : 1000, //1s后自动关闭
							btn : [ '知道了' ]
						});
						}
						},
						error: function(){
							  alert("抱歉！您为非管理员用户，修改阀值请联系对应管理员");
						}
			}); 	
	});
	
		$(document).ready(function() {
			//加载添加弹出层的测点类型选项
			$.ajax({
		    	type:'post',
			  	  url: 'rest/sysDictionary/queryType',
			  	  data: {typeCode:2},			 
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
			  	  url: 'rest/sysDictionary/queryType',
			  	  data: {typeCode:10},
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
									    	''+item.thresholdTypeName+''+
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
							    		'<td class="project-title" style="width:160px">'+
									    	+item.minDrasticThresholdValue+
									    '</td>'+
									    '<td class="project-title" style="width:160px">'+
								    		+item.maxDrasticThresholdValue+
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
		});	