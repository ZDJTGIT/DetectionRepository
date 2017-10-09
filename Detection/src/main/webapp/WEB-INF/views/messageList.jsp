<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
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
<title>告警消息列表</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="stylesheet" href="assets/js/plugins/layui/css/layui.css" media="all"></link>

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content  animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>告警消息表</h5>
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
						<div class="">
							<a onclick="fnClickAddRow();" href="javascript:void(0);"
								class="btn btn-primary ">添加行</a>
						</div>
						<table class="layui-table" id="messageTable">
							<thead>
							    <tr>
							      <th>ID</th>
							      <th>消息类型</th>
							      <th lay-data="">消息内容</th>
							      <th lay-data="">创建时间</th>
							      <th lay-data="{field:'status', width:108}">消息状态</th>
							    </tr>
							</thead>
							<tbody>
								<c:forEach items="${messageList}" var="message">
									<tr>
										<td>${message.messageId}</td>
										<td>${message.messageType}</td>
										<td>${message.messageContext}</td>
										<td><fmt:formatDate value="${message.createTime}" type="both"/></td>
										<td>${message.status}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/plugins/layui/layui.all.js" charset="utf-8"></script>
	<script>
		function(){
		  //无需再执行layui.use()方法加载模块，直接使用即可
		  var table = layui.table;

		  table.render({
			  elem: '#messageTable', //指定原始表格元素选择器（推荐id选择器）
			  height: 315, //容器高度
			  cols: [[ //标题栏
			       {field:'messageId', width:50, title: 'ID', sort:true},
			       {field:'messageType', width:108, title: '消息类型'},
			       {field:'messageContext', width:700, title: '创建时间'},
			       {field: 'sign', title: '签名', width: 150}{field:'createTime', width:108, sort:true}
			       {field: 'sex', title: '性别', width: 80}
			       {field: 'city', title: '城市', width: 100}
			       {field: 'experience', title: '积分', width: 80, sort: true}
			  ]] //设置表头
			  //,…… //更多参数参考右侧目录：基本参数选项
			});

		}();
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
