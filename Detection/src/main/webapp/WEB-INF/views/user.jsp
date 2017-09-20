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


<title>H+ 后台主题UI框架 - 个人资料</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="assets/css/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link href="assets/css/animate.min.css" rel="stylesheet">
<link href="assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">

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
						<form>
							<div class="" style="height:20% ; margin-right: -15px; margin-left: 9px;">
								<div class=""
									style="padding-left: 15px; padding: 6px; float: left; width: 43%; position: relative">
								<div class="" style="margin-bottom:0 ;color:#252422;">
									  <label>公司</label>
									  <input class=""  id="company" type="text" value="${userInfo.company}" style="background-color: #E3E3E3; 
									  border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 100%;border-radius:8px">
									</div>
							    </div>
								<div class=""
									style="padding: 6px; float: left; width: 27%; position: relative">
									<div class="" style="margin-bottom:0">
									  <label>用户名</label>
									  <input class="" id="user_name" type="text" value="${userInfo.userName}" style="background-color: #E3E3E3; 
									  border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 100%;border-radius:8px">
									</div>
								</div>
								<div class=""
									style="padding-right: 15px; padding: 6px; float: left; width: 30%; position: relative">
									  <div class="" style="margin-bottom:0">
									  <label>联系人</label>
									  <input class="" id="linkman" type="text" value="${userInfo.linkman}" style="background-color: #E3E3E3; 
									  border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 100%;border-radius:8px">
									  </div>
								</div>
							</div>
							<div class="" style="height:20% ;margin-top: 15px; margin-right: -15px; margin-left: 9px;">
							    <div class=""
									style="padding-left: 15px; padding: 6px; float: left; width: 50%; position: relative">
								    <div class="" style="margin-bottom:0">
									<label>邮箱地址</label>
									<input class="" id="email" type="text" value="${userInfo.email}" style="background-color: #E3E3E3; 
								    border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 100%;border-radius:8px">
									</div>
							    </div>
							    <div class=""
									style="padding-left: 15px; padding: 6px; float: left; width: 50%; position: relative">
								    <div class="" style="margin-bottom:0">
									<label>手机号码</label>
									<input class="" id="phone" type="text" value="${userInfo.phone}" style="background-color: #E3E3E3; 
								    border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 100%;border-radius:8px">
									</div>
							    </div>
							</div>
							<div class="" style="height:20% ;margin-top: 15px; margin-right: -15px; margin-left: 9px;">
							   <div class=""
									style="padding-left: 15px; padding: 6px; float: left; width: 33.33%; position: relative">
								    <div class="" style="margin-bottom:0">
									<label>请输入原密码</label>
									<input class="" id="password" type="password" style="background-color: #E3E3E3; 
								    border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 100%;border-radius:8px">
									</div>
							    </div> 
							    <div class=""
									style="padding-left: 15px; padding: 6px; float: left; width: 33.33%; position: relative">
								    <div class="" style="margin-bottom:0">
									<label>请输入新密码</label>
									<input class="" id="new_password" type="password"  style="background-color: #E3E3E3; 
								    border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 100%;border-radius:8px">
									</div>
							    </div> 
							    <div class=""
									style="padding-left: 15px; padding: 6px; float: left; width: 33.33%; position: relative">
								    <div class="" style="margin-bottom:0">
									<label>请再次输入新密码</label>
									<input class="" id="new_passwords" type="password"  style="background-color: #E3E3E3; 
								    border: 1px solid #CCC5B9;height: 40px;padding: 9px 3px;width: 100%;border-radius:8px">
									</div>
							    </div> 
							</div>
							<div class="" style="height:20% ;margin-top: 15px; margin-right: -15px; margin-left: 9px;">
							    <div class=""
									style="padding-left: 15px; padding: 6px; float: left; width: 100%; position: relative">
								    <div class="" style="margin-bottom:0">
									<label>个人说明</label>
									<textarea class=""  rows="4" style="background-color: #E3E3E3; 
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
									<label>预留区域</label>
									<input class="" type="text" style="background-color: #E3E3E3; 
								     border: 1px solid #CCC5B9;height: 160px;padding: 10px 0px;width: 100%;border-radius:8px">
									</div>
							    </div>
							</div>
						</form>
					</div>
					<button id="determineDelete" class="btn btn-primary btn-block m">
						<i class="fa fa-arrow-down"></i> 确认修改
					</button>
				</div>
			</div>
		</div>

      </div>
	</div>
	<script src="assets/js/jquery.min.js?v=2.1.4"></script>
	<script src="assets/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="assets/js/content.js"></script>
	<script src="assets/js/plugins/peity/jquery.peity.min.js"></script>
	<script src="assets/js/demo/peity-demo.min.js"></script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <script type="text/javascript">
       //点击确定修改，提交修改的user信息，提交到控制器修改数据库数据
       $('#determineDelete').click(function(){
    	   
    	   var companyvalue = $('#company').val();
    	   var namevalue = $('#user_name').val();
		   var linkmanvalue = $('#linkman').val();
		   var emailvalue = $('#email').val();
    	   var phonevalue = $('#phone').val();
           var user_idvalue = '${userInfo.userId}';
           alert(user_idvalue+companyvalue+namevalue+linkmanvalue+emailvalue+phonevalue);
           var jsonData= '{"userId":"'+user_idvalue+'","linkman":"'+linkmanvalue+'","userName":"'+namevalue+'","company":"'+companyvalue+'","phone":"'+phonevalue+'","email":"'+emailvalue+'"}';
           $.ajax({
        	   type: 'post',
	    		  url: 'rest/user/updataUser',
	    		  contentType:'application/json',
		          dataType:'json',
	    		  data: jsonData,
	    		  success: function (data){
	    			       if(data){
	    			    	   alert("数据正常");
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
