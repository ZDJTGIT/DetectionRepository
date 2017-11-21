$(function(){	
	
	(function(){
		
		var rateChart = echarts.init(document.getElementById("echarts-rate-chart"));//总变化量,累计变化量
  		var grandtotalChart = echarts.init(document.getElementById("echarts-grandtotal-chart"));//单次变化量
  		var singleChart = echarts.init(document.getElementById("echarts-single-chart"));//变化速率
  		var displacementChart = echarts.init(document.getElementById("echarts-displacement-chart"));//原始数据(当前传入数据)
  		rateChart.showLoading();
  		grandtotalChart.showLoading();
  		singleChart.showLoading();
  		displacementChart.showLoading();
  		
//  		displacementChart.on("dataZoom", function(param){
//  			console.log(param);
//  			console.log(param.zoom.start);
//  			console.log(param.zoom.end);
//  			var lastData = [];
//  			var axisData = new Date('2017-11-18');
//  			lastData.push(axisData);
//  			lastData.push(3333);
  			// 动态数据接口 addData
//  			displacementChart.addData([
//  		        [
//  		            0,        // 系列索引
//  		            lastData, // 新增数据
//  		            false,    // 新增数据是否从队列头部插入
//  		            true    // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
//  		           // axisData  // 坐标轴标签
//  		        ]
//  		    ]);
  			
//	    });	  				
  		
		$.ajax({
			type:'post',
  	  	  	url: 'rest/project/subwayRailComparison',
  	  	  	data: {projectId:$('#projectId').text()},
  	  	    dataType: 'json',
  	  	  	success: function(data){
  	  	  		var subway = data;
  	  	  		if(subway.length==0){
  	  	  			alert("暂无数据");
  	  	  		}else{
  	  			
  	  	  			var selected = {};//设置测点数据加载时是否显示
  	  	  			var displacementlegen = [];//legend属性中的data数据，添加测点个数
  	  	  			var displacementSeries = [];
  	  	  			var rateSeries = [];
  	  	  			var grandtotalSeries = [];
  	  	  			var singleSeries = [];
  	  	  			
  	  	  			$(subway).each(function(index,value){
  	  	  				displacementlegen.push(value.detectionName);
  	  	  				if(index>1){
  	  	  					selected[value.detectionName]=false;
  	  	  				}
  	  	  				var displacementData = [];
  	  	  				var rateData = [];
  	  	  				var grandtotalData = [];
  	  	  				var singleData = [];
  	  	  				$(value.laserDataList).each(function(ind,val){
  	  	  					var datas = [];
  	  	  					var ratedatas = [];
  	  	  					var grandtotaldatas = [];
  	  	  					var singledatas = [];
  	  	  					var temper=val.currentTimes;
  	  	  					var dt = new Date(temper.substring(0,4),temper.substring(5,7)-1,temper.substring(8,10),temper.substring(11,13),temper.substring(14,16),temper.substring(17,19));
  	  	  					datas.push(dt);
  	  	  					datas.push(val.currentData);
  	  	  					ratedatas.push(dt);
  	  	  					ratedatas.push(val.totalLaserChange);
  	  	  					grandtotaldatas.push(dt);
  	  	  					grandtotaldatas.push(val.currentLaserChange);
  	  	  					singledatas.push(dt);
  	  	  					singledatas.push(val.speedChange);
  	  	  					displacementData.push(datas);
  	  	  					rateData.push(ratedatas);
  	  	  					grandtotalData.push(grandtotaldatas);
  	  	  					singleData.push(singledatas);
  	  	  				});
  	  	  				
  	  	  				var displacementpoint ={name: value.detectionName, type: 'line',symbol:'circle',showAllSymbol: true,data: displacementData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}, formatter : function (params){return params.name+'<br>'+params } };
  	  	  				var ratepoint ={name: value.detectionName, type: 'line',symbol:'circle',showAllSymbol: true,data: rateData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}, formatter : function (params){return params.name+'<br>'+params } };
  	  	  				var grandtotalpoint ={name: value.detectionName, type: 'line',symbol:'circle',showAllSymbol: true,data: grandtotalData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}, formatter : function (params){return params.name+'<br>'+params } };
  	  	  				var singlepoint ={name: value.detectionName, type: 'line',symbol:'circle',showAllSymbol: true,data: singleData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}, formatter : function (params){return params.name+'<br>'+params } };
  	  	  				displacementSeries.push(displacementpoint);
  	  	  				rateSeries.push(ratepoint);
  	  	  				grandtotalSeries.push(grandtotalpoint);
  	  	  				singleSeries.push(singlepoint);
  	  	  			});
  			
  			
  			
  			
  	  	  			var displacement = {
  	  	  					tooltip : {
  						        trigger: 'axis',
  						        formatter : function (params) {
  						            var date = new Date(params.value[0]);
  						            var minute = date.getMinutes();
  						            var seconds = date.getSeconds();
  						            var hours = date.getHours();
  						            var year= date.getFullYear();
  						            var month =date.getMonth() ;
  					                var day = date.getDate(); 
  					                if(month<10){
  					                	month="0"+month;
  					                }
  					                if(day<10){
  					                	day="0"+day;
  					                }
  						            if(minute<10){
  						            	minute="0"+minute;
  						            }
  						            if(seconds<10){
  						            	seconds="0"+seconds;
  						            }
  						            if(hours<10){
  						            	hours="0"+hours;
  						            }
  						            data =year+"-"+month+"-"+day+" "+ hours  + ':'
  						                   + minute+":"+seconds;
  						            return "测点名称："+params[0]+"<br/>"+"时间："+data + '<br/>'
  						                   + "实时数据："+params.value[1]
  						        }
  						    },
  						    toolbox: {
  						        show : true,
  						        feature : {
  						            mark : {show: true},
  						            dataView : {show: true, readOnly: false},
  						            restore : {show: true},
  						            saveAsImage : {show: true}
  						        }
  						    },
  						    dataZoom: {
  						        show: true,
  						        start : 90
  						    },
  						    legend : {
  						    	selected:selected,
  						        data : displacementlegen
  						    },
  						    grid: {
  						        y2: 80
  						    },
  						    xAxis : [
  						        {
  						            type : 'time',
  						            splitNumber:10
  						        }
  						    ],
  						    yAxis : [
  					            {
  						            type : 'value',
  						            splitArea : { // 分隔区域
  										show : true, // 默认不显示，属性show控制显示与否
  										areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
  											color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
  										}
  									}
  						        }
  						    ],
  						    series : displacementSeries
  						                    
  						};
  						                    
  				displacementChart.clear();
  				displacementChart.setOption(displacement);
  				window.addEventListener("resize",function(){
  					displacementChart.resize();
  			    });//表格自适应
  				displacementChart.hideLoading();
//  			$(window).resize(chart.resize);
  				
  				var rate = {
  					    tooltip : {
  					        trigger: 'axis',
  					        formatter : function (params) {
  					            var date = new Date(params.value[0]);
  					            var minute = date.getMinutes();
  					            var seconds = date.getSeconds();
  					            var hours = date.getHours();
  					            var year= date.getFullYear();
  					            var month =date.getMonth() ;
  				                var day = date.getDate(); 
//  					            alert(JSON.stringify(params));
  				                if(month<10){
  				                	month="0"+month;
  				                }
  				                if(day<10){
  				                	day="0"+day;
  				                }
  					            if(minute<10){
  					            	minute="0"+minute;
  					            }
  					            if(seconds<10){
  					            	seconds="0"+seconds;
  					            }
  					            if(hours<10){
  					            	hours="0"+hours;
  					            }
  					            data =year+"-"+month+"-"+day+" "+ hours  + ':'
  					                   + minute+":"+seconds;
  					            return "测点名称："+params[0]+"<br/>"+"时间："+data + '<br/>'
  					                   + "累计变化量："+params.value[1]
  					        }
  					    },
  					    toolbox: {
  					        show : true,
  					        feature : {
  					            mark : {show: true},
  					            dataView : {show: true, readOnly: false},
  					            restore : {show: true},
  					            saveAsImage : {show: true}
  					        }
  					    },
  					    dataZoom: {
  					        show: true,
  					        start : 90
  					    },
  					    legend : {
  					    	selected:selected,
  					        data : displacementlegen
  					    },
  					    grid: {
  					        y2: 80
  					    },
  					    xAxis : [
  					        {
  					            type : 'time',
  					            splitNumber:10
  					        }
  					    ],
  					    yAxis : [
  				            {
  					            type : 'value',
  					            splitArea : { // 分隔区域
  									show : true, // 默认不显示，属性show控制显示与否
  									areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
  										color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
  									}
  								}
  					        }
  					    ],
  					    series : rateSeries
  					                    
  					};
  					                    
  				rateChart.clear();
  				rateChart.setOption(rate);
  				window.addEventListener("resize",function(){
  					rateChart.resize();
  			    });//表格自适应
  				rateChart.hideLoading();
  			//	$(window).resize(chart.resize);
  			
  			var grandtotal = {
  				    tooltip : {
  				        trigger: 'axis',
  				        formatter : function (params) {
  				            var date = new Date(params.value[0]);
  				            var minute = date.getMinutes();
  				            var seconds = date.getSeconds();
  				            var hours = date.getHours();
  				            var year= date.getFullYear();
  				            var month =date.getMonth();
  			                var day = date.getDate(); 
  			                if(month<10){
  			                	month="0"+month;
  			                }
  			                if(day<10){
  			                	day="0"+day;
  			                }
  				            if(minute<10){
  				            	minute="0"+minute;
  				            }
  				            if(seconds<10){
  				            	seconds="0"+seconds;
  				            }
  				            if(hours<10){
  				            	hours="0"+hours;
  				            }
  				            data =year+"-"+month+"-"+day+" "+ hours  + ':'
  				                   + minute+":"+seconds;
  				            return "测点名称："+params[0]+"<br/>"+"时间："+data + '<br/>'
  				                   + "单次变化量："+params.value[1]
  				        }
  				    },
  				    toolbox: {
  				        show : true,
  				        feature : {
  				            mark : {show: true},
  				            dataView : {show: true, readOnly: false},
  				            restore : {show: true},
  				            saveAsImage : {show: true}
  				        }
  				    },
  				    dataZoom: {
  				        show: true,
  				        start : 90
  				    },
  				    legend : {
  				    	selected:selected,
  				        data : displacementlegen
  				    },
  				    grid: {
  				        y2: 80
  				    },
  				    xAxis : [
  				        {
  				            type : 'time',
  				            splitNumber:10
  				        }
  				    ],
  				    yAxis : [
  			            {
  				            type : 'value',
  				            splitArea : { // 分隔区域
  								show : true, // 默认不显示，属性show控制显示与否
  								areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
  									color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
  								}
  							}
  				        }
  				    ],
  				    series : grandtotalSeries
  				                    
  				};
  				                    
  				grandtotalChart.clear();
  				grandtotalChart.setOption(grandtotal);
  				window.addEventListener("resize",function(){
  					grandtotalChart.resize();
  				});//表格自适应
  				grandtotalChart.hideLoading();
  				//$(window).resize(chart.resize);

  			var single = {
  				    tooltip : {
  				        trigger: 'axis',
  				        formatter : function (params) {
  				            var date = new Date(params.value[0]);
  				            var minute = date.getMinutes();
  				            var seconds = date.getSeconds();
  				            var hours = date.getHours();
  				            var year= date.getFullYear();
  				            var month =date.getMonth();
  			                var day = date.getDate(); 
  			                if(month<10){
  			                	month="0"+month;
  			                }
  			                if(day<10){
  			                	day="0"+day;
  			                }
  				            if(minute<10){
  				            	minute="0"+minute;
  				            }
  				            if(seconds<10){
  				            	seconds="0"+seconds;
  				            }
  				            if(hours<10){
  				            	hours="0"+hours;
  				            }
  				            data =year+"-"+month+"-"+day+" "+ hours  + ':'
  				                   + minute+":"+seconds;
  				            return "测点名称："+params[0]+"<br/>"+"时间："+data + '<br/>'
  				                   + "变化速率："+params.value[1]
  				        }
  				    },
  				    toolbox: {
  				        show : true,
  				        feature : {
  				            mark : {show: true},
  				            dataView : {show: true, readOnly: false},
  				            restore : {show: true},
  				            saveAsImage : {show: true}
  				        }
  				    },
  				    dataZoom: {
  				        show: true,
  				        start : 90
  				    },
  				    legend : {
  				    	selected:selected,
  				        data : displacementlegen
  				    },
  				    grid: {
  				        y2: 80
  				    },
  				    xAxis : [
  				        {
  				            type : 'time',
  				            splitNumber:10
  				        }
  				    ],
  				    yAxis : [
  			            {
  				            type : 'value',
  				            splitArea : { // 分隔区域
  								show : true, // 默认不显示，属性show控制显示与否
  								areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
  									color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
  								}
  							}
  				        }
  				    ],
  				    series : singleSeries
  				                    
  				};
  				                    
  				singleChart.clear();
  				singleChart.setOption(single);
  				window.addEventListener("resize",function(){
  					singleChart.resize();
  				});//表格自适应
  				singleChart.hideLoading();
  				//$(window).resize(chart.resize);
  			}
  	  	  	},
  	  	  	error: function(){
  	  	  		alert("数据加载失败");
  	  	  		displacementChart.hideLoading();
  	  	  		rateChart.hideLoading();
  	  	  		grandtotalChart.hideLoading();
  	  	  		singleChart.hideLoading();
		    }
  	    });	
		
	})();
		
})


