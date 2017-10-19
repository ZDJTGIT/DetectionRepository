	var sensroInfoData;
	$("#selectdispladata").click(function(){
		var diapladataText = $("#diapladata").val();
		var detectionTypeId = $("#detectionTypeId").text();
		var projectId = $("#projectId").text();
		if(diapladataText.length==0){
			alert("请选择时间！");
		}else{
			$.ajax({
				url: 'rest/project/selectdisplament',
				dataType: 'json',
				data : {currentTimes:diapladataText,projectId:projectId,detectionTypeId:detectionTypeId},
				success: function(data){
					sensroInfoData = data;
					
					$("#displaallnumber").children('option').remove();
					$("#displaalltime").children('option').remove();
					if(data.detectionNumsList.length==0){
						alert("当前日期没有数据");
					}else{
						var detectionNums = data.detectionNumsList;
						var timeList = data.timeList;
						
						$(detectionNums).each(function(index,val){
							var options = "<option id='"+val+"'>"+val+"</option>";
							var optiontime = "<option id='"+timeList[index]+"'>"+timeList[index]+"</option>";
							$("#displaallnumber").append(options);
							$("#displaalltime").append(optiontime);
						});
					}
				}
			});
		}
	});
	$(function() {
		var rateChart = echarts.init(document.getElementById("echarts-rate-chart"));//深部位移折线图对象
		var grandtotalChart = echarts.init(document.getElementById("echarts-grandtotal-chart"));
		var singleChart = echarts.init(document.getElementById("echarts-single-chart"));
		var displacementChart = echarts.init(document.getElementById("echarts-displacement-chart"));
			
			var selecttime ;
			var selectnumber;
			
			$("#displaallnumber").change(function(){
				
				selectnumber = $(this).val();//次数选项的值
				var selected = {};//设置测点数据加载时是否显示
				var legenData = ['警戒值1', '警戒值2'];//legend属性中的data数据，添加测点个数
				var displacementlegen = [];//legend属性中的data数据，添加测点个数
				var singlelegen = ['警戒值1'];//legend属性中的data数据，添加测点个数
				var detectionList = sensroInfoData.detectionList;//获取测点数组
				var xData = sensroInfoData.depthList;//获取高度填充X轴坐标数据
				var rateSeries = [{name : '警戒值1',type : 'line',symbol : 'none',data : [ 0 ],itemStyle : {normal : {color : '#FE0202',}},markLine : {data : [ [ {name : '警戒值1起点',value : 30,xAxis : -1,yAxis : 30}, {name : '警戒值1终点',xAxis : 60,yAxis : 30},]]},},
				                  {name : '警戒值2',type : 'line',symbol : 'none',itemStyle : {normal : {color : '#FE0202',}},data : [ 0 ],markLine : {data : [ [ {name : '警戒值2起点',value : -30,xAxis : -1,yAxis : -30}, {name : '警戒值2终点',xAxis : 60,yAxis : -30}, ] ]}}];
				var singleSeries = [{name : '警戒值1',type : 'line',symbol : 'none',data : [ 0 ],itemStyle : {normal : {color : '#FE0202',}},markLine : {data : [ [ {name : '警戒值1起点',value : 5,xAxis : -1,yAxis : 5},{name : '警戒值1终点',xAxis : 60,yAxis : 5},]]},}];
				var grandtotalSeries = [{name : '警戒值1',type : 'line',symbol : 'none',data : [ 0 ],itemStyle : {normal : {color : '#FE0202',}},markLine : {data : [ [ {name : '警戒值1起点',value : 30,xAxis : -1,yAxis : 30},{name : '警戒值1终点',xAxis : 60,yAxis : 30},] ]},},
				  	                  {name : '警戒值2',type : 'line',symbol : 'none',itemStyle : {normal : {color : '#FE0202',}},data : [ 0 ],markLine : {data : [ [ {name : '警戒值2起点',value : -30,xAxis : -1,yAxis : -30},{name : '警戒值2终点',xAxis : 60,yAxis : -30},] ]}}];
				var displacementSeries = [];
				var detectionIdValue = sensroInfoData.detectionIdValue;//所有数据Map
				oTabel.fnClearTable();//清空数据.fnClearTable();//清空数据  
				$(detectionList).each(function(index,detections){
					legenData.push(detections);
					displacementlegen.push(detections);
					singlelegen.push(detections);
					if(index>4){
						selected[detection]=false;
					}
					var slopdata = detectionIdValue[detectionList[index]][selectnumber];//该测点下深部位移所有对象
					
					var pointData = [];
					var singleData = [];
					var grandtotalData = [];
					var displacementData = [];
					$(xData).each(function(inde,val){
						if(slopdata[val]==null){
							val = val+".0"
						}
						if(slopdata[val]!=null){
							pointData.push(slopdata[val].totalDisplacement);
							singleData.push(slopdata[val].speedChange);
							grandtotalData.push(slopdata[val].currentDisplacement);
							displacementData.push(slopdata[val].currentData);
							oTabel.fnAddData([
	                  						detections,
	                                       val,
								            slopdata[val].firstTime,
								            slopdata[val].firstData,
								            slopdata[val].previousTime,
								            slopdata[val].previousData,
								            slopdata[val].currentTimes,
								            slopdata[val].currentData,
								            slopdata[val].currentDisplacement,
								            slopdata[val].totalDisplacement,
								            slopdata[val].speedChange,
								            slopdata[val].detectionHoleName,
								            slopdata[val].detectionNums,
								            slopdata[val].tester
	                                       ]);
						}
					});
					var detectionpoint = {name:detections,type:'line',smooth:true,symbol:'droplet',data:pointData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
					var singlepoint = {name:detections,type:'line',smooth:true,symbol:'droplet',data:singleData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
					var grandtotalpoint = {name:detections,type:'line',smooth:true,symbol:'droplet',data:grandtotalData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
					var displacementpoint = {name:detections,type:'line',smooth:true,symbol:'droplet',data:displacementData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
					rateSeries.push(detectionpoint);
					singleSeries.push(singlepoint);
					grandtotalSeries.push(grandtotalpoint);
					displacementSeries.push(displacementpoint);
					
				});
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
								formatter : '{value} m'
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
					$(window).resize(rateChart.resize);
					
					
					var grandtotaltion = {
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
									formatter : '{value} m'
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
						$(window).resize(grandtotalChart.resize);
						
						
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
									formatter : '{value} m'
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
						$(window).resize(singleChart.resize);
						
						
						
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
									formatter : '{value} m'
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
							// 标志图形默认只有主轴显示（随主轴标签间隔隐藏策略）
							},
							series : displacementSeries
						};
						displacementChart.clear();
						displacementChart.setOption(displacementtion);
						$(window).resize(displacementChart.resize);
						
						
			});
			
			
			$("#displaalltime").change(function(){
				selecttime = $(this).val();//次数选项的值
				var selected = {};//设置测点数据加载时是否显示
				var legenData = ['警戒值1', '警戒值2'];//legend属性中的data数据，添加测点个数
				var displacementlegen = [];//legend属性中的data数据，添加测点个数
				var singlelegen = ['警戒值1'];//legend属性中的data数据，添加测点个数
				var detectionList = sensroInfoData.detectionList;//获取测点数组
				var xData = sensroInfoData.depthList;//获取高度填充X轴坐标数据
				var rateSeries = [{name : '警戒值1',type : 'line',symbol : 'none',data : [ 0 ],itemStyle : {normal : {color : '#FE0202',}},markLine : {data : [ [ {name : '警戒值1起点',value : 30,xAxis : -1,yAxis : 30}, {name : '警戒值1终点',xAxis : 60,yAxis : 30},]]},},
				                  {name : '警戒值2',type : 'line',symbol : 'none',itemStyle : {normal : {color : '#FE0202',}},data : [ 0 ],markLine : {data : [ [ {name : '警戒值2起点',value : -30,xAxis : -1,yAxis : -30}, {name : '警戒值2终点',xAxis : 60,yAxis : -30}, ] ]}}];
				var singleSeries = [{name : '警戒值1',type : 'line',symbol : 'none',data : [ 0 ],itemStyle : {normal : {color : '#FE0202',}},markLine : {data : [ [ {name : '警戒值1起点',value : 5,xAxis : -1,yAxis : 5},{name : '警戒值1终点',xAxis : 60,yAxis : 5},]]},}];
				var grandtotalSeries = [{name : '警戒值1',type : 'line',symbol : 'none',data : [ 0 ],itemStyle : {normal : {color : '#FE0202',}},markLine : {data : [ [ {name : '警戒值1起点',value : 30,xAxis : -1,yAxis : 30},{name : '警戒值1终点',xAxis : 60,yAxis : 30},] ]},},
				  	                  {name : '警戒值2',type : 'line',symbol : 'none',itemStyle : {normal : {color : '#FE0202',}},data : [ 0 ],markLine : {data : [ [ {name : '警戒值2起点',value : -30,xAxis : -1,yAxis : -30},{name : '警戒值2终点',xAxis : 60,yAxis : -30},] ]}}];
				var displacementSeries = [];
				var detectionIdValue = sensroInfoData.detectionIdValue;//所有数据Map
				oTabel.fnClearTable();//清空数据.fnClearTable();//清空数据
				$(detectionList).each(function(index,detections){
					legenData.push(detections);
					displacementlegen.push(detections);
					singlelegen.push(detections);
					if(index>4){
						selected[detection]=false;
					}
					
					var slopdata = detectionIdValue[detectionList[index]][" "+selecttime];//该测点下深部位移所有对象
					
					var pointData = [];
					var singleData = [];
					var grandtotalData = [];
					var displacementData = [];
					$(xData).each(function(inde,val){
						if(slopdata[val]==null){
							val = val+".0"
						}
						if(slopdata[val]!=null){
							pointData.push(slopdata[val].totalDisplacement);
							singleData.push(slopdata[val].speedChange);
							grandtotalData.push(slopdata[val].currentDisplacement);
							displacementData.push(slopdata[val].currentData);
							oTabel.fnAddData([
	                  						detections,
	                                       val,
								            slopdata[val].firstTime,
								            slopdata[val].firstData,
								            slopdata[val].previousTime,
								            slopdata[val].previousData,
								            slopdata[val].currentTimes,
								            slopdata[val].currentData,
								            slopdata[val].currentDisplacement,
								            slopdata[val].totalDisplacement,
								            slopdata[val].speedChange,
								            slopdata[val].detectionHoleName,
								            slopdata[val].detectionNums,
								            slopdata[val].tester
	                                       ]);
						}
					});
					
					var detectionpoint = {name:detections,type:'line',smooth:true,symbol:'droplet',data:pointData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
					var singlepoint = {name:detections,type:'line',smooth:true,symbol:'droplet',data:singleData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
					var grandtotalpoint = {name:detections,type:'line',smooth:true,symbol:'droplet',data:grandtotalData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
					var displacementpoint = {name:detections,type:'line',smooth:true,symbol:'droplet',data:displacementData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
					rateSeries.push(detectionpoint);
					singleSeries.push(singlepoint);
					grandtotalSeries.push(grandtotalpoint);
					displacementSeries.push(displacementpoint);
				});
				
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
								formatter : '{value} m'
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
					$(window).resize(rateChart.resize);
					
					
					var grandtotaltion = {
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
									formatter : '{value} m'
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
						$(window).resize(grandtotalChart.resize);
						
						
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
									formatter : '{value} m'
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
						$(window).resize(singleChart.resize);
						
						
						
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
									formatter : '{value} m'
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
							// 标志图形默认只有主轴显示（随主轴标签间隔隐藏策略）
							},
							series : displacementSeries
						};
						displacementChart.clear();
						displacementChart.setOption(displacementtion);
						$(window).resize(displacementChart.resize);
			});
	});



	
	
	
	
	
		