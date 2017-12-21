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
<title>角色</title>
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
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>角色管理</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_data_tables.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="table_data_tables.html#">添加角色</a></li>
								<li><a href="table_data_tables.html#">删除角色</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-5 m-b-xs">								
								<a href="javascript:;" class="popupAddRole btn btn-sm btn-info" data-toggle="modal" data-target="#addRoleModel"><i class='fa fa-user-plus'></i>添加角色</a>
								<a href="javascript:;" id="refresh" class="btn btn-sm btn-info"><i class='fa fa-refresh'></i>刷新(清除缓存)</a>
								<!-- Modal添加角色 -->
								<div class="modal fade" id="addRoleModel" tabindex="-1" role="dialog" aria-labelledby="addRoleLabel">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="addRoleLabel">新建角色</h4>
								      </div>
								      <div class="modal-body">
								      	<p>(请确保新增的角色名称，角色标识，角色描述的唯一，且不能为空)</p><br>
								      	<form id="addRoleForm" class="form-horizontal m-t">
									      	<div class="form-group">
				                                <label class="col-sm-3 control-label" for="addRoleName">角色名称:</label>
				                                <div class="col-sm-8">
				                                    <input id="addRoleName" name="addRoleName" class="form-control myInputClass" type="text">
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <label class="col-sm-3 control-label" for="addRoleSign">角色标识:</label>
				                                <div class="col-sm-8">
				                                    <input id="addRoleSign" name="addRoleSign" class="form-control myInputClass" type="text">
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <label class="col-sm-3 control-label" for="addRoleDescription">角色描述:</label>
				                                <div class="col-sm-8">
				                                    <input id="addRoleDescription" name="addRoleDescription" class="form-control myInputClass" type="text">
				                                </div>
				                            </div>
								      	 </form>
								      </div>
								      <div class="modal-footer">
								        <button type="button" id="closeAddRoleModelBtn" class="btn btn-default" style="margin-bottom:0px" data-dismiss="modal">关闭</button>
								        <button type="button" id="submitAddRoleBtn" class="btn btn-primary">提交</button>
								      </div>
								    </div>
								  </div>
								</div>
						
								<!-- Modal修改角色 -->
								<div class="modal fade" id="updateRoleModel" tabindex="-1" role="dialog" aria-labelledby="updateRoleLabel">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="updateRoleLabel">修改角色</h4>
								      </div>
								      <div class="modal-body">
								      	<p>(请确保修改之后的角色名称，角色标识，角色描述的唯一，且不能为空)</p><br>
								      	<form id="updateRoleForm" class="form-horizontal m-t">
								      		<div class="form-group">
				                                <label class="col-sm-3 control-label" for="updateRoleId">角色ID:</label>
				                                <div class="col-sm-8">
				                                    <input id="updateRoleId" name="updateRoleId" class="form-control myInputClass" type="text" disabled>
				                                </div>
				                            </div>
									      	<div class="form-group">
				                                <label class="col-sm-3 control-label" for="updateRoleName">角色名称:</label>
				                                <div class="col-sm-8">
				                                    <input id="updateRoleName" name="updateRoleName" class="form-control myInputClass" type="text">
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <label class="col-sm-3 control-label" for="updateRoleSign">角色标识:</label>
				                                <div class="col-sm-8">
				                                    <input id="updateRoleSign" name="updateRoleSign" class="form-control myInputClass" type="text">
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <label class="col-sm-3 control-label" for="updateRoleDescription">角色描述:</label>
				                                <div class="col-sm-8">
				                                    <input id="updateRoleDescription" name="updateRoleDescription" class="form-control myInputClass" type="text">
				                                </div>
				                            </div>
								      	</form>
								      </div>
								      <div class="modal-footer">
								        <button type="button" id="closeUpdateRoleModelBtn" class="btn btn-default" style="margin-bottom:0px" data-dismiss="modal">关闭</button>
								        <button type="button" id="submitUpdateRoleBtn" class="btn btn-primary">提交</button>
								      </div>
								    </div>
								  </div>
								</div>
								
								<!-- Modal分配权限 -->
								<div class="modal fade" id="grantPrivilegesModel" tabindex="-1" role="dialog" aria-labelledby="grantPrivilegesLabel">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title">分配权限</h4>
								      </div>
								      <div class="modal-body">
								      	<div>
								      		<input type="hidden" id="grantPrivilegesRoleId"/>
								      		<Label id="grantPrivilegesRoleName"></Label>
								      	</div>
								      	<div id="permissionList"></div>
								      </div>
								      <div class="modal-footer">
								        <button type="button" id="closeGrantPrivilegesModelBtn" class="btn btn-default" style="margin-bottom:0px" data-dismiss="modal">关闭</button>
								        <button type="button" id="submitGrantPrivilegesBtn" class="btn btn-primary">提交</button>
								      </div>
								    </div>
								  </div>
								</div>
								
							</div>
							<div class="col-sm-4 m-b-xs">
								<div data-toggle="buttons" class="btn-group"></div>
							</div>
							<div class="col-sm-3">
								<div class="input-group">
									<input type="text" id="keyword" name="keyword" placeholder="输入角色名称，角色标识，角色描述关键字" class="input-sm form-control"> 
									<span class="input-group-btn">
									<button type="button" id="searchRole" class="btn btn-sm btn-primary">
									搜索
									</button>
									</span>
								</div>
							</div>
						</div>
						<table class="table table-striped table-bordered table-hover display" id="roleListTable">
							<thead>
								<tr>
									<th>角色ID</th>
									<th>角色名称</th>
									<th>角色标识</th>
									<th>角色描述</th>
									<th>操作</th>										
								</tr>
							</thead>
							<tbody id="roleListTbody"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

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
	
    <script type="text/javascript">
    $(document).ready(function(){
		  
		 $.ajax({
  		  type:'post',
  	  	  url: 'rest/role/roleList',
  	  	  dataType : 'json',
  	  	  success: function(data){
  	  		 if(data){
  	  			var roleListString = '';
  	  		    $.each(data,function(idx,role){
  	  		   		roleListString += '<tr id="roleId-'+role.roleId+'" class="project-status">';
  	  		    	roleListString += '<td>'+role.roleId+'</td><td>'+role.roleName+'</td><td>'+role.roleSign+'</td><td>'+role.roleDescription+'</td><td>';
  	  		    	roleListString += '<a href="javascript:;" class="popupGrantPrivileges" data-toggle="modal" data-target="#grantPrivilegesModel"><i class="fa fa-pencil"></i>分配权限</a>&nbsp;&nbsp;&nbsp;&nbsp;';
  	  		    	roleListString += '<a href="javascript:;" class="popupUpdateRole" data-toggle="modal" data-target="#updateRoleModel"><i class="fa fa-pencil"></i>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;';
  	  		    	roleListString += '<a href="javascript:;" class="deleteRole"><i class="fa fa-times-circle"></i>删除</a>';
  	  		    	roleListString += '</td></tr>';
  	  		    });
  	  		    $('#roleListTbody').html(roleListString);
  	  		 }else{
  	  		    alert("数据异常");
  	  		 }
  	  	  },
  	  	  error: function(){
			 alert("数据加载失败");
		  }
  	     });
		 
		 //弹出修改窗口时，填充需修改的角色信息到弹窗中
		 $('#roleListTbody').on('click', '.popupUpdateRole', function(e) {
			 var roleInfoArray = $(this).parent().siblings();
			 $('#updateRoleId').val(roleInfoArray.eq(0).text());
			 $('#updateRoleName').val(roleInfoArray.eq(1).text());
			 $('#updateRoleSign').val(roleInfoArray.eq(2).text());
			 $('#updateRoleDescription').val(roleInfoArray.eq(3).text());
		 });
		 
		//弹出分配权限窗口时，填充权限信息列表到弹窗中
		 $('#roleListTbody').on('click', '.popupGrantPrivileges', function(e) {
			 var roleInfoArray = $(this).parent().siblings();
			 $('#grantPrivilegesRoleId').val(roleInfoArray.eq(0).text());
			 $('#grantPrivilegesRoleName').text(roleInfoArray.eq(1).text());
			 $.ajax({
		  		  type:'post',
		  	  	  url: 'rest/permission/permissionListAndOwn',
		  	  	  data : {roleId:$('#grantPrivilegesRoleId').val()},
		  	  	  dataType : 'json',
		  	  	  success: function(data){
		  	  		 if(data){
						//构建树形权限结构
		  	  			var permissionString = '';
		  	  			var permissionListOnGrade = data.permissionListOnGrade;
		  	  			var permissionOwn = data.permissionOwnList;
		  	  		    //循环取出顶级权限，递归构建树形权限
			  	  		$.each(permissionListOnGrade[0],function(idx1,item1){
			  	  			permissionString += '<div><label><input type="checkbox" class="checkbox-all" value="'+item1.permissionId+'">'+item1.permissionName+'</label></div>';
			  	  			if(permissionListOnGrade[item1.permissionId]){
			  	  				permissionString += '<div>';
			  	  				$.each(permissionListOnGrade[item1.permissionId],function(idx2,item2){
			  	  					permissionString += '<label class="checkbox-inline"><input type="checkbox" class="checkbox-single" value="'+item2.permissionId+'">'+item2.permissionName+'</label>';
			  	  				});
			  	  				permissionString += '</div>';
			  	  			}
				  	    });
			  	  	    $('#permissionList').html(permissionString);
			  	  		//循环取出角色原权限，构建自有权限选项
			  	  		$.each(permissionOwn,function(idx,item){
			  	  			$('#permissionList input[type="checkbox"][value="'+item.permissionId+'"]').iCheck('check');
				  	    });
			  	  	    
			  	  		//对新生成的checkbox应用iCheck
			  			$('input[type="checkbox"]').iCheck({
			  				checkboxClass: 'icheckbox_square-green',
			  				increaseArea: '20%' // optional
			  			});
		  	  		 }else{
		  	  		    alert("数据异常");
		  	  		 }
		  	  	  },
		  	  	  error: function(){
					 alert("数据加载失败");
				  }
		  	 });
		 });
		 
		 //全选checkbox
		 $('#permissionList').on("ifClicked", '.checkbox-all', function(event){
			var checkboxArray = $(this).parent().parent().parent().next().find('.checkbox-single');
		    if(event.target.checked){
		      checkboxArray.iCheck('uncheck');
		    }else{
		      checkboxArray.iCheck('check');
		    }
		 });

		 //反选checkbox
		 $('#permissionList').on('ifClicked', '.checkbox-single', function(event){
			 var parentCheckbox = $(this).parent().parent().parent();
			 var checkLength = parentCheckbox.find('input[type="checkbox"]:checked').length;
			 if(event.target.checked){
				 checkLength --;
				 if(checkLength == 0){
					 parentCheckbox.prev().find('.checkbox-all').iCheck('uncheck');
				 }
			 }else{
				 checkLength ++;
				 if(checkLength > 0){
					 parentCheckbox.prev().find('.checkbox-all').iCheck('check');
				 }
			 }
		 });
		
		//以下为修改jQuery Validation插件兼容Bootstrap的方法，没有直接写在插件中是为了便于插件升级
	    $.validator.setDefaults({
	         highlight: function (element) {
	            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
	         },
	         success: function (element) {
	            element.closest('.form-group').removeClass('has-error').addClass('has-success');
	         },
	         errorElement: "span",
	         errorPlacement: function (error, element) {
	            if (element.is(":radio") || element.is(":checkbox")) {
	                error.appendTo(element.parent().parent().parent());
	            } else {
	                error.appendTo(element.parent());
	            }
	         },
	         errorClass: "help-block m-b-none",
	         validClass: "help-block m-b-none"
	     });
		 
		 //只能输入英文字母验证
		 jQuery.validator.addMethod("isEnglish", function(value, element) {
		     var sign =  /^[A-Za-z]+$/;
		     return this.optional(element) || sign.test(value);
		 }, "只能输入英文字母");
		
		 //只能输入中文字符验证
		 jQuery.validator.addMethod("isChinese", function(value, element) {
		     var name =  /^[\u4e00-\u9fa5]+$/;
		     return this.optional(element) || name.test(value);
		 }, "只能输入汉字");
		 
		 //添加角色信息验证
		 $('#addRoleForm').validate({		 	
		 	rules : {
		 		addRoleName : {
		 			required : true,
		 			isChinese : true,
		 			remote: {
		 			    url: "rest/role/roleNameUnique",    //后台处理程序
		 			    type: "post",               //数据发送方式  
		 			    data: {                     //要传递的数据
		 			    	roleName: function() {
		 			            return $("#addRoleName").val();
		 			        }
		 			    }
		 			}
		 		},
		 		addRoleSign : {
		 			required : true,
		 			isEnglish : true,
		 			remote: {
		 			    url: "rest/role/roleSignUnique",    //后台处理程序
		 			    type: "post",               //数据发送方式  
		 			    data: {                     //要传递的数据
		 			    	roleSign: function() {
		 			            return $("#addRoleSign").val();
		 			        }
		 			    }
		 			}
		 		},
		 		addRoleDescription : {
		 			required : true
		 		}		 	
		 	},		 	
		 	messages : {		 	
		 		addRoleName : {
		 			required : "<i class='fa fa-times-circle'></i>角色名称不能为空",
		 			isChinese : "<i class='fa fa-times-circle'></i>只能输入汉字",
		 			remote: "<i class='fa fa-times-circle'></i>角色名称已存在"
		 		},
		 		addRoleSign : {
		 			required : "<i class='fa fa-times-circle'></i>角色标识不能为空",
		 			isEnglish : "<i class='fa fa-times-circle'></i>只能输入英文字母",
		 			remote: "<i class='fa fa-times-circle'></i>角色标识已存在"
		 		},
		 		addRoleDescription : {
		 			required : "<i class='fa fa-times-circle'></i>角色描述不能为空"
		 		}		 		
		 	}
		 });
		 
		//修改角色信息验证
		 $('#updateRoleForm').validate({		 	
		 	rules : {
		 		updateRoleName : {
		 			required : true,
		 			isChinese : true,
		 			remote: {
		 			    url: "rest/role/roleNameUniqueByRoleId",    //后台处理程序
		 			    type: "post",               //数据发送方式  
		 			    data: {                     //要传递的数据
		 			    	roleId: function() {
		 			            return $("#updateRoleId").val();
		 			        },
		 			    	roleName: function() {
		 			            return $("#updateRoleName").val();
		 			        }
		 			    }
		 			}
		 		},
		 		updateRoleSign : {
		 			required : true,
		 			isEnglish : true,
		 			remote: {
		 			    url: "rest/role/roleSignUniqueByRoleId",    //后台处理程序
		 			    type: "post",               //数据发送方式  
		 			    data: {                     //要传递的数据
		 			    	roleId: function() {
		 			            return $("#updateRoleId").val();
		 			        },
		 			    	roleSign: function() {
		 			            return $("#updateRoleSign").val();
		 			        }
		 			    }
		 			}
		 		},
		 		updateRoleDescription : {
		 			required : true
		 		}		 	
		 	},		 	
		 	messages : {		 	
		 		updateRoleName : {
		 			required : "<i class='fa fa-times-circle'></i>角色名称不能为空",
		 			isChinese : "<i class='fa fa-times-circle'></i>只能输入汉字",
		 			remote: "<i class='fa fa-times-circle'></i>角色名称已存在"
		 		},
		 		updateRoleSign : {
		 			required : "<i class='fa fa-times-circle'></i>角色标识不能为空",
		 			isEnglish : "<i class='fa fa-times-circle'></i>只能输入英文字母",
		 			remote: "<i class='fa fa-times-circle'></i>角色标识已存在"
		 		},
		 		updateRoleDescription : {
		 			required : "<i class='fa fa-times-circle'></i>角色描述不能为空"
		 		}		 		
		 	}
		 });
		 
		 //添加角色提交
		 $('#submitAddRoleBtn').click(function(){
			 if(!$('#addRoleForm').valid()){
				 return false;
			 }
			 var jsonRoleData = '{"roleName":"'+ $('#addRoleName').val() +'","roleSign":"'+ $('#addRoleSign').val() +'","roleDescription":"'+ $('#addRoleDescription').val() +'"}';
			 $.ajax({
		  		  type:'post',
		  	  	  url: 'rest/role/addRole',
		  	  	  dataType : 'json',
		  	  	  data : jsonRoleData,
		  	  	  contentType : 'application/json',
		  	  	  success: function(res){
		  	  		 if(res.code == 0){
		  	  			var role = res.data;
		  	  			var roleString = '<tr id="roleId-'+role.roleId+'" class="project-status">';
		  	  		 	roleString += '<td>'+role.roleId+'</td><td>'+role.roleName+'</td><td>'+role.roleSign+'</td><td>'+role.roleDescription+'</td><td>';
		  	  			roleString += '<a href="javascript:;" class="popupGrantPrivileges" data-toggle="modal" data-target="#grantPrivilegesModel"><i class="fa fa-pencil"></i>分配权限</a>&nbsp;&nbsp;&nbsp;&nbsp;';
		  	  			roleString += '<a href="javascript:;" class="popupUpdateRole" data-toggle="modal" data-target="#updateRoleModel"><i class="fa fa-pencil"></i>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;';
		  	  			roleString += '<a href="javascript:;" class="deleteRole"><i class="fa fa-times-circle"></i>删除</a>';
		  	  			roleString += '</td></tr>';
		  	  		    $('#roleListTbody').append(roleString);
		  	  		 }else{
		  	  		    alert(res.msg);
		  	  		 }
		  	  	  },
		  	  	  error: function(){
					 alert("数据加载失败");
				  }
		  	 });
		 });
		 
		 //修改角色提交
		 $('#submitUpdateRoleBtn').click(function(){
			 if(!$('#updateRoleForm').valid()){
				 return false;
			 }
			 var jsonRoleData = '{"roleId":"'+ $('#updateRoleId').val() +'","roleName":"'+ $('#updateRoleName').val() +'","roleSign":"'+ $('#updateRoleSign').val() +'","roleDescription":"'+ $('#updateRoleDescription').val() +'"}';
			 $.ajax({
		  		  type:'post',
		  	  	  url: 'rest/role/updateRole',
		  	  	  dataType : 'json',
		  	  	  data : jsonRoleData,
		  	  	  contentType : 'application/json',
		  	  	  success: function(res){
		  	  		 if(res.code == 0){
		  	  			var role = res.data;
		  	  			var roleInfoTd = $('#roleId-'+role.roleId).children();
		  	  			roleInfoTd.eq(1).text(role.roleName);
		  	  			roleInfoTd.eq(2).text(role.roleSign);
		  				roleInfoTd.eq(3).text(role.roleDescription);
		  	  		 }else{
		  	  			alert(res.msg);
		  	  		 }
		  	  	  },
		  	  	  error: function(){
					 alert("数据加载失败");
				  }
		  	 });
		 });	
		 
		 //删除角色提交
		 $('#roleListTbody').on('click', '.deleteRole', function(e) {
			 var roleTr = $(this).parent().parent();
			 $.ajax({
		  		  type:'post',
		  	  	  url: 'rest/role/deleteRole',
		  	  	  dataType : 'json',
		  	  	  data : {roleId:roleTr.children().eq(0).text()},
		  	  	  success: function(res){
		  	  		 if(res.code == 0){
		  	  			roleTr.remove();
		  	  		 }else{
		  	  			alert(res.msg);
		  	  		 }
		  	  	  },
		  	  	  error: function(){
					 alert("数据加载失败");
				  }
		  	 });
		 });
		 
		 //分配权限给角色提交
		 $('#submitGrantPrivilegesBtn').click(function(){
			 var jsonRolePermissionData = [];
			 var roleId = $('#grantPrivilegesRoleId').val();
			 $('#permissionList input[type="checkbox"]:checked').each(function(){
	        	var jsonRolePermission={"roleId":roleId,"permissionId":$(this).val()};
	        	jsonRolePermissionData.push(jsonRolePermission);
	         });
			 if(jsonRolePermissionData.length == 0){
				 jsonRolePermissionData.push({"roleId":roleId})
			 }
			 $.ajax({
		  		  type:'post',
		  	  	  url: 'rest/role/grantPrivileges',
		  	  	  dataType : 'json',
		  	  	  data : JSON.stringify(jsonRolePermissionData),
		  	  	  contentType : 'application/json',
		  	  	  success: function(res){
		  	  		 if(res.code == 0){
		  	  			$("#grantPrivilegesModel").modal('hide');
		  	  		 }else{
		  	  			alert(res.msg);
		  	  		 }
		  	  	  },
		  	  	  error: function(){
					 alert("数据加载失败");
				  }
		  	 });
		 });
		 
		 //清空原有权限缓存
		 $('#refresh').click(function(){
			 $.ajax({
		  		  type:'post',
		  	  	  url: 'rest/role/clearRoleCache'
		  	 });
		 });
		 
    });
    </script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
