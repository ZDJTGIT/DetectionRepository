//dashboard报表js
// 路径配置
require.config({
	paths : {
		echarts : 'http://echarts.baidu.com/build/dist'
	}
});
// 使用
require(
		[ 'echarts', 'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
		'echarts/chart/bar', ],

		function(ec) {
			// 基于准备好的dom，初始化echarts图表¨
			var myChart = ec.init(document.getElementById('test'));
			var option = {

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
					data : [ '警戒值MAX', '警戒值MIN', '测点1', '测点2', '测点3', '测点4',
							'测点5', '测点6', '测点7', '测点8' ]
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
					data : [ '0', '3', '6', '9', '12', '15', '18', '21', '24' ],
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
						formatter : '{value} 时'
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
							color : [ 'rgba(250,250,250,0.3)',
									'rgba(200,200,200,0.3)' ]
						}
					}
				} ],
				yAxis : [ {
					type : 'value',
					data : [ 0, 5, 10, 15 ],
					axisLabel : {
						formatter : '{value} cm'
					},
					splitArea : { // 分隔区域
						show : true, // 默认不显示，属性show控制显示与否
						areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
							color : [ 'rgba(250,250,250,0.3)',
									'rgba(200,200,200,0.3)' ]
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
					data : [ 9, 9, 9, 9, 9, 9, 9, 9, 9 ],
					markLine : {
						data : [
						// {type : 'max', name: '自定义名字'}, // 最大值水平线或垂直线
						{
							type : 'min',
							name : '自定义名字'
						}, // 最小值水平线或垂直线
						]
					},
				}, {
					name : '警戒值MIN',
					type : 'line',
					symbol : 'none',
					data : [ 3, 3, 3, 3, 3, 3, 3, 3, 3 ],
					markLine : {
						data : [
						// {type : 'max', name: '自定义名字'}, // 最大值水平线或垂直线
						{
							type : 'min',
							name : '自定义名字'
						}, // 最小值水平线或垂直线
						]
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

			// 为echarts对象加载数据
			myChart.setOption(option);
			window.onresize = function() {
				myChart.resize();
			}

		});