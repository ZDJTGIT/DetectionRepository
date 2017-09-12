<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>sidebar</title>
<style type="text/css">
.span_box{
	background-color:#1ab394;
	border-color:#1ab394;
	color:#FFFFFF;
	text-align:center;
	font-size:10px;
	padding:4px 1px;
	height:initial;
}
#span_box_2{
	display:none;
}
</style>
</head>
<body>
	<div class="sidebar" data-background-color="white"
		data-active-color="danger">
		<div class="sidebar-wrapper" id="div_box">
			<span id="span_box_1" class="span_box" onclick="danru('1')"><i class="ti-view-list"></i></span>
			<span id="span_box_2" class="span_box" onclick="danru('2')"><i class="ti-view-list"></i></span>
			<ul class="nav nav_bt" id="page-sidebar-menu">
				<li class="active"><a href="rest/home" id="btn-home"> <i
						class="ti-home fti" title="首页"></i>
						<p class="ft">首页</p>
				</a></li>
				<li class="active_bg"><a href="#farmland"
					data-toggle="collapse"> <i class="ti-panel fti" title="我的项目"></i>
						<p class="ft">我的项目</p>
				</a>
				</li>
				<div id="farmland" class="collapse">
					<ul>
						<li><a href="rest/dashboard"> <span>农田</span>
						</a></li>
						<li><a href="rest/dashboard"> <span>桥梁</span>
						</a></li>
						<li><a href="rest/dashboard"> <span>隧道</span>
						</a></li>
					</ul>
				</div>
				<li class="active_bg"><a href="rest/user"> <i
						class="ti-user fti" title="用户信息"></i>
						<p class="ft">用户信息</p>
				</a></li>
				<li class="active_bg"><a href="rest/table"> <i
						class="ti-view-list-alt fti" title="表格集合"></i>
						<p class="ft">表格集合</p>
				</a></li>
				<li class="active_bg"><a href="rest/typography"> <i
						class="ti-text fti" title="排版"></i>
						<p class="ft">排版</p>
				</a></li>
				<li class="active_bg"><a href="rest/icons"> <i
						class="ti-pencil-alt2 fti" title="图标"></i>
						<p class="ft">图标</p>
				</a></li>
				<li class="active_bg"><a href="rest/maps"> <i
						class="ti-map fti" title="地图"></i>
						<p class="ft">地图</p>
				</a></li>
				<li class="active_bg"><a href="rest/notifications"> <i
						class="ti-bell fti" title="消息"></i>
						<p class="ft">消息</p>
				</a></li>
				<li class="active-pro active_bg"><a href="rest/upgrade"> <i
						class="ti-export fti" title="升级"></i>
						<p class="ft">升级</p>
				</a></li>
			</ul>
		</div>
	</div>
</body>
</html>