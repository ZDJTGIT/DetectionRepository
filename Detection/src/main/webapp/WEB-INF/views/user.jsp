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
<title>个人资料</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/plugins/table/user.css" rel="stylesheet">
<link href="assets/css/plugins/layuis/layui.css" rel="stylesheet" media="all">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
      <div class="row animated fadeInDown">
		<div class="col-sm-4" >
			<div class="ibox float-e-margins" >
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h3>
							<strong>我的基本信息</strong>
						</h3>
					</div>
					<div>
					     <div class="ibox-content no-padding border-left-right">
					        <div class="img_head">
                            <div class="ge_pic_icon_Infor">  
                                    <img src="assets/img/rojay.png" width="130" height="100">  
							</div>  
							<div class="Infor_file">  
    								<input type="file" name="uploadPicture" id="file" value="上传照片" title="上传照片" onchange="getPhoto(this)"/>  
							</div>
							</div>
							<div class="head_basicmessage">
					            <h4 class="head_basicmessage_h" id="username">
								<img alt="status" src="assets/img/user.png" style="height:17px; width:17px">
								<b id="status"><small>${userInfo.status}</small></b>
								&ensp;&ensp;${userInfo.userName}
								<b >&ensp;&ensp;<input type="text" id="user_role" name="user_role" readonly="readonly" class="input_noborder"></b>
								</h4>
								<p class="signature" id="" style="margin-left: 6px">
							    </p>
					        </div>
						</div>
						<div class="ibox-content profile-content">
						    <br><hr>
						</div>
					</div>
				</div>
			</div>
			<div class="ibox float-e-margins" >
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h3>
							<strong>我的项目信息</strong>
						</h3>
					</div>
					
					<div style="margin-top: -20px">
							<!-- <table class="table table-hover" id="project_table">
								<tbody id="allProject">
								</tbody>
							</table>
							<div style="margin-top:15px; text-align:center;" id="pageComponent"></div> -->
						<div class="ibox-content profile-content" id="allProject">
							<hr>
							<div style="">
							</div>
						</div>
						<div style="margin-top:15px; text-align:center;" id="pageComponent_5"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h3>
						<strong>个人资料编辑</strong>
					</h3>
					<p>（三个密码输入框为空可直接修改其他信息）</p>
				</div>
				<div class="ibox-content">
					<div class="feed-activity-list">
						<form id="from_modifyusermassage">
							<div class="data_basic">
							        <label for="self_Id" style="display:none"></label>	
									<input type="text" id="self_Id" name="self_Id" value="${userInfo.userId}" style="display:none">
								<div class="data_content_1">
								    <div class="data_content_8">
									 <label class="data_content_lable" style="font-size: 15px; " for="self_name">用户名</label>
									 <input class="data_content_input_1" id="self_name" type="text" readonly="readonly" name="self_name" value="${userInfo.userName}">
									</div>
							    </div>
								<div class="data_content_2">
									<div class="data_content_8">
									 <label class="data_content_lable" style="font-size: 15px;" for="self_company">公司</label>
									 <input class="data_content_input_1" id="self_company" name="self_company" type="text" value="${userInfo.company}">
									</div>
								</div>
								<div class="data_content_3">
									 <div class="data_content_8">
									 <label class="data_content_lable" style="font-size: 15px;" for="self_linkman">联系人</label>
									 <input class="data_content_input_0" id="self_linkman" type="text" name="self_linkman" value="${userInfo.linkman}"> 
									 </div>
								</div>
							</div>
							<div class="data_basic">
							    <div class="data_content_4">
								    <div class="data_content_8">
								    <label class="data_content_lable" style="font-size: 15px;" for="self_email">邮箱地址</label>
									<input class="data_content_input_2" id="self_email" type="text" name="self_email" value="${userInfo.email}">
									</div>
							    </div>
							    <div class="data_content_4">
								    <div class="data_content_8">
									<label class="data_content_lable" style="font-size: 15px;" for="self_phone">手机号码</label>
									<input class="data_content_input_2" id="self_phone" type="text" name="self_phone" value="${userInfo.phone}">
									</div>
							    </div>
							</div>
							</form>
							
							<form id="from_modifyuserpassword">
							<div class="data_basic">    
							    <div class="data_content_5">
									<label class="data_content_lable" for="password">请输入原密码:</label>
									<input class="data_content_input_3" id="password" name="password" type="password" >
							    </div>
							    
							    <div class="data_content_5">
									<label class="data_content_lable" for="new_password">请输入新密码:</label>
									<input class="data_content_input_3" id="new_password" name="new_password" type="password" >
							    </div>
							    
							    <div class="data_content_5">
									<label class="data_content_lable" for="new_passwords">请确认新密码:</label>
									<input class="data_content_input_3" id="new_passwords" name="new_passwords" type="password" >
							    </div>
							</div>   
							</form>
							
							<div class="data_basic">
							    <div class="data_content_7">
								    <div class="data_content_8">
									<font size="3" color=#585858>个人说明</font>
									<textarea class="data_content_input_5"  rows="4">
								    </textarea>
								    <br><br>
									</div>
							    </div>
							</div>
					</div>
					<button id="determineDelete" class="btn btn-primary btn-block m" style="width:96%">
						<i class="fa fa-arrow-down"></i> 确认修改
					</button>
					<input class="md_input" style="display:none" id="user_userInfo.userId" name="user_userInfo.userId" value="${userInfo.userId}">
					<input class="md_input" style="display:none" id="user_userInfo.password" name="user_userInfo.password" value="${userInfo.password}">
				</div>
			</div>
		</div>
      </div>
	</div>
	<script src="assets/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="assets/js/content.js"></script>
	<script src="assets/js/demo/peity-demo.min.js"></script>
	<script src="assets/js/customerValidate.js"></script>
	
	<!-- external jquery -->
	<script src="assets/js/user.js"></script>
		
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
