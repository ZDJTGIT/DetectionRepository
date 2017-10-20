
// 手机号码验证
jQuery.validator.addMethod("isMobile", function(value, element) {
    var length = value.length;
    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
    return this.optional(element) || (length == 11 && mobile.test(value));
}, "请正确填写您的手机号码");


//添加用户校验用户信息唯一性
$(document).ready(function() {
//添加项目信息验证	
$('#form_addProject').validate({
		
		rules : {
			projectName_addProject : {
				required : true,
				minlength : 2,
			},
			projectAddress_addProject : {
				required : true,
				minlength : 2,
			},
			projectLongitude_addProject : {
				required : true,
				minlength : 2,
			},
			projectLatitude_addProject : {
				required : true,
				minlength : 2,
			}
		},
		
		messages : {
		
			projectName_addProject : {
				required : "请输入项目名",
				minlength:"项目名为2-15个字符",
			},
			projectAddress_addProject : {
				required : "请输入项目地址",
				minlength:"项目地址为2-15个字符",
			},
			projectLongitude_addProject : {
				required : "请输入项目经度",
				minlength:"项目经度为2-15个字符",
			},
			projectLatitude_addProject : {
				required : "请输入项目纬度",
				minlength:"项目纬度为2-15个字符",
			}
		}
	});
//修改项目信息验证
$('#form_updetaProject').validate({
	
	rules : {
		projectName_addProject : {
			required : true,
			minlength : 2,
		},
		projectAddress_addProject : {
			required : true,
			minlength : 2,
		},
		projectLongitude_addProject : {
			required : true,
			minlength : 2,
		},
		projectLatitude_addProject : {
			required : true,
			minlength : 2,
		}
	},
	
	messages : {
	
		projectName_addProject : {
			required : "项目名不能为空",
			minlength:"项目名为2-15个字符",
		},
		projectAddress_addProject : {
			required : "项目地址不能为空",
			minlength:"项目地址为2-15个字符",
		},
		projectLongitude_addProject : {
			required : "项目经度不能为空",
			minlength:"项目经度为2-15个字符",
		},
		projectLatitude_addProject : {
			required : "项目纬度不能为空",
			minlength:"项目纬度为2-15个字符",
		}
	}
});

//添加测点信息验证
$('#form_addDetection').validate({
	
	rules : {
		detectionName_add : {
			required : true,
			minlength : 2,
		},
		detectionNum_add : {
			required : true,
			minlength : 2,
		},
		detectionLongitude_add : {
			required : true,
			minlength : 2,
		},
		detectionLatitude_add : {
			required : true,
			minlength : 2,
		}
	},
	
	messages : {
	
		detectionName_add : {
			required : "测点名称不能为空",
			minlength:"测点名称为2-15个字符",
		},
		detectionNum_add : {
			required : "测点编号不能为空",
			minlength:"测点编号为2-15个字符",
		},
		detectionLongitude_add : {
			required : "测点经度不能为空",
			minlength:"测点经度为2-15个字符",
		},
		detectionLatitude_add : {
			required : "测点纬度不能为空",
			minlength:"测点纬度为2-15个字符",
		}
	}
});

//修改测点信息验证
$('#form_updetaDetection').validate({
	
	rules : {
		detectionName_updeta : {
			required : true,
			minlength : 2,
		},
		detectionNum_updeta : {
			required : true,
			minlength : 2,
		},
		detectionLongitude_updeta : {
			required : true,
			minlength : 2,
		},
		detectionLatitude_updeta : {
			required : true,
			minlength : 2,
		}
	},
	
	messages : {
	
		detectionName_updeta : {
			required : "测点名称不能为空",
			minlength:"测点名称为2-15个字符",
		},
		detectionNum_updeta : {
			required : "测点编号不能为空",
			minlength:"测点编号为2-15个字符",
		},
		detectionLongitude_updeta : {
			required : "测点经度不能为空",
			minlength:"测点经度为2-15个字符",
		},
		detectionLatitude_updeta : {
			required : "测点纬度不能为空",
			minlength:"测点纬度为2-15个字符",
		}
	}
});

//添加用户验证	
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
				isMobile : true,
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
				isMobile : "请正确填写您的手机号码",
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
				isMobile : true,
				//验证手机号码是否被注册
				remote: {
				    url: "rest/user/mdOnlyPhone",//后台处理程序
				    type: "post",                //数据发送方式  
				    data: {                      //要传递的数据
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
				    url: "rest/user/mdOnlyEmail",//后台处理程序
				    type: "post",                //数据发送方式  
				    data: {                      //要传递的数据
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
				isMobile : "请正确填写您的手机号码",
				remote: "手机号码已经被注册"
			},
		
			mdemail :{
				required : "请输入邮箱",
				email : "请输入一个正确的邮箱",
				remote: "电子邮箱已经被注册"
			}
		}
		
	});

$('#from_modifyuserpassword').validate({
	
	onkeyup:false,
	focusCleanup:true,
	//onfocusout:false,
	
	rules : {
		password: {
			required : true,
			rangelength: [6,12],
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
			rangelength: [6,12]
	    },
	      
	    new_passwords: {
	    	rangelength: [6,12],
		    equalTo: "#new_password"
		}
	},

	messages : {
		password: {
	        required: "请填写原密码",
	        rangelength: "密码为6-12个字符",
	        remote: "原密码错误"	
	    },
		
		new_password: {
			required:"请填写新密码",
			rangelength: "密码为6-12个字符"
			
	    },
	      
	    new_passwords: {
	    	rangelength: "密码为6-12个字符",
	        equalTo: "两次密码不一致"
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
			isMobile : true,
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
			isMobile : "请正确填写您的手机号码",
			remote: "手机号码已经被注册"
		},
	
		self_email :{
			required : "请输入邮箱",
			email : "请输入一个正确的邮箱",
			remote: "电子邮箱已经被注册"
		}
		
	}
	
  });

});






