<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - Sparkline图表</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="assets/css/animate.min.css" rel="stylesheet">
    <link href="assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInDown">

        <div class="row">
            <div class="col-sm-5">
                <div class="jumbotron">
                    <h1>Sparkline</h1>
                    <p>这是另一个可视化图表库</p>
                    <p><a href="http://omnipotent.net/jquery.sparkline" target="_blank" class="btn btn-primary btn-lg" role="button">了解 Sparkline</a>
                    </p>
                </div>
            </div>
            <div class="col-sm-7">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Sparkline图表 <small>自定义颜色</small></h5>
                        <div class="ibox-tools">
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div>
                        <table class="table table-bordered white-bg">
                            <thead>
                                <tr>
                                    <th>图表</th>
                                    <th>类型</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>
                                        <span id="sparkline1"></span>
                                    </td>
                                    <td>
                                        内联线性图
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="sparkline2"></span>
                                    </td>
                                    <td>
                                        柱状图
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="sparkline3"></span>
                                    </td>
                                    <td>
                                        饼状图
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="sparkline4"></span>
                                    </td>
                                    <td>
                                        长线性图
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="sparkline5"></span>
                                    </td>
                                    <td>
                                        三态图
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="sparkline6"></span>
                                    </td>
                                    <td>
                                        散点图
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>自定义饼状图尺寸</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_sparkline.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_sparkline.html#">选项1</a>
                                </li>
                                <li><a href="graph_sparkline.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content text-center h-200">
                        <span id="sparkline7"></span>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>自定义柱状图尺寸</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_sparkline.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_sparkline.html#">选项1</a>
                                </li>
                                <li><a href="graph_sparkline.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content text-center h-200">
                        <span id="sparkline8"></span>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>自定义线性图尺寸</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_sparkline.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_sparkline.html#">选项1</a>
                                </li>
                                <li><a href="graph_sparkline.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content text-center h-200">
                        <span id="sparkline9"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js?v=2.1.4"></script>
    <script src="assets/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="assets/js/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="assets/js/content.min.js?v=1.0.0"></script>
    <script src="assets/js/demo/sparkline-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
