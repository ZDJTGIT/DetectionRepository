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
			data : [ '警戒值MAX', '警戒值MIN', '测点1', '测点2', '测点3', '测点4', '测点5',
					'测点6', '测点7', '测点8' ]
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
			data : [ '2017.9.1', '2017.9.2', '2017.9.3', '2017.9.4',
					'2017.9.5', '2017.9.6', '2017.9.7', '2017.9.8', '2017.9.9',
					'2017.9.10', '2017.9.11', '2017.9.12', '2017.9.13',
					'2017.9.14', '2017.9.15', '2017.9.16', '2017.9.17',
					'2017.9.18', '2017.9.19', '2017.9.20', '2017.9.21',
					'2017.9.22', '2017.9.23', '2017.9.24', '2017.9.25',
					'2017.9.26', '2017.9.27', '2017.9.28', '2017.9.29',
					'2017.9.30' ],
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
				formatter : '{value} 号'
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
				}, // 当xAxis为类目轴号，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
				// {name: '标线1终点', xAxis: '周日', yAxis:5}, //
				// 当xAxis为类目轴号，字符串'周三'会被理解为与类目轴的文本进行匹配
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
			name : '警戒值MAX',
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
					name : '警戒值MAX起点',
					value : 9,
					xAxis : -1,
					yAxis : 9
				}, // 当xAxis为类目轴号，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
				{
					name : '警戒值MAX终点',
					xAxis : 9,
					yAxis : 9
				}, // 当xAxis为类目轴号，字符串'周三'会被理解为与类目轴的文本进行匹配
				] ]
			},

		},

		{
			name : '警戒值MIN',
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
					name : '警戒值MIN起点',
					value : 3,
					xAxis : -1,
					yAxis : 3
				}, // 当xAxis为类目轴号，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
				{
					name : '警戒值MIN终点',
					xAxis : 9,
					yAxis : 3
				}, // 当xAxis为类目轴号，字符串'周三'会被理解为与类目轴的文本进行匹配
				] ]
			}
		}, {

			name : '测点1',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 4, 14, 1, 2, 5, 7, 4, 11, 11 ],
			markPoint : {
				data : [ {
					type : 'max',
					name : '最大值'
				}, {
					type : 'min',
					name : '最小值'
				} ]
			},

		}, {
			name : '测点2',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 12, 7, 6, 11, 4, 3, 0, 0, 3 ],
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
			name : '测点3',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 14, 8, 1, 7, 3, 4, 10, 12, 14 ],
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
			name : '测点4',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 12, 8, 11, 8, 0, 3, 13, 5, 11 ],
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
			name : '测点5',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 12, 13, 4, 14, 9, 14, 3, 9, 10 ],
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
			data : [ '警戒值MAX', '警戒值MIN', '测点1', '测点2', '测点3', '测点4', '测点5',
					'测点6', '测点7', '测点8' ]
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
			data : [ '2017.9.1', '2017.9.2', '2017.9.3', '2017.9.4',
					'2017.9.5', '2017.9.6', '2017.9.7', '2017.9.8', '2017.9.9',
					'2017.9.10', '2017.9.11', '2017.9.12', '2017.9.13',
					'2017.9.14', '2017.9.15', '2017.9.16', '2017.9.17',
					'2017.9.18', '2017.9.19', '2017.9.20', '2017.9.21',
					'2017.9.22', '2017.9.23', '2017.9.24', '2017.9.25',
					'2017.9.26', '2017.9.27', '2017.9.28', '2017.9.29',
					'2017.9.30' ],
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
				formatter : '{value} 号'
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
				}, // 当xAxis为类目轴号，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
				// {name: '标线1终点', xAxis: '周日', yAxis:5}, //
				// 当xAxis为类目轴号，字符串'周三'会被理解为与类目轴的文本进行匹配
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
			name : '警戒值MAX',
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
					name : '警戒值MAX起点',
					value : 9,
					xAxis : -1,
					yAxis : 9
				}, // 当xAxis为类目轴号，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
				{
					name : '警戒值MAX终点',
					xAxis : 9,
					yAxis : 9
				}, // 当xAxis为类目轴号，字符串'周三'会被理解为与类目轴的文本进行匹配
				] ]
			},

		},

		{
			name : '警戒值MIN',
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
					name : '警戒值MIN起点',
					value : 3,
					xAxis : -1,
					yAxis : 3
				}, // 当xAxis为类目轴号，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
				{
					name : '警戒值MIN终点',
					xAxis : 9,
					yAxis : 3
				}, // 当xAxis为类目轴号，字符串'周三'会被理解为与类目轴的文本进行匹配
				] ]
			}
		}, {

			name : '测点1',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 4, 14, 1, 2, 5, 7, 4, 11, 11 ],
			markPoint : {
				data : [ {
					type : 'max',
					name : '最大值'
				}, {
					type : 'min',
					name : '最小值'
				} ]
			},

		}, {
			name : '测点2',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 12, 7, 6, 11, 4, 3, 0, 0, 3 ],
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
			name : '测点3',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 14, 8, 1, 7, 3, 4, 10, 12, 14 ],
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
			name : '测点4',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 12, 8, 11, 8, 0, 3, 13, 5, 11 ],
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
			name : '测点5',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 12, 13, 4, 14, 9, 14, 3, 9, 10 ],
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
			data : [ '警戒值MAX', '警戒值MIN', '测点1', '测点2', '测点3', '测点4', '测点5',
					'测点6', '测点7', '测点8' ]
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
			data : [ '2017.9.1', '2017.9.2', '2017.9.3', '2017.9.4',
					'2017.9.5', '2017.9.6', '2017.9.7', '2017.9.8', '2017.9.9',
					'2017.9.10', '2017.9.11', '2017.9.12', '2017.9.13',
					'2017.9.14', '2017.9.15', '2017.9.16', '2017.9.17',
					'2017.9.18', '2017.9.19', '2017.9.20', '2017.9.21',
					'2017.9.22', '2017.9.23', '2017.9.24', '2017.9.25',
					'2017.9.26', '2017.9.27', '2017.9.28', '2017.9.29',
					'2017.9.30' ],
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
				formatter : '{value} 号'
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
				}, // 当xAxis为类目轴号，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
				// {name: '标线1终点', xAxis: '周日', yAxis:5}, //
				// 当xAxis为类目轴号，字符串'周三'会被理解为与类目轴的文本进行匹配
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
			name : '警戒值MAX',
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
					name : '警戒值MAX起点',
					value : 9,
					xAxis : -1,
					yAxis : 9
				}, // 当xAxis为类目轴号，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
				{
					name : '警戒值MAX终点',
					xAxis : 9,
					yAxis : 9
				}, // 当xAxis为类目轴号，字符串'周三'会被理解为与类目轴的文本进行匹配
				] ]
			},

		},

		{
			name : '警戒值MIN',
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
					name : '警戒值MIN起点',
					value : 3,
					xAxis : -1,
					yAxis : 3
				}, // 当xAxis为类目轴号，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
				{
					name : '警戒值MIN终点',
					xAxis : 9,
					yAxis : 3
				}, // 当xAxis为类目轴号，字符串'周三'会被理解为与类目轴的文本进行匹配
				] ]
			}
		}, {

			name : '测点1',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 4, 14, 1, 2, 5, 7, 4, 11, 11 ],
			markPoint : {
				data : [ {
					type : 'max',
					name : '最大值'
				}, {
					type : 'min',
					name : '最小值'
				} ]
			},

		}, {
			name : '测点2',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 12, 7, 6, 11, 4, 3, 0, 0, 3 ],
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
			name : '测点3',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 14, 8, 1, 7, 3, 4, 10, 12, 14 ],
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
			name : '测点4',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 12, 8, 11, 8, 0, 3, 13, 5, 11 ],
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
			name : '测点5',
			type : 'line',
			smooth : true,
			symbol : 'droplet',
			data : [ 12, 13, 4, 14, 9, 14, 3, 9, 10 ],
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
});