//
////var klinedata = JSON.parse(klinesubway);
////
////var indexs = 0;
////$("body").on('click','.subwaybutton',function(){
////	var id = $(this).attr('id');
////	indexs++;
////	alert(id+"--"+indexs);
////});
//
//$(function(){	
//	
//	var subway = JSON.parse(subwayrail);
//	if(subway.length==0){
//		alert("今天没有数据");
//	}else{
//		
//	var rateChart = echarts.init(document.getElementById("echarts-rate-chart"));//总变化量,累计变化量
//	var grandtotalChart = echarts.init(document.getElementById("echarts-grandtotal-chart"));//单次变化量
//	var singleChart = echarts.init(document.getElementById("echarts-single-chart"));//变化速率
//	var displacementChart = echarts.init(document.getElementById("echarts-displacement-chart"));//原始数据(当前传入数据)
//	var selected = {};//设置测点数据加载时是否显示
//	var displacementlegen = [];//legend属性中的data数据，添加测点个数
//	var displacementSeries = [];
//	var rateSeries = [];
//	var grandtotalSeries = [];
//	var singleSeries = [];
//	$(subway).each(function(index,value){
//		displacementlegen.push(value.detectionName);
//		if(index>1){
//			selected[value.detectionName]=false;
//		}
//		var displacementData = [];
//		var rateData = [];
//		var grandtotalData = [];
//		var singleData = [];
//		$(value.laserDataList).each(function(ind,val){
//			var datas = [];
//			var ratedatas = [];
//			var grandtotaldatas = [];
//			var singledatas = [];
//			var temper=val.currentTimes;
//			var dt = new Date(temper.substring(0,4),temper.substring(5,7),temper.substring(8,10),temper.substring(11,13),temper.substring(14,16),temper.substring(17,19));
//			datas.push(dt);
//			datas.push(val.currentData);
//			ratedatas.push(dt);
//			ratedatas.push(val.totalLaserChange);
//			grandtotaldatas.push(dt);
//			grandtotaldatas.push(val.currentLaserChange);
//			singledatas.push(dt);
//			singledatas.push(val.speedChange);
//			displacementData.push(datas);
//			rateData.push(ratedatas);
//			grandtotalData.push(grandtotaldatas);
//			singleData.push(singledatas);
//		});
//		var displacementpoint ={name: value.detectionName, type: 'line',symbol:'circle',showAllSymbol: true,data: displacementData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}, formatter : function (params){return params.name+'<br>'+params } };
//		var ratepoint ={name: value.detectionName, type: 'line',symbol:'circle',showAllSymbol: true,data: rateData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}, formatter : function (params){return params.name+'<br>'+params } };
//		var grandtotalpoint ={name: value.detectionName, type: 'line',symbol:'circle',showAllSymbol: true,data: grandtotalData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}, formatter : function (params){return params.name+'<br>'+params } };
//		var singlepoint ={name: value.detectionName, type: 'line',symbol:'circle',showAllSymbol: true,data: singleData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}, formatter : function (params){return params.name+'<br>'+params } };
//		displacementSeries.push(displacementpoint);
//		rateSeries.push(ratepoint);
//		grandtotalSeries.push(grandtotalpoint);
//		singleSeries.push(singlepoint);
//	});
//	
//	
//	
//	
//	var displacement = {
//				    tooltip : {
//				        trigger: 'axis',
//				        formatter : function (params) {
//				            var date = new Date(params.value[0]);
//				            var minute = date.getMinutes();
//				            var seconds = date.getSeconds();
//				            var hours = date.getHours();
//				            var year= date.getFullYear();
//				            var month =date.getMonth() ;
//			                var day = date.getDate(); 
////				            alert(JSON.stringify(params));
//			                if(month<10){
//			                	month="0"+month;
//			                }
//			                if(day<10){
//			                	day="0"+day;
//			                }
//				            if(minute<10){
//				            	minute="0"+minute;
//				            }
//				            if(seconds<10){
//				            	seconds="0"+seconds;
//				            }
//				            if(hours<10){
//				            	hours="0"+hours;
//				            }
//				            data =year+"-"+month+"-"+day+" "+ hours  + ':'
//				                   + minute+":"+seconds;
//				            return "测点名称："+params[0]+"<br/>"+"时间："+data + '<br/>'
//				                   + "实时数据："+params.value[1]
//				        }
//				    },
//				    toolbox: {
//				        show : true,
//				        feature : {
//				            mark : {show: true},
//				            dataView : {show: true, readOnly: false},
//				            restore : {show: true},
//				            saveAsImage : {show: true}
//				        }
//				    },
//				    dataZoom: {
//				        show: true,
//				        start : 90
//				    },
//				    legend : {
//				    	selected:selected,
//				        data : displacementlegen
//				    },
//				    grid: {
//				        y2: 80
//				    },
//				    xAxis : [
//				        {
//				            type : 'time',
//				            splitNumber:10
//				        }
//				    ],
//				    yAxis : [
//			            {
//				            type : 'value',
//				            splitArea : { // 分隔区域
//								show : true, // 默认不显示，属性show控制显示与否
//								areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
//									color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
//								}
//							}
//				        }
//				    ],
//				    series : displacementSeries
//				                    
//				};
//				                    
//		displacementChart.clear();
//		displacementChart.setOption(displacement);
//		window.addEventListener("resize",function(){
//		displacementChart.resize();
//	    });//表格自适应
////		$(window).resize(chart.resize);
//		
//		var rate = {
//			    tooltip : {
//			        trigger: 'axis',
//			        formatter : function (params) {
//			            var date = new Date(params.value[0]);
//			            var minute = date.getMinutes();
//			            var seconds = date.getSeconds();
//			            var hours = date.getHours();
//			            var year= date.getFullYear();
//			            var month =date.getMonth() ;
//		                var day = date.getDate(); 
////			            alert(JSON.stringify(params));
//		                if(month<10){
//		                	month="0"+month;
//		                }
//		                if(day<10){
//		                	day="0"+day;
//		                }
//			            if(minute<10){
//			            	minute="0"+minute;
//			            }
//			            if(seconds<10){
//			            	seconds="0"+seconds;
//			            }
//			            if(hours<10){
//			            	hours="0"+hours;
//			            }
//			            data =year+"-"+month+"-"+day+" "+ hours  + ':'
//			                   + minute+":"+seconds;
//			            return "测点名称："+params[0]+"<br/>"+"时间："+data + '<br/>'
//			                   + "累计变化量："+params.value[1]
//			        }
//			    },
//			    toolbox: {
//			        show : true,
//			        feature : {
//			            mark : {show: true},
//			            dataView : {show: true, readOnly: false},
//			            restore : {show: true},
//			            saveAsImage : {show: true}
//			        }
//			    },
//			    dataZoom: {
//			        show: true,
//			        start : 90
//			    },
//			    legend : {
//			    	selected:selected,
//			        data : displacementlegen
//			    },
//			    grid: {
//			        y2: 80
//			    },
//			    xAxis : [
//			        {
//			            type : 'time',
//			            splitNumber:10
//			        }
//			    ],
//			    yAxis : [
//		            {
//			            type : 'value',
//			            splitArea : { // 分隔区域
//							show : true, // 默认不显示，属性show控制显示与否
//							areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
//								color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
//							}
//						}
//			        }
//			    ],
//			    series : rateSeries
//			                    
//			};
//			                    
//		rateChart.clear();
//		rateChart.setOption(rate);
//		window.addEventListener("resize",function(){
//			rateChart.resize();
//	    });//表格自适应
//	//	$(window).resize(chart.resize);
//	
//	var grandtotal = {
//		    tooltip : {
//		        trigger: 'axis',
//		        formatter : function (params) {
//		            var date = new Date(params.value[0]);
//		            var minute = date.getMinutes();
//		            var seconds = date.getSeconds();
//		            var hours = date.getHours();
//		            var year= date.getFullYear();
//		            var month =date.getMonth();
//	                var day = date.getDate(); 
////		            alert(JSON.stringify(params));
//	                if(month<10){
//	                	month="0"+month;
//	                }
//	                if(day<10){
//	                	day="0"+day;
//	                }
//		            if(minute<10){
//		            	minute="0"+minute;
//		            }
//		            if(seconds<10){
//		            	seconds="0"+seconds;
//		            }
//		            if(hours<10){
//		            	hours="0"+hours;
//		            }
//		            data =year+"-"+month+"-"+day+" "+ hours  + ':'
//		                   + minute+":"+seconds;
//		            return "测点名称："+params[0]+"<br/>"+"时间："+data + '<br/>'
//		                   + "单次变化量："+params.value[1]
//		        }
//		    },
//		    toolbox: {
//		        show : true,
//		        feature : {
//		            mark : {show: true},
//		            dataView : {show: true, readOnly: false},
//		            restore : {show: true},
//		            saveAsImage : {show: true}
//		        }
//		    },
//		    dataZoom: {
//		        show: true,
//		        start : 90
//		    },
//		    legend : {
//		    	selected:selected,
//		        data : displacementlegen
//		    },
//		    grid: {
//		        y2: 80
//		    },
//		    xAxis : [
//		        {
//		            type : 'time',
//		            splitNumber:10
//		        }
//		    ],
//		    yAxis : [
//	            {
//		            type : 'value',
//		            splitArea : { // 分隔区域
//						show : true, // 默认不显示，属性show控制显示与否
//						areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
//							color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
//						}
//					}
//		        }
//		    ],
//		    series : grandtotalSeries
//		                    
//		};
//		                    
//		grandtotalChart.clear();
//		grandtotalChart.setOption(grandtotal);
//		window.addEventListener("resize",function(){
//			grandtotalChart.resize();
//		});//表格自适应
//		//$(window).resize(chart.resize);
//
//	var single = {
//		    tooltip : {
//		        trigger: 'axis',
//		        formatter : function (params) {
//		            var date = new Date(params.value[0]);
//		            var minute = date.getMinutes();
//		            var seconds = date.getSeconds();
//		            var hours = date.getHours();
//		            var year= date.getFullYear();
//		            var month =date.getMonth();
//	                var day = date.getDate(); 
////		            alert(JSON.stringify(params));
//	                if(month<10){
//	                	month="0"+month;
//	                }
//	                if(day<10){
//	                	day="0"+day;
//	                }
//		            if(minute<10){
//		            	minute="0"+minute;
//		            }
//		            if(seconds<10){
//		            	seconds="0"+seconds;
//		            }
//		            if(hours<10){
//		            	hours="0"+hours;
//		            }
//		            data =year+"-"+month+"-"+day+" "+ hours  + ':'
//		                   + minute+":"+seconds;
//		            return "测点名称："+params[0]+"<br/>"+"时间："+data + '<br/>'
//		                   + "变化速率："+params.value[1]
//		        }
//		    },
//		    toolbox: {
//		        show : true,
//		        feature : {
//		            mark : {show: true},
//		            dataView : {show: true, readOnly: false},
//		            restore : {show: true},
//		            saveAsImage : {show: true}
//		        }
//		    },
//		    dataZoom: {
//		        show: true,
//		        start : 90
//		    },
//		    legend : {
//		    	selected:selected,
//		        data : displacementlegen
//		    },
//		    grid: {
//		        y2: 80
//		    },
//		    xAxis : [
//		        {
//		            type : 'time',
//		            splitNumber:10
//		        }
//		    ],
//		    yAxis : [
//	            {
//		            type : 'value',
//		            splitArea : { // 分隔区域
//						show : true, // 默认不显示，属性show控制显示与否
//						areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
//							color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
//						}
//					}
//		        }
//		    ],
//		    series : singleSeries
//		                    
//		};
//		                    
//		singleChart.clear();
//		singleChart.setOption(single);
//		window.addEventListener("resize",function(){
//			singleChart.resize();
//		});//表格自适应
//		//$(window).resize(chart.resize);
//				
//		
////		var klineChart = echarts.init(document.getElementById("echarts-klinedata-chart"));//总变化量,累计变化量
////		$("[name='subway_detectionButtion']").empty();
////		var dex = 0;
////		var onekey;
////		$.each(klinedata,function(key,value){
////			if(dex==0){
////				onekey = key;
////			}
////			dex++;
////			var label = "<button class='btn btn-primary subwaybutton' id='"+value.detectionPointId+"' type='button'>"+value.detectionName+"</button>"
////			$("[name='subway_detectionButtion']").append(label);
////		});
////		
////		var kselected = {};//显示一个属性
////		var xdata=[];//x轴数据
////		
//////		var legenddata = ['实时数据','累计变化量','变化速率','单次变化量'];
////		var legenddata = ['实时数据']
//////		$(legenddata).each(function(inx,val){
//////			if(inx>0){
//////				kselected[val]=false;
//////			}
//////		});
////		var currentData = []; //实时数据
////		var currentlaserchange = [];//单次变化
////		var totallaserchange = []; //总变化
////		var speedchange = [];//变化速率
////		$(klinedata[onekey].kGraphLaserDataList).each(function(index,value){
////			xdata.push(value.currentTimes.substring(0,10));
////			var currentDatas = [];
////			currentDatas.push(value.beginCurrentDatas);
////			currentDatas.push(value.endCurrentData);
////			currentDatas.push(value.minCurrentData);
////			currentDatas.push(value.maxCurrentdata);
////			currentData.push(currentDatas);
////			var currentlaserchanges = [];
////			currentlaserchanges.push(value.beginCurrentLaserChange);
////			currentlaserchanges.push(value.endCurentLaerChangens);
////			currentlaserchanges.push(value.minCurrentLaserChange);
////			currentlaserchanges.push(value.maxCurrentLaserChange);
////			currentlaserchanges.push(currentlaserchanges);
////			var totallaserchanges = [];
////			totallaserchanges.push(value.beginTotalLaerChanges);
////			totallaserchanges.push(value.endTotalLaserChangens);
////			totallaserchanges.push(value.minTotalLaserChangen);
////			totallaserchanges.push(value.maxTotalLaserChange);
////			totallaserchanges.push(totallaserchanges);
////			var speedchanges = [];
////			speedchanges.push(value.beginSpeedChanges);
////			speedchanges.push(value.endSpeedChange);
////			speedchanges.push(value.minSpeedChange);
////			speedchanges.push(value.maxSpeedChange);
////			speedchange.push(speedchanges);
////		});
//////		var yseries = [{ name:'实时数据',type:'k',data:currentData},{ name:'累计变化量',type:'k',data:totallaserchange},{ name:'变化速率',type:'k',data:speedchange},{ name:'单次变化量',type:'k',data:currentlaserchange}];
////		var yseries = [{ name:'实时数据',type:'k',data:currentData}];
//////		alert(JSON.stringify(currentData));
////		var Klinegraph = {
////			    tooltip : {
////			        trigger: 'axis',
////			        formatter: function (params) {
////			            var res = params[0].seriesName + ' ' + params[0].name;
////			            res += '<br/>  开盘 : ' + params[0].value[0] + '  最高 : ' + params[0].value[3];
////			            res += '<br/>  收盘 : ' + params[0].value[1] + '  最低 : ' + params[0].value[2];
////			            return res;
////			        }
////			    },
////			    legend: {
////			    	selected : kselected,
////			        data:legenddata
////			    },
////			    toolbox: {
////			        show : true,
////			        feature : {
////			            mark : {show: true},
////			            dataZoom : {show: true},
////			            dataView : {show: true, readOnly: false},
////			            magicType: {show: true, type: ['line', 'bar']},
////			            restore : {show: true},
////			            saveAsImage : {show: true}
////			        }
////			    },
////			    dataZoom : {
////			        show : true,
////			        realtime: true,
////			        start : 50,
////			        end : 100
////			    },
////			    xAxis : [
////			        {
////			            type : 'category',
////			            boundaryGap : true,
////			            axisTick: {onGap:false},
////			            splitLine: {show:false},
////			            data : xdata
////			        }
////			    ],
////			    yAxis : [
////			        {
////			            type : 'value',
////			            scale:true,
////			            boundaryGap: [0.01, 0.01],
////			            splitArea : { // 分隔区域
////							show : true, // 默认不显示，属性show控制显示与否
////							areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
////								color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
////							}
////						}
////			        }
////			    ],
////			    series : yseries
////			};
////		
////		klineChart.clear();
////		klineChart.setOption(Klinegraph);
////		window.addEventListener("resize",function(){
////			klineChart.resize();
////		});//表格自适应
//			                    
//	}
//})
//
