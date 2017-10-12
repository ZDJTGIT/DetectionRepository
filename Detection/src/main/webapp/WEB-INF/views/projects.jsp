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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>项目</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="shortcut icon" href="favicon.ico">
</head>
<body class="gray-bg">

	<div class="wrapper wrapper-content animated fadeInUp">
		<div class="row">
			<div class="col-sm-12">

				<div class="ibox">
					<div class="ibox-title">
						<h5>所有项目</h5>
						<div class="ibox-tools">
							<a href="projects.html" class="btn btn-primary btn-xs">创建新项目</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row m-b-sm m-t-sm">
							<div class="col-md-1">
								<button type="button" id="loading-example-btn"
									class="btn btn-white btn-sm">
									<i class="fa fa-refresh"></i> 刷新
								</button>
							</div>
							<div class="col-md-11">
								<div class="input-group">
									<input type="text" placeholder="请输入项目名称"
										class="input-sm form-control"> <span
										class="input-group-btn">
										<button type="button" class="btn btn-sm btn-primary">
											搜索</button>
									</span>
								</div>
							</div>
						</div>

						<div class="project-list">

							<table class="table table-hover">
								<tbody>
									<tr>
										<td class="project-status"><span
											class="label label-primary">进行中 </td>
										<td class="project-title"><a href="project_detail.html">长沙橘子洲西边坡A工程</a>
											<br /> <small>创建于 2014.08.15</small></td>
										<td class="project-completion"><small>当前进度： 48%</small>
											<div class="progress progress-mini">
												<div style="width: 48%;" class="progress-bar"></div>
											</div></td>
										<td class="project-people"><a href="projects.html"><img
												alt="image" class="img-circle" src="img/a3.jpg"></a> <a
											href="projects.html"><img alt="image" class="img-circle"
												src="img/a1.jpg"></a> <a href="projects.html"><img
												alt="image" class="img-circle" src="img/a2.jpg"></a> <a
											href="projects.html"><img alt="image" class="img-circle"
												src="img/a4.jpg"></a> <a href="projects.html"><img
												alt="image" class="img-circle" src="img/a5.jpg"></a></td>
										<td class="project-actions"><a href="projects.html#"
											class="btn btn-white btn-sm"><i class="fa fa-folder"></i>
												查看 </a> <a href="projects.html#" class="btn btn-white btn-sm"><i
												class="fa fa-pencil"></i> 编辑 </a></td>
									</tr>
									<tr>
										<td class="project-status"><span
											class="label label-primary">进行中 </td>
										<td class="project-title"><a href="project_detail.html">长沙橘子洲边坡B工程</a> <br /> <small>创建于 2014.08.15</small></td>
										<td class="project-completion"><small>当前进度： 28%</small>
											<div class="progress progress-mini">
												<div style="width: 28%;" class="progress-bar"></div>
											</div></td>
										<td class="project-people"><a href="projects.html"><img
												alt="image" class="img-circle" src="img/a7.jpg"></a> <a
											href="projects.html"><img alt="image" class="img-circle"
												src="img/a6.jpg"></a> <a href="projects.html"><img
												alt="image" class="img-circle" src="img/a3.jpg"></a></td>
										<td class="project-actions"><a href="projects.html#"
											class="btn btn-white btn-sm"><i class="fa fa-folder"></i>
												查看 </a> <a href="projects.html#" class="btn btn-white btn-sm"><i
												class="fa fa-pencil"></i> 编辑 </a></td>
									</tr>
									<tr>
										<td class="project-status"><span
											class="label label-default">已取消 </td>
										<td class="project-title"><a href="project_detail.html">长沙橘子洲边坡=C工程</a>
											<br /> <small>创建于 2014.08.15</small></td>
										<td class="project-completion"><small>当前进度： 8%</small>
											<div class="progress progress-mini">
												<div style="width: 8%;" class="progress-bar"></div>
											</div></td>
										<td class="project-people"><a href="projects.html"><img
												alt="image" class="img-circle" src="img/a5.jpg"></a> <a
											href="projects.html"><img alt="image" class="img-circle"
												src="img/a3.jpg"></a></td>
										<td class="project-actions"><a href="projects.html#"
											class="btn btn-white btn-sm"><i class="fa fa-folder"></i>
												查看 </a> <a href="projects.html#" class="btn btn-white btn-sm"><i
												class="fa fa-pencil"></i> 编辑 </a></td>
									</tr>
									<tr>
										<td class="project-status"><span
											class="label label-primary">进行中 </td>
										<td class="project-title"><a href="project_detail.html">长沙岳麓区边坡A工程</a>
											<br /> <small>创建于 2014.08.15</small></td>
										<td class="project-completion"><small>当前进度： 83%</small>
											<div class="progress progress-mini">
												<div style="width: 83%;" class="progress-bar"></div>
											</div></td>
										<td class="project-people"><a href="projects.html"><img
												alt="image" class="img-circle" src="img/a2.jpg"></a> <a
											href="projects.html"><img alt="image" class="img-circle"
												src="img/a3.jpg"></a> <a href="projects.html"><img
												alt="image" class="img-circle" src="img/a1.jpg"></a> <a
											href="projects.html"><img alt="image" class="img-circle"
												src="img/a7.jpg"></a></td>
										<td class="project-actions"><a href="projects.html#"
											class="btn btn-white btn-sm"><i class="fa fa-folder"></i>
												查看 </a> <a href="projects.html#" class="btn btn-white btn-sm"><i
												class="fa fa-pencil"></i> 编辑 </a></td>
									</tr>
									<tr>
										<td class="project-status"><span
											class="label label-primary">进行中 </td>
										<td class="project-title"><a href="project_detail.html">长沙岳麓区四水厂边坡A工程</a>
											<br /> <small>创建于 2014.08.15</small></td>
										<td class="project-completion"><small>当前进度： 97%</small>
											<div class="progress progress-mini">
												<div style="width: 97%;" class="progress-bar"></div>
											</div></td>
										<td class="project-people"><a href="projects.html"><img
												alt="image" class="img-circle" src="img/a4.jpg"></a></td>
										<td class="project-actions"><a href="projects.html#"
											class="btn btn-white btn-sm"><i class="fa fa-folder"></i>
												查看 </a> <a href="projects.html#" class="btn btn-white btn-sm"><i
												class="fa fa-pencil"></i> 编辑 </a></td>
									</tr>
									<tr>
										<td class="project-status"><span
											class="label label-primary">进行中 </td>
										<td class="project-title"><a href="project_detail.html">长沙岳麓区四水厂边坡b工程</a>
											<br /> <small>创建于 2014.08.15</small></td>
										<td class="project-completion"><small>当前进度： 48%</small>
											<div class="progress progress-mini">
												<div style="width: 48%;" class="progress-bar"></div>
											</div></td>
										<td class="project-people"><a href="projects.html"><img
												alt="image" class="img-circle" src="img/a1.jpg"></a> <a
											href="projects.html"><img alt="image" class="img-circle"
												src="img/a2.jpg"></a> <a href="projects.html"><img
												alt="image" class="img-circle" src="img/a4.jpg"></a> <a
											href="projects.html"><img alt="image" class="img-circle"
												src="img/a5.jpg"></a></td>
										<td class="project-actions"><a href="projects.html#"
											class="btn btn-white btn-sm"><i class="fa fa-folder"></i>
												查看 </a> <a href="projects.html#" class="btn btn-white btn-sm"><i
												class="fa fa-pencil"></i> 编辑 </a></td>
									</tr>
									<tr>
										<td class="project-status"><span
											class="label label-primary">进行中 </td>
										<td class="project-title"><a href="project_detail.html">长沙岳麓区四水厂边坡c工程</a>
											<br /> <small>创建于 2014.08.15</small></td>
										<td class="project-completion"><small>当前进度： 28%</small>
											<div class="progress progress-mini">
												<div style="width: 28%;" class="progress-bar"></div>
											</div></td>
										<td class="project-people"><a href="projects.html"><img
												alt="image" class="img-circle" src="img/a7.jpg"></a> <a
											href="projects.html"><img alt="image" class="img-circle"
												src="img/a6.jpg"></a> <a href="projects.html"><img
												alt="image" class="img-circle" src="img/a3.jpg"></a></td>
										<td class="project-actions"><a href="projects.html#"
											class="btn btn-white btn-sm"><i class="fa fa-folder"></i>
												查看 </a> <a href="projects.html#" class="btn btn-white btn-sm"><i
												class="fa fa-pencil"></i> 编辑 </a></td>
									</tr>
									<tr>
										<td class="project-status"><span
											class="label label-default">已取消 </td>
										<td class="project-title"><a href="project_detail.html">郴州东江湖边坡A工程</a>
											<br /> <small>创建于 2014.08.15</small></td>
										<td class="project-completion"><small>当前进度： 8%</small>
											<div class="progress progress-mini">
												<div style="width: 8%;" class="progress-bar"></div>
											</div></td>
										<td class="project-people"><a href="projects.html"><img
												alt="image" class="img-circle" src="img/a5.jpg"></a> <a
											href="projects.html"><img alt="image" class="img-circle"
												src="img/a3.jpg"></a></td>
										<td class="project-actions"><a href="projects.html#"
											class="btn btn-white btn-sm"><i class="fa fa-folder"></i>
												查看 </a> <a href="projects.html#" class="btn btn-white btn-sm"><i
												class="fa fa-pencil"></i> 编辑 </a></td>
									</tr>
									<tr>
										<td class="project-status"><span
											class="label label-primary">进行中 </td>
										<td class="project-title"><a href="project_detail.html">P郴州东江湖边坡A工程家</a>
											<br /> <small>创建于 2014.08.15</small></td>
										<td class="project-completion"><small>当前进度： 83%</small>
											<div class="progress progress-mini">
												<div style="width: 83%;" class="progress-bar"></div>
											</div></td>
										<td class="project-people"><a href="projects.html"><img
												alt="image" class="img-circle" src="img/a2.jpg"></a> <a
											href="projects.html"><img alt="image" class="img-circle"
												src="img/a3.jpg"></a> <a href="projects.html"><img
												alt="image" class="img-circle" src="img/a1.jpg"></a></td>
										<td class="project-actions"><a href="projects.html#"
											class="btn btn-white btn-sm"><i class="fa fa-folder"></i>
												查看 </a> <a href="projects.html#" class="btn btn-white btn-sm"><i
												class="fa fa-pencil"></i> 编辑 </a></td>
									</tr>
									<tr>
										<td class="project-status"><span
											class="label label-primary">进行中 </td>
										<td class="project-title"><a href="project_detail.html">郴州东江湖边坡B工程</a> <br /> <small>创建于 2014.08.15</small></td>
										<td class="project-completion"><small>当前进度： 97%</small>
											<div class="progress progress-mini">
												<div style="width: 97%;" class="progress-bar"></div>
											</div></td>
										<td class="project-people"><a href="projects.html"><img
												alt="image" class="img-circle" src="img/a4.jpg"></a></td>
										<td class="project-actions"><a href="projects.html#"
											class="btn btn-white btn-sm"><i class="fa fa-folder"></i>
												查看 </a> <a href="projects.html#" class="btn btn-white btn-sm"><i
												class="fa fa-pencil"></i> 编辑 </a></td>
									</tr>
									<tr>
										<td class="project-status"><span
											class="label label-primary">进行中 </td>
										<td class="project-title"><a href="project_detail.html">郴州东江湖边坡c工程</a>
											<br /> <small>创建于 2014.08.15</small></td>
										<td class="project-completion"><small>当前进度： 28%</small>
											<div class="progress progress-mini">
												<div style="width: 28%;" class="progress-bar"></div>
											</div></td>
										<td class="project-people"><a href="projects.html"><img
												alt="image" class="img-circle" src="img/a7.jpg"></a> <a
											href="projects.html"><img alt="image" class="img-circle"
												src="img/a6.jpg"></a> <a href="projects.html"><img
												alt="image" class="img-circle" src="img/a3.jpg"></a></td>
										<td class="project-actions"><a href="projects.html#"
											class="btn btn-white btn-sm"><i class="fa fa-folder"></i>
												查看 </a> <a href="projects.html#" class="btn btn-white btn-sm"><i
												class="fa fa-pencil"></i> 编辑 </a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/content.js"></script>
	<script>
		$(document).ready(function() {
			$("#loading-example-btn").click(function() {
				btn = $(this);
				simpleLoad(btn, true);
				simpleLoad(btn, false)
			})
		});
		function simpleLoad(btn, state) {
			if (state) {
				btn.children().addClass("fa-spin");
				btn.contents().last().replaceWith(" Loading")
			} else {
				setTimeout(function() {
					btn.children().removeClass("fa-spin");
					btn.contents().last().replaceWith(" Refresh")
				}, 2000)
			}
		};
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>