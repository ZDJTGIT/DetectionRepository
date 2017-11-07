var oTabel= $('#editable').dataTable();
var map = laserRangMap;
var laserjson = JSON.parse(map);
var detectionIdMap={};
echartloading(laserjson,oTabel);

$("#selectdispladata").click(function(){
	var diapladataText = $("#diapladata").val();
	var projectId = $("#projectId").text();
	var detectionTypeId = $("#detectionTypeId").text();
		if(diapladataText.length==0){
			alert("请选择时间！");
		}else{
			$.ajax({
				url: 'rest/project/selectlaserRanging',
				dataType: 'json',
				data : {currentTime:diapladataText,projectId:projectId,detectionTypeId:detectionTypeId},
				success: function(data){
					echartloading(data,oTabel);
				}
			});
		}
});

		
$("body").on('click','.btn-primary',function(){
	var parent = $(this).parent().prev().text();
	var dName = $(this).html();
	var id = $(this).attr("name");
	var valueList = detectionIdMap[id];//该测点下的所有数据
	var chart;
	var selected = {};//设置测点数据加载时是否显示
	var legenData = [];//legend属性中的data数据，添加测点个数
	var rateSeries=[];//数据
	var alar = laserjson["threshold"];//警戒值
	var xData = [];//获取高度填充X轴坐标数据
	var pointData = [];//y轴值
	var projectId = $("#projectId").text();
	var detectionTypeId = $("#detectionTypeId").text();
	$("#laserRangexcel_a").attr('href',"rest/project/exportExcel?sensorId="+valueList[0].sensorId+"&currentTime="+valueList[0].currentTimes.substring(0,10)+"&projectId="+projectId+"&detectionTypeId="+detectionTypeId+"&detectionName="+dName);
	if(parent=="数据信息"){
		oTabel.fnClearTable();//清空数据.fnClearTable();//清空数据  
		$(valueList).each(function(inde,value){
			oTabel.fnAddData([
					dName,
					value.firstTime,
					value.firstData,
					value.previousTime,
					value.previousData,
					value.currentTimes,
					value.currentData,
					value.currentLaserChange,
					value.totalLaserChange,
					value.speedChange,
					value.smuCmsId,
					value.smuCmsChannel,
          ]);
		});
	}else{
		if(parent=="累计变化量"){
			chart=echarts.init(document.getElementById("echarts-rate-chart"));
			thresholdData(alar,31,rateSeries,legenData);
			
			$(valueList).each(function(index,value){
				xData.push(value.currentTimes.substring(11));
				pointData.push(value.totalLaserChange);
			});
			
		}else if(parent=="单次变化量"){
			chart=echarts.init(document.getElementById("echarts-grandtotal-chart"));
			thresholdData(alar,30,rateSeries,legenData);
			
			$(valueList).each(function(index,value){
				xData.push(value.currentTimes.substring(11));
				pointData.push(value.currentLaserChange);
			});
			
		}else if(parent=="变化速率"){
			chart=echarts.init(document.getElementById("echarts-single-chart"));
			thresholdData(alar,32,rateSeries,legenData);
			
			$(valueList).each(function(index,value){
				xData.push(value.currentTimes.substring(11));
				pointData.push(value.speedChange);
			});
		}else if(parent=="实时数据"){
			chart=echarts.init(document.getElementById("echarts-displacement-chart"));
			thresholdData(alar,29,rateSeries,legenData);
			$(valueList).each(function(index,value){
				xData.push(value.currentTimes.substring(11));
				pointData.push(value.currentData);
			});
		}
		legenData.push(dName);
		selected[dName]=true;
		var detectionpoint = {name:dName,type:'line',smooth:true,symbol:'circle',data:pointData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
		rateSeries.push(detectionpoint);
		var ratetion = {
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					orient : 'horizontal',
					x : 'center',
					selected : selected,
					data : legenData
				},
				toolbox : {
					show : true,
					orient : 'vertical',
					feature : {
						mark : {
							show : true
						},
						dataView : {
							show : true,
							readOnly : false
						},
						magicType : {
							show : true,
							type : [ 'line', 'bar' ]
						},
						restore : {
							show : true
						},
						saveAsImage : {
							show : true
						}
					}
				},
				calculable : true,
				xAxis : [ {
					type : 'category',
					boundaryGap : false,
					data : xData,
					axisLine : {
						show : true,
						lineStyle : {
							color : '#48b',
							width : 2,
							type : 'solid'
						}
					},
					axisLabel : {
						show : true,
						formatter : '{value}'
					},
					splitLine : { // 分隔线
						show : true, // 默认显示，属性show控制显示与否
						// onGap: null,
						lineStyle : { // 属性lineStyle（详见lineStyle）控制线条样式
							color : [ '#ccc' ],
							width : 1,
							type : 'solid'
						}
					},
					splitArea : { // 分隔区域
						show : false, // 默认不显示，属性show控制显示与否
						// onGap: true,
						areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
							color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
						}
					}
				} ],
				yAxis : [ {
					type : 'value',
					data : [ 0, 5, 10, 15 ],
					axisLabel : {
						formatter : '{value} mm'
					},
					markLine : {
						data : [ [ {
							name : '标线1起点',
							value : 5,
							xAxis : 0,
							yAxis : 5
						}, // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
						// {name: '标线1终点', xAxis: '周日', yAxis:5}, //
						// 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
						] ]
					},
					splitArea : { // 分隔区域
						show : true, // 默认不显示，属性show控制显示与否
						areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
							color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
						}
					}
				}

				],
				line : {
					itemStyle : {
						normal : {
							// color:各异,
							label : {
								show : false
							// position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
							// 'inside'|'left'|'right'|'top'|'bottom'
							// textStyle: null // 默认使用全局文本样式，详见TEXTSTYLE
							},
							lineStyle : {
								width : 2,
								type : 'solid',
								shadowColor : 'rgba(0,0,0,0)', // 默认透明
								shadowBlur : 5,
								shadowOffsetX : 3,
								shadowOffsetY : 3
							}
						},
						emphasis : {
							// color: 各异,
							label : {
								show : false
							// position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
							// 'inside'|'left'|'right'|'top'|'bottom'
							// textStyle: null // 默认使用全局文本样式，详见TEXTSTYLE
							}
						}
					},
					smooth : true, // 曲线平滑
					symbol : 'none', // 拐点图形类型
					symbolSize : 2, // 拐点图形大小
					// symbolRotate : null, // 拐点图形旋转控制
					showAllSymbol : false
				// 标志图形默认只有主轴显示（随主轴标签间隔隐藏策略）
				},
				series : rateSeries
			};
			chart.clear();
			chart.setOption(ratetion);
			window.addEventListener("resize",function(){
				chart.resize();
		    });//表格自适应
//			$(window).resize(chart.resize);
	}
	
	
});

