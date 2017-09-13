<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css"
	href="assets/plugins/bootstrap/css/bootstrap.css" />
</head>
<body>

	<script src="assets/plugins/jquery/jquery-1.11.1.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="" type="text/javascript" charset="utf-8"></script>
</body>
</html>