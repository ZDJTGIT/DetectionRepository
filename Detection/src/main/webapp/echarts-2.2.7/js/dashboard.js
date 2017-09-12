
	function water() {
		//dashboard报表js
		// 路径配置
		require.config({
			paths : {
				echarts : 'echarts-2.2.7/doc/example/www/js/'
			}
		});
		// 使用
		require(
				[ 'echarts', 'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
				'echarts/chart/bar', ],

				function(ec) {
					// 基于准备好的dom，初始化echarts图表¨
					var myChart = ec.init(document.getElementById('waterlevel'));
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
							markLine : {
				                data : [
						                   [
										        {name: '标线1起点', value: 5, xAxis: 0, yAxis: 5},      // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
//										        {name: '标线1终点', xAxis: '周日', yAxis:5},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
										    ]
						                ]
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
                            name:'警戒值MAX',
                            type:'line',
                             symbol: 'none',
                            data:[0],
                              itemStyle :{
                                normal : {
                                        color : '#FE0202',
                                }
                             },
                             markLine : {
                                data : [
                                     [
                                        {name: '警戒值MAX起点', value: 9, xAxis: -1, yAxis: 9},      // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
                                        {name: '警戒值MAX终点', xAxis: 9, yAxis:9},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
                                    ]
                                ]
                            },

                        },

                        {
                            name:'警戒值MIN',
                            type:'line',
                            symbol: 'none',
                             itemStyle :{
                                normal : {
                                        color : '#FE0202',
                                }
                             },
                            data:[0],
                             markLine : {
                                data : [
                                    [
                                        {name: '警戒值MIN起点', value: 3, xAxis: -1, yAxis: 3},      // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
                                        {name: '警戒值MIN终点', xAxis: 9, yAxis:3},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
                                    ]
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
					window.addEventListener('resize',function(){
                         myChart.resize();
                    });

				});
	}
	
	//PH
	function ph() {
		//dashboard报表js
		// 路径配置
		require.config({
			paths : {
				echarts : 'echarts-2.2.7/doc/example/www/js/'
			}
		});
		// 使用
		require(
				[ 'echarts', 'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
				'echarts/chart/bar', ],

				function(ec) {
					// 基于准备好的dom，初始化echarts图表¨
					var myPhChart = ec.init(document.getElementById('ph'));
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
							data : [ 0, 2, 4, 6, 8, 10, 12, 14 ],
							
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
							itemStyle :{
                                normal : {
                                        color : '#FE0202',
                                }
                             },
							data : [0],
							markLine : {
                                data : [
                                    [
                                        {name: '警戒值MAX起点', value: 6.5, xAxis: -1, yAxis: 6.5},      // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
                                        {name: '警戒值MAX终点', xAxis: 9, yAxis:6.5},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
                                    ]
                                ]
                            },
						}, {
							name : '警戒值MIN',
							type : 'line',
							symbol : 'none',
							itemStyle :{
                                normal : {
                                        color : '#FE0202',
                                }
                             },
							data : [0],
							markLine : {
                                data : [
                                    [
                                        {name: '警戒值MIN起点', value: 4.5, xAxis: -1, yAxis: 4.5},      // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
                                        {name: '警戒值MIN终点', xAxis: 9, yAxis:4.5},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
                                    ]
                                ]
                            },
						}, {
							name : '测点1',
							type : 'line',
							smooth : true,
							symbol : 'droplet',
							data : [ 4.1, 3.6, 9.1, 13.2, 2.8, 10.9, 4.1, 8.8, 3.0 ],
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
							data : [ 12.4, 4.8, 0.2, 6.0, 0.3, 1.6, 10.8, 2.3, 12.5 ],
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
							data : [ 8.4, 5.5, 3.1, 8.2, 8.6, 0.3, 1.1, 13.2, 4.3 ],
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
							data : [ 13.1, 10.6, 9.9, 9.7, 7.8, 11.0, 4.5, 5.0, 4.1 ],
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
							data : [ 6.3, 1.3, 6.6, 3.2, 10.6, 1.6, 11.0, 0.4, 9.6 ],
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
							data : [ 5.7, 1.0, 5.5, 10.0, 6.8, 12.1, 11.2, 10.8, 9.2 ],
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
							data : [ 12.3, 12.2, 5.7, 0.6, 8.8, 7.5, 9.9, 1.5, 9.5 ],
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
							data : [ 2.9, 10.2, 12.8, 6.9, 3.4, 1.3, 13.2, 6.3, 1.4 ],
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
					myPhChart.setOption(option);
					window.addEventListener('resize',function(){
						myPhChart.resize();
					});
					

				});
	}
	
	function cadmium() {
		//dashboard报表js
		// 路径配置
		require.config({
			paths : {
				echarts : 'echarts-2.2.7/doc/example/www/js/'
			}
		});
		// 使用
		require(
				[ 'echarts', 'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
				'echarts/chart/bar', ],

				function(ec) {
					// 基于准备好的dom，初始化echarts图表¨
					var myCadmiumChart = ec.init(document.getElementById('cadmium'));
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
								formatter : '{value} mg/kg'
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
							itemStyle :{
                                normal : {
                                        color : '#FE0202',
                                }
                             },
							data : [ 0 ],
							markLine : {
                                data : [
                                    [
                                        {name: '警戒值MAX起点', value: 1.5, xAxis: -1, yAxis: 1.5},      // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
                                        {name: '警戒值MAX终点', xAxis: 9, yAxis:1.5},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
                                    ]
                                ]
                            },
						}, {
							name : '警戒值MIN',
							type : 'line',
							symbol : 'none',
							itemStyle :{
                                normal : {
                                        color : '#FE0202',
                                }
                             },
							data : [ 0],
							markLine : {
                                data : [
                                    [
                                        {name: '警戒值MIN起点', value: 0.3, xAxis: -1, yAxis: 0.3},      // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
                                        {name: '警戒值MIN终点', xAxis: 9, yAxis:0.3},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
                                    ]
                                ]
                            },
						}, {
							name : '测点1',
							type : 'line',
							smooth : true,
							symbol : 'droplet',
							data : [ 3.64, 2.71, 3.02, 0.72, 1.76, 3.46, 3.34, 0.83, 2.68 ],
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
							data : [ 4.20, 2.99, 3.46, 3.95, 1.50, 2.40, 2.46, 0.76, 4.94 ],
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
							data : [ 0.94, 0.97, 2.68, 0.30, 1.07, 2.83, 2.69, 1.94, 4.71 ],
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
							data : [3.06, 3.72, 4.31, 4.04, 2.76, 3.24, 4.99, 0.09, 2.62 ],
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
							data : [ 4.94, 3.43, 4.46, 0.49, 2.95, 1.09, 2.16, 1.36, 4.35],
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
							data : [ 4.66, 2.07, 3.20, 3.74, 4.34, 0.94, 4.36, 0.49, 4.58 ],
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
							data : [ 1.65, 2.29, 3.67, 3.68, 2.58, 4.60, 3.25, 3.33, 1.36],
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
							data : [ 1.70, 2.23, 2.27, 3.75, 0.40, 4.12, 1.82, 1.67, 0.43],
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
					myCadmiumChart.setOption(option);
					window.addEventListener('resize',function(){
						myCadmiumChart.resize();
                   });
				});
	}