function echartloading(map,oTabel){
	var data = map["laser"];
	if(data.length==0){
		alert("所选日期没有数据");
	}else{
		var threshold = laserjson["threshold"];//警戒值
		$("[name='laserRanging_detectionButtion']").empty(); 
		$(data).each(function(index,value){
			detectionIdMap[value.detectionPointId]=value.laserDataList;
			var lable = "<button class='btn btn-primary' name='"+value.detectionPointId+"' type='button'>"+value.detectionName+"</button>"
			$("[name='laserRanging_detectionButtion']").append(lable);
		});
		
		$("#diapladata").val((data[0].laserDataList)[0].currentTimes.substring(0,11));//设置显示时间
		
		var rateChart = echarts.init(document.getElementById("echarts-rate-chart"));//总变化量,累计变化量
		var grandtotalChart = echarts.init(document.getElementById("echarts-grandtotal-chart"));//单次变化量
		var singleChart = echarts.init(document.getElementById("echarts-single-chart"));//变化速率
		var displacementChart = echarts.init(document.getElementById("echarts-displacement-chart"));//原始数据(当前传入数据)
		
		var selected = {};//设置测点数据加载时是否显示
		var legenData = [];//legend属性中的data数据，添加测点个数
		var displacementlegen = [];//legend属性中的data数据，添加测点个数
		var singlelegen = [];//legend属性中的data数据，添加测点个数
		var grandtotaldatas=[];//legend属性中的data数据，添加测点个数
		var xData = [];//获取高度填充X轴坐标数据
		var rateSeries = [];
		var singleSeries = [];
		var grandtotalSeries = [];
		var displacementSeries = [];
		
		thresholdData(threshold,31,rateSeries,legenData);
		thresholdData(threshold,32,singleSeries,singlelegen);
		thresholdData(threshold,30,grandtotalSeries,grandtotaldatas);
		thresholdData(threshold,29,displacementSeries,displacementlegen);
		
		oTabel.fnClearTable();//清空数据.fnClearTable();//清空数据  
			var val = data[0]
			
			legenData.push(val.detectionName);
			displacementlegen.push(val.detectionName);
			singlelegen.push(val.detectionName);
			grandtotaldatas.push(val.detectionName);
			selected[val.detectionName]=true;
			var list = val.laserDataList;
			var projectId = $("#projectId").text();
			var detectionTypeId = $("#detectionTypeId").text();
			$("#laserRangexcel_a").attr('href',"rest/project/exportExcel?sensorId="+list[0].sensorId+"&currentTime="+list[0].currentTimes.substring(0,10)+"&projectId="+projectId+"&detectionTypeId="+detectionTypeId+"&detectionName="+val.detectionName);
			var pointData = [];
			var singleData = [];
			var grandtotalData = [];
			var displacementData = [];
			$(list).each(function(inde,value){
				xData.push(value.currentTimes.substring(11));
				pointData.push(value.totalLaserChange);
				singleData.push(value.speedChange);
				grandtotalData.push(value.currentLaserChange);
				displacementData.push(value.currentData);
				oTabel.fnAddData([
						val.detectionName,
						value.firstTime,
						value.firstData,
						value.previousTime,
						value.previousData,
						value.currentTimes,
						value.currentData,
						value.currentLaserChange,
						value.totalLaserChange,
						value.speedChange,
						value.smuCmsId,
						value.smuCmsChannel,
	          ]);
			});
//			symbol标志图形类型，默认自动选择（8种类型循环使用，不显示标志图形可设为'none'），默认循环选择类型有：
//			'circle' | 'rectangle' | 'triangle' | 'diamond' |
//			'emptyCircle' | 'emptyRectangle' | 'emptyTriangle' | 'emptyDiamond'
//			另外，还支持五种更特别的标志图形'heart'（心形）、'droplet'（水滴）、'pin'（标注）、'arrow'（箭头）和'star'（五角星），这并不出现在常规的8类图形中，但无论是在系列级还是数据级上你都可以指定使用，同时，'star' + n（n>=3)可变化出N角星，如指定为'star6'则可以显示6角星 
			
			var detectionpoint = {name:val.detectionName,type:'line',smooth:true,symbol:'circle',data:pointData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
			var singlepoint = {name:val.detectionName,type:'line',smooth:true,symbol:'circle',data:singleData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
			var grandtotalpoint = {name:val.detectionName,type:'line',smooth:true,symbol:'circle',data:grandtotalData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
			var displacementpoint = {name:val.detectionName,type:'line',smooth:true,symbol:'circle',data:displacementData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
			rateSeries.push(detectionpoint);
			singleSeries.push(singlepoint);
			grandtotalSeries.push(grandtotalpoint);
			displacementSeries.push(displacementpoint);
		var ratetion = {
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					orient : 'horizontal',
					x : 'center',
					selected : selected,
					data : legenData
				},
				toolbox : {
					show : true,
					orient : 'vertical',
					feature : {
						mark : {
							show : true
						},
						dataView : {
							show : true,
							readOnly : false
						},
						magicType : {
							show : true,
							type : [ 'line', 'bar' ]
						},
						restore : {
							show : true
						},
						saveAsImage : {
							show : true
						}
					}
				},
				calculable : true,
				xAxis : [ {
					type : 'category',
					boundaryGap : false,
					data : xData,
					axisLine : {
						show : true,
						lineStyle : {
							color : '#48b',
							width : 2,
							type : 'solid'
						}
					},
					axisLabel : {
						show : true,
						formatter : '{value}'
					},
					splitLine : { // 分隔线
						show : true, // 默认显示，属性show控制显示与否
						// onGap: null,
						lineStyle : { // 属性lineStyle（详见lineStyle）控制线条样式
							color : [ '#ccc' ],
							width : 1,
							type : 'solid'
						}
					},
					splitArea : { // 分隔区域
						show : false, // 默认不显示，属性show控制显示与否
						// onGap: true,
						areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
							color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
						}
					}
				} ],
				yAxis : [ {
					type : 'value',
					data : [ 0, 5, 10, 15 ],
					axisLabel : {
						formatter : '{value} mm'
					},
					markLine : {
						data : [ [ {
							name : '标线1起点',
							value : 5,
							xAxis : 0,
							yAxis : 5
						}, // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
						// {name: '标线1终点', xAxis: '周日', yAxis:5}, //
						// 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
						] ]
					},
					splitArea : { // 分隔区域
						show : true, // 默认不显示，属性show控制显示与否
						areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
							color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
						}
					}
				}

				],
				line : {
					itemStyle : {
						normal : {
							// color:各异,
							label : {
								show : false
							// position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
							// 'inside'|'left'|'right'|'top'|'bottom'
							// textStyle: null // 默认使用全局文本样式，详见TEXTSTYLE
							},
							lineStyle : {
								width : 2,
								type : 'solid',
								shadowColor : 'rgba(0,0,0,0)', // 默认透明
								shadowBlur : 5,
								shadowOffsetX : 3,
								shadowOffsetY : 3
							}
						},
						emphasis : {
							// color: 各异,
							label : {
								show : false
							// position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
							// 'inside'|'left'|'right'|'top'|'bottom'
							// textStyle: null // 默认使用全局文本样式，详见TEXTSTYLE
							}
						}
					},
					smooth : true, // 曲线平滑
					symbol : 'none', // 拐点图形类型
					symbolSize : 2, // 拐点图形大小
					// symbolRotate : null, // 拐点图形旋转控制
					showAllSymbol : false
				// 标志图形默认只有主轴显示（随主轴标签间隔隐藏策略）
				},
				series : rateSeries
			};
			rateChart.clear();
			rateChart.setOption(ratetion);
			window.addEventListener("resize",function(){
				rateChart.resize();
		                 });
//			$(window).resize(rateChart.resize);
			
			
			var grandtotaltion = {
					tooltip : {
						trigger : 'axis'
					},
					legend : {
						orient : 'horizontal',
						x : 'center',
						selected : selected,
						data : grandtotaldatas
					},
					toolbox : {
						show : true,
						orient : 'vertical',
						feature : {
							mark : {
								show : true
							},
							dataView : {
								show : true,
								readOnly : false
							},
							magicType : {
								show : true,
								type : [ 'line', 'bar' ]
							},
							restore : {
								show : true
							},
							saveAsImage : {
								show : true
							}
						}
					},
					calculable : true,
					xAxis : [ {
						type : 'category',
						boundaryGap : false,
						data : xData,
						axisLine : {
							show : true,
							lineStyle : {
								color : '#48b',
								width : 2,
								type : 'solid'
							}
						},
						axisLabel : {
							show : true,
							formatter : '{value}'
						},
						splitLine : { // 分隔线
							show : true, // 默认显示，属性show控制显示与否
							// onGap: null,
							lineStyle : { // 属性lineStyle（详见lineStyle）控制线条样式
								color : [ '#ccc' ],
								width : 1,
								type : 'solid'
							}
						},
						splitArea : { // 分隔区域
							show : false, // 默认不显示，属性show控制显示与否
							// onGap: true,
							areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
								color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
							}
						}
					} ],
					yAxis : [ {
						type : 'value',
						data : [ 0, 5, 10, 15 ],
						axisLabel : {
							formatter : '{value} mm'
						},
						markLine : {
							data : [ [ {
								name : '标线1起点',
								value : 5,
								xAxis : 0,
								yAxis : 5
							}, // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
							// {name: '标线1终点', xAxis: '周日', yAxis:5}, //
							// 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
							] ]
						},
						splitArea : { // 分隔区域
							show : true, // 默认不显示，属性show控制显示与否
							areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
								color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
							}
						}
					}

					],
					line : {
						itemStyle : {
							normal : {
								// color:各异,
								label : {
									show : false
								// position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
								// 'inside'|'left'|'right'|'top'|'bottom'
								// textStyle: null // 默认使用全局文本样式，详见TEXTSTYLE
								},
								lineStyle : {
									width : 2,
									type : 'solid',
									shadowColor : 'rgba(0,0,0,0)', // 默认透明
									shadowBlur : 5,
									shadowOffsetX : 3,
									shadowOffsetY : 3
								}
							},
							emphasis : {
								// color: 各异,
								label : {
									show : false
								// position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
								// 'inside'|'left'|'right'|'top'|'bottom'
								// textStyle: null // 默认使用全局文本样式，详见TEXTSTYLE
								}
							}
						},
						smooth : true, // 曲线平滑
						symbol : 'none', // 拐点图形类型
						symbolSize : 2, // 拐点图形大小
						// symbolRotate : null, // 拐点图形旋转控制
						showAllSymbol : false
					// 标志图形默认只有主轴显示（随主轴标签间隔隐藏策略）
					},
					series : grandtotalSeries
				};
				grandtotalChart.clear();
				grandtotalChart.setOption(grandtotaltion);
				window.addEventListener("resize",function(){
					grandtotalChart.resize();
			                 });
//				$(window).resize(grandtotalChart.resize);
				
				
				var singletion = {
					tooltip : {
						trigger : 'axis'
					},
					legend : {
						orient : 'horizontal',
						x : 'center',
						selected : selected,
						data : singlelegen
					},
					toolbox : {
						show : true,
						orient : 'vertical',
						feature : {
							mark : {
								show : true
							},
							dataView : {
								show : true,
								readOnly : false
							},
							magicType : {
								show : true,
								type : [ 'line', 'bar' ]
							},
							restore : {
								show : true
							},
							saveAsImage : {
								show : true
							}
						}
					},
					calculable : true,
					xAxis : [ {
						type : 'category',
						boundaryGap : false,
						data : xData,
						axisLine : {
							show : true,
							lineStyle : {
								color : '#48b',
								width : 2,
								type : 'solid'
							}
						},
						axisLabel : {
							show : true,
							formatter : '{value}'
						},
						splitLine : { // 分隔线
							show : true, // 默认显示，属性show控制显示与否
							// onGap: null,
							lineStyle : { // 属性lineStyle（详见lineStyle）控制线条样式
								color : [ '#ccc' ],
								width : 1,
								type : 'solid'
							}
						},
						splitArea : { // 分隔区域
							show : false, // 默认不显示，属性show控制显示与否
							// onGap: true,
							areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
								color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
							}
						}
					} ],
					yAxis : [ {
						type : 'value',
						data : [ 0, 5, 10, 15 ],
						axisLabel : {
							formatter : '{value} mm'
						},
						markLine : {
							data : [ [ {
								name : '标线1起点',
								value : 5,
								xAxis : 0,
								yAxis : 5
							}, // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
							// {name: '标线1终点', xAxis: '周日', yAxis:5}, //
							// 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
							] ]
						},
						splitArea : { // 分隔区域
							show : true, // 默认不显示，属性show控制显示与否
							areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
								color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
							}
						}
					}

					],
					line : {
						itemStyle : {
							normal : {
								// color:各异,
								label : {
									show : false
								// position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
								// 'inside'|'left'|'right'|'top'|'bottom'
								// textStyle: null // 默认使用全局文本样式，详见TEXTSTYLE
								},
								lineStyle : {
									width : 2,
									type : 'solid',
									shadowColor : 'rgba(0,0,0,0)', // 默认透明
									shadowBlur : 5,
									shadowOffsetX : 3,
									shadowOffsetY : 3
								}
							},
							emphasis : {
								// color: 各异,
								label : {
									show : false
								// position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
								// 'inside'|'left'|'right'|'top'|'bottom'
								// textStyle: null // 默认使用全局文本样式，详见TEXTSTYLE
								}
							}
						},
						smooth : true, // 曲线平滑
						symbol : 'none', // 拐点图形类型
						symbolSize : 2, // 拐点图形大小
						// symbolRotate : null, // 拐点图形旋转控制
						showAllSymbol : false
					// 标志图形默认只有主轴显示（随主轴标签间隔隐藏策略）
					},
					series : singleSeries
				};
				singleChart.clear();
				singleChart.setOption(singletion);
				window.addEventListener("resize",function(){
					singleChart.resize();
			                 });
