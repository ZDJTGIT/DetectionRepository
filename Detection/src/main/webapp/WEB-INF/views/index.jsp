<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/zdLogo.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Detection</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- Bootstrap core CSS     -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<!-- Animation library for notifications   -->
<link href="assets/css/animate.min.css" rel="stylesheet" />
<!--  Paper Dashboard core CSS    -->
<link href="assets/css/paper-dashboard.css" rel="stylesheet" />
<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="assets/css/demo.css" rel="stylesheet" />
<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="assets/css/themify-icons.css" rel="stylesheet">
<!--  AMap CSS  -->
<link rel="stylesheet"
	href="http://cache.amap.com/lbs/static/main1119.css" />

</head>
<!-- END HEAD -->

<!-- BEGIN BODY -->
<body>
	<div class="wrapper">
		<%@ include file="../layout/header.jsp"%>
		<%@ include file="../layout/sidebar.jsp"%>

		<div class="main-panel">
			<div class="content" id="main-content"></div>
			<%@ include file="../layout/footer.jsp"%>
		</div>
	</div>
</body>
<!--  GaoDe Map Plugin   -->
<script
	src="http://webapi.amap.com/maps?v=1.3&key=45d7aee2c7ba665d7c3445f4209fe885"
	type="text/javascript"></script>
<!--  jquery.js   -->
<script src="assets/plugin/jquery-1.10.2.js" type="text/javascript"></script>
<!-- bootstrap js -->
<script src="assets/plugin/bootstrap.min.js" type="text/javascript"></script>
<!--  Checkbox, Radio & Switch Plugins -->
<script src="assets/plugin/bootstrap-checkbox-radio.js"
	type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="assets/plugin/chartist.min.js" type="text/javascript"></script>
<!--  Notifications Plugin    -->
<script src="assets/plugin/bootstrap-notify.js" type="text/javascript"></script>
<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="assets/plugin/paper-dashboard.js" type="text/javascript"></script>
<!-- websocket stomp js -->
<script src="assets/plugin/sockjs.min.js" type="text/javascript"></script>
<script src="assets/plugin/stomp.min.js" type="text/javascript"></script>
<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js" type="text/javascript"></script>
<script src="assets/js/index.js" type="text/javascript"></script>
<script type="text/javascript">

         var socket = new SockJS('/Detection/rest/webSocket');

         /**
          * 建立成功的回调函数
          */
         socket.onopen = function() {
             console.log('open');
         };

         /**
          * 服务器有消息返回的回调函数
          */
         socket.onmessage = function(e) {
             console.log('message', e.data);
         };

         /**
          * websocket链接关闭的回调函数
          */
         socket.onclose = function() {
             console.log('close');
         };

         var stompClient = Stomp.over(socket);
         stompClient.connect({}, function(frame) {
         	console.log("connected-------:"+frame);
             stompClient.subscribe('/topic/hello',  function(data) { //订阅消息
             	alert("AAA");
                 alert(data);
             });

             console.log("connected++++++:"+frame);
             stompClient.subscribe('/topic/message',  function(data) { //订阅消息
             	alert("BBB");
                 alert(data.body);
             });

             console.log("connected======:"+frame);
             stompClient.subscribe('/user/queue/single',  function(data) { //订阅消息
             	alert("CCC");
                 alert(data.body);
             });
         });

//         stompClient.send("/ws/singlemessage", {}, JSON.stringify({
//             name : "nane",
//             taskName : "taskName",
//             taskDetail : "taskDetail"
//        }));

    </script>
</html>