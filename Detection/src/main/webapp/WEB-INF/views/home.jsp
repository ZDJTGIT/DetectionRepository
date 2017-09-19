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
<!--  AMap CSS  -->
<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css" />
<style type="text/css">
#mapContent {
	height: 700px;
}
</style>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
   
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>当前项目所在地图</h5>
                        
                    </div>
                    <div class="ibox-content">
                        <div class="content" id="mapContent"></div>
                    </div>
                </div>
            </div>
        </div>
	</div>

	<script src="assets/js/demo.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		    demo.initAMap();
		});
	</script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