//				$(window).resize(singleChart.resize);
				
				
				
				var displacementtion = {
					tooltip : {
						trigger : 'axis'
					},
					legend : {
						orient : 'horizontal',
						x : 'center',
						selected : selected,
						data : displacementlegen
					},
					toolbox : {
						show : true,
						orient : 'vertical',
						feature : {
							mark : {
								show : true
							},
							dataView : {
								show : true,
								readOnly : false
							},
							magicType : {
								show : true,
								type : [ 'line', 'bar' ]
							},
							restore : {
								show : true
							},
							saveAsImage : {
								show : true
							}
						}
					},
					calculable : true,
					xAxis : [ {
						type : 'category',
						boundaryGap : false,
						data : xData,
						axisLine : {
							show : true,
							lineStyle : {
								color : '#48b',
								width : 2,
								type : 'solid'
							}
						},
						axisLabel : {
							show : true,
							formatter : '{value}'
						},
						splitLine : { // 分隔线
							show : true, // 默认显示，属性show控制显示与否
							// onGap: null,
							lineStyle : { // 属性lineStyle（详见lineStyle）控制线条样式
								color : [ '#ccc' ],
								width : 1,
								type : 'solid'
							}
						},
						splitArea : { // 分隔区域
							show : false, // 默认不显示，属性show控制显示与否
							// onGap: true,
							areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
								color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
							}
						}
					} ],
					yAxis : [ {
						type : 'value',
						data : [ 0, 5, 10, 15 ],
						axisLabel : {
							formatter : '{value} mm'
						},
						markLine : {
							data : [ [ {
								name : '标线1起点',
								value : 5,
								xAxis : 0,
								yAxis : 5
							}, // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
							// {name: '标线1终点', xAxis: '周日', yAxis:5}, //
							// 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
							] ]
						},
						splitArea : { // 分隔区域
							show : true, // 默认不显示，属性show控制显示与否
							areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
								color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
							}
						}
					}

					],
					line : {
						itemStyle : {
							normal : {
								// color:各异,
								label : {
									show : false
								// position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
								// 'inside'|'left'|'right'|'top'|'bottom'
								// textStyle: null // 默认使用全局文本样式，详见TEXTSTYLE
								},
								lineStyle : {
									width : 2,
									type : 'solid',
									shadowColor : 'rgba(0,0,0,0)', // 默认透明
									shadowBlur : 5,
									shadowOffsetX : 3,
									shadowOffsetY : 3
								}
							},
							emphasis : {
								// color: 各异,
								label : {
									show : false
								// position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
								// 'inside'|'left'|'right'|'top'|'bottom'
								// textStyle: null // 默认使用全局文本样式，详见TEXTSTYLE
								}
							}
						},
						smooth : true, // 曲线平滑
						symbol : null, // 拐点图形类型
						symbolSize : 1, // 拐点图形大小
						// symbolRotate : null, // 拐点图形旋转控制
						showAllSymbol : false
					// 标志图形默认只有主轴显示（随主轴标签间隔隐藏策略）
					},
					series : displacementSeries
				};
				displacementChart.clear();
				displacementChart.setOption(displacementtion);
				window.addEventListener("resize",function(){
					displacementChart.resize();
			                 });
