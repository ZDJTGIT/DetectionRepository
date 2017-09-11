<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head></head>
<body>
	<div class="container-fluid">
		<div class="card card-map">
			<div class="header">
				<h4 class="title">高德地图</h4>
			</div>
			<div class="map">
				<div id="mapContent"></div>
			</div>
		</div>
	</div>
</body>
<!--  GaoDe Map Plugin   -->
<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.3&key=45d7aee2c7ba665d7c3445f4209fe885"></script>

<script>
        $().ready(function(){
            demo.initAMap();
        });
    </script>

</html>
