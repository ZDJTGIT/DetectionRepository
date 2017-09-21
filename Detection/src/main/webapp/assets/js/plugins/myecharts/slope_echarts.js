$(function(){
	 var singleChart = echarts.init(document.getElementById("echarts-single-chart"));
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
//	                                              {name: '标线1终点', xAxis: '周日', yAxis:5},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
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
	    singleChart.setOption(singletion);
	    $(window).resize(singleChart.resize);
	    
	    
	    var grandtotalChart = echarts.init(document.getElementById("echarts-grandtotal-chart"));
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
//	                                              {name: '标线1终点', xAxis: '周日', yAxis:5},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
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
//	                                              {name: '标线1终点', xAxis: '周日', yAxis:5},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
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
		
		//深部
		var deepsingleChart = echarts.init(document.getElementById("echarts-deepsingle-chart"));
	    var deepsingletion = {
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
//		                                              {name: '标线1终点', xAxis: '周日', yAxis:5},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
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
	    deepsingleChart.setOption(deepsingletion);
		    $(window).resize(deepsingleChart.resize);
		    
		    
		    var deepgrandtotalChart = echarts.init(document.getElementById("echarts-deepgrandtotal-chart"));
		    var deepgrandtotaltion = {
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
//		                                              {name: '标线1终点', xAxis: '周日', yAxis:5},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
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
		    deepgrandtotalChart.setOption(deepgrandtotaltion);
		    $(window).resize(deepgrandtotalChart.resize);
		    
		    var deeprateChart = echarts.init(document.getElementById("echarts-deeprate-chart"));
		    var deepratetion = {
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
//		                                              {name: '标线1终点', xAxis: '周日', yAxis:5},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
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
		    deeprateChart.setOption(deepratetion);
		    $(window).resize(deeprateChart.resize);
		    
		    
		    var deepdisplacementChart = echarts.init(document
					.getElementById("echarts-deepdisplacement-chart"));
			var deepdisplacementtion = {
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
			deepdisplacementChart.setOption(deepdisplacementtion);
			$(window).resize(deepdisplacementChart.resize);
			
			
			//雨量
			var rainfallsingleChart = echarts.init(document.getElementById("echarts-rainfallsingle-chart"));
		    var rainfallsingletion = {
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
//		                                              {name: '标线1终点', xAxis: '周日', yAxis:5},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
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
		    rainfallsingleChart.setOption(rainfallsingletion);
		    $(window).resize(rainfallsingleChart.resize);
		    
		    
		    var rainfallgrandtotalChart = echarts.init(document.getElementById("echarts-rainfallgrandtotal-chart"));
		    var rainfallgrandtotaltion = {
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
//		                                              {name: '标线1终点', xAxis: '周日', yAxis:5},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
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
		    rainfallgrandtotalChart.setOption(rainfallgrandtotaltion);
		    $(window).resize(rainfallgrandtotalChart.resize);
		    
		    var rainfallrateChart = echarts.init(document.getElementById("echarts-rainfallrate-chart"));
		    var rainfallratetion = {
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
//		                                              {name: '标线1终点', xAxis: '周日', yAxis:5},             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
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
		    rainfallrateChart.setOption(rainfallratetion);
		    $(window).resize(rainfallrateChart.resize);
		    
		    
		    var rainfalldisplacementChart = echarts.init(document
					.getElementById("echarts-rainfalldisplacement-chart"));
			var rainfalldisplacementtion = {
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
			rainfalldisplacementChart.setOption(rainfalldisplacementtion);
			$(window).resize(rainfalldisplacementChart.resize);
});