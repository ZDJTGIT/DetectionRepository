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
						<div class="ibox-content profile-content" id="allProject">
							<hr>
							<div style="height:20px">
							</div>
						</div>
						
						
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
									</div>
							    </div>
							</div>
							<div class="data_basic">
							     <div class="data_content_7">
								    <div class="data_content_8">
									<font size="3" color=#585858>预留区域</font>
									<input class="data_content_input_6" type="text">
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
    
    //上传图片并及时展示 
    var imgurl = "";  
    function getPhoto(node) {  
        var imgURL = "";  
        try{  
            var file = null;  
            if(node.files && node.files[0] ){  
                file = node.files[0];  
            }else if(node.files && node.files.item(0)) {  
                file = node.files.item(0);  
            }  
            try{  
                imgURL =  file.getAsDataURL();  
            }catch(e){  
                imgRUL = window.URL.createObjectURL(file);  
            }  
        }catch(e){  
            if (node.files && node.files[0]) {  
                var reader = new FileReader();  
                reader.onload = function (e) {  
                    imgURL = e.target.result;  
                };  
                reader.readAsDataURL(node.files[0]);  
            }  
        }  
        creatImg(imgRUL);  
        return imgURL;  
    }  
    function creatImg(imgRUL){  
        var textHtml = "<img src='"+imgRUL+"'width='130px' height='100px'/>";  
        $(".ge_pic_icon_Infor").html(textHtml);  
    }  
    
    
       $(document).ready(function(){
    	  var user_idvalue = '${userInfo.userId}';
    	  $.ajax({
    		  type:'post',
    	  	  url: 'rest/user/selectUserRole',
    	  	  data: {userId:user_idvalue},
    	  	  contextType:"application/json",
    	  	  success: function(data){
    	  		       if(data){
    	  		    	$('#user_role').val(data.role);
    	  		       }else{
    	  		    	alert("数据异常");
    	  		       }
    	  	  },
    	  	  error: function(){
  			    alert("数据加载失败");
  		      }
    	  });
    	  
    	  $.ajax({
    		  type:'post',
    	  	  url: 'rest/user/selectUserproject',
    	  	  data: {userId:user_idvalue},
    	  	  contextType:"application/json",
    	  	  success: function(data){
    	  		         if(data){
    	  		    	 var  asthtml="";
    	  		    	 $.each(data,function(idx,item){
    	  		    		asthtml += '<div class="poj_External_div">'+
							   			 	'<div class="poj_layer">'+
					    						'<input type="text" id="projectItem_name" name="projectItem_name" class="input_noborder" value="'+item.sysDictionary.itemName+'">'+
											'</div>'+
											'<div class="poj_layer">'+
												'<input type="text" id="projectStatus" name="projectStatus" class="input_noborder_2" value="'+item.projectStatusString+'">'+
											'</div>'+
											'<div class="poj_description_div">'+
												'<div>'+
						        					'<div style="width:20%;float: left">'+
														'<input type="text" class="input_noborder" value="名称："><br>'+
														'<input type="text" class="input_noborder" value="时间：">'+
													'</div>'+
													'<div style="width:80%;float: left">'+
														'<input type="text" id="projectName" name="projectName" class="input_noborder" value="'+item.projectName+'">'+
													'</div>'+
												'</div>'+
												'<div>'+
													'<div style="width:80%;float: left">'+
														'<input type="text" id="projectTime" name="projectTime" class="input_noborder" value="'+item.projectBeginTime+'">'+
													'</div>'+
												'</div>'+	
											'</div>'+
											'<div class="poj_layer">'+
												'<a class="J_menuItem" style="font-size: 15px" onclick="" href="rest/project_detail/'+item.projectId+":"+item.projectName+'" name="项目详情">查看项目</a>'+
											'</div>'+
									'</div><hr>';
    	  		    	 });
        	  		    $('#allProject').append(asthtml); 	
    	  		       }else{
    	  		    	var  asthtmls='<div class="poj_External_div">'+
    	  		    					'<p>管理员无项目信息</p>'
    	  		    				  '</div>';
    	  		    	$('#allProject').append(asthtmls); 	
    	  		       }
    	  	  },
    	  	  error: function(){
  			    alert("数据加载失败");
  		      }
    	  });
    	  
       });
       
       //点击确定修改，提交修改的user信息，提交到控制器修改数据库数据
       $('#determineDelete').click(function(){
    	   var newpassword = '${userInfo.password}';
    	   if($('#password').val()!=''|$('#new_password').val()!=''|$('#new_passwords').val()!=''){
    		   if(!$('#from_modifyuserpassword').valid()){
      				return false;
      			}
    		   newpassword = $('#new_passwords').val();
    	   }
	       	   if(!$('#from_modifyusermassage').valid()){
	   				return false;
	   			}
    	   var companyvalue = $('#self_company').val();
    	   var namevalue = $('#self_name').val();
		   var linkmanvalue = $('#self_linkman').val();
		   var emailvalue = $('#self_email').val();
    	   var phonevalue = $('#self_phone').val();
           var user_idvalue = '${userInfo.userId}';
           var jsonData= '{"userId":"'+user_idvalue+'","linkman":"'+linkmanvalue+'","password":"'+newpassword+'","userName":"'+namevalue+'","company":"'+companyvalue+'","phone":"'+phonevalue+'","email":"'+emailvalue+'"}';
           $.ajax({
        	      type: 'post',
	    		  url: 'rest/user/updataUser',
	    		  contentType:'application/json',
		          dataType:'json',
	    		  data: jsonData,
	    		  success: function (data){
	    			       if(data){
	    			    	      $("#self_company").val(companyvalue);
		    			  		  $("#self_name").val(namevalue);
		    			  		  $("#self_linkman").val(linkmanvalue);
		    			  		  $("#self_email").val(emailvalue);
		    			  		  $("#self_phone").val(phonevalue);
		    			  		  $("#password").val("");
		    			  		  $("#new_password").val("");
		    			  		  $("#new_passwords").val("");
		    			  		alert("修改成功！");
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
