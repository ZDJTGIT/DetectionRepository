<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
<title>添加新用户</title>
<meta name="keywords" content="">
<meta name="description"
	content="">
<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="assets/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="assets/css/animate.min.css" rel="stylesheet">
<link href="assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">
<link href="https://cdn.bootcss.com/ionic/1.3.2/css/ionic.css" rel="stylesheet">
<style>
  #footer {
 	    clear:both;
	    text-align:center;	 	 
	}
</style>
</head>
<body class="gray-bg">
    <div class="middle-box text-center loginscreen   animated fadeInDown">
		<div id="footer">
			<h4>添加新用户</h4>
			<form class="m-t" role="form" method="POST" action="rest/user/addUser">
				<div class="form-group">
					<input type="text" name="name" style="width:100%;" class="form-control" placeholder="用户名"
						required="">
				</div>
				<br>
				<div class="form-group" >
					<input type="text" name="account" style="width:100%;" class="form-control" placeholder="账户名"
						required="">
				</div>
				<br>
				<div class="form-group">
					<input type="text" name="sysname" style="width:100%;" class="form-control" placeholder="所属系统名称"
						required="">
				</div>
				<br>
				<div class="form-group">
					<input type="text" name="company" style="width:100%;" class="form-control" placeholder="所属公司名称"
						required="">
				</div>
				<br>
				<div class="form-group">
					<input type="text" name="phone" style="width:100%;" class="form-control" placeholder="手机号码"
						required="">
				</div>
				<br>
				<div class="form-group">
					<input type="text" name="email" style="width:100%;" class="form-control" placeholder="邮箱地址"
						required="">
				</div>
				<br>
				
				<div class="item item-input item-select">
                <div class="input-label" style="height:18px">
                                   用户角色
                </div>
                <select name="identity">
                <option>管理员</option>
                <option selected="">普通用户</option>
                <option>告警联系人</option>
                </select>
                </div>
                <br>
                <div class="form-group" style="height:100px">
				<button type="submit" style="position:absolute;margin-left:-120px;margin-top:-6px;"
				onclick="logout()">确定添加
				</button>
				<input type="button" value="关闭" style="position:absolute;margin-left:60px;margin-top:-6px;"
				 onclick = "logout()">
				</div>
			</form>
		</div>
	</div>
	
	<script src="assets/js/jquery.min.js?v=2.1.4"></script>
	<script src="assets/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="assets/js/plugins/iCheck/icheck.min.js"></script>
	<script src="https://cdn.bootcss.com/ionic/1.3.2/js/ionic.bundle.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			})
		});
		//$('#closeIframe').click(function(){
		    //if(confirm("您确定要关闭本页吗？")){
		    	//alert("第一个窗口对象"+window);
		    	//alert(window.closed);
		        //window.opener=null;
		        //window.open('','_self');
		        //alert("第二个窗口对象"+window);
		        //window.close;
		        //alert("第san个窗口对象"+window);
		        //alert(window.closed);
		    	//window.open("about:blank","_self").close() //关闭当前窗口数据
		    	//window.open("","_self").close()
		    	//window.top.close();//关闭所有父级页
		    	//window.open("about:blank","_top").close()
		    	//window.open("","_top").close()
		    	//window.parent.close();
		    	//alert(window.closed);
                //}
		    //}
		//});
		function logout(){
        if(confirm("确定要退出吗？")){
        	window.open("about:blank","_self").close()
        }
}
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>