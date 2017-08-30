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
        <meta charset="utf-8" />
        <title>Detection</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <meta name="MobileOptimized" content="320">

        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->

        <!-- BEGIN THEME STYLES -->
        <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
        <!-- END THEME STYLES -->
		<style type="text/css">
			#displayMap {
			  width: 1000px;
			  height: 700px;
			}
		</style>
        <link rel="shortcut icon" href="app/img/favicon.ico" />
    </head>
    <!-- END HEAD -->

    <!-- BEGIN BODY -->
    <body class="page-header-fixed" onload="mapInit()">
        <!-- BEGIN HEADER -->
        <div class="header navbar navbar-inverse navbar-fixed-top">
            <!-- BEGIN TOP NAVIGATION BAR -->
            <div class="header-inner container">
                <div class="row">
                    <div class="col-md-1">
                        <!-- BEGIN LOGO -->
                        <a class="navbar-brand" href="javascript:;">
                            <img src="assets/img/zdLogo.png" alt="logo" class="img-responsive" />
                        </a>
                        <!-- END LOGO -->
                    </div>
                     <div class="col-md-10">
                        <h3>中大检测在线检测平台</h3>
                    </div>
                    <div class="col-md-1">
                        <!-- BEGIN TOP NAVIGATION MENU -->
                        <ul class="nav navbar-nav pull-right">
                            <li class="dropdown user">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <img alt="" src="assets/img/avatar1_small.jpg"/>
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="javascript:;" id="trigger_fullscreen">
                                            <i class="fa fa-move"></i> 全屏
                                        </a>
                                    </li>
                                    <li>
                                        <a href="extra_lock.html">
                                            <i class="fa fa-lock"></i> 锁屏
                                        </a>
                                    </li>
                                    <li>
                                        <a href="rest/user/logout">
                                            <i class="fa fa-key"></i> 退出
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- END USER LOGIN DROPDOWN -->
                        </ul>
                    </div>
                </div>
                <!-- END TOP NAVIGATION MENU -->
            </div>
            <!-- END TOP NAVIGATION BAR -->
        </div>
        <!-- END HEADER -->
        <div class="clearfix"></div>
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <!-- BEGIN DASHBOARD STATS -->
                    <div id="main-content">
                        <div id="displayMap"></div>
                    </div>
                    <!-- END PORTLET-->
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <div class="footer">
            <div class="footer-inner">
                2017 &copy; Detection by zhongda.
            </div>
            <div class="footer-tools">
                <span class="go-top"><i class="fa fa-angle-up"></i></span>
            </div>
        </div>
        <!--[if lt IE 9]>
        <script src="assets/plugins/respond.min.js"></script>
        <script src="assets/plugins/excanvas.min.js"></script>
        <![endif]-->
        <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=45d7aee2c7ba665d7c3445f4209fe885"></script>
        <script src="assets/plugins/jquery/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript">
                            </script>
        <script src="assets/scripts/app.js" type="text/javascript"></script>
       <!--  <script type="text/javascript" src="../app/js/index.js"></script> -->

        <!--Begin Test -->
        <script type="text/javascript">
            var mapObj;
            var point = new AMap.LngLat(112.883749,28.115017);

            var satellLayer = new AMap.TileLayer.Satellite({zIndex:10}); //实例化卫星图

            function mapInit(){   //初始化地图对象，加载地图。
                mapObj = new AMap.Map("displayMap",{
                center : point, //地图中心点
                level : 15  //地图显示的缩放级别
                });
                AMap.event.addListener(mapObj,'click',getLnglat); //点击事件
                satellLayer.setMap(mapObj); //在map中添加卫星图
                mapObj.setZoom(18);
            }
            //鼠标点击，获取经纬度坐标
            function getLnglat(e){
                var x = e.lnglat.getLng();
                var y = e.lnglat.getLat();
                document.getElementById("lnglat").innerHTML = x + "," + y;
            }
        </script>
		<!--End Test -->

        <!-- <script data-main="app/js/main" src="app/lib/requirejs/require.js"></script> -->
    </body>
</html>