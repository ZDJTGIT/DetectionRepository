<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>中国大检测数据在线监控平台 </title>
<meta name="keywords"
	content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">

<!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/zdLogo.png">
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">
<link href="assets/css/animate.min.css" rel="stylesheet">
<link href="assets/css/style.min.css" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg"
	style="overflow-y: hidden margin: 0 padding: 0">

	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header" style="text-align: center">
						<div class="dropdown profile-element">
							<div id="newMessageAudio" style="display: none;"></div>
							<span><img alt="image" class="img-circle"
								src="assets/img/zdLogo.png" /></span> <a data-toggle="dropdown"
								class="dropdown-toggle" href="#"> <span class="clear">
									<span class="block m-t-xs"><strong class="font-bold">ZDJC</strong></span>
							</span>
							</a>
						</div>
					</li>
					<li><a class="J_menuItem" href="rest/home" id="btn-home">
							<i class="fa fa-home"></i> <span class="nav-label">主页</span> <span
							class="fa arrow"></span>
					</a></li>
					<%-- <shiro:hasPermission name="project:manager:*">
						<li><a class="firstMenu" href="javascript:;"
							aria-expanded="false"> <i class="fa fa-columns"></i> <span
								class="nav-label">我的项目</span> <span class="fa arrow"></span>
						</a>
							<ul class="nav nav-second-level" aria-expanded="false">
								<shiro:hasPermission name="farmland:query:*">
									<li><a class="secondMenu J_menuItem" href="rest/project/1"
										aria-expanded="false"> <i class="fa fa-columns"></i><span
											class="nav-label">农田项目</span> <span class="fa arrow"></span>
									</a>
										<ul class="nav nav-third-level" aria-expanded="false"></ul></li>
								</shiro:hasPermission>
								<shiro:hasPermission name="bridge:query:*">
									<li><a class="secondMenu J_menuItem" href="rest/project/2"
										aria-expanded="false"> <i class="fa fa-columns"></i><span
											class="nav-label">桥梁项目</span>
									</a>
										<ul class="nav nav-third-level" aria-expanded="false"></ul></li>
								</shiro:hasPermission>
								<shiro:hasPermission name="tunnel:query:*">
									<li><a class="secondMenu J_menuItem" href="rest/project/3"
										aria-expanded="false"> <i class="fa fa-columns"></i><span
											class="nav-label">隧道项目</span>
									</a>
										<ul class="nav nav-third-level" aria-expanded="false"></ul></li>
								</shiro:hasPermission>
								<shiro:hasPermission name="slope:query:*">
									<li><a class="secondMenu J_menuItem" href="rest/project/4"
										aria-expanded="false"> <i class="fa fa-columns"></i><span
											class="nav-label">边坡项目</span>
									</a>
										<ul class="nav nav-third-level" aria-expanded="false">
											<!-- <li>
												<a class="J_menuItem" href="rest/graph_echarts_deep">深部位移</a>
											</li>
											<li>
												<a class="J_menuItem" href="rest/graph_echarts_osmotic">渗压</a>
											</li>
											<li>
												<a class="J_menuItem" href="rest/graph_echarts_rainwater">雨量</a>
											</li> -->
										</ul></li>
								</shiro:hasPermission>
							</ul></li>
					</shiro:hasPermission> --%>


					<shiro:hasPermission name="project:manager:*">
						<li id="accordion"><a data-toggle="collapse"
							data-parent="#accordion" href="#collapseOne" class="queryproject">
								<i class="fa fa-columns"></i> <span class="nav-label">我的项目</span>
								<span class="fa arrow"></span>
						</a>
							<ul id='collapseOne'
								class='collapse nav nav-second-level filling'>

							</ul></li>

					</shiro:hasPermission>



					<%-- <shiro:hasPermission name="project:manager:*">
						<li><a href="javascript:;"> <i
								class="fa fa fa-bar-chart-o"></i><span class="nav-label">统计图表</span>
								<span class="fa arrow"></span>
						</a>
							<ul class="nav nav-second-level">
								<shiro:hasPermission name="farmland:query:*">
									<li><a class="J_menuItem"
										href="rest/graph_echarts_farmland" name="农田数据分析图">农田数据分析图</a></li>
								</shiro:hasPermission>
								<shiro:hasPermission name="bridge:query:*">
									<li><a class="J_menuItem" href="rest/graph_echarts_bridge" name="桥梁数据分析图">桥梁数据分析图</a>
									</li>
								</shiro:hasPermission>
								<shiro:hasPermission name="tunnel:query:*">
									<li><a class="J_menuItem" href="rest/graph_echarts_tunnel" name="隧道数据分析图">隧道数据分析图</a>
									</li>
								</shiro:hasPermission>
								<shiro:hasPermission name="slope:query:*">
									<li><a class="J_menuItem" href="rest/graph_echarts_slope" name="边坡数据分析图">边坡数据分析图</a>
									</li>
								</shiro:hasPermission>
								<shiro:hasPermission name="subwayRail:query:*">
									<li><a class="J_menuItem" href="rest/graph_echarts_slope" name="地铁轨道分析图">地铁轨道分析图</a>
									</li>
								</shiro:hasPermission>
							</ul></li>
					</shiro:hasPermission> --%>
					<li><a href="javascript:;"> <i class="fa fa fa-user"></i>
							<span class="nav-label">个人资料</span> <span class="fa arrow"></span>
					</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="rest/user" name="个人资料">个人资料</a></li>
						</ul></li>

					<shiro:hasAnyRoles name="superAdmin, admin">
						<li><a href="javascript:;"><i class="fa fa-table"></i> <span
								class="nav-label">用户管理</span><span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a class="J_menuItem" href="rest/user/userList"
									name="用户信息">用户信息 <span
										class="label label-danger pull-right">管理员可见</span>
								</a></li>
								<li><a class="J_menuItem"
									href="rest/alarm/selectalarm_linkman" name="告警联系人">告警联系人 <span
										class="label label-danger pull-right">管理员可见</span>
								</a></li>
								<li><a class="J_menuItem" href="rest/table_data_tables"
									name="详细检验数据展示分析">详细检验数据展示分析</a></li>
								<li><a class="J_menuItem" href="rest/table_foo_table"
									name="操作日志">操作日志</a></li>
								<li><a class="J_menuItem" href="rest/table_bootstrap"
									name="其他">其他</a></li>
							</ul></li>
					</shiro:hasAnyRoles>

					<li><a href="javascript:;"><i class="fa fa-tasks"></i> <span
							class="nav-label">项目管理</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="rest/projects" name="项目">项目</a></li>
							
						</ul></li>
					<!-- <li><a class="J_menuItem" href="rest/table_jqgrid" name="告警信息"><i
							class="fa fa-bell"></i> <span class="nav-label">告警信息</span></a></li>
 -->
				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<!-- header 开始 -->
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<!-- <a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"><i class="fa fa-bars"></i> </a> -->
						<div class="logo">
							<!-- 	<img src="assets/img/zdLogo.png" alt="logo" class="logo"> -->
							<a href="#" class="navbar-brand">中国大检测数据在线监控平台(恩瑞万豪酒店项目基坑支护工程)</a>
						</div>
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="javascript:;"> <i
								class="fa fa-envelope"></i> <span class="label label-warning"
								id="alarmCountSpan">${fn:length(messageList)}</span>
						</a>
							<ul class="dropdown-menu dropdown-messages">
								<c:forEach items="${messageList}" var="message"
									varStatus="status">
									<li class="m-t-xs">
										<div class="dropdown-messages-box">
											<a href="rest/profile" class="pull-left"> <img
												alt="image" class="img-circle" src="assets/img/zdLogo.png">
											</a>
											<div class="media-body">
												<small class="pull-right">46小时前</small> <strong>${userInfo.userName}</strong>
												${message.messageContext}<br> <small class="text-muted"><fmt:formatDate
														value="${message.createTime}" type="both" /></small>
											</div>
										</div>
									</li>
									<li class="divider"></li>
								</c:forEach>
								<li>
									<div class="text-center link-block">
										<a class="J_menuItem" href="rest/message/messageList"
											name="消息管理"> <i class="fa fa-envelope"></i> <strong>
												查看所有消息</strong>
										</a>
									</div>
								</li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="#"> <i class="fa fa-bell"></i> <span
								class="label label-primary">${alarmTotal}</span>
						</a>
							<ul class="dropdown-menu dropdown-alerts">
								<c:forEach items="${alarmList}" var="alarm">
									<li><a class="J_menuItem" href="rest/table_jqgrid">
											<div>
												<i class="fa fa-envelope fa-fw"></i>${alarm.alarmContext} <span
													class="pull-right text-muted small"><fmt:formatDate
														value="${alarm.createTime}" type="both" /></span>
											</div>
									</a></li>
									<li class="divider"></li>
								</c:forEach>
								<li>
									<div class="text-center link-block">
										<a class="J_menuItem" name="告警管理" href="rest/alarm/alarmList">
											<strong>查看所有</strong> <i class="fa fa-angle-right"></i>
										</a>
									</div>
								</li>
							</ul></li>
						<li class="hidden-xs"><a class="J_menuItem dropdown-toggle"
							data-toggle="dropdown" href="javascript:;"> <i
								class="fa fa-user"></i>${userInfo.userName}<span class="caret"></span>
						</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a class="J_menuItem" href="rest/user" name="个人资料">个人资料</a></li>
								<li class="divider"></li>
								<li><a href="rest/user/logout">安全退出</a></li>
							</ul></li>
						<li class="dropdown hidden-xs"><a
							class="right-sidebar-toggle" aria-expanded="false"> <i
								class="fa fa-tasks"></i> 主题
						</a></li>
					</ul>
				</nav>
			</div>
			<!-- header 结束-->

			<div class="row content-tabs">
				<a class="navbar-minimalize minimalize-styl-3 btn btn-primary "
					href="#"><i class="fa fa-bars"></i> </a>
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="rest/home" class="J_menuTab">主页</a>
					</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right dropdown">
					<button class="dropdown-toggle J_tabClose" data-toggle="dropdown">
						关闭操作<span class="caret"></span>

					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a>定位当前选项卡</a></li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
			</div>
			<div class="row J_mainContent" id="content-main">
				<!-- 填充内容 -->
			</div>
			<div class="footer">
				<div class="pull-right">
					&copy; 2017 <a href="http://www.hnzdjc.com" target="_blank">ZDJT</a>
				</div>
			</div>
		</div>
		<!--右侧部分结束-->
		<!--右侧边栏开始-->
		<div id="right-sidebar">
			<div class="sidebar-container">

				<ul class="nav nav-tabs navs-3">

					<li class="active"><a data-toggle="tab" href="#tab-1"> <i
							class="fa fa-gear"></i> 主题
					</a></li>
					<!-- <li class=""><a data-toggle="tab" href="#tab-2"> 通知 </a></li>
					<li><a data-toggle="tab" href="#tab-3"> 项目进度 </a></li> -->
				</ul>

				<div class="tab-content">
					<div id="tab-1" class="tab-pane active">
						<div class="sidebar-title">
							<h3>
								<i class="fa fa-comments-o"></i> 主题设置
							</h3>
							<small><i class="fa fa-tim"></i>
								你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
						</div>
						<div class="skin-setttings">
							<div class="title">主题设置</div>
							<div class="setings-item">
								<span>收起左侧菜单</span>
								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="collapsemenu"
											class="onoffswitch-checkbox" id="collapsemenu"> <label
											class="onoffswitch-label" for="collapsemenu"> <span
											class="onoffswitch-inner"></span> <span
											class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span>固定顶部</span>

								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="fixednavbar"
											class="onoffswitch-checkbox" id="fixednavbar"> <label
											class="onoffswitch-label" for="fixednavbar"> <span
											class="onoffswitch-inner"></span> <span
											class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="setings-item">
								<span> 固定宽度 </span>

								<div class="switch">
									<div class="onoffswitch">
										<input type="checkbox" name="boxedlayout"
											class="onoffswitch-checkbox" id="boxedlayout"> <label
											class="onoffswitch-label" for="boxedlayout"> <span
											class="onoffswitch-inner"></span> <span
											class="onoffswitch-switch"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="title">皮肤选择</div>
							<div class="setings-item default-skin nb">
								<span class="skin-name "> <a href="javascript:;"
									class="s-skin-0"> 默认皮肤 </a>
								</span>
							</div>
							<div class="setings-item blue-skin nb">
								<span class="skin-name "> <a href="javascript:;"
									class="s-skin-1"> 蓝色主题 </a>
								</span>
							</div>
							<div class="setings-item yellow-skin nb">
								<span class="skin-name "> <a href="javascript:;"
									class="s-skin-3"> 黄色/紫色主题 </a>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 	mini聊天窗口开始 -->
	<div class="small-chat-box fadeInRight animated">

		<div class="heading" draggable="true">
			<small class="chat-date pull-right"> 2017.9.20 </small> 与 中大客服咨询 聊天中
		</div>

		<div class="content">

			<div class="left">
				<div class="author-name">
					客服 <small class="chat-date"> 10:02 </small>
				</div>
				<div class="chat-message active">你好</div>

			</div>
			<div class="right">
				<div class="author-name">
					Rojay <small class="chat-date"> 11:24 </small>
				</div>
				<div class="chat-message">你好，请问中大有关于边坡检测业务吗？</div>
			</div>
			<div class="left">
				<div class="author-name">
					客服 <small class="chat-date"> 08:45 </small>
				</div>
				<div class="chat-message active">有，您需要了解关于边坡的的哪些技术？</div>
			</div>
			<div class="right">
				<div class="author-name">
					Rojay <small class="chat-date"> 11:24 </small>
				</div>
				<div class="chat-message">关于深部位移、渗压、雨量的</div>
			</div>
			<div class="left">
				<div class="author-name">
					客服 <small class="chat-date"> 08:45 </small>
				</div>
				<div class="chat-message active">
					1.到中大官网下载：www.hnzdjc.com； <br> 2.预留您的联系方式，邮箱，公司信息； <br>
					…… <br>
				</div>
			</div>


		</div>
		<div class="form-chat">
			<div class="input-group input-group-sm">
				<input type="text" class="form-control"> <span
					class="input-group-btn">
					<button class="btn btn-primary" type="button">发送</button>
				</span>
			</div>
		</div>

	</div>
	<div id="small-chat">
		<span class="badge badge-warning pull-right">5</span> <a
			class="open-small-chat"> <i class="fa fa-comments"></i>
		</a>
	</div>
	</div>
	<script type="text/javascript">
		var indexmapcenter;
		var indexmapzoom;
	</script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- 百度地图key -->
	<script type="text/javascript"
		src="http://api.map.baidu.com/api?v=2.0&ak=lDSAFnztqS94cdBKPqgQUwTXuciyxpGa">
		
	</script>
	<script src="assets/js/sockjs.min.js" type="text/javascript"></script>
	<script src="assets/js/stomp.min.js" type="text/javascript"></script>
	<script src="assets/js/plugins/layer/layer.js"></script>
	<script src="assets/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="assets/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/js/plugins/pace/pace.min.js"></script>
	<script src="assets/js/hplus.js" type="text/javascript"></script>
	<script src="assets/js/contabs.js" type="text/javascript"></script>
	<script src="assets/js/demo.js"></script>
	<script type="text/javascript">
		$(function() {

			/* demo.showNotification('top','right', 'success', "欢迎来到<b>中大检测在线监控平台</b>."); */

			$("#side-menu").metisMenu();

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
			stompClient
					.connect(
							{},
							function(frame) {
								console.log("connected-------:" + frame);
								stompClient
										.subscribe(
												'/user/${userInfo.userName}/message',
												function(data) { //订阅消息
													layer
															.msg(
																	'<a class="J_menuItem" name="消息管理" href="rest/message/messageList">'
																			+ JSON
																					.parse(data.body).alarmContext
																			+ '</a>',
																	{
																		title : '告警消息',
																		closeBtn : 1,
																		time : 30000,
																		offset : 'rb', //右下角弹出
																		anim : 6,
																		icon : 0
																	});

													var alarmCount = parseInt($(
															'#alarmCountSpan')
															.text());
													$('#alarmCountSpan').text(
															alarmCount);

													/* $('#newMessageAudio').html('<audio autoplay="autoplay">' 
															+ '<source src="assets/audio/notify.wav" type="audio/wav"/></audio>');  */

													/* if($.browser.msie && $.browser.version=='8.0'){ 
														//本来这里用的是<bgsound src="system.wav"/>,结果IE8不播放声音,于是换成了embed 
														$('#newMessageAudio').html('<embed src="assets/audio/notify.wav"/>');
														alert('<embed src="assets/audio/notify.wav"/>');
													}else{ 
														//IE9+,Firefox,Chrome均支持<audio/> 
														$('#newMessageAudio').html('<audio autoplay="autoplay">' 
														+ '<source src="assets/audio/notify.wav" type="audio/wav"/></audio>'); 
														alert('<audio autoplay="autoplay">');
													}*/

												});

								/*  console.log("connected++++++:"+frame);
								 stompClient.subscribe('/topic/message',  function(data) { //订阅消息
								 	alert("BBB");
								     alert(data.body);
								 });

								 console.log("connected======:"+frame);
								 stompClient.subscribe('/user/queue/single',  function(data) { //订阅消息
								 	alert("CCC");
								     alert(data.body);
								 }); */
							});

			//	        stompClient.send("/ws/singlemessage", {}, JSON.stringify({
			//	            name : "nane",
			//	            taskName : "taskName",
			//	            taskDetail : "taskDetail"
			//	       }));

		});
	</script>

	<!-- 动态加载左导航栏我的项目 -->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var btainUserId = "${sessionScope.userInfo.userId}";
							var userId = btainUserId;
							var key = true;
							var projectData = null;
							$(".queryproject")
									.click(
											function() {
												if (key) {
													key = false;
													var itemName = "";
													$
															.ajax({
																url : 'rest/project/myproject',
																dataType : 'json',
																data : 'userId='
																		+ userId,
																success : function(
																		data) {
																	$
																			.each(
																					data,
																					function(
																							key,
																							value) {
																						projectData = data;
																						var label = "<li><a class='secondbind' data-toggle='collapse' data-parent='#accordion'  href='#"+key+"' name='"+key+"'><i class='fa fa-columns'></i><span class='nav-label'>"
																								+ key
																								+ "</span><span class='fa arrow'></span></a><ul class='collapse nav nav-second-level' id='"+key+"' ></ul></li>";
																						$(
																								".filling")
																								.append(
																										label);
																					});
																}
															});
												}
											});
							var key2 = true;
							var map = {};
							$(document)
									.on(
											'click',
											'.secondbind',
											function() {
												var dataKey = $(this).attr(
														"name");
												var value = projectData[dataKey];
												if (map[dataKey] == null) {
													map[dataKey] = 1;
													key2 = true;
												} else {
													key2 = false;
												}
												if (key2) {
													$(value)
															.each(
																	function(
																			index,
																			val) {
																		var projectName = val.projectName;
																		index++;
																		var label = "<li><a class='thirdbind' data-toggle='collapse' data-target='#"+projectName+"' name='"+val.projectId+"'><i>"
																				+ index
																				+ ":"
																				+ "</i><span class='nav-label'>"
																				+ projectName
																				+ "</span><span class='fa arrow'></span></a><ul class='collapse nav nav-second-level' id='"+projectName+"' ></ul></li>";
																		$(
																				"#"
																						+ dataKey)
																				.append(
																						label);
																	});
												}
											});

							$(document)
									.on(
											'click',
											'.thirdbind',
											function() {
												var projectId = $(this).attr(
														"name");
												var projectName = $(this).attr(
														"data-target");
												if (map[projectName] == null) {
													map[projectName] = 1;
													key2 = true;
												} else {
													key2 = false;
												}
												if (key2) {
													$
															.ajax({
																url : 'rest/project/queryItem',
																dataType : 'json',
																data : 'projectId='
																		+ projectId,
																success : function(
																		data) {
																	$(data)
																			.each(
																					function(
																							index,
																							val) {
																						var label = "<li><a class='J_menuItem' name='"
																								+ val.itemName
																								+ "' href='rest/project/"
																								+ val.itemValue
																								+ "?projectId="
																								+ val.projectId
																								+ "&detectionTypeId="
																								+ val.detectionTypeId
																								+ "'><i>—</i><span class='nav-label'>"
																								+ val.itemName
																								+ "</span></a></li>";
																						$(
																								projectName)
																								.append(
																										label);
																					});
																}
															});
												}
											});
						})
	</script>

</body>
</html>
