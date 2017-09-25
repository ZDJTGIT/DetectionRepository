$(document).ready(function() {
	$('#form_adduser').validate({
		
		rules : {
			userName : {
				required : true,
				minlength : 2,
				//验证用户名是否存在
				remote: {
				    url: "rest/user/OnlyUserName",     //后台处理程序
				    type: "post",               //数据发送方式  
				    data: {                     //要传递的数据
				        userName: function() {
				            return $("#userName").val();
				        }
				    }
				}
			},
			
			linkman : {
				required : true,
				minlength : 2
			},
			
			company : {
				required : true,
				minlength : 2
			},
			
			phone : {
				required : true,
				minlength : 11
			},
			
			email : {
				required : true,
				email : true
			}
		},
		
		messages : {
		
			userName : {
				required : "请输入用户名",
				minlength:"用户名为2-15个字符",
				remote: "用户名已经被注册"
			},
		
			linkman : {
				required : "请输入联系人",
				minlength :"用户名为2-10个字符"
			},
		
			company : {
				required : "请输入公司名称",
				minlength : "公司名称最少两个字符"
			},
		
			phone : {
				required : "输入常用手机号码",
				minlength : "请输入一个正确的手机号码"
			},
		
			email :{
				required : "请输入邮箱",
				email : "请输入一个正确的邮箱"
			}
		}
		
	});
	
$('#form_modifyuser').validate({
		
		rules : {
			mdname : {
				required : true,
				minlength : 2,
				//验证用户名是否存在
				remote: {
				    url: "rest/user/mdOnlyUserName",     //后台处理程序
				    type: "post",               //数据发送方式  
				    data: {                     //要传递的数据
				        userName: function() {
				            return $("#mdname").val();
				        },
				        userId: function() {
					        return $("#mdid").val();
				        }
				    }
				}
			},
			
			mdlinkman : {
				required : true,
				minlength : 2
			},
			
			mdcompany : {
				required : true,
				minlength : 2
			},
			
			mdphone : {
				required : true,
				minlength : 11
			},
			
			mdemail : {
				required : true,
				email : true
			}
		},
		
		messages : {
		
			mdname : {
				required : "请输入用户名",
				minlength:"用户名为2-15个字符",
				remote: "用户名已经被注册"
			},
		
			mdlinkman : {
				required : "请输入联系人",
				minlength :"用户名为2-10个字符"
			},
		
			mdcompany : {
				required : "请输入公司名称",
				minlength : "公司名称最少两个字符"
			},
		
			mdphone : {
				required : "输入常用手机号码",
				minlength : "请输入一个正确的手机号码"
			},
		
			mdemail :{
				required : "请输入邮箱",
				email : "请输入一个正确的邮箱"
			}
		}
		
	});

$('#from_modifyPassWord').validate({
	
		rules : {
			password: {
				required: true,
	            minlength: 6,
				remote: {
				    url: "rest/user/OnlyPassword",     //后台处理程序
				    type: "post",               //数据发送方式  
				    data: {                     //要传递的数据
				    	password: function() {
				            return $("#password").val();
				        },
				        userId: function() {
					        return $("#passId").val();
				        }
				    }
				}
			},
			
			new_password: {
		        required: true,
		        minlength: 6
		    },
		      
		    new_passwords: {
			    required: true,
			    minlength: 6,
			    equalTo: "#new_password"
			}
		},
		
		messages : {
		
			password: {
		        required: "请输入密码",
		        minlength: "密码长度不能小于 6 个字符",
		        remote: "原密码输入错误"	
		    },
			
			new_password: {
		        required: "请输入密码",
		        minlength: "密码长度不能小于 6 个字符"
		    },
		      
		    new_passwords: {
		        required: "请输入密码",
		        minlength: "密码长度不能小于 6 个字符",
		        equalTo: "两次密码输入不一致"
		    }
		}
	});
});