//				$(window).resize(displacementChart.resize);
	}
	
	
	

}
	
function thresholdData(threshold,id,rateSeries,legenData){
	var num = 0;
	var mindata = threshold[id].minThresholdValue;
	var maxdata = threshold[id].maxThresholdValue;
	if(mindata!=null){
		num++;
		var name = "警戒值"+num;
		var namebegin = "警戒值"+num+"起点";
		var nameend = "警戒值"+num+"终点";
		legenData.push(name);
		var alardata = {name : name,type : 'line',symbol : 'none',data : [ 0 ],itemStyle : {normal : {color : '#FE0202',}},markLine : {data : [ [ {name : namebegin,value : mindata,xAxis : -1,yAxis : mindata}, {name : nameend,xAxis : 6000,yAxis : mindata},]]},};
		rateSeries.push(alardata);
	}
	if(maxdata!=null){
		num++;
		var name = "警戒值"+num;
		var namebegin = "警戒值"+num+"起点";
		var nameend = "警戒值"+num+"终点";
		legenData.push(name);
		var alardata = {name : name,type : 'line',symbol : 'none',data : [ 0 ],itemStyle : {normal : {color : '#FE0202',}},markLine : {data : [ [ {name : namebegin,value : maxdata,xAxis : -1,yAxis : maxdata}, {name : nameend,xAxis : 6000,yAxis : maxdata},]]},};
		rateSeries.push(alardata);
	}
}
	
	
	
	
		