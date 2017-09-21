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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>Detection</title>
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
	style="overflow-y:hidden  margin: 0
    padding: 0">
	<div id="wrapper">

		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header" style="text-align:center">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" src="assets/img/zdLogo.png" /></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">ZDJC</strong></span>

                                </span>
                            </a>
                        </div>
                    </li>
					<li><a class="J_menuItem" href="rest/home" id="btn-home">
							<i class="fa fa-home"></i> <span class="nav-label">主页</span> <span
							class="fa arrow"></span>
					</a></li>
					<li>
                        <a href="javascript:;">
                            <i class="fa fa-columns"></i>
                            <span class="nav-label">我的项目</span>
                            <span class="fa arrow"></span>
                        </a>
						<ul id="my_project" class="nav nav-second-level">
                            <li>
                            	<a class="J_menuItem" href="javascript:;">
		                        	<i class="fa fa-columns"></i> <span class="nav-label">农田项目</span>
		                        </a>
		                        <ul class="nav nav-second-level">
		                            <li>
		                                <a class="J_menuItem" href="rest/graph_echarts_farmland">农田</a>
		                            </li>
		                        </ul>
                                
                            </li>
                            <li>
                            	<a class="J_menuItem" href="javascript:;">
		                        	<i class="fa fa-columns"></i> <span class="nav-label">桥梁项目</span>
		                        </a>
		                        <ul class="nav nav-second-level">
		                            <li>
		                                <a class="J_menuItem" href="rest/graph_echarts_bridge">桥梁</a>
		                            </li>
		                        </ul>
                            </li>
                             <li>
                            	<a class="J_menuItem" href="javascript:;">
		                        	<i class="fa fa-columns"></i> <span class="nav-label">隧道项目</span>
		                        </a>
		                        <ul class="nav nav-second-level">
		                            <li>
		                                <a class="J_menuItem" href="rest/graph_echarts_tunnel">隧道</a>
		                            </li>
		                        </ul>
                            </li>
                            <li>
                            	<a class="J_menuItem" href="javascript:;">
		                        	<i class="fa fa-columns"></i> <span class="nav-label">边坡项目</span>
		                        </a>
		                        <ul class="nav nav-second-level">
		                            <li>
		                                <a class="J_menuItem" href="rest/graph_echarts_deep">深部位移</a>
		                            </li>
		                            <li>
		                                <a class="J_menuItem" href="rest/graph_echarts_osmotic">渗压</a>
		                            </li>
		                            <li>
		                                <a class="J_menuItem" href="rest/graph_echarts_rainwater">雨量</a>
		                            </li>
		                        </ul>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">统计图表</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	<li>
                                <a class="J_menuItem" href="rest/graph_echarts_farmland">农田数据分析图</a>
							</li>
							<li>
                                <a class="J_menuItem" href="rest/graph_echarts_tunnel">隧道数据分析图</a>
							</li>
							<li>
                                <a class="J_menuItem" href="rest/graph_echarts_bridge">桥梁数据分析图</a>
							</li>

						</ul>
					</li>
					<li><a href="javascript:;"><i class="fa fa-desktop"></i> <span
							class="nav-label">页面</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="rest/user">个人资料</a></li>
							<li><a href="javascript:;">项目管理 <span class="fa arrow"></span></a>
								<ul class="nav nav-third-level">
									<li><a class="J_menuItem" href="rest/projects">项目</a></li>
									<li><a class="J_menuItem" href="rest/project_detail">项目详情</a>
									</li>
								</ul></li>
							<li><a class="J_menuItem" href="rest/calendar">日历</a></li>
							<li><a class="J_menuItem" href="rest/pin_board">标签墙</a></li>
							<li><a href="javascript:;">单据 <span class="fa arrow"></span></a>
								<ul class="nav nav-third-level">
									<li><a class="J_menuItem" href="rest/invoice">单据</a></li>
									<li><a class="J_menuItem" href="rest/invoice_print">单据打印</a>
									</li>
								</ul></li>
							<li><a href="javascript:;">即时通讯 <span class="fa arrow"></span></a>
								<ul class="nav nav-third-level">
									<li><a class="J_menuItem" href="rest/chat_view">聊天窗口</a></li>
									<li><a class="J_menuItem" href="rest/webim">layIM</a></li>
								</ul></li>
							<li><a href="javascript:;">登录注册相关 <span class="fa arrow"></span></a>
								<ul class="nav nav-third-level">
									<li><a href="rest/page/login" target="_blank">登录页面</a></li>
									<li><a href="rest/login_v2" target="_blank">登录页面v2</a></li>
									<li><a href="rest/register" target="_blank">注册页面</a></li>
								</ul></li>
							<li><a class="J_menuItem" href="rest/404">404页面</a></li>
							<li><a class="J_menuItem" href="rest/500">500页面</a></li>
						</ul></li>
					<li><a href="javascript:;"><i class="fa fa-table"></i> <span
							class="nav-label">表格</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="rest/user/userList">用户&告警联系人
									<span class="label label-danger pull-right">管理员可见</span>
							</a></li>
							<li><a class="J_menuItem" href="rest/table_data_tables">详细检验数据展示分析</a>
							</li>
							<li><a class="J_menuItem" href="rest/table_foo_table">操作日志</a>
							</li>
							<li><a class="J_menuItem" href="rest/table_bootstrap">其他</a>
							</li>
						</ul></li>
					<li><a class="J_menuItem" href="rest/table_jqgrid"><i
							class="fa fa-bell"></i> <span class="nav-label">告警信息</span></a></li>
					<li><a class="J_menuItem" href="rest/css_animation"><i
							class="fa fa-magic"></i> <span class="nav-label">CSS动画</span></a></li>
					<li><a href="javascript:;"><i class="fa fa-cutlery"></i> <span
							class="nav-label">工具 </span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="rest/form_builder">表单构建器</a>
							</li>
						</ul></li>

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
							<a href="#" class="navbar-brand">中国大检测数据在线监控平台</a>
						</div>
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="javascript:;"> <i
								class="fa fa-envelope"></i> <span class="label label-warning">16</span>
						</a>
							<ul class="dropdown-menu dropdown-messages">
								<li class="m-t-xs">
									<div class="dropdown-messages-box">
										<a href="rest/profile" class="pull-left"> <img alt="image"
											class="img-circle" src="assets/img/zdLogo.png">
										</a>
										<div class="media-body">
											<small class="pull-right">46小时前</small> <strong>李四</strong>
											XX边坡项目深部位移监测55米孔深处，编号JCZ1测点位移量为XXmm,超出阀值，请及时处理<br> <small
												class="text-muted">1天前 2017.9.20</small>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="dropdown-messages-box">
										<a href="rest/profile" class="pull-left"> <img alt="image"
											class="img-circle" src="assets/img/zdLogo.png">
										</a>
										<div class="media-body ">
											<small class="pull-right text-navy">2小时前</small> <strong>王五</strong>
											XX边坡项目地下水位位监测，编号JCZ1 90m处水位达到XXmm，临近阀值，请及时采取措施预防 <br> <small
												class="text-muted">今天 2017.9.21</small>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="text-center link-block">
										<a class="J_menuItem" href="rest/mailbox"> <i
											class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
										</a>
									</div>
								</li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="javascript:;"> <i
								class="fa fa-bell"></i> <span class="label label-primary">8</span>
						</a>
							<ul class="dropdown-menu dropdown-alerts">
								<li><a href="rest/mailbox">
										<div>
											<i class="fa fa-envelope fa-fw"></i> 您有16条未读消息 <span
												class="pull-right text-muted small">4分钟前</span>
										</div>
								</a></li>
								<li class="divider"></li>
								<li><a href="rest/profile">
										<div>
											<i class="fa fa-qq fa-fw"></i> 3条新回复 <span
												class="pull-right text-muted small">12分钟钱</span>
										</div>
								</a></li>
								<li class="divider"></li>
								<li>
									<div class="text-center link-block">
										<a class="J_menuItem" href="rest/notifications"> <strong>查看所有
										</strong> <i class="fa fa-angle-right"></i>
										</a>
									</div>
								</li>
							</ul></li>
						<li class="hidden-xs">
							<a class="J_menuItem dropdown-toggle" data-toggle="dropdown" href="javascript:;">
								<i class="fa fa-user"></i>${userInfo.userName}<span class="caret"></span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
	                            <li><a class="J_menuItem" href="rest/form_avatar">修改头像</a>
	                            </li>
	                            <li><a class="J_menuItem" href="rest/user">个人资料</a>
	                            </li>
	                            <li><a class="J_menuItem" href="rest/contacts">联系我们</a>
	                            </li>
	                            <li><a class="J_menuItem" href="rest/mailbox">信箱</a>
	                            </li>
	                            <li class="divider"></li>
	                            <li><a href="rest/user/logout">安全退出</a>
	                            </li>
	                        </ul>
						</li>
						<li class="dropdown hidden-xs"><a class="right-sidebar-toggle"
							aria-expanded="false"> <i class="fa fa-tasks"></i> 主题
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
					<li class=""><a data-toggle="tab" href="#tab-2"> 通知 </a></li>
					<li><a data-toggle="tab" href="#tab-3"> 项目进度 </a></li>
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
					<div id="tab-2" class="tab-pane">

						<div class="sidebar-title">
							<h3>
								<i class="fa fa-comments-o"></i> 最新通知
							</h3>
							<small><i class="fa fa-tim"></i> 您当前有10条未读信息</small>
						</div>

						<div>

							<div class="sidebar-message">
								<a href="javascript:;">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="assets/img/a1.jpg">

										<div class="m-t-xs">
											<i class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i>
										</div>
									</div>
									<div class="media-body">

										据天津日报报道：瑞海公司董事长于学伟，副董事长董社轩等10人在13日上午已被控制。 <br> <small
											class="text-muted">今天 4:21</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="javascript:;">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="assets/img/a2.jpg">
									</div>
									<div class="media-body">
										HCY48之音乐大魔王会员专属皮肤已上线，快来一键换装拥有他，宣告你对华晨宇的爱吧！ <br> <small
											class="text-muted">昨天 2:45</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="javascript:;">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="assets/img/a3.jpg">

										<div class="m-t-xs">
											<i class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i>
										</div>
									</div>
									<div class="media-body">
										写的好！与您分享 <br> <small class="text-muted">昨天 1:10</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="javascript:;">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="assets/img/a4.jpg">
									</div>

									<div class="media-body">
										国外极限小子的炼成！这还是亲生的吗！！ <br> <small class="text-muted">昨天
											8:37</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="javascript:;">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="assets/img/a8.jpg">
									</div>
									<div class="media-body">

										一只流浪狗被收留后，为了减轻主人的负担，坚持自己觅食，甚至......有些东西，可能她比我们更懂。 <br> <small
											class="text-muted">今天 4:21</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="javascript:;">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="assets/img/a7.jpg">
									</div>
									<div class="media-body">
										这哥们的新视频又来了，创意杠杠滴，帅炸了！ <br> <small class="text-muted">昨天
											2:45</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="javascript:;">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="assets/img/a3.jpg">

										<div class="m-t-xs">
											<i class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i> <i
												class="fa fa-star text-warning"></i>
										</div>
									</div>
									<div class="media-body">
										最近在补追此剧，特别喜欢这段表白。 <br> <small class="text-muted">昨天
											1:10</small>
									</div>
								</a>
							</div>
							<div class="sidebar-message">
								<a href="javascript:;">
									<div class="pull-left text-center">
										<img alt="image" class="img-circle message-avatar"
											src="assets/img/a4.jpg">
									</div>
									<div class="media-body">
										我发起了一个投票 【你认为下午大盘会翻红吗？】 <br> <small class="text-muted">星期一
											8:37</small>
									</div>
								</a>
							</div>
						</div>

					</div>
					<div id="tab-3" class="tab-pane">

						<div class="sidebar-title">
							<h3>
								<i class="fa fa-cube"></i> 最新任务
							</h3>
							<small><i class="fa fa-tim"></i> 您当前有14个任务，10个已完成</small>
						</div>

						<ul class="sidebar-list">
							<li><a href="javascript:;">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>市场调研</h4> 按要求接收教材；

									<div class="small">已完成： 22%</div>
									<div class="progress progress-mini">
										<div style="width: 22%;"
											class="progress-bar progress-bar-warning"></div>
									</div>
									<div class="small text-muted m-t-xs">项目截止： 4:00 -
										2015.10.01</div>
							</a></li>
							<li><a href="javascript:;">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>可行性报告研究报上级批准</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的
									开发进度作出一个合理的比对

									<div class="small">已完成： 48%</div>
									<div class="progress progress-mini">
										<div style="width: 48%;" class="progress-bar"></div>
									</div>
							</a></li>
							<li><a href="javascript:;">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>立项阶段</h4> 东风商用车公司 采购综合综合查询分析系统项目进度阶段性报告武汉斯迪克科技有限公司

									<div class="small">已完成： 14%</div>
									<div class="progress progress-mini">
										<div style="width: 14%;"
											class="progress-bar progress-bar-info"></div>
									</div>
							</a></li>
							<li><a href="javascript:;"> <span
									class="label label-primary pull-right">NEW</span>
									<h4>设计阶段</h4> <div class="small pull-right m-t-xs">9小时以后</div>
									项目进度报告(Project Progress Report)
									<div class="small">已完成： 22%</div>
									<div class="small text-muted m-t-xs">项目截止： 4:00 -
										2015.10.01</div>
							</a></li>
							<li><a href="javascript:;">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>拆迁阶段</h4> 科研项目研究进展报告 项目编号: 项目名称: 项目负责人:

									<div class="small">已完成： 22%</div>
									<div class="progress progress-mini">
										<div style="width: 22%;"
											class="progress-bar progress-bar-warning"></div>
									</div>
									<div class="small text-muted m-t-xs">项目截止： 4:00 -
										2015.10.01</div>
							</a></li>
							<li><a href="javascript:;">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>建设阶段</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的
									开发进度作出一个合理的比对

									<div class="small">已完成： 48%</div>
									<div class="progress progress-mini">
										<div style="width: 48%;" class="progress-bar"></div>
									</div>
							</a></li>
							<li><a href="javascript:;">
									<div class="small pull-right m-t-xs">9小时以后</div>
									<h4>获证开盘</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的
									开发进度作出一个合理的比对

									<div class="small">已完成： 14%</div>
									<div class="progress progress-mini">
										<div style="width: 14%;"
											class="progress-bar progress-bar-info"></div>
									</div>
							</a></li>

						</ul>

					</div>
				</div>

			</div>
		</div>

	<!-- 	mini聊天窗口开始 -->
		<div class="small-chat-box fadeInRight animated">

			<div class="heading" draggable="true">
				<small class="chat-date pull-right"> 2017.9.20 </small> 与 中大客服咨询
				聊天中
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
					<div class="chat-message active">有，您需要了解关于边坡的的哪些技术？
					</div>
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
						1.到中大官网下载：www.hnzdjc.com； <br> 2.预留您的联系方式，邮箱，公司信息； <br> …… <br>
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
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="http://webapi.amap.com/maps?v=1.3&key=45d7aee2c7ba665d7c3445f4209fe885"></script>
	<script src="assets/js/bootstrap-notify.js"></script>
	<script src="assets/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="assets/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/js/plugins/layer/layer.min.js"></script>
	<script src="assets/js/plugins/pace/pace.min.js"></script>
	<script src="assets/js/hplus.js" type="text/javascript"></script>
	<script src="assets/js/contabs.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function(){

	    $.notify({
	        icon: 'fa user',
	        message: "欢迎来到<b>中大检测在线监控平台</b>."

	    },{
	        type: 'success',
	        timer: 4000
	    });

	});
	</script>
	<script type="text/javascript">

		
		var farmspan = document.getElementById("farmspan");
		var farmpointli = document.getElementById("farmpointli");
		farmspan.onclick = function(){
			$("#licontent").remove();
			var li = document.createElement("li");
			li.setAttribute("id","licontent");
			var a = document.createElement("a");
			a.innerHTML = "农田";
			a.setAttribute("class","J_menuItem");
			a.setAttribute("href","rest/graph_echarts_bridge");
			var a2 = document.createElement("a");
			a2.innerHTML = "农田1";
			li.appendChild(a);
			li.appendChild(a2);
			farmpointli.appendChild(li);

		} 
	</script>

</body>
</html>
