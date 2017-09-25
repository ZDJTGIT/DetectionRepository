<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 深部渗压分析图</title>
    <meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
    <meta name="description" content="中大检测平台">

    <link rel="shortcut icon" href="favicon.ico">
    <!-- Data Tables -->
    <link href="assets/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <script>
    $(function(){
        $(".pimg").click(function(){

            var _this = $(this);//将当前的pimg元素作为_this传入函数
            // imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
            var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
            $("#bigimg").attr("src", src);//设置#bigimg元素的src属性

                /*获取当前点击图片的真实大小，并显示弹出层及大图*/
            $("<img/>").attr("src", src).load(function(){
                var windowW = $(window).width();//获取当前窗口宽度
                var windowH = $(window).height();//获取当前窗口高度
                var realWidth = this.width;//获取图片真实宽度
                var realHeight = this.height;//获取图片真实高度
                var imgWidth, imgHeight;
                var scale = 0.8;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放

                if(realHeight>windowH*scale) {//判断图片高度
                    imgHeight = windowH*scale;//如大于窗口高度，图片高度进行缩放
                    imgWidth = imgHeight/realHeight*realWidth;//等比例缩放宽度
                    if(imgWidth>windowW*scale) {//如宽度扔大于窗口宽度
                        imgWidth = windowW*scale;//再对宽度进行缩放
                    }
                } else if(realWidth>windowW*scale) {//如图片高度合适，判断图片宽度
                    imgWidth = windowW*scale;//如大于窗口宽度，图片宽度进行缩放
                                imgHeight = imgWidth/realWidth*realHeight;//等比例缩放高度
                } else {//如果图片真实高度和宽度都符合要求，高宽不变
                    imgWidth = realWidth;
                    imgHeight = realHeight;
                }
                        $( "#bigimg").css("width",imgWidth);//以最终的宽度对图片缩放

                var w = (windowW-imgWidth)/2;//计算图片与窗口左边距
                var h = (windowH-imgHeight)/2;//计算图片与窗口上边距
                $("#innerdiv").css({"top":h, "left":w});//设置#innerdiv的top和left属性
                $("#outerdiv").fadeIn("fast");//淡入显示#outerdiv及.pimg
            });

            $("#outerdiv").click(function(){//再次点击淡出消失弹出层
                $(this).fadeOut("fast");
            });
        });
    });
</script>

</head>

<body class="gray-bg">
	<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:999;width:100%;height:100%;display:none;">
		<div id="innerdiv" style="position:absolute;"><img id="bigimg" style="border:5px solid #fff;" src="assets/img/farmmap.jpg" />
		</div>
	</div>
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-5">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>渗压位移变化图</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="text-align: center;">
                        <img class="pimg" alt="图片未加载" src="assets/img/farmmap.jpg" style="width: 100%;height: 360px" >
                    </div>
                </div>
            </div>
            <div class="col-sm-7" >
                <div class="ibox float-e-margins" >
                    <div class="ibox-title">
                        <h5>渗压监测总位移</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" >
                        <div class="echarts" id="echarts-rate-chart" style="height: 360px"></div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>渗压本次位移监测</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-grandtotal-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>渗压位移变化速率监测</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <div class="echarts" id="echarts-single-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>渗压水平位移监测值</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-displacement-chart"></div>
                    </div>
                </div>
            </div>

        </div>
       </div>

    <!-- ECharts -->
    <script src="assets/js/plugins/echarts/echarts-all.js"></script>
    <!-- 自定义js -->
    <script src="assets/js/content.js"></script>
    <!-- ECharts demo data -->
    <script src="assets/js/plugins/myecharts/osmotic_ecahrts.js"></script>
    <script src="assets/js/plugins/jeditable/jquery.jeditable.js"></script>

    <!-- Data Tables -->
    <script src="assets/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/plugins/dataTables/dataTables.bootstrap.js"></script>
</body>

</html>
