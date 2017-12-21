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
<title>权限</title>
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
						<h5>权限管理</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_data_tables.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="table_data_tables.html#">添加权限</a></li>
								<li><a href="table_data_tables.html#">删除权限</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="col-sm-4">
                        	<div class="panel panel-success">
                                <div class="panel-heading">
                                	<h3 class="panel-title">权限列表</h3>
                               	</div>
                                <div class="panel-body" >
                                	<div class="flex" style="display:flex;flex-flow:row wrap;justify-content:space-around">
	                                	<div class="flex-item" style="flex:0 1 60px;">
					                        <button type="button" id="expandAllBtn" class="btn btn-sm btn-success">全部展开</button>
					                    </div>
					                    <div class="flex-item">
					                        <button type="button" id="allCollapseBtn" class="btn btn-sm btn-success">全部折叠</button>
					                    </div>
					                    <div class="flex-item">
					                        <a href="javascript:;" class="btn btn-sm btn-success" data-toggle="modal" data-target="#addPermissionModel">添加权限</a>
					                    </div>
	                              	</div>
                                    <div id="permissionTreeView" style="position:relative; height:65vh; overflow-y:scroll;"></div>
                                </div>
                            </div>
                    	</div>
                    	<div class="col-sm-4">
                    		<div class="panel panel-success">
                                <div class="panel-heading">
                                	<h3 class="panel-title">所选择的权限详细信息</h3>
                               	</div>
                                <div class="panel-body">
                                	<div class="modal-content">
									    <div class="modal-body">
		                                	<form id="updatePermissionForm" class="form-horizontal m-t">
										      	<div class="form-group">
						                            <label class="col-sm-3 control-label" for="updatePermissionId">权限ID:</label>
						                            <div class="col-sm-8">
						                                <input id="updatePermissionId" name="updatePermissionId" class="form-control myInputClass" type="text" disabled>
						                            </div>
						                        </div>
						                        <div class="form-group">
						                            <label class="col-sm-3 control-label" for="updatePermissionName">权限名称:</label>
						                            <div class="col-sm-8">
						                                <input id="updatePermissionName" name="updatePermissionName" class="form-control myInputClass" type="text">
						                            </div>
						                        </div>
											    <div class="form-group">
						                            <label class="col-sm-3 control-label" for="updatePermissionSign">权限标识:</label>
						                            <div class="col-sm-8">
						                                <input id="updatePermissionSign" name="updatePermissionSign" class="form-control myInputClass" type="text">
						                            </div>
						                        </div>
						                        <div class="form-group">
						                            <label class="col-sm-3 control-label" for="updatePermissionParentId">上级权限:</label>
						                            <div class="col-sm-8">
						                                <select id="updatePermissionParentId" name="updatePermissionParentId" class="form-control myInputClass"></select>
						                            </div>
						                        </div>
						                        <div class="form-group">
						                            <label class="col-sm-3 control-label" for="updatePermissionLevel">权限等级:</label>
						                            <div class="col-sm-8">
						                                <input id="updatePermissionLevel" name="updatePermissionLevel" class="form-control myInputClass" type="text">
						                            </div>
						                        </div>
						                        <div class="form-group">
						                            <label class="col-sm-3 control-label" for="updatePermissionDescription">权限描述:</label>
						                            <div class="col-sm-8">
						                                <input id="updatePermissionDescription" name="updatePermissionDescription" class="form-control myInputClass" type="text">
						                            </div>
						                        </div>
										    </form>
										</div>
										<div class="modal-footer">
									        <button type="button" id="submitDeletePermissionBtn" class="btn btn-success" style="margin-bottom:0px">删除</button>
									        <button type="button" id="submitUpdatePermissionBtn" class="btn btn-success">保存</button>
									    </div>
									</div>	    
                                </div>
                            </div>
                    	</div>
                    	<div class="col-sm-4">
                    		<div class="panel panel-success">
                                <div class="panel-heading">
                                	<h3 class="panel-title">拥有该权限的所有角色</h3>
                               	</div>
                                <div class="panel-body">
                                    <table class="table table-striped table-bordered table-hover">
										<tbody id="roleListTbody"></tbody>
									</table>
                                </div>
                            </div>
                    	</div>
                    	<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<!-- Modal添加权限 -->
		<div class="modal fade" id="addPermissionModel" tabindex="-1" role="dialog" aria-labelledby="addPermissionLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="addPermissionLabel">新建权限</h4>
					</div>
					<div class="modal-body">
						<p>(请确保新增的权限名称，权限标识，权限等级，权限描述的唯一，且不能为空)</p><br>
						<form id="addPermissionForm" class="form-horizontal m-t">
						    <div class="form-group">
						        <label class="col-sm-3 control-label" for="addPermissionName">权限名称:</label>
						        <div class="col-sm-8">
						             <input id="addPermissionName" name="addPermissionName" class="form-control myInputClass" type="text">
						        </div>
						    </div>
							<div class="form-group">
						        <label class="col-sm-3 control-label" for="addPermissionSign">权限标识:</label>
						        <div class="col-sm-8">
						             <input id="addPermissionSign" name="addPermissionSign" class="form-control myInputClass" type="text">
						        </div>
						    </div>
						    <div class="form-group">
						        <label class="col-sm-3 control-label" for="addPermissionParentId">上级权限:</label>
						        <div class="col-sm-8">
						             <select id="addPermissionParentId" name="addPermissionParentId" class="form-control myInputClass"></select>
						        </div>
						    </div>
						    <div class="form-group">
						        <label class="col-sm-3 control-label" for="addPermissionLevel">权限等级:</label>
						        <div class="col-sm-8">
						             <input id="addPermissionLevel" name="addPermissionLevel" class="form-control myInputClass" type="text">
						        </div>
						    </div>
						    <div class="form-group">
						        <label class="col-sm-3 control-label" for="addPermissionDescription">权限描述:</label>
						        <div class="col-sm-8">
						             <input id="addPermissionDescription" name="addPermissionDescription" class="form-control myInputClass" type="text">
						        </div>
						    </div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" id="closeAddPermissionModelBtn" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" id="submitAddPermissionBtn" class="btn btn-success" data-dismiss="modal">提交</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 确认删除信息提示Modal -->  
		<div class="modal fade" id="deletePermissionMsgModel" tabindex="-1" role="dialog" aria-labelledby="deletePermissionMsgLabel">  
		  	<div class="modal-dialog" role="document">  
		    	<div class="modal-content">  
		      		<div class="modal-header">  
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>  
		        		<h4 class="modal-title">提示信息</h4>  
		      		</div>  
		      		<div class="modal-body">  
		        		<div id="deletePermissionMsgDiv"></div>
		      		</div>  
		      		<div class="modal-footer">  
		         		<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
		         		<button type="button" id="confirmDeleteBtn" class="btn btn-success" data-dismiss="modal">确定</button>  
		      		</div>  
		    	</div> 
		  	</div>
		</div>
		
	</div>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/plugins/validate/jquery.validate.min.js"></script>
	<!-- Switchery -->
    <script src="assets/js/plugins/switchery/switchery.js"></script>
	<!-- iCheck -->
    <script src="assets/js/plugins/iCheck/icheck.min.js"></script>
    <script src="assets/js/plugins/layer/layer.js"></script>
    <!-- Sweet alert -->
    <script src="assets/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="assets/js/plugins/treeview/bootstrap-treeview.js"></script>
	
    <script type="text/javascript">
    $(document).ready(function(){
		 
    	/* center modal 垂直居中模态框  */
    	function centerModals(){
    	    $('.modal').each(function(i){
    	        var $clone = $(this).clone().css('display', 'block').appendTo('body');    var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
    	        top = top > 0 ? top : 0;
    	        $clone.remove();
    	        $(this).find('.modal-content').css("margin-top", top);
    	    });
    	}
    	$('.modal').on('show.bs.modal', centerModals);
	    $(window).on('resize', centerModals);
	    
	    $('#confirmDeleteBtn').click(function(e){
	    	deletePermission();
	    });
	     
    	//按父子关系归类权限，构建树形权限
    	function createPermissionData(permission,data){ //item-单个权限  data-权限分类集合
    		//构建权限信息节点
			var permissionInfo = {
  	  			text: permission.permissionName,
  	  			href: permission.permissionId
  	        };
    		//如果该权限有子权限
  			if(data[permission.permissionId]){
  				//权限信息节点添加子权限的具体个数
  				permissionInfo.tags = [data[permission.permissionId].length];
  				//权限信息节点添加子权限的数组
  				permissionInfo.nodes = [];
  				//递归调用，同时构建子权限的信息节点
  				$.each(data[permission.permissionId],function(idx,item){
  					//将返回的权限节点添加到当前权限的子节点下
  					permissionInfo.nodes.push(createPermissionData(item,data));
  				});
  			}else{
  				//权限信息节点添加子权限的个数为0
  				permissionInfo.tags = [0];
  			}
  			//返回对应权限信息节点
			return permissionInfo;
    	}

    	
		$.ajax({
  		  type:'post',
  	  	  url: 'rest/permission/permissionListOnGrade',
  	  	  dataType : 'json',
  	  	  success: function(data){
  	  		 if(data){
  	  			//填充所有权限到下拉列表中
  	  			var permissionListString = '<option value="0">无</option>';
				$.each(data.permissionList,function(idx,item){
					permissionListString += '<option value="'+item.permissionId+'">'+item.permissionName+'</option>';
				});
				$('#addPermissionParentId').html(permissionListString); 
				$('#updatePermissionParentId').html(permissionListString);
				//构建树形权限结构
  	  			var permissionData = [];
  	  			var permissionListOnGrade = data.permissionListOnGrade;
  	  		    //循环取出顶级权限，递归构建树形权限
	  	  		$.each(permissionListOnGrade[0],function(idx,item){
	  	  			permissionData.push(createPermissionData(item,permissionListOnGrade));
		  	    });
	  	  	    $('#permissionTreeView').treeview({
		  	  		levels: 1,
				    color: "#428bca",
				    showTags: true,
				    data: permissionData,
				    onNodeSelected: function (event, node) {
				    	//当选中一个权限时，查询出它的详细信息
				    	$.ajax({
				    		type:'post',
				    	  	url: 'rest/permission/permissionDetail',
				    	  	data: {permissionId:node.href},
				    	  	dataType : 'json',
				    	  	success: function(data){
				    	  		if(data){
				    	  			 $('#updatePermissionId').val(data.permissionId);
				    	  			 $('#updatePermissionName').val(data.permissionName);
								     $('#updatePermissionSign').val(data.permissionSign);
								     $('#updatePermissionParentId option[value="'+data.permissionParentId+'"]').prop("selected",true);
								     $('#addPermissionParentId option[value="'+data.permissionId+'"]').prop("selected",true);
								     $('#updatePermissionLevel').val(data.permissionLevel);
								     $('#updatePermissionDescription').val(data.permissionDescription);
								     if(data.roleList){
								    	 var roleListString = '';
								    	 $.each(data.roleList,function(idx,item){
									    	 roleListString += '<tr><td>' + item.roleName + '</td></tr>';
									  	 });
									     $('#roleListTbody').html(roleListString); 
								     }
				    	  		}else{
				    	  		   alert("没有找到数据");
				    	  		}
				    	  	},
				    	  	error: function(){
				  			 	alert("数据加载失败");
				  		  	}
				    	});
				    }
				});
  	  		 }else{
  	  		    alert("数据异常");
  	  		 }
  	  	  },
  	  	  error: function(){
			 alert("数据加载失败");
		  }
  	     });
		
		//全部展开
		$('#expandAllBtn').click(function(e){
			$('#permissionTreeView').treeview('expandAll', { silent: true });
		});
		
		//全部折叠
		$('#allCollapseBtn').click(function(e){
			$('#permissionTreeView').treeview('collapseAll', { silent: true });
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
		 jQuery.validator.addMethod("isEnglishAndChar", function(value, element) {
		     var sign =  /^[A-Za-z:*]+$/;
		     return this.optional(element) || sign.test(value);
		 }, "只能输入英文字母以及:*两种特殊字符");
		
		 //只能输入中文字符验证
		 jQuery.validator.addMethod("isChinese", function(value, element) {
		     var name =  /^[\u4e00-\u9fa5]+$/;
		     return this.optional(element) || name.test(value);
		 }, "只能输入汉字");
		 
		 //添加权限信息验证
		 $('#addPermissionForm').validate({		 	
		 	rules : {
		 		addPermissionName : {
		 			required : true,
		 			isChinese : true,
		 			remote: {
		 			    url: "rest/permission/permissionNameUnique",    //后台处理程序
		 			    type: "post",               //数据发送方式  
		 			    data: {                     //要传递的数据
		 			    	permissionName: function() {
		 			            return $("#addPermissionName").val();
		 			        }
		 			    }
		 			}
		 		},
		 		addPermissionSign : {
		 			required : true,
		 			isEnglishAndChar : true,
		 			remote: {
		 			    url: "rest/permission/permissionSignUnique",    //后台处理程序
		 			    type: "post",               //数据发送方式  
		 			    data: {                     //要传递的数据
		 			    	permissionSign: function() {
		 			            return $("#addPermissionSign").val();
		 			        }
		 			    }
		 			}
		 		},
		 		addPermissionParentId: {
		 			required : true,
		 		},		 	
		 		addPermissionLevel: {
		 			required : true,
		 			digits : true
		 		},		 	
		 		addPermissionDescription : {
		 			required : true
		 		}		 	
		 	},		 	
		 	messages : {		 	
		 		addPermissionName : {
		 			required : "<i class='fa fa-times-circle'></i>权限名称不能为空",
		 			isChinese : "<i class='fa fa-times-circle'></i>只能输入汉字",
		 			remote: "<i class='fa fa-times-circle'></i>权限名称已存在"
		 		},
		 		addPermissionSign : {
		 			required : "<i class='fa fa-times-circle'></i>权限标识不能为空",
		 			isEnglishAndChar : "<i class='fa fa-times-circle'></i>只能输入英文字母以及:*两种特殊字符",
		 			remote: "<i class='fa fa-times-circle'></i>权限标识已存在"
		 		},
		 		addPermissionParentId: {
		 			required : "<i class='fa fa-times-circle'></i>请选择一个上级权限",
		 		},
		 		addPermissionLevel: {
		 			required : "<i class='fa fa-times-circle'></i>权限等级不能为空",
		 			digits: "<i class='fa fa-times-circle'></i>权限等级只能填数字，1的等级最高"
		 		},
		 		addPermissionDescription : {
		 			required : "<i class='fa fa-times-circle'></i>权限描述不能为空"
		 		}		 		
		 	}
		 });
		 
		//修改权限信息验证
		 $('#updatePermissionForm').validate({		 	
		 	rules : {
		 		updatePermissionName : {
		 			required : true,
		 			isChinese : true,
		 			remote: {
		 			    url: "rest/permission/permissionNameUniqueByPermissionId",    //后台处理程序
		 			    type: "post",               //数据发送方式  
		 			    data: {                     //要传递的数据
		 			    	permissionId: function() {
		 			            return $("#updatePermissionId").val();
		 			        },
		 			    	permissionName: function() {
		 			            return $("#updatePermissionName").val();
		 			        }
		 			    }
		 			}
		 		},
		 		updatePermissionSign : {
		 			required : true,
		 			isEnglishAndChar : true,
		 			remote: {
		 			    url: "rest/permission/permissionSignUniqueByPermissionId",    //后台处理程序
		 			    type: "post",               //数据发送方式  
		 			    data: {                     //要传递的数据
		 			    	permissionId: function() {
		 			            return $("#updatePermissionId").val();
		 			        },
		 			    	permissionSign: function() {
		 			            return $("#updatePermissionSign").val();
		 			        }
		 			    }
		 			}
		 		},
		 		updatePermissionParentId: {
		 			required : true,
		 		},		 	
		 		updatePermissionLevel: {
		 			required : true,
		 			digits : true
		 		},	
		 		updatePermissionDescription : {
		 			required : true
		 		}		 	
		 	},		 	
		 	messages : {		 	
		 		updatePermissionName : {
		 			required : "<i class='fa fa-times-circle'></i>权限名称不能为空",
		 			isChinese : "<i class='fa fa-times-circle'></i>只能输入汉字",
		 			remote: "<i class='fa fa-times-circle'></i>权限名称已存在"
		 		},
		 		updatePermissionSign : {
		 			required : "<i class='fa fa-times-circle'></i>权限标识不能为空",
		 			isEnglishAndChar : "<i class='fa fa-times-circle'></i>只能输入英文字母以及:*两种特殊字符",
		 			remote: "<i class='fa fa-times-circle'></i>权限标识已存在"
		 		},
		 		updatePermissionParentId: {
		 			required : "<i class='fa fa-times-circle'></i>请选择一个上级权限"
		 		},		 	
		 		updatePermissionLevel: {
		 			required : "<i class='fa fa-times-circle'></i>权限等级不能为空",
		 			digits : "<i class='fa fa-times-circle'></i>权限等级只能填数字，1的等级最高"
		 		},	
		 		updatePermissionDescription : {
		 			required : "<i class='fa fa-times-circle'></i>权限描述不能为空"
		 		}		 		
		 	}
		 });
		 
		 //添加权限提交
		 $('#submitAddPermissionBtn').click(function(){
			 if(!$('#addPermissionForm').valid()){
				 return false;
			 }
			 var jsonPermissionData = '{"permissionName":"'+ $('#addPermissionName').val() +'","permissionSign":"'+ $('#addPermissionSign').val() +
			 							'","permissionParentId":"'+ $('#addPermissionParentId').val() +'","permissionLevel":"'+ $('#addPermissionLevel').val() +
			 							'","permissionDescription":"'+ $('#addPermissionDescription').val() +'"}';
			 $.ajax({
		  		  type:'post',
		  	  	  url: 'rest/permission/addPermission',
		  	  	  dataType : 'json',
		  	  	  data : jsonPermissionData,
		  	  	  contentType : 'application/json',
		  	  	  success: function(res){
		  	  		 if(res.code == 0){
		  	  			var permission = res.data;
		  	  			//得到选择的节点
		  	  		    var nodeData = $("#permissionTreeView").treeview('getSelected')[0];
		  	  			$("#permissionTreeView").treeview("addNode", [nodeData.nodeId, {node: {text: permission.permissionName, href: permission.permissionId, tags:[0] }}]);
		  	  		 }else{
		  	  		    alert(res.msg);
		  	  		 }
		  	  	  },
		  	  	  error: function(){
					 alert("数据加载失败");
				  }
		  	 });
		 });
		 
		 //修改权限提交
		 $('#submitUpdatePermissionBtn').click(function(){
			 if(!$('#updatePermissionForm').valid()){
				 return false;
			 }
			 var jsonPermissionData = '{"permissionId":"'+ $('#updatePermissionId').val() +'","permissionName":"'+ $('#updatePermissionName').val() +
				 						'","permissionSign":"'+ $('#updatePermissionSign').val() +'","permissionParentId":"'+ $('#updatePermissionParentId').val() +
				 						'","permissionLevel":"'+ $('#updatePermissionLevel').val() +'","permissionDescription":"'+ $('#updatePermissionDescription').val() +'"}';
			 $.ajax({
		  		  type:'post',
		  	  	  url: 'rest/permission/updatePermission',
		  	  	  dataType : 'json',
		  	  	  data : jsonPermissionData,
		  	  	  contentType : 'application/json',
		  	  	  success: function(res){
		  	  		 if(res.code == 0){
		  	  			var permission = res.data;
	  	  				//得到选择的节点
	  	  		    	var nodeData = $("#permissionTreeView").treeview('getSelected')[0];
	  	  				$("#permissionTreeView").treeview("updateNode", [nodeData.nodeId, {text: permission.permissionName, href: permission.permissionId }]);
		  	  		 }else{
		  	  			alert(res.msg);
		  	  		 }
		  	  	  },
		  	  	  error: function(){
					 alert("数据加载失败");
				  }
		  	 });
		 });	
		 
		 //删除权限提交
		 $('#submitDeletePermissionBtn').click(function(e) {
			 var nodeData;
			 if(!$('#updatePermissionId').val()){
				 alert("请在左边权限列表选择需要删除的权限，然后点击删除");
				 return false;
			 }else{
				 //提示级联删除
				 //得到选择的节点
		  	     nodeData = $("#permissionTreeView").treeview('getSelected')[0];
				 if(nodeData){
					 var msg = '<p>删除<u style="color:Red;">'+$('#updatePermissionName').val()+'</u>权限，将会级联删除';
					 msg += getChildPermission(nodeData);
					 $('#deletePermissionMsgDiv').html(msg+'请确认是否全部删除？</p>');
					 $('#deletePermissionMsgModel').modal('show');
					 return false;
				 }
			 }
			 deletePermission();
		 });
		 
		 //获取子权限通过父权限
		 function getChildPermission(nodeData){
			 var msg = '';
			 if(nodeData.nodes && nodeData.nodes.length >0){
				 $.each(nodeData.nodes, function(idx,item){
					 msg += '<u style="color:Red;">'+item.text + '</u>权限,';
					 msg += getChildPermission(item);
				 });
			 }
			 return msg;
		 }
		 
		 //删除权限方法
		 function deletePermission(){
			 $.ajax({
		  		  type:'post',
		  	  	  url: 'rest/permission/deletePermission',
		  	  	  dataType : 'json',
		  	  	  data : {permissionId:$('#updatePermissionId').val()},
		  	  	  success: function(res){
		  	  		 if(res.code == 0){
		  	  			//得到选择的节点
				  	    nodeData = $("#permissionTreeView").treeview('getSelected')[0];
		  	  			$("#permissionTreeView").treeview("deleteNode", [nodeData.nodeId, { silent: true } ]);
		  	  		 }else{
		  	  			alert(res.msg);
		  	  		 }
		  	  	  },
		  	  	  error: function(){
					 alert("数据加载失败");
				  }
		  	 });
		 }
		 
    });
    </script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
