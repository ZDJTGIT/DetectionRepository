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
			selected : {
				'测点1' : false,
				'测点2' : false,
				'测点3' : false,
				'测点4' : false,
				'测点5' : false,
				'测点6' : false,
				'测点7' : false,
				'测点8' : false,
			},
			data : [ '警戒值1', '测点1', '测点2', '测点3', '测点4', '测点5', '测点6', '测点7',
					'测点8' ]
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
			data : [ '0.5', '1', '1.5', '2', '2.5', '3', '3.5', '4', '4.5',
					'5', '5.5', '6', '6.5', '7', '7.5', '8', '8.5', '9', '9.5',
					'10', '10.5', '11', '11.5', '12', '12.5', '13', '13.5',
					'14', '14.5', '15', '15.5', '16', '16.5', '17', '17.5',
					'18', '18.5', '19', '19.5', '20' ],
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
		series : [

				{
					name : '警戒值1',
					type : 'line',
					symbol : 'none',
					data : [ 0 ],
					itemStyle : {
						normal : {
							color : '#FE0202',
						}
					},
					markLine : {
						data : [ [ {
							name : '警戒值1起点',
							value : 5,
							xAxis : -1,
							yAxis : 5
						}, // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
						{
							name : '警戒值1终点',
							xAxis : 60,
							yAxis : 5
						}, // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
						] ]
					},

				},

				// {
				// name : '警戒值2',
				// type : 'line',
				// symbol : 'none',
				// itemStyle : {
				// normal : {
				// color : '#FE0202',
				// }
				// },
				// data : [ 0 ],
				// markLine : {
				// data : [ [ {
				// name : '警戒值2起点',
				// value : -30,
				// xAxis : -1,
				// yAxis : -30
				// }, //
				// 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
				// {
				// name : '警戒值2终点',
				// xAxis : 60,
				// yAxis : -30
				// }, // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
				// ] ]
				// }
				// },
				{

					name : '测点1',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 0.02, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0.01, 0.01, 0,
							0, -0.01, 0, 0.01, 0, 0.01, 0, 0, 0, 0.01, 0, 0, 0,
							0, 0, 0.01, 0.03, 0.01, 0, 0.01, 0, -0.01, 0, 0, 0,
							0.01, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},

				},
				{
					name : '测点2',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
							0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				},
				{
					name : '测点3',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 0.33, 0.17, 0.21, 0.28, 0.19, 0.22, 0.25, 0.26,
							0.36, 0.38, 0.38, 0.34, 0.26, 0.21, 0.14, 0.17,
							0.08, 0.07, 0.11, 0.14, 0.14, 0.09, 0.1, 0.06,
							0.11, 0.08, 0.03, 0, 0, 0.01, 0.02, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				},
				{
					name : '测点4',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 0.13, 0.14, 0.09, 0.07, 0.12, 0.21, 0.24, 0.24,
							0.32, 0.3, 0.26, 0.25, 0.2, 0.17, 0.2, 0.22, 0.23,
							0.21, 0.17, 0.14, 0.15, 0.14, 0.09, 0.11, 0.16,
							0.1, 0.05, 0.07, 0.04, 0.02, 0, 0.01, 0.01, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				},
				{
					name : '测点5',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 0, 0, 0, 0, 0, 0, 0, -0.01, 0, -0.01, 0, 0, 0, 0,
							0, 0, 0, 0, 0, -0.01, 0, 0, 0, 0, 0, 0, -0.01, 0,
							0, 0, 0, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				}, {
					name : '测点6',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 5, 2, 10, 12, 8, 4, 14, 11, 7 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				}, {
					name : '测点7',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 14, 3, 9, 0, 2, 13, 9, 5, 12 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				}, {
					name : '测点8',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 10, 6, 9, 8, 8, 0, 8, 12, 0 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				} ]
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
			selected : {
				'测点1' : false,
				'测点2' : false,
				'测点3' : false,
				'测点4' : false,
				'测点5' : false,
				'测点6' : false,
				'测点7' : false,
				'测点8' : false,
			},
			data : [ '警戒值1', '警戒值2', '测点1', '测点2', '测点3', '测点4', '测点5', '测点6',
					'测点7', '测点8' ]
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
			data : [ '0.5', '1', '1.5', '2', '2.5', '3', '3.5', '4', '4.5',
					'5', '5.5', '6', '6.5', '7', '7.5', '8', '8.5', '9', '9.5',
					'10', '10.5', '11', '11.5', '12', '12.5', '13', '13.5',
					'14', '14.5', '15', '15.5', '16', '16.5', '17', '17.5',
					'18', '18.5', '19', '19.5', '20' ],
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
		series : [

				{
					name : '警戒值1',
					type : 'line',
					symbol : 'none',
					data : [ 0 ],
					itemStyle : {
						normal : {
							color : '#FE0202',
						}
					},
					markLine : {
						data : [ [ {
							name : '警戒值1起点',
							value : 30,
							xAxis : -1,
							yAxis : 30
						}, // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
						{
							name : '警戒值1终点',
							xAxis : 60,
							yAxis : 30
						}, // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
						] ]
					},

				},

				{
					name : '警戒值2',
					type : 'line',
					symbol : 'none',
					itemStyle : {
						normal : {
							color : '#FE0202',
						}
					},
					data : [ 0 ],
					markLine : {
						data : [ [ {
							name : '警戒值2起点',
							value : -30,
							xAxis : -1,
							yAxis : -30
						}, // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
						{
							name : '警戒值2终点',
							xAxis : 60,
							yAxis : -30
						}, // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
						] ]
					}
				},
				{

					name : '测点1',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 0.09, -0.3, 0.19, 0.38, 0.43, 0.75, 1.15, 1.77,
							2.24, 2.61, 2.84, 2.97, 3.84, 3.83, 4.23, 4.8,
							5.57, 6.78, 6.89, 8.27, 8.37, 8.08, 8.39, 8.16,
							7.61, 6.92, 6.81, 6.36, 5.77, 5.49, 4.94, 4.1,
							3.51, 2.97, 2.34, 1.81, 1.23, 0.59, 0.69, 0.16 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},

				},
				{
					name : '测点2',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ -0.4, -0.46, -0.47, -0.49, -0.44, -0.43, -0.4,
							-0.38, -0.39, -0.41, -0.4, -0.4, -0.35, -0.33,
							-0.32, -0.27, -0.25, -0.25, -0.24, -0.26, -0.23,
							-0.22, -0.23, -0.24, -0.24, -0.26, -0.27, -0.26,
							-0.16, -0.13, -0.05, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				},
				{
					name : '测点3',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 1.05, 0.85, 0.88, 0.96, 0.86, 0.82, 0.85, 0.81,
							0.86, 0.9, 0.89, 0.87, 0.8, 0.71, 0.66, 0.75, 0.68,
							0.75, 0.71, 0.67, 0.62, 0.61, 0.63, 0.57, 0.71,
							0.7, 0.62, 0.55, 0.51, 0.38, 0.2, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				},
				{
					name : '测点4',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 0.85, 1.11, 1.19, 1.18, 1.19, 1.2, 1.22, 1.16,
							1.15, 1.12, 1.12, 1.08, 1.02, 1, 1.02, 0.92, 0.84,
							0.64, 0.6, 0.53, 0.5, 0.43, 0.39, 0.35, 0.32, 0.24,
							0.2, 0.19, 0.12, 0.09, 0.09, 0.1, 0.01, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				},
				{
					name : '测点5',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ -0.09, -0.43, 0.19, -0.21, -0.38, -0.35, -0.02,
							0.03, 0.21, -1.01, -1.01, -0.33, -0.33, -0.35,
							-1.28, -0.71, -0.96, -0.12, -3.88, -4.17, -2.67,
							-2.74, -2.07, -1.45, -1.68, -0.85, -0.65, -0.58,
							-0.48, -0.2, 0.01, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				}, {
					name : '测点6',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 5, 2, 10, 12, 8, 4, 14, 11, 7 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				}, {
					name : '测点7',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 14, 3, 9, 0, 2, 13, 9, 5, 12 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				}, {
					name : '测点8',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 10, 6, 9, 8, 8, 0, 8, 12, 0 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				} ]
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
			selected : {
				'测点1' : false,
				'测点2' : false,
				'测点3' : false,
				'测点4' : false,
				'测点5' : false,
				'测点6' : false,
				'测点7' : false,
				'测点8' : false,
			},
			data : [ '警戒值1', '警戒值2', '测点1', '测点2', '测点3', '测点4', '测点5', '测点6',
					'测点7', '测点8' ]
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
			data : [ '0.5', '1', '1.5', '2', '2.5', '3', '3.5', '4', '4.5',
					'5', '5.5', '6', '6.5', '7', '7.5', '8', '8.5', '9', '9.5',
					'10', '10.5', '11', '11.5', '12', '12.5', '13', '13.5',
					'14', '14.5', '15', '15.5', '16', '16.5', '17', '17.5',
					'18', '18.5', '19', '19.5', '20' ],
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
		series : [

				{
					name : '警戒值1',
					type : 'line',
					symbol : 'none',
					data : [ 0 ],
					itemStyle : {
						normal : {
							color : '#FE0202',
						}
					},
					markLine : {
						data : [ [ {
							name : '警戒值1起点',
							value : 30,
							xAxis : -1,
							yAxis : 30
						}, // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
						{
							name : '警戒值1终点',
							xAxis : 60,
							yAxis : 30
						}, // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
						] ]
					},

				},

				{
					name : '警戒值2',
					type : 'line',
					symbol : 'none',
					itemStyle : {
						normal : {
							color : '#FE0202',
						}
					},
					data : [ 0 ],
					markLine : {
						data : [ [ {
							name : '警戒值2起点',
							value : -30,
							xAxis : -1,
							yAxis : -30
						}, // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
						{
							name : '警戒值2终点',
							xAxis : 60,
							yAxis : -30
						}, // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
						] ]
					}
				},
				{

					name : '测点1',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 0.09, -0.3, 0.19, 0.38, 0.43, 0.75, 1.15, 1.77,
							2.24, 2.61, 2.84, 2.97, 3.84, 3.83, 4.23, 4.8,
							5.57, 6.78, 6.89, 8.27, 8.37, 8.08, 8.39, 8.16,
							7.61, 6.92, 6.81, 6.36, 5.77, 5.49, 4.94, 4.1,
							3.51, 2.97, 2.34, 1.81, 1.23, 0.59, 0.69, 0.16 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},

				},
				{
					name : '测点2',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ -0.4, -0.46, -0.47, -0.49, -0.44, -0.43, -0.4,
							-0.38, -0.39, -0.41, -0.4, -0.4, -0.35, -0.33,
							-0.32, -0.27, -0.25, -0.25, -0.24, -0.26, -0.23,
							-0.22, -0.23, -0.24, -0.24, -0.26, -0.27, -0.26,
							-0.16, -0.13, -0.05, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				},
				{
					name : '测点3',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 1.05, 0.85, 0.88, 0.96, 0.86, 0.82, 0.85, 0.81,
							0.86, 0.9, 0.89, 0.87, 0.8, 0.71, 0.66, 0.75, 0.68,
							0.75, 0.71, 0.67, 0.62, 0.61, 0.63, 0.57, 0.71,
							0.7, 0.62, 0.55, 0.51, 0.38, 0.2, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				},
				{
					name : '测点4',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 0.85, 1.11, 1.19, 1.18, 1.19, 1.2, 1.22, 1.16,
							1.15, 1.12, 1.12, 1.08, 1.02, 1, 1.02, 0.92, 0.84,
							0.64, 0.6, 0.53, 0.5, 0.43, 0.39, 0.35, 0.32, 0.24,
							0.2, 0.19, 0.12, 0.09, 0.09, 0.1, 0.01, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				},
				{
					name : '测点5',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ -0.09, -0.43, 0.19, -0.21, -0.38, -0.35, -0.02,
							0.03, 0.21, -1.01, -1.01, -0.33, -0.33, -0.35,
							-1.28, -0.71, -0.96, -0.12, -3.88, -4.17, -2.67,
							-2.74, -2.07, -1.45, -1.68, -0.85, -0.65, -0.58,
							-0.48, -0.2, 0.01, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				}, {
					name : '测点6',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 5, 2, 10, 12, 8, 4, 14, 11, 7 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				}, {
					name : '测点7',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 14, 3, 9, 0, 2, 13, 9, 5, 12 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				}, {
					name : '测点8',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 10, 6, 9, 8, 8, 0, 8, 12, 0 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				} ]
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
			selected : {
				'测点1' : false,
				'测点2' : false,
				'测点3' : false,
				'测点4' : false,
				'测点5' : false,
				'测点6' : false,
				'测点7' : false,
				'测点8' : false,
			},
			data : [  '测点1', '测点2', '测点3', '测点4', '测点5', '测点6',
					'测点7', '测点8' ]
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
			data : [ '0.5', '1', '1.5', '2', '2.5', '3', '3.5', '4', '4.5',
					'5', '5.5', '6', '6.5', '7', '7.5', '8', '8.5', '9', '9.5',
					'10', '10.5', '11', '11.5', '12', '12.5', '13', '13.5',
					'14', '14.5', '15', '15.5', '16', '16.5', '17', '17.5',
					'18', '18.5', '19', '19.5', '20' ],
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
		series : [

				
				{

					name : '测点1',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 420.78, 410.36, 401.48, 394.47, 387.36, 378.62,
							369.78, 361.35, 352.76, 342.68, 331.36, 318.52,
							305.36, 290.35, 274.58, 259.54, 244.81, 234.39,
							225.64, 219.76, 214.84, 207.39, 198.75, 188.26,
							175.31, 161.73, 148.57, 135.59, 123.24, 111.35,
							99.23, 86.79, 75.68, 65.24, 54.87, 44.59, 35.36,
							25.61, 17.15, 8.64, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},

				},
				{
					name : '测点2',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 95.95, 114.17, 116.87, 117.07, 117.19, 113.93,
							108.78, 101.78, 94.76, 85.17, 76.37, 71.03, 68.29,
							67.45, 68.12, 65.35, 59.28, 56.45, 52.49, 48.58,
							45.65, 41.83, 37.34, 31.53, 26.93, 22.46, 18.88,
							15.42, 8.94, 4.32, 2.07, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				},
				{
					name : '测点3',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ -37.62, -41.75, -45.82, -48.3, -49.6, -51.9,
							-52.77, -52.26, -48.58, -42.55, -36.85, -32.11,
							-28.86, -26.41, -25.43, -26.03, -29.77, -30.25,
							-27.51, -22.48, -15.83, -12.1, -9.81, -8.35, -7.81,
							-6.44, -6.42, -7.91, -7.87, -6.67, -3.89, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				},
				{
					name : '测点4',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 606.27, 593.69, 581.62, 567.62, 553.51, 538.94,
							522.05, 504, 486.24, 469.51, 454.27, 439.03,
							423.86, 409.14, 396.57, 379.85, 361.01, 341.57,
							321.1, 299.88, 276.97, 252.19, 226.4, 203.62,
							183.11, 162.21, 140.39, 121.73, 104.12, 86.47,
							67.46, 45.46, 22.93, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				},
				{
					name : '测点5',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 335.05, 318.78, 308.84, 299.44, 294.05, 292.1,
							293.1, 296.46, 302.36, 306.12, 309.12, 309.77,
							311.43, 307.76, 303.28, 296.36, 280.67, 260.05,
							237.78, 213.46, 188.77, 165.01, 143.58, 126.28,
							108.98, 92.86, 78.61, 64.11, 46.69, 31.01, 15.2, ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				}, {
					name : '测点6',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 5, 2, 10, 12, 8, 4, 14, 11, 7 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				}, {
					name : '测点7',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 14, 3, 9, 0, 2, 13, 9, 5, 12 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				}, {
					name : '测点8',
					type : 'line',
					smooth : true,
					symbol : 'droplet',
					data : [ 10, 6, 9, 8, 8, 0, 8, 12, 0 ],
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
				// markLine : {
				// data : [
				// {type : 'average', name: '平均值'}
				// ]
				// }
				} ]
	};
	displacementChart.setOption(displacementtion);
	$(window).resize(displacementChart.resize);
});