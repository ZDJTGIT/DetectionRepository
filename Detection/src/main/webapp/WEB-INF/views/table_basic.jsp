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
							        <h4 class="modal-title" id="myModalLabel_addProject">新建项目</h4>
							      </div>
							      <div class="modal-body">
							      		<p><h3><strong>添加新用户</strong></h3>(请确保用户名的唯一，确认邮箱，电话正确。其他输入框不能为空)</p>
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
											
								            <label class="md_lable" for="">用户权限:</label>
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
							        <h4 class="modal-title" id="myModalLabel_addProject">新建项目</h4>
							      </div>
							      <div class="modal-body">
							      		<p><h3><strong>修改用户信息</strong></h3>（请确保修改之后用户名唯一，确认邮箱，电话正确。其他输入框不能为空)</p>
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
										
										<label class="md_lable" for="">用户权限:</label>
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
									<input type="text" id="keyword" name="keyword" placeholder="请输入关键词" class="input-sm form-control"> 
									<span class="input-group-btn">
									<button type="button" id="sureSearch" class="btn btn-sm btn-primary">
									搜索
									</button>
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
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script> -->
	<!-- <script src="assets/js/content.js"></script> -->
	 <!-- jQuery Validation plugin javascript-->
	<script src="assets/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="assets/js/customerValidate.js"></script>
    <!-- <script src="assets/js/plugins/validate/messages_zh.min.js"></script>
    <script src="assets/js/demo/form-validate-demo.min.js"></script> -->
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
    
    <script type="text/javascript">
    	function xx(e){
    		var s = e.parentNode.parentNode.rowIndex;
    		alert(s);
    		alert(e);
    	}
    </script>
    
	<script type="text/javascript">
	var dlId = '${userInfo.userId}';
	var b;
    //修改用户信息
	function selectRow(s){
		b = s.parentNode.parentNode.rowIndex;
		var dlId = '${userInfo.userId}';
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
		$.ajax({
	   		  type:'post',
	   	  	  url: 'rest/user/showSelectUserRole',
	   	  	  data: {userId:dlId,userName:name},
	   	  	  contextType:"application/json",
	   	  	  success: function(data){
	   	  		document.getElementById("userRole")[data.roleid].selected=true;
	   	  	  }
		});
		return;
	}
    
	//切换用户状态
	function changStatus(s){
	    b = s.parentNode.parentNode.rowIndex;
		var userId = $("table tr:eq(" + b + ") td:eq(0)").text();
		var status = $("table tr:eq(" + b + ") td:eq(8)").text();
		$.ajax({
    		   type:'post',
	    	  	  url: 'rest/user/changUserStatus',
	    	  	  data: {userId:userId,status:status},
	    	  	  contextType:"application/json",
	    	  	  success: function(data){
	    	  		       if(data){
	    	  		    	 $("table tr:eq(" + b + ") td:eq(8)").text(data.status);
	    	  		       }else{
	    	  		    	alert("数据异常");
	    	  		       }
	    	  	  },
	    	  	  error: function(){
	  			    alert("数据加载失败");
	  		      }
    	   });
	} 
	
	//删除用户
	function deleteRow(s) {
		b = s.parentNode.parentNode.rowIndex;
		var t = $("table tr:eq(" + b + ") td:eq(1)").text();
		var dlId = '${userInfo.userId}';
		var jsonData = '{"userName":"' + t +'","userId":"' + dlId + '"}';
		
		layer.confirm('确定要删除该用户么？', {
			btn : [ '取消删除', '确定删除' ] //按钮
		}, function() {
			layer.msg('已取消', {icon : 1});
		}, function() {
			$.ajax({
				type : 'post',
				url : 'rest/user/delete',
				contentType : 'application/json',
				data : jsonData,
				success : function(data) {
					document.getElementById('mytable').deleteRow(b);
					layer.msg('删除成功（该提示3s后自动关闭）', {
						time : 3000, //3s后自动关闭
						btn : [ '知道了' ]
					});
				}
			});
		});
	}
	
	 $(document).ready(function(){
		  
		 $.ajax({
   		  type:'post',
   	  	  url: 'rest/user/showUserRole',
   	  	  data: {userId:dlId},
   	  	  contextType:"application/json",
   	  	  success: function(data){
   	  		       if(data){
   	  		    	var strings = '<select class="md_input" id="userRoles" name="userRoles">';   
   	  		    	var string = '<select class="md_input" id="userRole" name="userRole">';
   	  		    	$.each(data,function(idx,role){
   	  		    		//如果这个roleId和选中的user的roleId是相同的，就选中当前的option
   	  		    	    string += '<option value="'+role.roleId+'">'+ role.roleName +'</option>';
   	  		    	    strings += '<option value="'+role.roleId+'">'+ role.roleName +'</option>';
   	  		    	});
   	  		       string += '</select>';
   	  		       $('#userRole_div').append(string);
   	  		       $('#userRole_div_s').append(strings); 	
   	  		       }else{
   	  		    	alert("数据异常");
   	  		       }
   	  	  },
   	  	  error: function(){
 			    alert("数据加载失败");
 		      }
   	     });
	 
	
		$('#sureSearch').click(function(){
			var keyword = $('#keyword').val();
			var userid = '${userInfo.userId}';
			$.ajax({
				  type:'post',
	    	  	  url: 'rest/user/keywordSearch',
	    	  	  data: {keyword:keyword,userId:userid},
	    	  	  contextType:"application/json",
				  success : function(data) {
					if (data) {
						$("#mytable tbody").html("");
						$.each(data,function(idx,user){
						   var viewData = '<tr><td>'+ user.userId
										+ '</td><td>'+ user.userName
										+ '</td><td>'+ user.email
										+ '</td><td>'+ user.phone
										+ '</td><td>'+ user.company
										+ '</td><td>'+ user.linkman
										+ '</td><td>'+ user.createTime
										+ '</td><td>'
										+ '<a href="javascript:;" class="selectRow" onclick="selectRow(this)" data-toggle="modal" data-target="#myModal_modifyuser"><b>修改用户</b></a>'
										+ '<a href="javascript:;" class="deteteRow" onclick="deleteRow(this)"><b>删除用户</b></a>'
										+ "</td><td>"+ user.status
                            			+ "</td><td>"
                            			+ "<a href='javascript:;' class='changStatus' onclick='changStatus(this)'><b>切换状态</b></a>"
										+ '</td></tr>';
						   $('#userTableDeatil').append(viewData);
						});
					} else {
						alert("数据异常");
					}
				},
				error : function() {
					alert("查找失败");
				}
			});
		});
	    
		//确定修改（修改操作稍后改成看信息修改）
		$("#sureMdy").click(function() {
			if(!$('#form_modifyuser').valid()){
				return false;
			}
			        var t=b;
			        var role = $("#userRole option:selected").val();
					var idvalue = $('#mdid').val();
					var namevalue = $("#mdname").val();
					var linkmanvalue = $("#mdlinkman").val();
					var companyvalue = $("#mdcompany").val();
					var phonevalue = $("#mdphone").val();
					var emailvalue = $("#mdemail").val();
				    var jsonData = '{"userId":"'+idvalue+'","linkman":"'+linkmanvalue+'","roleId":"'+role+'","userName":"'+namevalue+
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
								$("table tr:eq(" + t + ") td:eq(1)").text(data.userName);
								$("table tr:eq(" + t + ") td:eq(2)").text(data.email);
								$("table tr:eq(" + t + ") td:eq(3)").text(data.phone);
								$("table tr:eq(" + t + ") td:eq(4)").text(data.company);
								$("table tr:eq(" + t + ") td:eq(5)").text(data.linkman);
								$('#offModifyUser').trigger("click"); 
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
	    
	 		//打开表格发送请求到控制器查数据库获取表格信息返回加载，
			//增删改都是通过发送请求到控制器查数据库获取表格信息返回加载
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
	 		
			//确定添加用户
			$('#sureAdd').click(function(){
				if(!$('#form_adduser').valid()){
					return false;
				}
				var role = $("#userRoles option:selected").val();
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
							+ '","roleId":"'
							+ role
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
							var viewData = "<tr><td>"+ data.userId
										+ "</td><td>"+ data.userName
										+ "</td><td>"+ data.email
										+ "</td><td>"+ data.phone
										+ "</td><td>"+ data.company
										+ "</td><td>"+ data.linkman
										+ "</td><td>"+ data.createTime
										+ "</td><td>"
										+ "<a href='javascript:;' class='selectRow' onclick='selectRow(this)' data-toggle='modal' data-target='#myModal_modifyuser'><b>修改用户</b></a> "
										+ "<a href='javascript:;' class='deteteRow' onclick='deleteRow(this)'><b>删除用户</b></a>"
										+ "</td><td>"+ data.status
                            			+ "</td><td>"
                            			+ "<a href='javascript:;' class='changStatus' onclick='changStatus(this)'><b>切换状态</b></a>"
										+ "</td></tr>";
								$('#offAddUser').trigger("click"); 	
								$('#userTableDeatil').append(viewData);
								} else {
									alert("数据异常");
								}
							}
						});
				}); 
	 });
	</script>
	
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
