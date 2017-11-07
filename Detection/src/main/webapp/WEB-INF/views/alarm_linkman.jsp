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
<title>用户&告警联系人信息表</title>
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
							<h5>告警联系人</h5>
						</div>
						 <div class="ibox-content">
	                        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal_table_basic" id="table_basic_addalarm">
							  添加联系人
							</button>
	                        <table class="table table-striped table-bordered table-hover display" id="addAlarmBasic"  cellspacing="0" width="100%"> 
	                            <thead>
	                                <tr>
	                                	<td>用户名</td>
										<td>项目名</td>
										<td>手机号</td>
										<td>邮箱</td>
										<td>启用状态</td>
										<td >操作</td>
									</tr>
	                            </thead>
	                            <tbody>
	                            	<c:forEach items="${aLinkmanList }" var="aLinkman">
	                            		<tr>
	                            			<td>${aLinkman.userName }</td> 
	                            			<td>${aLinkman.projectName }</td>   
	                            			<td>${aLinkman.phone }</td> 
	                            			<td>${aLinkman.email }</td> 
	                            			<td >
	                            				<div id="status${aLinkman.alarmLinkmanId }">
	                            					<c:choose>
					                            		<c:when test="${aLinkman.status eq 27}">
					                            			启用
					                            		</c:when>
					                            		<c:otherwise>
					                            			禁用
					                            		</c:otherwise>
					                            	</c:choose>
	                            				</div>
	                            				
	                            			</td> 
	                            			<td >
					                            <div class="onoffswitch" >
					                            	<c:choose>
					                            		<c:when test="${aLinkman.status eq 27}">
					                            			<input type="checkbox" checked class="onoffswitch-checkbox" id="example${aLinkman.alarmLinkmanId}">
					                            		</c:when>
					                            		<c:otherwise>
					                            			 <input type="checkbox" class="onoffswitch-checkbox" id="example${aLinkman.alarmLinkmanId}">
					                            		</c:otherwise>
					                            	</c:choose>
					                                <label class="onoffswitch-label" for="example${aLinkman.alarmLinkmanId}" >
					                                    <span class="onoffswitch-inner"></span>
					                                    <span class="onoffswitch-switch"></span>
					                                </label>
					                            </div>
	                            			</td>
	                            		</tr> 
	                            	</c:forEach>
                           		</tbody>
	                        </table>
	                    </div>
					</div>
				</div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="myModal_table_basic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">添加联系人</h4>
				      </div>
				      <!-- 表单 -->
				      	 <form class="form-horizontal m-t" id="signupForm">
					      <div class="modal-body">
					      	
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label">联系人：</label>
	                                <div class="col-sm-8">
	                                    <input id="table_basic_userName" name="username" class="form-control" type="text" aria-required="true">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label">手机号码：</label>
	                                <div class="col-sm-8">
	                                    <input  id="table_basic_phone" name="phone" class="form-control" type="text">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label">E-mail：</label>
	                                <div class="col-sm-8">
	                                    <input id="table_basic_email" name="email" class="form-control" type="email">
	                                </div>
	                            </div>
	                            <div class="form-group" id="allckekout_tablebasic">
	                             	<label class="col-sm-3 control-label" ><input type="checkbox" class="i-checks" id="nidaoshika" name="tale_basic_checkbox" >项目名称：</label>
	                                <div class="col-sm-8" id="checkout_basic_all" >
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label">启用状态：</label>
	                                <div class="col-sm-8">
	                                     <div class="radio radio-info radio-inline">
	                                        <input type="radio" id="inlineRadio1" value="27" name="table_basic_radioInline" checked="">
	                                        <label for="inlineRadio1"> 启用 </label>
	                                    </div>
	                                    <div class="radio radio-inline">
	                                        <input type="radio" id="inlineRadio2" value="28" name="table_basic_radioInline">
	                                        <label for="inlineRadio2"> 禁用 </label>
	                                    </div>
	                                </div>
	                            </div>
	                            
	                        
				        	 
					      </div>
					      <div class="modal-footer">
					        <button type="button"  class="btn btn-default" data-dismiss="modal" id="table_basic_close">关闭</button>
					        <button type="submit" class="btn btn-primary" id="table_basic_commitadd">提交</button>
					      </div>
				      </form>
				    </div>
				  </div>
			</div>
	</div>

	<script src="assets/js/jquery.min.js"></script>

	<!-- Switchery -->
    <script src="assets/js/plugins/switchery/switchery.js"></script>
	<!-- iCheck -->
    <script src="assets/js/plugins/iCheck/icheck.min.js"></script>
	
	<!-- Data Tables -->
    <script src="assets/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/plugins/dataTables/dataTables.bootstrap.js"></script>
   
    <!-- Sweet alert -->
    <script src="assets/js/plugins/sweetalert/sweetalert.min.js"></script>
    
	<!-- jquery validata -->
    <script type="text/javascript" src="assets/js/plugins/validate/jquery.validate.js"></script>
    <script type="text/javascript" src="assets/js/plugins/validate/messages_zh.min.js"></script>
    
    
    <script type="text/javascript" src="assets/js/alarm_linkman.js"></script>    
	
	<script type="text/javascript">
	
	
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
	</script>
	
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
