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
<meta http-equiv="refresh" content="5">


<title>用户&告警联系人信息表</title>
<meta name="keywords" content="">
<meta name="description"
	content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="assets/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="assets/css/animate.min.css" rel="stylesheet">
<link href="assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">

            <style>   
            .black_overlay{   
                display: none;   
                position: absolute;   
                top: 0%;   
                left: 0%;   
                width: 100%;   
                height: 100%;   
                background-color: black;   
                z-index:1001;   
                -moz-opacity: 0.8;   
                opacity:.80;   
                filter: alpha(opacity=88);   
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
                z-index:1002;   
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
								<a href = "javascript:;" id="popupAddUser">添加用户</a>
								<a href = "javascript:;" id="popupModfiyUser">修改用户信息</a>
								<div id="modify" class="white_content" style="width:500px;height:460px;margin-left:200px;margin-top:-50px; 
								background-color:#eeeeee ; border:2px;solid #000;filter:alpha(Opacity=80);-moz-opacity:0.8;opacity: 0.8;">
 								    <div >
 								    <h5>修改用户信息（根据您输入的用户名修改！用户信息输入不完整不予修改）</h5>
 								    <input type="text" id="mdname" name="name" style="width:100%;" class="form-control" placeholder="您要修改的用户名"><br>
 								    <input type="text" id="mdaccount" name="account" style="width:100%;" placeholder="账户名" class="form-control"><br>
 								    <input type="text" id="mdsysname" name="sysname" style="width:100%;" placeholder="所属系统名" class="form-control"><br>
 								    <input type="text" id="mdcompany" name="company" style="width:100%;" placeholder="邮箱" class="form-control"><br>
 								    <input type="text" id="mdphone" name="phone" style="width:100%;" placeholder="手机号码" class="form-control"><br>
 								    <input type="text" id="mdemail" name="email" style="width:100%;" placeholder="所属公司" class="form-control">
 								    <div class="item item-input item-select">
                                    <div class="input-label" style="height:18px">
                                  	 用户角色
              	  					</div>
                					<select id="mdidentity" name="identity">
                					<option>系统管理员</option>
                					<option>管理员</option>
                					<option selected="">普通用户</option>
                					<option>告警联系人</option>
                					</select>
                					</div>
 								    </div>
 								    <input type="button" id="sureMdy" value="确定修改">
							        <a href = "javascript:;" id="closeModfiyUser">关闭窗口</a>
							    </div>   
							    
							    <div id="adduser" class="white_content" style="width:500px;height:460px;margin-left:200px;margin-top:-50px;
							     background-color:#eeeeee ; border:2px;solid #000;filter:alpha(Opacity=80);-moz-opacity:0.8;opacity: 0.8;">
 								    <div >
 								    <h5>添加新用户</h5>
 								    <input type="text" id="name" name="name" style="width:100%;" class="form-control" placeholder="用户名"><br>
 								    <input type="text" id="account" name="account" style="width:100%;" class="form-control" placeholder="账户名"><br>
 								    <input type="text" id="sysname" name="sysname" style="width:100%;" class="form-control" placeholder="所属系统名称"><br>
 								    <input type="text" id="company" name="company" style="width:100%;" class="form-control" placeholder="所属公司名称"><br>
 								    <input type="text" id="phone" name="phone" style="width:100%;" class="form-control" placeholder="手机号码"><br>
 								    <input type="text" id="email" name="email" style="width:100%;" class="form-control" placeholder="邮箱地址">
 								    <div class="item item-input item-select">
                                    <div class="input-label" style="height:18px">
                                  	 用户角色
              	  					</div>
                					<select id="identity" name="identity">
                					<option>系统管理员</option>
                					<option>管理员</option>
                					<option selected="">普通用户</option>
                					<option>告警联系人</option>
                					</select>
                					</div>
 								    </div>
 								    <input type="button" id="sureAdd" value="确定添加">
							        <a href = "javascript:;" id="closeAddUser">关闭窗口</a>
							    </div>   
							</div>
							<div class="col-sm-4 m-b-xs">
								<div data-toggle="buttons" class="btn-group">
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
							<table class="table table-striped" >
								<thead>
									<tr>
										<th>序号</th>
									    <th>账户</th>
									    <th>用户名</th>
									    <th>所属系统名称</th>
									    <th>用户角色</th>
									    <th>邮箱</th>
										<th>手机号码</th>
										<th>所属公司</th>
										<th>创建时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody  id="userTableDeatil">
									<tr>
										<td id="tdid">055</td>
										<td id="tdaccount">mmmy</td>
										<td id="tdname">罗杰</td>
										<td id="tdsysname">农田自动检测系统</td>
										<td id="tdidentity">系统管理员</td>
										<td id="tdemail">794948489@qq.com</td>
					 					<td id="tdphone">18546474587</td>
										<td id="tdcompany">中大检测</td>
										<td>2017/9/18 16:26:35</td>
										<td><a href="javascript:;" id="deleteuser">
										    <b>删除用户</b></a>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		<div class="row">
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
	</div>
	<script src="assets/js/plugins/layer/layer.min.js"></script>
	<script src="assets/js/jquery.min.js?v=2.1.4"></script>
	<script src="assets/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="assets/js/plugins/peity/jquery.peity.min.js"></script>
	<script src="assets/js/content.js"></script>
	<script src="assets/js/plugins/iCheck/icheck.min.js"></script>
	<script src="assets/js/demo/peity-demo.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
			
			//获取系统时间
			$()
			
			
			//打开添加用户div
			$('#popupAddUser').click(function(e){
				e.preventDefault();
				$('#adduser').show();
			});
			
			//关闭添加用户div
			$('#closeAddUser').click(function(e){
				e.preventDefault();
				$('#adduser').hide();
			});
			
			//打开修改用户div
			$('#popupModfiyUser').click(function(e){
				e.preventDefault();
				
				$('#modify').show();
				var tdid=document.getElementById ("tdid").innerHTML;
				var tdaccount = document.getElementById ("tdaccount").innerHTML;
				var tdname = document.getElementById ("tdname").innerHTML; 
				var tdsysname = document.getElementById ("tdsysname").innerHTML;  
				var tdidentity = document.getElementById ("tdidentity").innerHTML;
				var tdemail = document.getElementById ("tdemail").innerHTML; 
				var tdphone = document.getElementById ("tdphone").innerHTML; 
				var tdcompany = document.getElementById ("tdcompany").innerHTML; 
				$('#mdname').val(tdname);
				$('#mdaccount').val(tdaccount);
				$('#mdsysname').val(tdsysname);
				$('#mdcompany').val(tdcompany);
				$('#mdphone').val(tdphone);
				$('#mdemail').val(tdemail);
				$('#mdidentity').get(0).selectedIndex=0;
				
			});
			
			//关闭修改用户div
			$('#closeModfiyUser').click(function(e){
				$('#modify').hide();
			});
			
			
			//添加用户
		    $('#sureAdd').click(function(){
		    	var namevalue =  $("#name").val();
			    var accountvalue =  $("#account").val();
			    var sysnamevalue =  $("#sysname").val();
			    var companyvalue =  $("#company").val();
			    var phonevalue =  $("#phone").val();
			    var emailvalue =  $("#email").val();
			    var selectvalue = $("#identity").val();
			    var jsonData= '{"name":"'+namevalue+'","company":"'+companyvalue+'","phone":"'+phonevalue+'","email":"'+emailvalue+'"}';

			    $('#adduser').hide();
		    	$.ajax({
		    		  type: 'post',
		    		  url: 'rest/user/addUser',
		    		  contentType:'application/json',
		    		  dataType:'json',
		    		  data: jsonData,
		    		  success: function (data){
		    			  if(data){
		    				  var xxx = "<tr><th>"+data.id+"</th><th>"+data.account+"</th><th>"+data.name
		    				  +"</th><th>"+data.sysname+"</th><th>"+data.identity+"</th><th>"+data.email
		    				  +"</th><th>"+data.phone+"</th><th>"+data.company+"</th><th>"+"2017/9/18 16:26:35"
		    				  +"</th><td>"+"<a href='javascript:;'id='deleteuser'><b>删除用户</b></a>"+"</td></tr>";
		    				  $('#userTableDeatil').append(xxx);
		    			  }else{
		    				  alert("数据异常");
		    			  }
		    		  },
		    		  error: function(XMLHttpRequest, textStatus, errorThrown) {
		    			  alert(XMLHttpRequest.status);
		    			  alert(XMLHttpRequest.readyState);
		    			  alert(textStatus);
		    			    }
		    			 
		    		  });
		        });
		        
		    //确定修改（修改操作稍后改成看信息修改）
		$('#sureMdy').click(function(){
			
			var namevalue =  $("#mdname").val();
		    var accountvalue =  $("#mdaccount").val();
		    var sysnamevalue =  $("#mdsysname").val();
		    var companyvalue =  $("#mdcompany").val();
		    var phonevalue =  $("#mdphone").val();
		    var emailvalue =  $("#mdemail").val();
		    var selectvalue = $("#mdidentity").val();
		    var jsonData= '{"name":"'+namevalue+'","company":"'+companyvalue+'","phone":"'+phonevalue+'","email":"'+emailvalue+'"}';
			
			$('#modify').hide();
	    	$.ajax({
	    		  type: 'POST',
	    		  url: 'rest/user/modify',
	    		  //传入输入新信息
	    		  data: jsonData,
	    		  success: function (data){
	    			  if(data){
	    				  
	    	var secenduser = "<tr><th>"+data.id+"</th><th>"+data.account+"</th><th>"+data.name
			  				+"</th><th>"+data.sysname+"</th><th>"+data.identity+"</th><th>"+data.email
			  				+"</th><th>"+data.phone+"</th><th>"+data.company+"</th><th>"+"2017/9/19 10:26:35"
			  				+"</th><td>"+"<a href='javascript:;'id='deleteuser'><b>删除用户</b></a>"+"</td></tr>";
	    				  
	    				  alert("数据加载成功"+ data.name +"11111");
	    				  $("#userTableDeatil").replace(secenduser)
	    			  }else{
	    				  alert("数据异常");
	    			  }
	    		  },
	    		  error: function(){
	    			  alert("数据加载失败");
	    		  }
	    		  });
	        });
		
		//删除用户
		$('#deleteuser').click(function(){
		layer.confirm('确定要删除该用户么？', {
			  btn: ['取消删除','确定删除'] //按钮
			}, function(){
			  layer.msg('已取消', {icon: 1});
			  
			}, function(){
				$.ajax({
					  type: 'POST',
		    		  url: 'rest/user/delete',
		    		  data: '{"name":"namevalue"}',//需取得当前选中user。name
		    		  success: function (data){
		    			  layer.msg('删除成功（该提示5s后自动关闭）', {
		    				    time: 5000, //5s后自动关闭
		    				    btn: ['知道了']
		    				  });
		    		  },
		    		  error: function(){
		    			  alert("删除失败");
		    		  }
		    		  });
				});
			 
			});
	        
		});

	</script>
	<!--  -->
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
<!-- Mirrored from www.zi-han.net/theme/hplus/table_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:01 GMT -->
</html>
