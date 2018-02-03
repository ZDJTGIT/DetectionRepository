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
<title>用户</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">

<link rel="shortcut icon" href="favicon.ico"> <link href="assets/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">

<link href="assets/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="assets/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<!-- Sweet Alert -->
<link href="assets/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<link href="assets/css/style.min.css" rel="stylesheet">
<link href="assets/css/plugins/table/basic.css" rel="stylesheet">
<link href="css/titatoggle-dist.css" rel="stylesheet">
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>用户详细信息列表</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_data_tables.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="table_data_tables.html#">添加联系人</a></li>
								<li><a href="table_data_tables.html#">删除联系人</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-5 m-b-xs">
								<p>详细记录用户各项基本信息(用户初始密码：123456)</p>
								<a href="javascript:;" id="popupAddUser" data-toggle="modal" data-target="#myModal_addUser">添加用户</a>
							<!-- Modal添加用户 -->
							<div class="modal fade" id="myModal_addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							 <form id="form_adduser">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel_addProject">添加新用户</h4>
							      </div>
							      <div class="modal-body">
							      		<p>(请确保用户名的唯一，确认邮箱，电话正确。其他输入框不能为空)</p>
											<br>
											<label class="md_lable" for="userName">用户名:</label>
											<input class="md_input" type="text" id="userName" name="userName"><br><br>
	
											<label class="md_lable" for="linkman">联系人:</label>
											<input class="md_input" type="text" id="linkman" name="linkman"><br><br>
	
											<label class="md_lable" for="company">所属公司:</label>
											<input class="md_input" type="text" id="company" name="company"><br><br>
	
											<label class="md_lable" for="phone">手机号码:</label>
											<input class="md_input" type="text"id="phone" name="phone"><br><br>
	
											<label class="md_lable" for="email">邮箱地址:</label>
											<input class="md_input" type="text" id="email" name="email"><br><br>
											
								            <label class="md_lable" for="">所属角色:</label>
								            <div id="userRole_div_s">
								            </div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" id="offAddUser" class="btn btn-default" data-dismiss="modal">关闭</button>
							        <button type="button" id="sureAdd" class="btn btn-primary">提交</button>
							      </div>
							    </div>
							  </div>
							 </form>
							</div>
						
							<!-- Modal修改用户 -->
							<div class="modal fade" id="myModal_modifyuser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							 <form id="form_modifyuser">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel_addProject">修改用户信息</h4>
							      </div>
							      <div class="modal-body">
							      		<p>(请确保修改之后用户名唯一，确认邮箱，电话正确。其他输入框不能为空)</p>
										<label for="mdid" style="display:none"></label>
										<input type="text" id="mdid" name="mdid" style="display:none"><br>

										<label class="md_lable" for="mdname">用户名:</label>
										<input class="md_input" type="text" id="mdname" name="mdname"><br><br>

										<label class="md_lable" for="mdlinkman">联系人:</label>
										<input class="md_input" type="text" id="mdlinkman" name="mdlinkman"><br><br>

										<label class="md_lable" for="mdcompany">所属公司:</label>
										<input class="md_input" type="text" id="mdcompany" name="mdcompany"><br><br>

										<label class="md_lable" for="mdphone">手机号码:</label>
										<input class="md_input" type="text" id="mdphone" name="mdphone"><br><br>

										<label class="md_lable" for="mdemail">邮箱地址:</label>
										<input class="md_input" type="text" id="mdemail" name="mdemail"><br><br>
										
										<label class="md_lable" for="">所属角色:</label>
										<div id="userRole_div">
							            </div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" id="offModifyUser" class="btn btn-default" data-dismiss="modal">关闭</button>
							        <button type="button" id="sureMdy" class="btn btn-primary">提交</button>
							      </div>
							    </div>
							  </div>
							 </form>
							</div>
								
							</div>
							<div class="col-sm-4 m-b-xs">
								<div data-toggle="buttons" class="btn-group"></div>
							</div>
							<div class="col-sm-3">
								<div class="input-group">
									<input type="text" id="keyword" name="keyword" placeholder="输入用户名，邮箱，手机号，公司，联系人关键字" class="input-sm form-control"> 
									<span class="input-group-btn">
									<button type="button" id="sureSearch" class="btn btn-sm btn-primary">
									搜索
									</button>
									</span>
								</div>
							</div>
						</div>
							<table class="table table-striped table-bordered table-hover display" id="mytable">
								<thead>
									<tr>
										<th>ID</th>
										<th>用户名</th>
										<th>邮箱</th>
										<th>手机号码</th>
										<th>所属公司</th>
										<th>联系人</th>
										<th>所属角色</th>
										<th>创建时间</th>
										<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</th>
										<th>状态</th>
										<th>修改状态</th>
									</tr>
								</thead>
								<tbody id="userTableDeatil">
									<c:forEach items="${userList}" var="singleUser">
										
										<tr class="project-status">
											<td>${singleUser.userId}</td>
											<td>${singleUser.userName}</td>
											<td>${singleUser.email}</td>
											<td>${singleUser.phone}</td>
											<td>${singleUser.company}</td>
											<td>${singleUser.linkman}</td>
											<td>${singleUser.roleName}</td>
											<td><fmt:formatDate value="${singleUser.createTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
											<td>
												<a href="javascript:;" class="selectRow"
												onclick="selectRow(this)" data-toggle="modal" data-target="#myModal_modifyuser"><b>修改</b></a>
												&nbsp;&nbsp;&nbsp;
												<a href="javascript:;" class="deteteRow"
												onclick="deleteRow(this)"><b>删除</b></a>
											</td>
											<td>${singleUser.status}</td> 
	                            			<td >
	                            			    <a href="javascript:;" class="changStatus" 
	                            			    onclick="changStatus(this)"><b>&nbsp;&nbsp;切换</b></a>
	                            			</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
					</div>
					<input class="md_input" style="display:none" id="table_basic_DLID" name="table_basic_DLID" value="${userInfo.userId}">
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="assets/js/customerValidate.js"></script>
	<!-- Switchery -->
    <script src="assets/js/plugins/switchery/switchery.js"></script>
	<!-- iCheck -->
    <script src="assets/js/plugins/iCheck/icheck.min.js"></script>
	<!-- Data Tables -->
    <script src="assets/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="assets/js/plugins/layer/layer.js"></script>
    <!-- Sweet alert -->
    <script src="assets/js/plugins/sweetalert/sweetalert.min.js"></script>
    <!-- external jquery -->
	<script src="assets/js/table_basic.js"></script>
	
    <script type="text/javascript">
    	function xx(e){
    		var s = e.parentNode.parentNode.rowIndex;
    		alert(s);
    		alert(e);
    	}
    </script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
