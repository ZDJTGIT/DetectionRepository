<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Home</title>
<meta name="keywords"
	content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="stylesheet"
	href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
<style type="text/css">
#mapContent {
	width: 100%;
	height: 750px;
}
</style>
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">

		<div class="row">
			<div class="col-sm-9">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<div class="content" id="mapContent"></div>

					</div>
				</div>
			</div>
			 <div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>项目信息</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_data_tables.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="table_data_tables.html#">选项1</a></li>
								<li><a href="table_data_tables.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					 <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover display" id="maphometabel"  cellspacing="0" width="100%"> 
                            <thead>
                                <tr>
                                	<td>项目名称</td>
									<td>告警</td>
								</tr>
                            </thead>
                            <tbody id="homecaveatproject">
                            	<c:forEach items="${projectList }" var="projectsList">
                            		<tr>
                            			<td>${projectsList.projectName }</td>
                            			<td><i class="fa fa-bell"></i> <span class="label label-primary">${projectsList.messageCount }</span></td>
                            		</tr> 
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>
				</div>
			</div> 
		</div>
	</div>
	<script type="text/javascript">
		var homeMapProjectList = '${projectLists}';
		var homeMapjsonObjss = JSON.parse(homeMapProjectList); 
		
	</script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/demo.js"></script>
	 <script src="assets/js/plugins/jeditable/jquery.jeditable.js"></script>
    <!-- Data Tables -->
    <script src="assets/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    
	<script type="text/javascript">
		var spanlist = $("#homecaveatproject").find('span');
		$(spanlist).each(function(){
			 if($(this).text()>0){
				$(this).removeClass("label label-primary");
				$(this).addClass("label label-warning");
			} 
		});
		$(document).ready(function() {
			$('#maphometabel').dataTable();
			
		}); 
		$(document).ready(function() {
			demo.initAMap();
			$("input[type='search']").css({width:'100%'});
		});
		
	</script>
</body>
</html>
