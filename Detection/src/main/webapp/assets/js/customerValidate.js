//添加用户校验用户信息唯一性
$(document).ready(function() {
	$('#form_adduser').validate({
		
		rules : {
			userName : {
				required : true,
				minlength : 2,
				//验证用户名是否已存在
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
				minlength : 11,
				//验证手机号码是否已注册
				remote: {
				    url: "rest/user/OnlyPhone",     //后台处理程序
				    type: "post",               //数据发送方式  
				    data: {                     //要传递的数据
				    	phone: function() {
				            return $("#phone").val();
				        }
				    }
				}
			},
			
			email : {
				required : true,
				email : true,
				//验证邮箱号是否已注册
				remote: {
				    url: "rest/user/OnlyEmail",     //后台处理程序
				    type: "post",               //数据发送方式  
				    data: {                     //要传递的数据
				    	email: function() {
				            return $("#email").val();
				        }
				    }
				}
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
				minlength : "请输入一个正确的手机号码",
				remote: "手机号已经被注册"
			},
		
			email :{
				required : "请输入邮箱",
				email : "请输入一个正确的邮箱",
				remote: "邮箱号已经被注册"	
			}
		}
		
	});

//管理员修改用户信息时校验修改后的用户信息唯一性
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
				minlength : 11,
				//验证手机号码是否被注册
				remote: {
				    url: "rest/user/mdOnlyPhone",     //后台处理程序
				    type: "post",               //数据发送方式  
				    data: {                     //要传递的数据
				    	mdphone: function() {
				            return $("#mdphone").val();
				        },
				        userId: function() {
					        return $("#mdid").val();
				        }
				    }
				}
			},
			
			mdemail : {
				required : true,
				email : true,
				//验证电子邮箱是否被注册
				remote: {
				    url: "rest/user/mdOnlyEmail",     //后台处理程序
				    type: "post",               //数据发送方式  
				    data: {                     //要传递的数据
				    	mdemail: function() {
				            return $("#mdemail").val();
				        },
				        userId: function() {
					        return $("#mdid").val();
				        }
				    }
				}
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
				minlength : "请输入一个正确的手机号码",
				remote: "手机号码已经被注册"
			},
		
			mdemail :{
				required : "请输入邮箱",
				email : "请输入一个正确的邮箱",
				remote: "电子邮箱已经被注册"
			}
		}
		
	});

//用户修改用户信息时校验用户信息是否唯一
$('#from_modifyusermassage').validate({
	
	rules : {
		self_name : {
			required : true,
			minlength : 2,
			//验证用户名是否存在
			remote: {
			    url: "rest/user/mdOnlyUserName",     //后台处理程序
			    type: "post",               //数据发送方式  
			    data: {                     //要传递的数据
			        userName: function() {
			            return $("#self_name").val();
			        },
			        userId: function() {
				        return $("#self_Id").val();
			        }
			    }
			}
		},
		
		self_linkman : {
			required : true,
			minlength : 2
		},
		
		self_company : {
			required : true,
			minlength : 2
		},
		
		self_phone : {
			required : true,
			minlength : 11,
			//验证手机号码是否被注册
			remote: {
			    url: "rest/user/mdOnlyPhone",     //后台处理程序
			    type: "post",               //数据发送方式  
			    data: {                     //要传递的数据
			    	mdphone: function() {
			            return $("#self_phone").val();
			        },
			        userId: function() {
				        return $("#self_Id").val();
			        }
			    }
			}
		},
		
		self_email : {
			required : true,
			email : true,
			//验证电子邮箱是否被注册
			remote: {
			    url: "rest/user/mdOnlyEmail",     //后台处理程序
			    type: "post",               //数据发送方式  
			    data: {                     //要传递的数据
			    	mdemail: function() {
			            return $("#self_email").val();
			        },
			        userId: function() {
				        return $("#self_Id").val();
			        }
			    }
			}
		},
		
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
				        return $("#self_Id").val();
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
	
		self_name : {
			required : "请输入用户名",
			minlength:"用户名为2-15个字符",
			remote: "用户名已经被注册"
		},
	
		self_linkman : {
			required : "请输入联系人",
			minlength :"用户名为2-10个字符"
		},
	
		self_company : {
			required : "请输入公司名称",
			minlength : "公司名称最少两个字符"
		},
	
		self_phone : {
			required : "输入常用手机号码",
			minlength : "请输入一个正确的手机号码",
			remote: "手机号码已经被注册"
		},
	
		self_email :{
			required : "请输入邮箱",
			email : "请输入一个正确的邮箱",
			remote: "电子邮箱已经被注册"
		},
		
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






