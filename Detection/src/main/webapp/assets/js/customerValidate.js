
// 手机号码验证
jQuery.validator.addMethod("isMobile", function(value, element) {
    var length = value.length;
    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
    return this.optional(element) || (length == 11 && mobile.test(value));
}, "请正确填写您的手机号码");

// 经度验证
jQuery.validator.addMethod("istrueLongitude", function(value, element) {
    var mobile =  /^(((\d|[1-9]\d|1[1-7]\d|0)\.\d{0,12})|(\d|[1-9]\d|1[1-7]\d|0{1,3})|180\.0{0,12}|180)$/;
    return this.optional(element) || mobile.test(value);
}, "请正确填写您的经度");

// 纬度验证
jQuery.validator.addMethod("istrueLatitude", function(value, element) {
    var mobile =   /^([1-8]?\d{1}\.\d{0,12}|90\.0{0,12}|[0-8]?\d{1}|90)$/;
    return this.optional(element) || mobile.test(value);
}, "请正确填写您的纬度");

//double类型验证
jQuery.validator.addMethod("isdouble", function(value, element) {
    var mobile =  /^[-+]?[0-9]+(\.[0-9]+)?$/;
    return this.optional(element) || mobile.test(value);
}, "请按要求填入double值");

//添加用户校验用户信息唯一性
$(document).ready(function() {

//添加图片校验该检测指标是否已存在图片（未启用）
/*function addImageFormValidate(){
	return*/ $('#addImageForm').validate({
		rules : {
			selectDetectionTypeAddImage : {
				//校验该检测指标是否已存在图片
				remote: {
					   url: "rest/image/OnlyImage",    //后台处理程序
					   type: "post",				   //数据发送方式
					   dataType: "json",  
					   data: {                         //要传递的数据
						    selectDetectionTypeAddImage: function() {
				            return $("#selectDetectionTypeAddImage").val();
				        },
				        	projectId_addImage: function() {
				            return $("#projectId_addImage").val();
				        }
				    }
				}
			}
		},
		messages : {
			selectDetectionTypeAddImage : {
				remote: "该检测指标已存在图片"
			}
		}
	});		
/*}*/

//添加采集器时判断采集器编号是否已存在项目
$('#form_addTerminals').validate({
	rules : {
		terminalsNum : {
			//校验该检测指标是否已存在图片
			remote: {
				   url: "rest/terminals/OnlyTerminals",    //后台处理程序
				   type: "post",				   //数据发送方式
				   dataType: "json",  
				   data: {                         //要传递的数据
					   terminalsNum: function() {
					    return $("#terminalsNum").val();
					     },
					   terminals_projectId: function() {
					    return $("#terminals_projectId").val();
					     }
					   }
					}
				}
			},
			messages : {
				terminalsNum : {
					remote: "该检测指标已存在图片"
				}
			}
		});		
	
//添加项目信息验证	
$('#form_addProject').validate({
		
		rules : {
			projectName_addProject : {
				required : true,
				minlength : 2,
				//验证项目名称是否已存在
				remote: {
				    url: "rest/project/OnlyProjectName",    //后台处理程序
				    type: "post",               //数据发送方式  
				    data: {                     //要传递的数据
				    	projectName_addProject: function() {
				            return $("#projectName_addProject").val();
				        }
				    }
				}
			},
			projectAddress_addProject : {
				required : true,
				minlength : 2
			},
			projectLongitude_addProject : {
				required : true,
				number:  true,
				istrueLongitude: true
			},
			projectLatitude_addProject : {
				required : true,
				number:  true,
				istrueLatitude :true
			},
			projectBeginTime_addProject : {
				required : true
			},
			projectEndTime_addProject : {
				required : true,
				remote: {
				    url: "rest/project/CorrectEndTime",    //后台处理程序
				    type: "post",               //数据发送方式  
				    data: {                     //要传递的数据
				    	projectBeginTime_addProject: function() {
				            return $("#projectBeginTime_addProject").val();
				        },
				        projectEndTime_addProject: function() {
				            return $("#projectEndTime_addProject").val();
				        }
				    }
				}
			}
		},
		
		messages : {
		
			projectName_addProject : {
				required : "请输入项目名",
				minlength:"项目名为2-15个字符",
				remote: "项目已存在"
			},
			projectAddress_addProject : {
				required : "请输入项目地址",
				minlength:"项目地址为2-15个字符",
			},
			projectLongitude_addProject : {
				required : "请输入项目经度",
				number:  "项目经度格式不正确",
				istrueLongitude : "项目经度格式不正确"
			},
			projectLatitude_addProject : {
				required : "请输入项目纬度",
				number:  "项目纬度格式不正确",
				istrueLatitude: "项目纬度格式不正确"
			},
			projectBeginTime_addProject : {
				required : "请选择项目开始时间"
			},
			projectEndTime_addProject : {
				required : "请选择项目结束时间",
				remote: "结束时间不能在开始时间之前"
			}
		}
	});
//修改项目信息验证
$('#form_updetaProject').validate({
	
	rules : {
		projectName_updetaProject : {
			required : true,
			minlength : 2,
			//验证项目名称是否已存在
			remote: {
			    url: "rest/project/upOnlyProjectName",    //后台处理程序
			    type: "post",               //数据发送方式  
			    data: {                     //要传递的数据
			    	projectName_updetaProject: function() {
			            return $("#projectName_updetaProject").val();
			        },
			        projectId_updetaProject: function() {
			            return $("#projectId_updetaProject").val();
			        }
			    }
			}
		},
		projectAddress_updetaProject : {
			required : true,
			minlength : 2
		},
		projectLongitude_updetaProject : {
			required : true,
			number:  true,
			istrueLongitude: true
		},
		projectLatitude_updetaProject : {
			required : true,
			number:  true,
			istrueLatitude :true
		},
		projectBeginTime_updetaProject : {
			required : true
		},
		projectEndTime_updetaProject : {
			required : true,
			remote: {
			    url: "rest/project/upCorrectEndTime",    //后台处理程序
			    type: "post",               //数据发送方式  
			    data: {                     //要传递的数据
			    	projectBeginTime_updetaProject: function() {
			            return $("#projectBeginTime_updetaProject").val();
			        },
			        projectEndTime_updetaProject: function() {
			            return $("#projectEndTime_updetaProject").val();
			        }
			    }
			}
		}
	},
	
	messages : {
	
		projectName_updetaProject : {
			required : "项目名不能为空",
			minlength:"项目名为2-15个字符",
			remote: "项目已存在"
		},
		projectAddress_updetaProject : {
			required : "项目地址不能为空",
			minlength:"项目地址为2-15个字符"
		},
		projectLongitude_updetaProject : {
			required : "项目经度不能为空",
			number:  "项目经度格式不正确",
			istrueLongitude : "项目经度格式不正确"
		},
		projectLatitude_updetaProject : {
			required : "项目纬度不能为空",
			number:  "项目纬度格式不正确",
			istrueLatitude: "项目纬度格式不正确"
		},
		projectBeginTime_updetaProject : {
			required : "请选择项目开始时间"
		},
		projectEndTime_updetaProject : {
			required : "请选择项目结束时间",
			remote: "结束时间不能在开始时间之前"
		}
	}
});

//添加测点信息验证
$('#form_addDetection').validate({
	
	rules : {
		DetectionName_addDetection : {
			required : true,
			minlength : 2,
			//验证，同一个项目下的测点名称不能相同
			remote: {
			    url: "rest/detectionPoint/OnlyDetectionPointName",    //后台处理程序
			    type: "post",               //数据发送方式  
			    data: {                     //要传递的数据
			    	DetectionName_addDetection: function() {
			            return $("#DetectionName_addDetection").val();
			        },
			        ProjectName_addDetection: function() {
				        return $("#ProjectName_addDetection").val();
			        }
			    }
			}
		},
		DetectionLongitude_addDetection : {
			required : true,
			number:  true,
			istrueLongitude: true
		},
		DetectionLatitude_addDetection : {
			required : true,
			number:  true,
			istrueLatitude :true
		}
	},
	
	messages : {
	
		DetectionName_addDetection : {
			required : "测点名称不能为空",
			minlength:"测点名称为2-15个字符",
			remote: "测点已存在"
		},
		DetectionLongitude_addDetection : {
			required : "测点经度不能为空",
			number:  "测点经度格式不正确",
			istrueLongitude : "项目经度格式不正确"
		},
		DetectionLatitude_addDetection : {
			required : "测点纬度不能为空",
			number:  "测点纬度格式不正确",
			istrueLatitude: "项目纬度格式不正确"
		}
	}
});
   
//修改测点信息验证
$('#form_updetaDetection').validate({
	
	rules : {
		DetectionName_updetaDetection : {
			required : true,
			minlength : 2,
			//验证，同一个项目下的测点名称不能相同
			remote: {
			    url: "rest/detectionPoint/upOnlyDetectionPointName",  //后台处理程序
			    type: "post",               //数据发送方式  
			    data: {                     //要传递的数据
			    	DetectionName_updetaDetection: function() {
			            return $("#DetectionName_updetaDetection").val();
			        },
			        ProjectName_updetaDetection: function() {
				        return $("#ProjectName_updetaDetection").val();
			        },
			        DetectionPointId_updetaDetection:function() {
				        return $("#DetectionPointId_updetaDetection").val();
			        }
			    }
			}
		},
		
		DetectionLongitude_updetaDetection : {
			required : true,
			number:  true,
			istrueLongitude: true,
		},
		
		DetectionLatitude_updetaDetection : {
			required : true,
			number:  true,
			istrueLatitude :true,
		}
	},
	
	messages : {
	
		DetectionName_updetaDetection : {
			required : "测点名称不能为空",
			minlength:"测点名称为2-15个字符",
			remote: "测点已存在"
		},
		DetectionLongitude_updetaDetection : {
			required : "测点经度不能为空",
			number:  "测点经度格式不正确",
			istrueLongitude : "项目经度格式不正确"
		},
		DetectionLatitude_updetaDetection : {
			required : "测点纬度不能为空",
			number:  "测点纬度格式不正确",
			istrueLatitude: "项目纬度格式不正确"
		}
	}
	
});

//添加阀值校验（同测点类型和阀值类型不能重复校验在java代码内部）
$('#form_addThresHold').validate({
		
		rules : {
			 
			 maxThresholdValue_add : {
				required : true,
				number:  true,
				minlength : 1
			},
			minThresholdValue_add : {
				required : true,
				number:  true,
				minlength : 1
			},
			maxDrasticThresholdValue_add : {
				isdouble:  true,
				minlength : 1
			},
			minDrasticThresholdValue_add : {
				isdouble:  true,
				minlength : 1
			}
		},
		
		messages : {
		
			maxThresholdValue_add : {
				required : "最大告警值不能为空",
				number:  "请正确填写阀值",
				minlength:"最大告警值为1-15个字符"
			},
			minThresholdValue_add : {
				required : "最小告警值不能为空",
				number:  "请正确填写阀值",
				minlength:"最小告警值为2-15个字符"
			},
			maxDrasticThresholdValue_add : {
				number:  "请按要求填写阀值",
				minlength:"最大意外告警值为1-15个字符"
			},
			minDrasticThresholdValue_add : {
				number:  "请按要求填写阀值",
				minlength:"最小意外告警值为2-15个字符"
			}
		}
});

//修改阀值校验（同测点类型和阀值类型不能重复校验在java代码内部）
$('#form_updetaThresHold').validate({
		
	rules : {
		 
		 maxThresholdValue_updeta : {
			required : true,
			number:  true,
			minlength : 1
		},
		minThresholdValue_updeta : {
			required : true,
			number:  true,
			minlength : 1
		}
	},
	
	messages : {
	
		maxThresholdValue_updeta : {
			required : "最大告警值不能为空",
			number:  "请正确填写阀值",
			minlength:"最大告警值为1-15个字符"
		},
		minThresholdValue_updeta : {
			required : "最小告警值不能为空",
			number:  "请正确填写阀值",
			minlength:"最小告警值为2-15个字符"
		}
	}
});

//添加传感器校验（传感器编号全字段不能重复）
$('#form_addSensorInfo').validate({
		rules : {
			sensorId_addSensorInfo : {
				required : true,
				minlength : 1,
				//验证，同一个项目下的测点名称不能相同
				remote: {
				    url: "rest/sensorInfo/OnlysensorInfoId",  //后台处理程序
				    type: "post",               //数据发送方式  
				    data: {                     //要传递的数据
				    	sensorId_addSensorInfo: function() {
					        return $("#sensorId_addSensorInfo").val();
				        },
				        sensorType_addSensorInfo: function() {
						    return $("#sensorType_addSensorInfo").val();
						},
						projectId_addSensorInfo: function() {
						    return $("#projectId_addSensorInfo").val();
						}
				    }
				}
			},
			sensorType_addSensorInfo : {
				required : true,
				minlength : 2
			},
			sensorModel_addSensorInfo : {
				required : true,
				minlength : 2
			},
			sensorDepth_addSensorInfo : {
				required : true,
				number:  true,
				minlength : 1
			},
			terminalsInfoNum_addSensorInfo : {
				required : true,
				minlength : 2
			},
			terminalsInfoAisle_addSensorInfo : {
				required : true,
				minlength : 1
			}
		},
		
		messages : {
		
			sensorId_addSensorInfo : {
				required : "传感器编号不能为空",
				minlength:"传感器编号为1-15个字符",
				remote: "编号已存在"
			},
			sensorType_addSensorInfo : {
				required : "传感器类型不能为空",
				minlength:"传感器类型为2-15个字符"
			},
			sensorModel_addSensorInfo : {
				required : "传感器模型不能为空",
				minlength:"传感器模型为2-15个字符"
			},
			sensorDepth_addSensorInfo : {
				required : "传感器深度不能为空",
				number: "传感器深度为数字",
				minlength:"传感器深度为1-15个字符"
			},
			terminalsInfoNum_addSensorInfo : {
				required : "请填写采集器编号",
				minlength:"采集器编号为2-15个字符"
			},
			terminalsInfoAisle_addSensorInfo : {
				required : "请填写采集器通道号",
				minlength:"采集器通道号为1-15个字符"
			}
		}
});
   
//修改传感器校验（传感器编号全字段不能重复）
$('#form_updetaSensorInfo').validate({
		
		rules : {
			sensorId_updetaSensorInfo : {
				required : true,
				minlength : 1,
				//验证，同一个项目下的测点名称不能相同
				remote: {
				    url: "rest/sensorInfo/upOnlysensorInfoId",  //后台处理程序
				    type: "post",               //数据发送方式  
				    data: {                     //要传递的数据
				    	sensorId_updetaSensorInfo: function() {
				            return $("#sensorId_updetaSensorInfo").val();
				        },
				        sensorType_updetaSensorInfo: function() {
						    return $("#sensorType_updetaSensorInfo").val();
						},
						sensorInfoId_updetaSensorInfo: function() {
						    return $("#sensorInfoId_updetaSensorInfo").val();
						},
						projectId_updetaSensorInfo: function() {
						    return $("#projectId_updetaSensorInfo").val();
						}
				    }
				}
			},
			sensorType_updetaSensorInfo : {
				required : true,
				minlength : 2
			},
			sensorModel_updetaSensorInfo : {
				required : true,
				minlength : 2
			},
			sensorDepth_updetaSensorInfo : {
				required : true,
				number:  true,
				minlength : 1
			},
			terminalsInfoNum_addSensorInfo : {
				required : true,
				minlength : 2
			},
			terminalsInfoAisle_addSensorInfo : {
				required : true,
				minlength : 1
			}
		},
		
		messages : {
		
			sensorId_updetaSensorInfo : {
				required : "传感器编号不能为空",
				minlength:"传感器编号为1-15个字符",
				remote: "传感器编号已存在"
			},
			sensorType_updetaSensorInfo : {
				required : "传感器类型不能为空",
				minlength:"传感器编号为2-15个字符"
			},
			sensorModel_updetaSensorInfo : {
				required : "传感器模型不能为空",
				minlength:"传感器模型为2-15个字符"
			},
			sensorDepth_updetaSensorInfo : {
				required : "传感器深度不能为空",
				number: "传感器深度为数字",
				minlength:"传感器深度为1-15个字符"
			},
			terminalsInfoNum_addSensorInfo : {
				required : "请填写采集器编号",
				minlength:"采集器编号为2-15个字符"
			},
			terminalsInfoAisle_addSensorInfo : {
				required : "请填写采集器通道号",
				minlength:"采集器通道号为1-15个字符"
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
		},
		
		success:{
			userName : {
				remote:"asd"
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

//修改密码是的密码检验
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






