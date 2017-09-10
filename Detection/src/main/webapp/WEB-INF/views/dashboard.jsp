<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
    <base href="<%=basePath%>">
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/zdLogo.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Detection</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>

<div class="wrapper">
    <%@ include file="../base/sidebar.jsp"%>
	<%@ include file="../base/header.jsp"%>
    <div class="main-panel">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-warning text-center">
                                            <i class="ti-server"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>Capacity</p>
                                            105GB
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-reload"></i> Updated now
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-success text-center">
                                            <i class="ti-wallet"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>Revenue</p>
                                            $1,345
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-calendar"></i> Last day
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-danger text-center">
                                            <i class="ti-pulse"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>Errors</p>
                                            23
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-timer"></i> In the last hour
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-info text-center">
                                            <i class="ti-twitter-alt"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>Followers</p>
                                            +45
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-reload"></i> Updated now
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="content">
                                <div id="test" style="height: 500px">
                                <script src="echarts-2.2.7/doc/example/www/js/echarts.js"></script>
                                <script type="text/javascript">
                             			// 路径配置
                                        require.config({
                                            paths: {
                                                echarts: 'http://echarts.baidu.com/build/dist'
                                            }
                                        });
                                        // 使用
                                        require(
                                            [
                                                'echarts',
                                                'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
                                                'echarts/chart/bar',
                                            ],

                                            function (ec) {
                                            	// 基于准备好的dom，初始化echarts图表¨
                                                var myChart = ec.init(document.getElementById('test'));
                                                var option = {
                                    title : {
                                        text: '一天中水位变化',
                                         textStyle: {
                                            fontSize: 20,
                                            color: '#46A9D9' // 主标题文字颜色
                                        },
                                    },
                                    tooltip : {
                                        trigger: 'axis'
                                    },
                                    legend: {
                                        orient : 'horizontal',
                                          x: 'center',
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
                                        data:['警戒值MAX','警戒值MIN','测点1','测点2','测点3','测点4','测点5','测点6','测点7','测点8']
                                    },
                                    toolbox: {
                                        show : true,
                                        orient: 'vertical',
                                        feature : {
                                            mark : {show: true},
                                            dataView : {show: true, readOnly: false},
                                            magicType : {show: true, type: ['line', 'bar']},
                                            restore : {show: true},
                                            saveAsImage : {show: true}
                                        }
                                    },
                                    calculable : true,
                                    xAxis : [
                                        {
                                            type : 'category',
                                            boundaryGap : false,
                                            data : ['0','3','6','9','12','15','18','21','24'],
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
                                                formatter:'{value} 时'
                                            },
                                            splitLine: {           // 分隔线
                                                show: true,        // 默认显示，属性show控制显示与否
                                                // onGap: null,
                                                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                                                    color: ['#ccc'],
                                                    width: 1,
                                                    type: 'solid'
                                                }
                                            },
                                            splitArea: {           // 分隔区域
                                                show: false,       // 默认不显示，属性show控制显示与否
                                                // onGap: true,
                                                areaStyle: {       // 属性areaStyle（详见areaStyle）控制区域样式
                                                    color: ['rgba(250,250,250,0.3)','rgba(200,200,200,0.3)']
                                                }
                                            }
                                        }
                                    ],
                                    yAxis : [
                                        {
                                            type : 'value',
                                            data : [0,5,10,15],
                                            axisLabel : {
                                                formatter: '{value} cm'
                                            },
                                             splitArea : {           // 分隔区域
                                            show: true,       // 默认不显示，属性show控制显示与否
                                            areaStyle: {       // 属性areaStyle（详见areaStyle）控制区域样式
                                                color: ['rgba(250,250,250,0.3)','rgba(200,200,200,0.3)']
                                            }
                                        }
                                        }

                                    ],
                                     line: {
                                        itemStyle: {
                                            normal: {
                                                // color:各异,
                                                label: {
                                                    show: false
                                                	// position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
                                                    //           'inside'|'left'|'right'|'top'|'bottom'
                                                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                                                },
                                                lineStyle: {
                                                    width: 2,
                                                    type: 'solid',
                                                    shadowColor : 'rgba(0,0,0,0)', //默认透明
                                                    shadowBlur: 5,
                                                    shadowOffsetX: 3,
                                                    shadowOffsetY: 3
                                                }
                                            },
                                            emphasis: {
                                                // color: 各异,
                                                label: {
                                                    show: false
                                                    // position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
                                                    //           'inside'|'left'|'right'|'top'|'bottom'
                                                    // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                                                }
                                            }
                                        },
                                        smooth : true,          //曲线平滑
                                        symbol: 'none',         // 拐点图形类型
                                        symbolSize: 2,          // 拐点图形大小
                                        //symbolRotate : null,  // 拐点图形旋转控制
                                        showAllSymbol: false    // 标志图形默认只有主轴显示（随主轴标签间隔隐藏策略）
                                    },
                                    series : [

                                        {
                                            name:'警戒值MAX',
                                            type:'line',
                                             symbol: 'none',
                                            data:[9,9,9,9,9,9,9,9,9],
                                             markLine : {
                                            	 data : [
                                                         // {type : 'max', name: '自定义名字'},    // 最大值水平线或垂直线
                                                         {type : 'min', name: '自定义名字'},    // 最小值水平线或垂直线
                                                 ]
                                            },
                                        },
                                        {
                                            name:'警戒值MIN',
                                            type:'line',
                                            symbol: 'none',
                                            data:[3,3,3,3,3,3,3,3,3],
                                             markLine : {
                                                data : [
                                                    // {type : 'max', name: '自定义名字'},    // 最大值水平线或垂直线
                                                    {type : 'min', name: '自定义名字'},    // 最小值水平线或垂直线
                                                ]
                                            }
                                        },
                                        {
                                            name:'测点1',
                                            type:'line',
                                             smooth : true,
                                             symbol: 'droplet',
                                            data:[4,14,1,2,5,7,4,11,11],
                                            markPoint : {
                                                data : [
                                                    {type : 'max', name: '最大值'},
                                                    {type : 'min', name: '最小值'}
                                                ]
                                            },

                                        },
                                        {
                                            name:'测点2',
                                            type:'line',
                                             smooth : true,
                                             symbol: 'droplet',
                                            data:[12,7,6,11,4,3,0,0,3],
                                            markPoint : {
                                                data : [
                                                    {type : 'max', name: '最大值'},
                                                    {type : 'min', name: '最小值'}
                                                ]
                                            },
                                            // markLine : {
                                            //     data : [
                                            //         {type : 'average', name: '平均值'}
                                            //     ]
                                            // }
                                        },
                                        {
                                            name:'测点3',
                                            type:'line',
                                             smooth : true,
                                             symbol: 'droplet',
                                            data:[14,8,1,7,3,4,10,12,14],
                                            markPoint : {
                                                data : [
                                                    {type : 'max', name: '最大值'},
                                                    {type : 'min', name: '最小值'}
                                                ]
                                            },
                                            // markLine : {
                                            //     data : [
                                            //         {type : 'average', name: '平均值'}
                                            //     ]
                                            // }
                                        },
                                        {
                                            name:'测点4',
                                            type:'line',
                                             smooth : true,
                                             symbol: 'droplet',
                                            data:[12,8,11,8,0,3,13,5,11],
                                            markPoint : {
                                                data : [
                                                    {type : 'max', name: '最大值'},
                                                    {type : 'min', name: '最小值'}
                                                ]
                                            },
                                            // markLine : {
                                            //     data : [
                                            //         {type : 'average', name: '平均值'}
                                            //     ]
                                            // }
                                        },
                                        {
                                            name:'测点5',
                                            type:'line',
                                             smooth : true,
                                             symbol: 'droplet',
                                            data:[12,13,4,14,9,14,3,9,10],
                                            markPoint : {
                                                data : [
                                                    {type : 'max', name: '最大值'},
                                                    {type : 'min', name: '最小值'}
                                                ]
                                            },
                                            // markLine : {
                                            //     data : [
                                            //         {type : 'average', name: '平均值'}
                                            //     ]
                                            // }
                                        },
                                        {
                                            name:'测点6',
                                            type:'line',
                                             smooth : true,
                                             symbol: 'droplet',
                                            data:[5,2,10,12,8,4,14,11,7],
                                            markPoint : {
                                                data : [
                                                    {type : 'max', name: '最大值'},
                                                    {type : 'min', name: '最小值'}
                                                ]
                                            },
                                            // markLine : {
                                            //     data : [
                                            //         {type : 'average', name: '平均值'}
                                            //     ]
                                            // }
                                        },
                                        {
                                            name:'测点7',
                                            type:'line',
                                             smooth : true,
                                             symbol: 'droplet',
                                            data:[14,3,9,0,2,13,9,5,12],
                                            markPoint : {
                                                data : [
                                                    {type : 'max', name: '最大值'},
                                                    {type : 'min', name: '最小值'}
                                                ]
                                            },
                                            // markLine : {
                                            //     data : [
                                            //         {type : 'average', name: '平均值'}
                                            //     ]
                                            // }
                                        },
                                        {
                                            name:'测点8',
                                            type:'line',
                                             smooth : true,
                                             symbol: 'droplet',
                                            data:[10,6,9,8,8,0,8,12,0],
                                            markPoint : {
                                                data : [
                                                    {type : 'max', name: '最大值'},
                                                    {type : 'min', name: '最小值'}
                                                ]
                                            },
                                            // markLine : {
                                            //     data : [
                                            //         {type : 'average', name: '平均值'}
                                            //     ]
                                            // }
                                        }
                                    ]
                                };


                                                // 为echarts对象加载数据
                                                myChart.setOption(option);
                                                window.onresize = function(){
                                                    myChart.resize();
                                                }

                                            }
                                        );
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                           <!--  <div class="header">
                                <h4 class="title">Email Statistics</h4>
                                <p class="category">Last Campaign Performance</p>
                            </div> -->
                            <div class="content">
                                <!-- <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>

                                <div class="footer">
                                    <div class="chart-legend">
                                        <i class="fa fa-circle text-info"></i> Open
                                        <i class="fa fa-circle text-danger"></i> Bounce
                                        <i class="fa fa-circle text-warning"></i> Unsubscribe
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        <i class="ti-timer"></i> Campaign sent 2 days ago
                                    </div>
                                </div> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card ">
                            <!-- <div class="header">
                                <h4 class="title">2015 Sales</h4>
                                <p class="category">All products including Taxes</p>
                            </div> -->
                            <div class="content">
                               <!--  <div id="chartActivity" class="ct-chart"></div>

                                <div class="footer">
                                    <div class="chart-legend">
                                        <i class="fa fa-circle text-info"></i> Tesla Model S
                                        <i class="fa fa-circle text-warning"></i> BMW 5 Series
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        <i class="ti-check"></i> Data information certified
                                    </div>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 李茂平做的表修改 -->
                <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="content">
                                    <div class="header">
                                        <h4 class="title" >测点数据表</h4>
                                        <div style="float: right;">
                                            <button type="button" >导出到Excel</button>
                                        </div>
                                            <br>
                                            <br>
                                        <div>
                                            <p class="category">
                                                <div>
                                                    <div style="float: left;">
                                                        显示&ensp;
                                                        <select style="width: 140px;height: 30px">
                                                            <option >8</option>
                                                            <option>16</option>
                                                            <option >All</option>
                                                        </select>&ensp; 项结果
                                                    </div>
                                                    <div style="float: right;">
                                                        <div style="float: left;">
                                                            <input type="text" class="form-control border-input"  placeholder="请输入搜索内容">
                                                        </div>
                                                        <div style="float: right;margin: 0px 0px 0px 10px;">
                                                            <button class="btn btn-default btn-block" >搜索</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-striped">
                                        <!-- <table class="table table-bordered"> -->
                                            <thead>
                                            	<tr>
	                                                <th>测点编号</th>
	                                                <th>测点位置</th>
	                                                <th>实时水深</th>
	                                                <th>实时PH值</th>
	                                                <th>实时镉含量</th>
	                                                <th>实时状态值</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Dakota Rice</td>
                                                    <td>$36,738</td>
                                                    <td>Niger</td>
                                                    <td>Oud-Turnhout</td>
                                                    <td>正常</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>Minerva Hooper</td>
                                                    <td>$23,789</td>
                                                    <td>Curaçao</td>
                                                    <td>Sinaai-Waas</td>
                                                    <td>正常</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>Sage Rodriguez</td>
                                                    <td>$56,142</td>
                                                    <td>Netherlands</td>
                                                    <td>Baileux</td>
                                                    <td>正常</td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td>Philip Chaney</td>
                                                    <td>$38,735</td>
                                                    <td>Korea, South</td>
                                                    <td>Overland Park</td>
                                                    <td>正常</td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td>Doris Greene</td>
                                                    <td>$63,542</td>
                                                    <td>Malawi</td>
                                                    <td>Feldkirchen in Kärnten</td>
                                                    <td>正常</td>
                                                </tr>
                                                <tr>
                                                    <td>6</td>
                                                    <td>Mason Porter</td>
                                                    <td>$78,615</td>
                                                    <td>Chile</td>
                                                    <td>Gloucester</td>
                                                    <td>正常</td>
                                                </tr>
                                                <tr>
                                                    <td>7</td>
                                                    <td>Mason Porter</td>
                                                    <td>$78,615</td>
                                                    <td>Chile</td>
                                                    <td>Gloucester</td>
                                                    <td>正常</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div align="center">
                                        <ul class="pagination">
                                            <li><a href="#">&laquo;</a></li>
                                            <li class="active"><a href="#">1</a></li>
                                            <li ><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#">5</a></li>
                                            <li><a href="#">&raquo;</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>

                        <li>
                            <a href="#">
                                Creative Tim
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                               Blog
                            </a>
                        </li>
                        <li>
                            <a href="#/license">
                                Licenses
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="copyright pull-right">
                    Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://www.17sucai.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
                </div>
            </div>
        </footer>
		</div>
    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="assets/plugin/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/plugin/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/plugin/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/plugin/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/plugin/bootstrap-notify.js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/plugin/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>

	<script type="text/javascript">
    	$(document).ready(function(){

        	demo.initChartist();

        	$.notify({
            	icon: 'ti-gift',
            	message: "Welcome to <b>Paper Dashboard</b> - a beautiful Bootstrap freebie for your next project."

            },{
                type: 'success',
                timer: 4000
            });

    	});
	</script>

</html>
