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

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>H+ 后台主题UI框架 - 团队管理</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

<link href="assets/css/animate.min.css" rel="stylesheet">
<link href="assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-4">
				<div class="ibox">
					<div class="ibox-title">
						<span class="label label-primary pull-right">NEW</span>
						<h5>IT-01 - 设计部</h5>
					</div>
					<div class="ibox-content">
						<div class="team-members">
							<a href="#"><img alt="member" class="img-circle"
								src="img/a1.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a2.jpg"> </a> <a href="#"><img
								alt="member" class="img-circle" src="img/a3.jpg"> </a> <a
								href="#"><img alt="member" class="img-circle"
								src="img/a5.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a6.jpg"> </a>
						</div>
						<h4>部门简介</h4>
						<p>平面设计（graphic
							design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
						</p>
						<div>
							<span>当前项目进度：</span>
							<div class="stat-percent">48%</div>
							<div class="progress progress-mini">
								<div style="width: 48%;" class="progress-bar"></div>
							</div>
						</div>
						<div class="row  m-t-sm">
							<div class="col-sm-4">
								<div class="font-bold">项目</div>
								12
							</div>
							<div class="col-sm-4">
								<div class="font-bold">周期</div>
								4个月
							</div>
							<div class="col-sm-4 text-right">
								<div class="font-bold">预算</div>
								&yen;200,913 <i class="fa fa-level-up text-navy"></i>
							</div>
						</div>

					</div>
				</div>
				<div class="ibox">
					<div class="ibox-title">
						<h5>IT-04 - 市场部</h5>
					</div>
					<div class="ibox-content">
						<div class="team-members">
							<a href="#"><img alt="member" class="img-circle"
								src="img/a4.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a5.jpg"> </a> <a href="#"><img
								alt="member" class="img-circle" src="img/a6.jpg"> </a> <a
								href="#"><img alt="member" class="img-circle"
								src="img/a8.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a7.jpg"> </a>
						</div>
						<h4>部门简介</h4>
						<p>平面设计（graphic
							design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
						</p>
						<div>
							<span>当前项目进度：</span>
							<div class="stat-percent">32%</div>
							<div class="progress progress-mini">
								<div style="width: 32%;" class="progress-bar"></div>
							</div>
						</div>
						<div class="row  m-t-sm">
							<div class="col-sm-4">
								<div class="font-bold">项目</div>
								24
							</div>
							<div class="col-sm-4">
								<div class="font-bold">周期</div>
								3个月
							</div>
							<div class="col-sm-4 text-right">
								<div class="font-bold">预算</div>
								&yen;190,325 <i class="fa fa-level-up text-navy"></i>
							</div>
						</div>

					</div>
				</div>
				<div class="ibox">
					<div class="ibox-title">
						<h5>IT-07 - 财务部</h5>
					</div>
					<div class="ibox-content">
						<div class="team-members">
							<a href="#"><img alt="member" class="img-circle"
								src="img/a4.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a8.jpg"> </a> <a href="#"><img
								alt="member" class="img-circle" src="img/a7.jpg"> </a>
						</div>
						<h4>部门简介</h4>
						<p>平面设计（graphic
							design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
						</p>
						<div>
							<span>当前项目进度：</span>
							<div class="stat-percent">73%</div>
							<div class="progress progress-mini">
								<div style="width: 73%;" class="progress-bar"></div>
							</div>
						</div>
						<div class="row  m-t-sm">
							<div class="col-sm-4">
								<div class="font-bold">项目</div>
								11
							</div>
							<div class="col-sm-4">
								<div class="font-bold">周期</div>
								6个月
							</div>
							<div class="col-sm-4 text-right">
								<div class="font-bold">预算</div>
								&yen;560,105 <i class="fa fa-level-up text-navy"></i>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="ibox">
					<div class="ibox-title">
						<h5>IT-02 - 开发部</h5>
					</div>
					<div class="ibox-content">
						<div class="team-members">
							<a href="#"><img alt="member" class="img-circle"
								src="img/a8.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a4.jpg"> </a> <a href="#"><img
								alt="member" class="img-circle" src="img/a1.jpg"> </a>
						</div>
						<h4>部门简介</h4>
						<p>平面设计（graphic
							design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
						</p>
						<div>
							<span>当前项目进度：</span>
							<div class="stat-percent">61%</div>
							<div class="progress progress-mini">
								<div style="width: 61%;" class="progress-bar"></div>
							</div>
						</div>
						<div class="row  m-t-sm">
							<div class="col-sm-4">
								<div class="font-bold">项目</div>
								43
							</div>
							<div class="col-sm-4">
								<div class="font-bold">周期</div>
								1个月
							</div>
							<div class="col-sm-4 text-right">
								<div class="font-bold">预算</div>
								&yen;705,913 <i class="fa fa-level-up text-navy"></i>
							</div>
						</div>

					</div>
				</div>
				<div class="ibox">
					<div class="ibox-title">
						<span class="label label-warning pull-right">截止</span>
						<h5>IT-05 - 管理层</h5>
					</div>
					<div class="ibox-content">
						<div class="team-members">
							<a href="#"><img alt="member" class="img-circle"
								src="img/a1.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a2.jpg"> </a> <a href="#"><img
								alt="member" class="img-circle" src="img/a6.jpg"> </a> <a
								href="#"><img alt="member" class="img-circle"
								src="img/a3.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a4.jpg"> </a> <a href="#"><img
								alt="member" class="img-circle" src="img/a7.jpg"> </a>
						</div>
						<h4>部门简介</h4>
						<p>平面设计（graphic
							design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
						</p>
						<div>
							<span>当前项目进度：</span>
							<div class="stat-percent">14%</div>
							<div class="progress progress-mini">
								<div style="width: 14%;" class="progress-bar"></div>
							</div>
						</div>
						<div class="row  m-t-sm">
							<div class="col-sm-4">
								<div class="font-bold">项目</div>
								8
							</div>
							<div class="col-sm-4">
								<div class="font-bold">周期</div>
								7个月
							</div>
							<div class="col-sm-4 text-right">
								<div class="font-bold">预算</div>
								&yen;40,200 <i class="fa fa-level-up text-navy"></i>
							</div>
						</div>

					</div>
				</div>
				<div class="ibox">
					<div class="ibox-title">
						<h5>IT-08 - 销售部</h5>
					</div>
					<div class="ibox-content">
						<div class="team-members">
							<a href="#"><img alt="member" class="img-circle"
								src="img/a1.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a8.jpg"> </a> <a href="#"><img
								alt="member" class="img-circle" src="img/a3.jpg"> </a> <a
								href="#"><img alt="member" class="img-circle"
								src="img/a7.jpg"> </a>
						</div>
						<h4>部门简介</h4>
						<p>平面设计（graphic
							design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
						</p>
						<div>
							<span>当前项目进度：</span>
							<div class="stat-percent">25%</div>
							<div class="progress progress-mini">
								<div style="width: 25%;" class="progress-bar"></div>
							</div>
						</div>
						<div class="row  m-t-sm">
							<div class="col-sm-4">
								<div class="font-bold">项目</div>
								25
							</div>
							<div class="col-sm-4">
								<div class="font-bold">周期</div>
								4个月
							</div>
							<div class="col-sm-4 text-right">
								<div class="font-bold">预算</div>
								&yen;140,105 <i class="fa fa-level-up text-navy"></i>
							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="ibox">
					<div class="ibox-title">

						<h5>IT-02 - 销售部</h5>
					</div>
					<div class="ibox-content">
						<div class="team-members">
							<a href="#"><img alt="member" class="img-circle"
								src="img/a3.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a4.jpg"> </a> <a href="#"><img
								alt="member" class="img-circle" src="img/a7.jpg"> </a> <a
								href="#"><img alt="member" class="img-circle"
								src="img/a2.jpg"> </a>
						</div>
						<h4>部门简介</h4>
						<p>平面设计（graphic
							design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
						</p>
						<div>
							<span>当前项目进度：</span>
							<div class="stat-percent">82%</div>
							<div class="progress progress-mini">
								<div style="width: 82%;" class="progress-bar"></div>
							</div>
						</div>
						<div class="row  m-t-sm">
							<div class="col-sm-4">
								<div class="font-bold">项目</div>
								68
							</div>
							<div class="col-sm-4">
								<div class="font-bold">周期</div>
								2个月
							</div>
							<div class="col-sm-4 text-right">
								<div class="font-bold">预算</div>
								&yen;701,400 <i class="fa fa-level-up text-navy"></i>
							</div>
						</div>

					</div>
				</div>
				<div class="ibox">
					<div class="ibox-title">
						<h5>IT-06 - 销售部</h5>
					</div>
					<div class="ibox-content">
						<div class="team-members">
							<a href="#"><img alt="member" class="img-circle"
								src="img/a1.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a2.jpg"> </a> <a href="#"><img
								alt="member" class="img-circle" src="img/a4.jpg"> </a> <a
								href="#"><img alt="member" class="img-circle"
								src="img/a7.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a8.jpg"> </a>
						</div>
						<h4>部门简介</h4>
						<p>平面设计（graphic
							design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
						</p>
						<div>
							<span>当前项目进度：</span>
							<div class="stat-percent">26%</div>
							<div class="progress progress-mini">
								<div style="width: 26%;" class="progress-bar"></div>
							</div>
						</div>
						<div class="row  m-t-sm">
							<div class="col-sm-4">
								<div class="font-bold">项目</div>
								16
							</div>
							<div class="col-sm-4">
								<div class="font-bold">周期</div>
								8个月
							</div>
							<div class="col-sm-4 text-right">
								<div class="font-bold">预算</div>
								&yen;160,100 <i class="fa fa-level-up text-navy"></i>
							</div>
						</div>

					</div>
				</div>
				<div class="ibox">
					<div class="ibox-title">
						<h5>IT-09 - 销售部</h5>
					</div>
					<div class="ibox-content">
						<div class="team-members">
							<a href="#"><img alt="member" class="img-circle"
								src="img/a2.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a3.jpg"> </a> <a href="#"><img
								alt="member" class="img-circle" src="img/a8.jpg"> </a> <a
								href="#"><img alt="member" class="img-circle"
								src="img/a6.jpg"> </a> <a href="#"><img alt="member"
								class="img-circle" src="img/a7.jpg"> </a>
						</div>
						<h4>部门简介</h4>
						<p>平面设计（graphic
							design），也称为视觉传达设计，是以“视觉”作为沟通和表现的方式，透过多种方式来创造和结合符号、图片和文字，借此作出用来传达想法或讯息的视觉表现。
						</p>
						<div>
							<span>当前项目进度：</span>
							<div class="stat-percent">18%</div>
							<div class="progress progress-mini">
								<div style="width: 18%;" class="progress-bar"></div>
							</div>
						</div>
						<div class="row  m-t-sm">
							<div class="col-sm-4">
								<div class="font-bold">项目</div>
								53
							</div>
							<div class="col-sm-4">
								<div class="font-bold">周期</div>
								9个月
							</div>
							<div class="col-sm-4 text-right">
								<div class="font-bold">预算</div>
								&yen;60,140 <i class="fa fa-level-up text-navy"></i>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="assets/js/jquery.min.js?v=2.1.4"></script>
	<script src="assets/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="assets/js/content.min.js?v=1.0.0"></script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>


<!-- Mirrored from www.zi-han.net/theme/hplus/teams_board.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:19:44 GMT -->
</html>
