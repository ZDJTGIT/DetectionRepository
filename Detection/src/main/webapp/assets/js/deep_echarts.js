
//后台数据处理begin
	var displaceData = sensorJson;
	var deeparr = deeparry;
	
	//把数据转做Json对象
	var sensorMap = JSON.parse(displaceData);
	var depth = JSON.parse(deeparr);
	var selected = {
			};
	var str = {};//设置测点折线默认不显示
	var legenData = ['警戒值1', '警戒值2'];//legend属性中的data数据，添加测点个数
	var displacementlegen = [];
	var singlelegen = ['警戒值1'];
	var xData = depth;
	if(xData.length==0){
		xData = [ '0.5', '1.0', '1.5', '2.0', '2.5', '3.0', '3.5', '4.0', '4.5',
					'5.0', '5.5', '6.0', '6.5', '7.0', '7.5', '8.0', '8.5', '9.0', '9.5',
					'10.0', '10.5', '11.0', '11.5', '12.0', '12.5', '13.0', '13.5',
					'14.0', '14.5', '15.0', '15.5', '16.0', '16.5', '17.0', '17.5',
					'18.0', '18.5', '19.0', '19.5', '20.0' ];
		
	}
	var rateSeries = [{name : '警戒值1',type : 'line',symbol : 'none',data : [ 0 ],itemStyle : {normal : {color : '#FE0202',}},markLine : {data : [ [ {name : '警戒值1起点',value : 30,xAxis : -1,yAxis : 30}, {name : '警戒值1终点',xAxis : 60,yAxis : 30},]]},},
	                  {name : '警戒值2',type : 'line',symbol : 'none',itemStyle : {normal : {color : '#FE0202',}},data : [ 0 ],markLine : {data : [ [ {name : '警戒值2起点',value : -30,xAxis : -1,yAxis : -30}, {name : '警戒值2终点',xAxis : 60,yAxis : -30}, ] ]}}];
	var singleSeries = [{name : '警戒值1',type : 'line',symbol : 'none',data : [ 0 ],itemStyle : {normal : {color : '#FE0202',}},markLine : {data : [ [ {name : '警戒值1起点',value : 5,xAxis : -1,yAxis : 5},{name : '警戒值1终点',xAxis : 60,yAxis : 5},]]},}];
	var grandtotalSeries = [{name : '警戒值1',type : 'line',symbol : 'none',data : [ 0 ],itemStyle : {normal : {color : '#FE0202',}},markLine : {data : [ [ {name : '警戒值1起点',value : 30,xAxis : -1,yAxis : 30},{name : '警戒值1终点',xAxis : 60,yAxis : 30},] ]},},
	  	                  {name : '警戒值2',type : 'line',symbol : 'none',itemStyle : {normal : {color : '#FE0202',}},data : [ 0 ],markLine : {data : [ [ {name : '警戒值2起点',value : -30,xAxis : -1,yAxis : -30},{name : '警戒值2终点',xAxis : 60,yAxis : -30},] ]}}];
	var displacementSeries = [];
	$.each(sensorMap,function(key,value){
		selected[key]=false;
		legenData.push(key);
		displacementlegen.push(key);
		singlelegen.push(key);
		var pointData = [];
		var singleData = [];
		var grandtotalData = [];
		var displacementData = [];
		$(depth).each(function(index,val){
			if(value[val]==null){
				val = ''+val+'.0';
			}
			if(value[val]!=null){
				pointData.push(value[val].slopeDisplacementData.totalDisplacement);
				singleData.push(value[val].slopeDisplacementData.speedChange);
				grandtotalData.push(value[val].slopeDisplacementData.currentDisplacement);
				displacementData.push(value[val].slopeDisplacementData.currentData);
			}
		});
		var detectionpoint = {name:key,type:'line',smooth:true,symbol:'droplet',data:pointData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
		var singlepoint = {name:key,type:'line',smooth:true,symbol:'droplet',data:singleData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
		var grandtotalpoint = {name:key,type:'line',smooth:true,symbol:'droplet',data:grandtotalData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
		var displacementpoint = {name:key,type:'line',smooth:true,symbol:'droplet',data:displacementData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}};
		rateSeries.push(detectionpoint);
		singleSeries.push(singlepoint);
		grandtotalSeries.push(grandtotalpoint);
		displacementSeries.push(displacementpoint);
	});
		
	//后台数据处理end

$(function() {
	
	
	
	var singleChart = echarts.init(document
			.getElementById("echarts-single-chart"));
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
	singleChart.setOption(singletion);
	$(window).resize(singleChart.resize);

	var grandtotalChart = echarts.init(document
			.getElementById("echarts-grandtotal-chart"));
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
	grandtotalChart.setOption(grandtotaltion);
	$(window).resize(grandtotalChart.resize);

	
	var rateChart = echarts.init(document.getElementById("echarts-rate-chart"));
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
	rateChart.setOption(ratetion);
	$(window).resize(rateChart.resize);

	var displacementChart = echarts.init(document
			.getElementById("echarts-displacement-chart"));
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
		// 标志图形默认只有主轴显示（随主轴标签间隔隐藏策略）
		},
		series : displacementSeries
	};
	displacementChart.setOption(displacementtion);
	$(window).resize(displacementChart.resize);
});