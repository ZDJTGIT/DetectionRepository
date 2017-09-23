<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta http-equiv="refresh" content="5">


<title>用户&告警联系人信息表</title>
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="assets/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link href="assets/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="assets/css/animate.min.css" rel="stylesheet">
<link href="assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">

<style>
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 88);
}

.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 55%;
	height: 55%;
	padding: 20px;
	border: 10px solid orange;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
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
								<a href="javascript:;" id="popupAddUser">添加用户</a>
								<!--a href = "javascript:;" id="popupModfiyUser">修改用户</a-->

								<div id="modifyuser" class="white_content"
									style="width: 500px; height: 430px; margin-left: 200px; margin-top: -50px; background-color: #eeeeee; border: 2px; solid #000; filter: alpha(Opacity = 80); -moz-opacity: 1; opacity: 1;">
									<div>
										<p><h3><strong>修改用户信息</strong></h3>（请确保修改之后用户名唯一，确认邮箱，电话正确。其他输入框不能为空)</p>
										<input type="text" id="mdid" name="mdid"
											style="display:none; border-radius:8px" placeholder="id" class="form-control"><br>
											
										<input type="text" id="mdname" name="mdname"
											style="width: 100%; border-radius:8px" placeholder="用户名" class="form-control"><br>
											
										<input type="text" id="mdlinkman" name="mdlinkman"
											style="width: 100%; border-radius:8px" placeholder="联系人" class="form-control"><br>
											
										<input type="text" id="mdcompany" name="mdcompany"
											style="width: 100%; border-radius:8px" placeholder="邮箱" class="form-control"><br>
											
										<input type="text" id="mdphone" name="mdphone"
											style="width: 100%; border-radius:8px" placeholder="手机号码" class="form-control"><br>
											
										<input type="text" id="mdemail" name="mdemail"
											style="width: 100%; border-radius:8px" placeholder="所属公司" class="form-control">
									</div>
									<br>
									<input type="button" id="sureMdy" style="margin-left:30px; width:130px; height:40px" value="确定修改"> 
									<input type="button" id="closeModfiyUser" style="margin-left:120px; width:130px; height:40px" value="关闭窗口">
								</div>

								<div id="adduser" class="white_content"
									style="width: 500px; height: 480px; margin-left: 200px; margin-top: -50px; background-color: #eeeeee; border: 2px; solid #000; filter: alpha(Opacity = 80); -moz-opacity: 1; opacity: 1;">
								    <form id="form_adduser">
								    <div>
										<p><h3><strong>添加新用户</strong></h3>(请确保用户名的唯一，确认邮箱，电话正确。其他输入框不能为空)</p>
										<br>
										<label for="userName" style="width: 30%; margin-left: 5px">用户名:</label>
										<input type="text" id="userName" name="userName" style="width: 75%; border-radius:8px;
										margin-left: 92px; margin-top: -39px" class="form-control"><br><br>
										
										<label for="linkman" style="width: 30%; margin-left: 5px">联系人:</label>	
										<input type="text" id="linkman" name="linkman" style="width: 75%; border-radius:8px; 
										margin-left: 92px; margin-top: -39px" class="form-control"><br><br>
											
										<label for="company" style="width: 30%; margin-left: 5px">所属公司名称:</label>	
										<input type="text" id="company" name="company" style="width: 75%; border-radius:8px;
										margin-left: 92px; margin-top: -39px" class="form-control"><br><br>
										    
										<label for="phone" style="width: 30%; margin-left: 5px">手机号码:</label>    
										<input type="text"id="phone" name="phone" style="width: 75%; border-radius:8px; 
										margin-left: 92px; margin-top: -39px" class="form-control"><br><br>
										    
										<label for="email" style="width: 30%; margin-left: 5px">邮箱地址:</label>    
										<input type="text" id="email" name="email"  style="width: 75%; border-radius:8px; 
										margin-left: 92px; margin-top: -39px" class="form-control">
									</div>
									<br>
									<input type="button" id="sureAdd" style="margin-left:30px; width:130px; height:40px" value="确定添加"> 
									<input type="button" id="closeAddUser" style="margin-left:120px; width:130px; height:40px" value="关闭窗口">
								    </form>
								</div>
							</div>
							<div class="col-sm-4 m-b-xs">
								<div data-toggle="buttons" class="btn-group"></div>
							</div>
							<div class="col-sm-3">
								<div class="input-group">
									<input type="text" placeholder="请输入关键词"
										class="input-sm form-control"> <span
										class="input-group-btn">
										<button type="button" class="btn btn-sm btn-primary">
											搜索</button>
									</span>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table table-striped" id="mytable"> 
								<thead>
									<tr>
										<th>ID</th>
										<th>用户名</th>
										<th>邮箱</th>
										<th>手机号码</th>
										<th>所属公司</th>
										<th>联系人</th>
										<th>创建时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="userTableDeatil">
									<c:forEach items="${userList}" var="singleUser">
										<tr>
											<td>${singleUser.userId}</td>
											<td>${singleUser.userName}</td>
											<td>${singleUser.email}</td>
											<td>${singleUser.phone}</td>
											<td>${singleUser.company}</td>
											<td>${singleUser.linkman}</td>
											<td>${singleUser.createTime}</td>
											<td>
												<a href="javascript:;" class="selectRow"
												onclick="selectRow(this)"><b>修改用户</b></a> 
												<a href="javascript:;" class="deteteRow"
												onclick="deleteRow(this)"><b>删除用户</b></a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>告警联系人列表</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_basic.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="table_basic.html#">添加联系人</a></li>
								<li><a href="table_basic.html#">删除联系人</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-5 m-b-xs">
								<p>系统数据告警时系统自动与相关联系人建立联系。</p>
								<button class="btn btn-sm btn-white">添加联系人</button>
							</div>
							<div class="col-sm-4 m-b-xs">
								<div data-toggle="buttons" class="btn-group">
									<label class="btn btn-sm btn-white"> <input
										type="radio" id="option1" name="options">隧道
									</label> <label class="btn btn-sm btn-white active"> <input
										type="radio" id="option2" name="options">农田
									</label> <label class="btn btn-sm btn-white"> <input
										type="radio" id="option3" name="options">桥梁
									</label><label class="btn btn-sm btn-white"> <input
										type="radio" id="option4" name="options">公路
									</label>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="input-group">
									<input type="text" placeholder="请输入关键词"
										class="input-sm form-control"> <span
										class="input-group-btn">
										<button type="button" class="btn btn-sm btn-primary">
											搜索</button>
									</span>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th></th>
										<th>接收人</th>
										<th>接收告警类型</th>
										<th>接收方式</th>
										<th>手机号</th>
										<th>邮箱</th>
										<th>短信接收告警级别</th>
										<th>邮件接收告警级别</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox" checked class="i-checks"
											name="input[]"></td>
										<th>罗杰</th>
										<th>农田水位告警</th>
										<th>短信接收</th>
										<th>15456547878</th>
										<th>888888@qq.com</th>
										<th>3</th>
										<th>2</th>
										<td><a href="table_basic.html#"><i
												class="fa fa-check text-navy"></i></a></td>
									</tr>
									<tr>
										<td><input type="checkbox" checked class="i-checks"
											name="input[]"></td>
										<th>张无忌</th>
										<th>农田水位告警</th>
										<th>短信接收</th>
										<th>15456547878</th>
										<th>888888@qq.com</th>
										<th>2</th>
										<th>1</th>
										<td><a href="table_basic.html#"><i
												class="fa fa-check text-navy"></i></a></td>
									</tr>
									<tr>
										<td><input type="checkbox" checked class="i-checks"
											name="input[]"></td>
										<th>猪八戒</th>
										<th>农田PH/铬含量异常告警</th>
										<th>短信接收</th>
										<th>15456547878</th>
										<th>8877788@qq.com</th>
										<th>3</th>
										<th>2</th>
										<td><a href="table_basic.html#"><i
												class="fa fa-check text-navy"></i></a></td>
									</tr>
									<tr>
										<td><input type="checkbox" checked class="i-checks"
											name="input[]"></td>
										<th>蜘蛛侠</th>
										<th>农田PH/铬含量异常告警</th>
										<th>邮件接收</th>
										<th>15456547878</th>
										<th>8666788@qq.com</th>
										<th>1</th>
										<th>1</th>
										<td><a href="table_basic.html#"><i
												class="fa fa-check text-navy"></i></a></td>
									</tr>
									<tr id="soss">
										<td><input type="checkbox" checked class="i-checks"
											name="input[]"></td>
										<th>d</th>
										<th>农</th>
										<th>邮</th>
										<th>1</th>
										<th>8</th>
										<th>1</th>
										<th>1</th>
										<td><a href="table_basic.html#"><i
												class="fa fa-check text-navy"></i></a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="assets/js/plugins/layer/layer.min.js"></script>
	<script src="assets/js/jquery.min.js?v=2.1.4"></script>
	<script src="assets/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="assets/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="assets/js/plugins/peity/jquery.peity.min.js"></script>
	<script src="assets/js/content.js"></script>
	<script src="assets/js/plugins/iCheck/icheck.min.js"></script>
	<script src="assets/js/demo/peity-demo.min.js"></script>
	<script type="text/javascript">
	
		$(document).on('click','#prohibitMdy',function(){
			alert("禁止修改新建用户！");
		});
		
	    //修改用户信息
		function selectRow(s){
			var b = s.parentNode.parentNode.rowIndex;
			var name = $("table tr:eq(" + b + ") td:eq(1)").text();
			var email= $("table tr:eq(" + b + ") td:eq(2)").text();
			var phone = $("table tr:eq(" + b + ") td:eq(3)").text();
			var company= $("table tr:eq(" + b + ") td:eq(4)").text();
			var linkman = $("table tr:eq(" + b + ") td:eq(5)").text();
			var id = $("table tr:eq(" + b + ") td:eq(0)").text();
			$('#modifyuser').show();
			$('#mdlinkman').val(linkman);
			$('#mdname').val(name);
			$('#mdcompany').val(company);
			$('#mdphone').val(phone);
			$('#mdemail').val(email);
			$('#mdid').val(id);
			
			//关闭修改用户div
			$('#closeModfiyUser').click(function(e) {
				$('#modifyuser').hide();
			}); 
			
			//确定修改（修改操作稍后改成看信息修改）--------mdname/mdlinkman/mdcompany/mdphone/mdemail
			$('#sureMdy').click(function() {
						var idvalue = $('#mdid').val();
						var namevalue = $("#mdname").val();
						var linkmanvalue = $("#mdlinkman").val();
						var companyvalue = $("#mdcompany").val();
						var phonevalue = $("#mdphone").val();
						var emailvalue = $("#mdemail").val();
					    var jsonData = '{"userId":"'+idvalue+'","linkman":"'+linkmanvalue+'","userName":"'+namevalue+
							           '","company":"'+companyvalue+'","phone":"'+phonevalue+'","email":"'+emailvalue +'"}';
						               $('#modifyuser').hide();
						$.ajax({
							type : 'post',
							url : 'rest/user/modify',
							contentType : 'application/json',
							dataType : 'json',
							data : jsonData,
							success : function(data) {
								if (data) {
									$("table tr:eq(" + b + ") td:eq(1)").text(data.userName);
									$("table tr:eq(" + b + ") td:eq(2)").text(data.email);
									$("table tr:eq(" + b + ") td:eq(3)").text(data.phone);
									$("table tr:eq(" + b + ") td:eq(4)").text(data.company);
									$("table tr:eq(" + b + ") td:eq(5)").text(data.linkman);
									alert("修改成功");
								} else {
									alert("数据异常");
								}
							},
							error : function() {
								alert("数据加载失败");
							}
						});
			});
		}
		//删除用户
		function deleteRow(s) {
			var b = s.parentNode.parentNode.rowIndex;
			var t = $("table tr:eq(" + b + ") td:eq(1)").text();
			var jsonData = '{"userName":"' + t + '"}';
			layer.confirm('确定要删除该用户么？', {
				btn : [ '取消删除', '确定删除' ]
			//按钮
			}, function() {
				layer.msg('已取消', {
					icon : 1
				});
			}, function() {
				$.ajax({
					type : 'post',
					url : 'rest/user/delete',
					contentType : 'application/json',
					data : jsonData,
					success : function(data) {
						document.getElementById('mytable').deleteRow(b);
						layer.msg('删除成功（该提示5s后自动关闭）', {
							time : 3000, //3s后自动关闭
							btn : [ '知道了' ]
						});
					}
				});
			});
		}
		//添加新用户
		$(document).ready(function() {
			//打开表格发送请求到控制器查数据库获取表格信息返回加载，
			//增删改都是通过发送请求到控制器查数据库获取表格信息返回加载
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
			//打开添加用户div
			$('#popupAddUser').click(function(e) {
				e.preventDefault();
				$('#adduser').show();
			});
			//关闭添加用户div
			$('#closeAddUser').click(function(e) {
				e.preventDefault();
				$('#adduser').hide();
			});

			//确定添加用户
			$('#sureAdd').click(function(){
				if(!$('#form_adduser').valid()){
					return false;
				}
				var userNamevalue = $("#userName").val();
				var companyvalue = $("#company").val();
				var phonevalue = $("#phone").val();
				var linkmanvalue = $("#linkman").val();
				var emailvalue = $("#email").val();
				var jsonData = '{"userName":"'
							+ userNamevalue
							+ '","company":"'
							+ companyvalue
							+ '","phone":"'
							+ phonevalue
							+ '","linkman":"'
							+ linkmanvalue
							+ '","email":"'
							+ emailvalue + '"}';
					$('#adduser').hide();
					$.ajax({
						type : 'post',
						url : 'rest/user/addUser',
						contentType : 'application/json',
						dataType : 'json',
						data : jsonData,
						success : function(data) {
							if(data) {
								alert("添加成功！");
							var viewData = "<tr><th>"+ data.userId
										+ "</th><th>"+ data.userName
										+ "</th><th>"+ data.email
										+ "</th><th>"+ data.phone
										+ "</th><th>"+ data.company
										+ "</th><th>"+ data.linkman
										+ "</th><th>"
										+ '${userInfo.createTime}'
										+ "</th><td>"
										+ "<a href='javascript:;' id='prohibitMdy'><b>禁止修改</b></a>"
										+ "</td></tr>";
								$('#userTableDeatil').append(viewData);
								} else {
									alert("数据异常");
								}
							}
						});
				});
		});
	</script>
	<script src="assets/js/customerValidate.js"></script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
<!-- Mirrored from www.zi-han.net/theme/hplus/table_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:01 GMT -->
</html>
