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
	border: 3px solid orange;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>

</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">

      <div class="row animated fadeInDown">
      <!-- class="row animated fadeInRight" style="margin-left:2%;width: 35%; float: left" -->
		<div class="col-sm-4" >
			  <!-- style="height: 48%; width: 94%;" -->
			<div class="ibox float-e-margins" >
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h3>
							<strong>我的基本信息</strong>
						</h3>
					</div>
					<div>
					     <div class="ibox-content no-padding border-left-right">
					        <div style="height:80px; width:25%;float:left">
					           <img src="assets/img/rojoy.jpg" alt="image"
							      style="height:80px; width:100%;">
							</div>
							<div style="height:80px; width:75%;float:left;background-color:#fff">
					           <h4 class="" id="username" style="margin-left: 4px">
								<img alt="status" src="assets/img/user.png" style="height:17px; width:17px">
								<b id="status"><small>${userInfo.status}</small></b>&ensp;&ensp;${userInfo.userName}<b>&ensp;&ensp;<small>系统管理员</small></b>
								</h4>
								<p class="signature" id="" style="margin-left: 6px">
								我很帅，而且我还很温柔,能砍树，能造飞机,上得厅堂，跪得澡堂,嘿嘿不要崇拜哥，哥只是个程序员
							    </p>
					        </div>
						</div>
						<div class="ibox-content profile-content">
							<div>
								<h6>预留DIV</h6>
							</div>
						</div>
					</div>
				</div>
			</div>


             <!-- style="height: 48%; width: 94%;" -->
			<div class="ibox float-e-margins" >
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h3>
							<strong>我的项目信息</strong>
						</h3>
					</div>
					<div>
						<div class="ibox-content no-padding border-left-right">
							<img alt="image" class="img-responsive" src="assets/img/mige.jpg"
							   style="height:80px; width:100%">
						</div>
						<div class="ibox-content profile-content" style="height: 260px">
							<div style="width: 100%">
								<div style="width: 25%; float: left">
									<img src="assets/img/face-0.jpg" alt="face"
										style="height:40px; width:40px">
								</div>
								<div style="width: 50%; float: left">
									<label>项目1</label>
									<br /> <span class=""><small>时间/负责人/想写啥写啥</small></span>
								</div>
								<div style="width: 25%; float: left">
									<a class="btn btn-primary " onclick="" href="">查看项目</a>
								</div>
							</div>
							<br>
							<hr>
							<div style="width: 100%">
								<div style="width: 25%; float: left">
									<img src="assets/img/face-1.jpg" alt="face"
										style="height:40px; width:40px">
								</div>
								<div style="width: 50%; float: left">
									<label>项目2</label>
									<br /> <span class=""><small>时间/负责人/想写啥写啥</small></span>
								</div>
								<div style="width: 25%; float: left">
									<a class="btn btn-primary " onclick="" href="">查看项目</a>
								</div>
							</div>
							<br>
							<hr>
							<div style="width: 100%">
								<div style="width: 25%; float: left">
									<img src="assets/img/face-2.jpg" alt="face"
										style="height:40px; width:40px">
								</div>
								<div style="width: 50%; float: left">
									<label>项目3</label>
									<br /> <span class=""><small>时间/负责人/想写啥写啥</small></span>
								</div>
								<div style="width: 25%; float: left">
									<a class="btn btn-primary " onclick="" href="">查看项目</a>
								</div>
							</div>
							<br>
							<hr>
							<div style="width: 100%">
								<div style="width: 25%; float: left">
									<img src="assets/img/face-3.jpg" alt="face"
										style="height:40px; width:40px">
								</div>
								<div style="width: 50%; float: left">
									<label>项目4</label>
									<br /> <span class=""><small>时间/负责人/想写啥写啥</small></span>
								</div>
								<div style="width: 25%; float: left">
									<a class="btn btn-primary " onclick="" href="">查看项目</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


        <!-- style=" width: 62%; float:left" -->
		<div class="col-sm-8">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h3>
						<strong>编辑个人资料</strong>
					</h3>
				</div>
				<div class="ibox-content">
					<div class="feed-activity-list">
							<div class="" style="height:20% ; margin-right: -15px; margin-left: 10px;">
								<div class=""
									style="padding-left: 15px; padding: 6px; float: left; width: 43%; position: relative">
								<div class="" style="margin-bottom:0 ;color:#252422;">
									  <font size="3" color=#585858>公司</font>
									  <input class="form-control"  id="company" type="text" value="${userInfo.company}" style="
									  border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 100%;border-radius:8px">
									</div>
							    </div>
								<div class=""
									style="padding: 6px; float: left; width: 27%; position: relative">
									<div class="" style="margin-bottom:0">
									  <font size="3" color=#585858>用户名</font>
									  <input class="form-control" id="user_name" type="text" value="${userInfo.userName}" style="
									  border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 100%;border-radius:8px">
									</div>
								</div>
								<div class=""
									style="padding-right: 15px; padding: 6px; float: left; width: 30%; position: relative">
									  <div class="" style="margin-bottom:0">
									  <font size="3" color=#585858>联系人</font>
									  <input class="form-control" id="linkman" type="text" value="${userInfo.linkman}" style="
									  border: 1px solid #CCC5B9; height: 40px;padding: 9px 3px;width: 88%;border-radius:8px">
									  </div>
								</div>
							</div>
							<div class="" style="height:20% ;margin-top: 15px; margin-right: -15px; margin-left: 9px;">
							    <div class=""
									style="padding-left: 15px; padding: 6px; float: left; width: 50%; position: relative">
								    <div class="" style="margin-bottom:0">
									<font size="3" color=#585858>邮箱地址</font>
									<input class="form-control" id="email" type="text" value="${userInfo.email}" style="
								    border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 100%;border-radius:8px">
									</div>
							    </div>
							    <div class=""
									style="padding-left: 15px; padding: 6px; float: left; width: 50%; position: relative">
								    <div class="" style="margin-bottom:0">
									<font size="3" color=#585858>手机号码</font>
									<input class="form-control" id="phone" type="text" value="${userInfo.phone}" style="
								    border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 93%;border-radius:8px">
									</div>
							    </div>
							</div>
							<input type="button" id="modifyPW" value="我要修改密码" style="border: 1px solid #CCC5B9;height: 39px;padding: 9px 3px;width: 80%; margin-left: 63px; margin-top: 14px;border-radius:8px">
							<form id="from_modifyPassWord"> 
							<div class="white_content" id="modifyPassWord" style="width:80%; height:24% ;margin-top: 62px; margin-right: -15px; margin-left: -116px; solid #000; filter: alpha(Opacity = 80)">
							    
							    <label for="passId" style="display:none"></label>	
								<input type="text" id="passId" name="passId" value="${userInfo.userId}"
								style="display:none; border-radius:8px" placeholder="id" class="form-control">
							    
							    <div class="" style="padding-left: 15px; padding: 6px; float: left; width: 33.33%; margin-top: -16px; position: relative">
									<label for="password" style="width: 100%; margin-left: 5px">请输入原密码:</label>
									<input class="form-control" id="password" name="password" type="password" style="
								    border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 100%;border-radius:8px">
							    </div>
							    
							    <div class="" style="padding-left: 15px; padding: 6px; float: left; width: 33.33%; margin-top: -16px; position: relative">
									<label for="new_password" style="width: 100%; margin-left: 5px">请输入新密码:</label>
									<input class="form-control" id="new_password" name="new_password" type="password"  style="
								    border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 100%;border-radius:8px">
							    </div>
							    
							    <div class="" style="padding-left: 15px; padding: 6px; float: left; width: 33.33%; margin-top: -16px; position: relative">
									<label for="new_passwords" style="width: 100%; margin-left: 5px">请确认新密码:</label>
									<input class="form-control" id="new_passwords" name="new_passwords" type="password"  style="
								    border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 90%;border-radius:8px">
							    </div>
							    
							    <div class="" style="padding-left: 15px; padding: 6px; float: left; width: 100%; position: relative">
								    <input type="button" id="sureModifyPW" value="确认修改"  style="border: 1px solid #CCC5B9;height: 36px; float: left; 
								    margin-left: 40px; padding: 9px 3px;width: 36%;border-radius:8px">
								    <input type="button" id="cancelModifyPW" value="取消修改"  style="border: 1px solid #CCC5B9;height: 36px; float: left; 
								    margin-left: 56px; padding: 9px 3px;width: 36%;border-radius:8px">
							    </div>
							</div>
							</form>
							
							<div class="" style="height:20% ;margin-top: 15px; margin-right: -15px; margin-left: 9px;">
							    <div class=""
									style="padding-left: 15px; padding: 6px; float: left; width: 97%; position: relative">
								    <div class="" style="margin-bottom:0">
									<font size="3" color=#585858>个人说明</font>
									<textarea class="form-control"  rows="4" style="
								     border: 1px solid #CCC5B9;height: 100px;padding: 10px 0px;width: 100%;border-radius:8px"
								     >Oh so, your weak rhyme You doubt I'll bother,reading into it I'll probably won't, left to my own devices But that's the difference in our opinions."
								    </textarea>
									</div>
							    </div>
							</div>
							<div class="" style="height:20% ;margin-top: 15px; margin-right: -15px; margin-left: 9px;">
							     <div class=""
									style="padding-left: 15px; padding: 6px; float: left; width: 100%; position: relative">
								    <div class="" style="margin-bottom:0">
									<font size="3" color=#585858>预留区域</font>
									<input class="form-control" type="text" style="
								     border: 1px solid #CCC5B9;height: 160px;padding: 10px 0px;width: 97%;border-radius:8px">
									</div>
							    </div>
							</div>
					</div>
					<button id="determineDelete" class="btn btn-primary btn-block m" style="width:96%">
						<i class="fa fa-arrow-down"></i> 确认修改
					</button>
				</div>
			</div>
		</div>
      </div>
	</div>
	<script src="assets/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="assets/js/content.js"></script>
	<script src="assets/js/demo/peity-demo.min.js"></script>
	<script src="assets/js/customerValidate.js"></script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <script type="text/javascript">
    
	    //打开修改密码div并发送验证码到邮箱
		$('#modifyPW').click(function(e) {
			e.preventDefault();
			$('#modifyPassWord').show();
			var emailvalue = $('#email').val();
			var namelvalue = $('#user_name').val();
			var data={emailAddress:emailvalue,userName:namelvalue};
			$.ajax({
				  type: 'post',
	    		  url: 'rest/user/sedemail',
	    		  data: data
			});
		});  
	    
	    //确认修改密码
		$('#sureModifyPW').click(function(){
			if(!$('#from_modifyPassWord').valid()){
				return false;
			}
			var newpassword = $('#new_passwords').val();
			var user_idvalue = '${userInfo.userId}';
			var jsonData = '{"password":"'+newpassword+'","userId":"'+user_idvalue+'"}';
			$('#modifyPassWord').hide();
			$.ajax({
				  type: 'post',
	    		  url: 'rest/user/updataPassword',
	    		  contentType:'application/json',
		          dataType:'json',
	    		  data: jsonData,
	    		  success: function (data){
	    			  alert("修改成功！");
	    		  },
	    		  error: function(){
	    			  alert("修改失败");
	    		  }
			});
		});
	    
	    //取消修改密码
		$('#cancelModifyPW').click(function(){
			$('#modifyPassWord').hide();
		});
    
       //点击确定修改，提交修改的user信息，提交到控制器修改数据库数据
       $('#determineDelete').click(function(){
    	   var companyvalue = $('#company').val();
    	   var namevalue = $('#user_name').val();
		   var linkmanvalue = $('#linkman').val();
		   var emailvalue = $('#email').val();
    	   var phonevalue = $('#phone').val();
           var user_idvalue = '${userInfo.userId}';
           var jsonData= '{"userId":"'+user_idvalue+'","linkman":"'+linkmanvalue+'","userName":"'+namevalue+'","company":"'+companyvalue+'","phone":"'+phonevalue+'","email":"'+emailvalue+'"}';
           $.ajax({
        	      type: 'post',
	    		  url: 'rest/user/updataUser',
	    		  contentType:'application/json',
		          dataType:'json',
	    		  data: jsonData,
	    		  success: function (data){
	    			       if(data){
	    			    	   alert("修改成功！");
	    			    	      $("#company").text(companyvalue);
		    			  		  $("#user_name").text(namevalue);
		    			  		  $("#linkman").text(linkmanvalue);
		    			  		  $("#email").text(emailvalue);
		    			  		  $("#phone").text(phonevalue);
	    			       }else{
	    				   alert("数据异常");
	    			      }
	    		  },
	    		  error: function(){
	    			  alert("数据加载失败");
	    		  }
	    		  });
       });
    </script>
</body>
</html>
