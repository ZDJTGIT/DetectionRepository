 
var projectId=document.getElementById("project_detail_projectId").value;
var projectName=document.getElementById("project_detail_projectName").value;

//指定图标的配置和数据
        var placeHoledStyle = {
		    normal:{
		        barBorderColor:'rgba(0,0,0,0)',
		        color:'rgba(26,179,148,1)',
		        label : {
		            show: true,
		            position: 'insideLeft',
		        }
		    },
		    emphasis:{
		        barBorderColor:'rgba(0,0,0,0)',
		        color:'rgba(0,0,0,0)'
		    }
		}; 
		var dataStyle = { 
		    normal: {
		        label : {
		            show: true,
		            position: 'insideLeft',
		        }
		    }
		};
		var option = {
            title:{
                text: '结构物报表统计分析',
                sublink: 'http://e.weibo.com/1341556070/AiEscco0H'
            },
            tooltip:{
            	 trigger: 'axis',
                 axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                     type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                 },
            },
            //选项（正常值和异常值）
            legend:{
                data:['正常','非正常']
            },
            
            xAxis : [
                     {
                         type : 'value',
                     }
            ],
            //纵坐标
            yAxis:{
                type : 'category',
                splitLine: {show: false},
                data : ['结构健康', '采集器', '传感器', '测点数量']
            },
            
            series : [
                        {
                          name:'正常',
                          type:'bar',
                          stack: '总量',
                          itemStyle: placeHoledStyle,
                          data:[0, 0, 0, 0]
                      } ,  
                      {
                          name:'非正常',
                          type:'bar',
                          stack: '总量',
                          itemStyle : dataStyle,
                          data:[0,0,0,0]
                      }  
                  ]
        };
		//初始化echarts实例
        var myChart = echarts.init(document.getElementById('project_column_div'));
		myChart.setOption(option);
		myChart.showLoading();
        
        var content=[];     //项目下正常内容数量数组（实际用来盛放X轴坐标值）
        var contenterror=[];//项目下异常内容数量数组（实际用来盛放X轴坐标值）
        
        //获取测点数量，传感器数量，阀值数量，图片数量。
	    $.ajax({
		        type:'post',
			    url: 'rest/project/obtainCount',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	 //非正常测点（出线告警信息的测点）
			    	 var normalDetectionPointCount = data.detectionPointCount-data.alarmDetectionCount;
			    	 //非正常传感器（传回设备类告警的传感器）
			    	 var normalSensorInfoCount = data.sensorInfoCount-data.alarmSensorInfoCount;
			    	 //未处理告警信息（告警信息状态为未读）
			    	 var normalAlarmCount = data.alarmCount-data.alarmAlarmCount;
			    	 if(data){   
				    		 content.push(normalAlarmCount);//告警信息条数（alarm表）
				    		 content.push(2);//改成采集器数量---
				    		 content.push(normalSensorInfoCount);
				    		 content.push(normalDetectionPointCount);
				    		 contenterror.push(data.alarmAlarmCount);
				    		 contenterror.push(0);
				    		 contenterror.push(data.alarmSensorInfoCount);
				    		 contenterror.push(data.alarmDetectionCount);
				    		 myChart.hideLoading();
				    		 myChart.setOption({        //加载数据图表
			                        series: [{
			                            // 根据名字对应到相应的系列
			                            data: content
			                        },{
			                        	data: contenterror
			                        }]
			                 });
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    error: function(){
			  			   	  alert("数据加载失败");
			  		         }
		    	});
	     
		//传字符串型时间转化为时间
	function stringToData(strin){
		var beginArray = strin.split(" ");
	   	var dateArray = beginArray[0].split("-");
	   	var timeArray = beginArray[1].split(":");
	   	var date = new Date(dateArray[0], dateArray[1]-1, dateArray[2], timeArray[0], timeArray[1], timeArray[2]);
	   	return date.getTime();
		}
	     $.ajax({
		        type:'post',
			    url: 'rest/project/obtainProject',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	if(data){
				    		var nowDate = new Date().getTime();
					    	var beginDate = stringToData(data.projectBeginTime);
					    	var endDate = stringToData(data.projectEndTime);
					    	var percentage=0;
					    	if(nowDate > endDate){
					    	 	percentage=100;
					    	}else if(nowDate < beginDate){
					    	 	percentage=0;
					    	}else{
					    	 	percentage = ((nowDate-beginDate)/(endDate-beginDate)*100).toFixed(2);
					    	} 
				    	  	$("#dd_projectStatus").append('<span class="label label-primary statusColor'+data.projectStatus+'">'+data.projectStatusString+'</span>');
				    	  	$("#dd_beginTime").text(data.projectBeginTime);
				    	  	$("#dd_endTime").text(data.projectEndTime);
				    	  	$("#dd_address").text(data.projectAddress);
				    	  	$("#dd_Longitude").text(data.projectLongitude);
				    	  	$("#dd_Latitude").text(data.projectLatitude);
				    	  	$("#schedule_div").css("width",percentage+"%");//当前进度
				    	  	$("#dd_schedule small").text("当前进度： "+percentage+"%");//当前进度
				    	  	$('.statusColor22').css("background-color","#1ab394"); 
		  	  	 			$('.statusColor21').css("background-color","#FF8547"); 
		  	  	 			$('.statusColor23').css("background-color","#F54545"); 
		  	  				$('.statusColor24').css("background-color","#696969");
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
		    	   });
	    //获取项目下所有测点
	     /*$.ajax({
		        type:'post',
			    url: 'rest/detectionPoint/showProjectDetectionPoint',
			    data: {projectName:projectName},
			    contextType:"application/json",
			    success: function(data){
			    	if(data){
			    	  		 var string = "";
			    	  		 $.each(data,function(idx,item){
			    	  		 string += '<tr>'+
											'<td><span class="label label-primary">'+
											'<i class=""></i>'+item.detectionName+'</span></td>'+
											'<td>'+item.itemName+'</td>'+
											'<td>'+item.detectionLatitude+'</td>'+
											'<td>'+item.detectionLongitude+'</td>'+
											'<td>'+
												'<p class="small">第一个测点</p>'+
											'</td>'+
										'</tr>';
					    	 });
			    	  		 $('#tbody_detectionPoint').append(string); 		
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
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
						 elem: 'pageComponent_1', //分页组件div的id
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
						  	  		    asthtml += '<tr>'+
														'<td><span class="label label-primary">'+
														'<i class=""></i>'+item.detectionName+'</span></td>'+
														'<td>'+item.itemName+'</td>'+
														'<td>'+item.detectionLatitude+'</td>'+
														'<td>'+item.detectionLongitude+'</td>'+
														'<td>'+
															'<p class="small">第一个测点</p>'+
														'</td>'+
												  '</tr>';		
					  	  		    	});
					  	  		    $('#tbody_detectionPoint').html(asthtml);
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
	    //获取项目下所有采集器
	    
	    /*//获取项目下所有传感器
	     $.ajax({
		        type:'post',
			    url: 'rest/sensorInfo/showProjectSensorInfo',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	if(data){
			    	  		 var string = "";
			    	  		 $.each(data,function(idx,item){
			    	  		 string += '<tr>'+
											'<td><span class="label label-primary">'+
											'<i class=""></i>'+item.detectionName+'</span></td>'+
											'<td>'+item.sensorId+'</td>'+
											'<td>'+item.sensorType+'</td>'+
											'<td>'+item.sensorModel+'</td>'+
											'<td>'+
												'<p class="small">'+item.sensorDepth+'</p>'+
											'</td>'+
										'</tr>';
					    	 });
			    	  		 $('#tbody_sensorInfo').append(string); 		
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
		    	 });*/
	     
	     	//分页获取项目下所有传感器
			$(function(){(function(){
				
				var jsonData = {};
				jsonData.projectName = projectName;
				jsonData.pageNum = 1;
				jsonData.pageSize = 6;
				
				//初始化分页组件函数
				 function loadLaypage(dataTotal, jsonData){
					 var laypage = layui.laypage;
					 laypage.render({
						 elem: 'pageComponent_2', //分页组件div的id
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
							url : 'rest/sensorInfo/showProjectSensorInfo',
							dataType : 'json',
							contentType : 'application/json',
							data : JSON.stringify(jsonData),
							success : function(data) {
								 if(data){
					  	  		    var asthtml = '';
					  	  		   	$.each(data.sensorInfoList,function(idx,item){
						  	  		    asthtml += '<tr>'+
														'<td><span class="label label-primary">'+
														'<i class=""></i>'+item.detectionName+'</span></td>'+
														'<td>'+item.sensorId+'</td>'+
														'<td>'+item.sensorType+'</td>'+
														'<td>'+item.sensorModel+'</td>'+
														'<td>'+
															'<p class="small">'+item.sensorDepth+'</p>'+
														'</td>'+
													'</tr>';		
					  	  		    	});
					  	  		    $('#tbody_sensorInfo').html(asthtml);
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
	     
	    //获取项目下所有告警信息
	   /* $.ajax({
		        type:'post',
			    url: 'rest/alarm/showProjectAlarm',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	if(data){
			    	  		 var string = "";
			    	  		 $.each(data,function(idx,item){
			    	  		 string += '<tr>'+
							    	  		'<td><span class="label label-primary">'+
											'<i class=""></i>'+item.detectionName+'</span></td>'+
											'<td>'+item.smuCmsId+'</td>'+
											'<td>'+item.sensorId+'</td>'+
											'<td>'+item.alarmType+'</td>'+
											'<td>'+item.alarmContext+'</td>'+
											'<td>'+item.createTime+'</td>'+
											'<td>'+item.alarmLevel+'</td>'+
											'<td>'+item.frequency+'</td>'+
										'</tr>';
					    	 });
			    	  		 $('#tbody_alarm').append(string); 		
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
		    	 });*/
	    
	  	//分页获取项目下所有告警信息
		$(function(){(function(){
			
			var jsonData = {};
			jsonData.projectId = projectId;
			jsonData.pageNum = 1;
			jsonData.pageSize = 6;
			
			//初始化分页组件函数
			 function loadLaypage(dataTotal, jsonData){
				 var laypage = layui.laypage;
				 laypage.render({
					 elem: 'pageComponent_3', //分页组件div的id
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
						url : 'rest/alarm/showProjectAlarm',
						dataType : 'json',
						contentType : 'application/json',
						data : JSON.stringify(jsonData),
						success : function(data) {
							 if(data){
				  	  		    var asthtml = '';
				  	  		   	$.each(data.AlarmList,function(idx,item){
					  	  		    asthtml += '<tr>'+
									    	  		'<td><span class="label label-primary">'+
													'<i class=""></i>'+item.detectionName+'</span></td>'+
													'<td>'+item.smuCmsId+'</td>'+
													'<td>'+item.sensorId+'</td>'+
													'<td>'+item.alarmType+'</td>'+
													'<td>'+item.alarmContext+'</td>'+
													'<td>'+item.createTime+'</td>'+
													'<td>'+item.alarmLevel+'</td>'+
													'<td>'+item.frequency+'</td>'+
													'<td>'+item.alarmStatus+'</td>'+
												'</tr>';		
				  	  		    	});
				  	  		    $('#tbody_alarm').html(asthtml);
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
	    
	    //获取项目下所有阀值
	     $.ajax({
		        type:'post',
			    url: 'rest/threshold/showProjectThreshold',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	if(data){
			    	  		 var string = "";
			    	  		 $.each(data,function(idx,item){
			    	  		 string += '<tr>'+
											'<td><span class="label label-primary">'+
											'<i class=""></i>'+item.detectionTypeName+'</span></td>'+
											'<td>'+item.thresholdTypeName+'</td>'+
											'<td>'+item.minThresholdValue+'</td>'+
											'<td>'+item.maxThresholdValue+'</td>'+
											'<td>'+item.minDrasticThresholdValue+'</td>'+
											'<td>'+item.maxDrasticThresholdValue+'</td>'+
										'</tr>';
					    	 });
			    	  		 $('#tbody_thresHold').append(string); 		
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
		    	 });
	    //获取项目下所有图片
        $.ajax({
		        type:'post',
			    url: 'rest/image/showProjectImage',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	if(data){
			    	  		 var string = "";
			    	  		 $.each(data,function(idx,item){
			    	  		 string += '<tr>'+
											'<td><span class="label label-primary">'+
											'<i class=""></i>'+item.detectionTypeName+'</span></td>'+
											'<td>'+
												'<img alt="未上传图片" src="'+item.heatImageUrl+'" style="height:110px; width:300px">'+
											'</td>'+
											'<td>'+
												'<img alt="未上传图片" src="'+item.physicalImageUrl+'" style="height:110px; width:300px">'+
											'</td>'+
										'</tr>';
					    	 });
			    	  		 $('#tbody_image').append(string); 		
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
		    	 });
	    //获取测点数量，传感器数量，阀值数量，图片数量。
	    /* $.ajax({
		        type:'post',
			    url: 'rest/project/obtainCount',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	 if(data){   
				    		 $("#dd_detectionPointCont").text(data.detectionPointCount);
				    	  	 $("#dd_thresHoldCont").text(data.thresholdCount);
				    	  	 $("#dd_imageCont").text(data.imageCount);
				    	  	 $("#dd_sensorInfoCont").text(data.sensorInfoCount);
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
		    	 }); */