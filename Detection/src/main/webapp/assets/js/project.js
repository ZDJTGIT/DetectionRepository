
var dlId=document.getElementById("project_DLID").value;

	 //自动更新项目状态
	 $.get('rest/project/updetaProjectStatus');
	 
		//传字符串型时间转化为时间
		 function stringToData(strin){
			var beginArray = strin.split(" ");
	    	var dateArray = beginArray[0].split("-");
	    	var timeArray = beginArray[1].split(":");
	    	var date = new Date(dateArray[0], dateArray[1]-1, dateArray[2], timeArray[0], timeArray[1], timeArray[2]);
	    	return date.getTime();
		}
		
		//设置上传图片显示的大小
		function creatImg(imgRUL){  
		    var textHtml = "<img src='"+imgRUL+"'width='170px' height='100px'/>";  
		    $(".ge_pic_icon_Infor").html(textHtml);  
		}  
		 
		//上传图片响应事件
		 $(function(){
				var upload = layui.upload;
				
				//heatImageUr上传
				var uploadInst1 = upload.render({
						elem: '#test1',
						url: 'rest/threshold/uploadImg',
						before: function(obj){
						//预读本地文件示例，不支持ie8
						obj.preview(function(index, file, result){
							//alert(result);
							$('#demo1').attr('src', result); //图片链接（base64）
						});
					},
					//上传成功回调函数
					done: function(res){
						//如果上传失败
						if(res.code > 0){
							return layer.msg('上传失败');
						}else{
							$('#demo1').attr('src', res.path);
						}
						//上传成功
					},
					//上传失败回调函数
					error: function(){
						//演示失败状态，并实现重传
						var demoText = $('#demoText1');
						demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
						demoText.find('.demo-reload').on('click', function(){
							uploadInst1.upload();
						});
					}
				});
				
				//physicalImageUrl上传
				var uploadInst2 = upload.render({
					elem: '#test2',
					url: 'rest/threshold/uploadImg',
					before: function(obj){
					//预读本地文件示例，不支持ie8
					obj.preview(function(index, file, result){
						$('#demo2').attr('src', result); //图片链接（base64）
					});
				}
				,done: function(res){
					//如果上传失败
					if(res.code > 0){
					return layer.msg('上传失败');
					}else{
						$('#demo2').attr('src', res.path);
					}
					//上传成功
				}
				,error: function(){
					//演示失败状态，并实现重传
					var demoText = $('#demoText2');
					demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
					demoText.find('.demo-reload').on('click', function(){
						uploadInst2.upload();
					});
				}
			});

			 });
	
		$(document).ready(function() {
			$zd.myPall.createPagingDage('myModal');
			var htmlBodyTyp;
			var htmlLiTopTypArray;
			var cuurTableLine ;
			//日期范围限制
	        var start = {
	            elem: '#projectBeginTime_addProject',
	            format: 'YYYY-MM-DD hh:mm:ss',
	            min: '1900-06-16 23:59:59', //设定最小日期为当前日期laydate.now()
	            max: '2099-06-16 23:59:59', //最大日期
	            istime: true,
	            istoday: false,
	            choose: function (datas) {
	                end.min = datas; //开始日选好后，重置结束日的最小日期
	                end.start = datas //将结束日的初始值设定为开始日
	            }
	        };
	        var end = {
	            elem: '#projectEndTime_addProject',
	            format: 'YYYY-MM-DD hh:mm:ss',
	            min: '1900-06-16 23:59:59',
	            max: '2099-06-16 23:59:59',
	            istime: true,
	            istoday: false,
	            choose: function (datas) {
	                start.max = datas; //结束日选好后，重置开始日的最大日期
	            }
	        };
	        laydate(start);
	        laydate(end);
	        
	      //日期范围限制
	        var start = {
	            elem: '#projectBeginTime_updetaProject',
	            format: 'YYYY-MM-DD hh:mm:ss',
	            min: '1900-06-16 23:59:59', //设定最小日期为当前日期laydate.now()
	            max: '2099-06-16 23:59:59', //最大日期
	            istime: true,
	            istoday: false,
	            choose: function (datas) {
	                end.min = datas; //开始日选好后，重置结束日的最小日期
	                end.start = datas //将结束日的初始值设定为开始日
	            }
	        };
	        var end = {
	            elem: '#projectEndTime_updetaProject',
	            format: 'YYYY-MM-DD hh:mm:ss',
	            min: '1900-06-16 23:59:59',
	            max: '2099-06-16 23:59:59',
	            istime: true,
	            istoday: false,
	            choose: function (datas) {
	                start.max = datas; //结束日选好后，重置开始日的最大日期
	            }
	        };
	        laydate(start);
	        laydate(end);
			
			//系统自带
			$("#loading-example-btn").click(function() {
				btn = $(this);
				simpleLoad(btn, true);
				simpleLoad(btn, false)
			})
 
	    	//新建项目时加载用户信息
	    	//用户信息暂且使用全部加载-之后改成按用户类型查找
	    	//超级管理员和管理员不加载，不能创建自己的项目
	 		 $.ajax({
	    		  type:'post',
	    	  	  url: 'rest/project/showUser',
	    	  	  data: {userId:dlId},
	    	  	  success: function(data){
	    	  		       if(data){
	    	  		    	var string = '<select class="md_input" id="selectUser" name="selectUser">';
	    	  		    	$.each(data,function(idx,user){
	    	  		    	    string += '<option value="'+user.userId+'">'+ user.userName +'</option>';
	    	  		    	});
	    	  		       string += '</select>';
	    	  		       $('#selectUser_div_addProject').append(string);
	    	  		       }else{
	    	  		    	alert("数据异常");
	    	  		       }
	    	  	  },
	    	  	  error: function(){
	  			    alert("数据加载失败");
	  		      }
	    	     });
	    	   //新建项目时加载项目类型信息
		 		$.ajax({
		    		  type:'post',
		    	  	  url: 'rest/project/showProjectType',
		    	  	  data: {userId:dlId},
		    	  	  success: function(data){
		    	  		       if(data){
		    	  		    	var string = '<select class="md_input" id="selectProjectType" name="selectProjectType">';
		    	  		    	$.each(data,function(idx,SysDictionary){
		    	  		    	    string += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
		    	  		    	});
		    	  		       string += '</select>';
		    	  		       $('#selectProjectType_div_addProject').append(string);
		    	  		       }else{
		    	  		    	alert("数据异常");
		    	  		       }
		    	  	  },
		    	  	  error: function(){
		  			    alert("数据加载失败");
		  		      }
		    	     });
	    	   //新建项目时加载项目状态
	    	   /*  $.ajax({
	    	    	type:'post',
		    	  	  url: 'rest/project/showProjectStatus',
		    	  	  data: {userId:dlId},
		    	  	  success: function(data){
		    	  		       if(data){
		    	  		    	var string = '<select class="md_input" id="selectProjectStatus" name="selectProjectStatus">';
		    	  		    	$.each(data,function(idx,SysDictionary){
		    	  		    	    string += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
		    	  		    	});
		    	  		       string += '</select>';
		    	  		       $('#selectProjectStatus_div_addProject').append(string);
		    	  		       }else{
		    	  		    	alert("数据异常");
		    	  		       }
		    	  	  },
		    	  	  error: function(){
		  			    alert("数据加载失败");
		  		      }
	    	     }); */
	    	   
		 		//编辑项目加载用户，默认显示选中用户
		    	   $.ajax({
		    		   type:'post',
			    	  	  url: 'rest/project/showUserType_selected',
			    	  	  data: {userId:dlId},
			    	  	  success: function(data){
			    	  		       if(data){
			    	  		    	var string = '<select class="md_input" id="selectUserType_selected" name="selectUserType_selected">';
			    	  		    	$.each(data,function(idx,user){
			    	  		    	    string += '<option value="'+user.userId+'">'+ user.userName +'</option>';
			    	  		    	});
			    	  		       string += '</select>';
			    	  		       $('#selectUser_div_updetaProject').append(string);
			    	  		       }else{
			    	  		    	alert("数据异常");
			    	  		       }
			    	  	  },
			    	  	  error: function(){
			  			    alert("数据加载失败");
			  		      }
		    	   });
		    	 //编辑项目加载项目类型，默认显示选中项目类型
		    	   $.ajax({
		    		   type:'post',
			    	  	  url: 'rest/project/showProjectType_selected',
			    	  	  data: {userId:dlId},
			    	  	  success: function(data){
			    	  		       if(data){
			    	  		    	var string = '<select class="md_input" id="selectProjectType_selected" name="selectProjectType_selected">';
			    	  		    	$.each(data,function(idx,SysDictionary){
			    	  		    	    string += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
			    	  		    	});
			    	  		       string += '</select>';
			    	  		       $('#selectProjectType_div_updetaProject').append(string);
			    	  		       }else{
			    	  		    	alert("数据异常");
			    	  		       }
			    	  	  },
			    	  	  error: function(){
			  			    alert("数据加载失败");
			  		      }
		    	   });
		    	//编辑项目加载项目状态，默认显示选中项目状态
		    	  /*  $.ajax({
		    		   type:'post',
			    	  	  url: 'rest/project/showProjectStatus_selected',
			    	  	  data: {userId:dlId},
			    	  	  success: function(data){
			    	  		       if(data){
			    	  		    	var string = '<select class="md_input" id="selectProjectStatus_selected" name="selectProjectStatus_selected">';
			    	  		    	$.each(data,function(idx,SysDictionary){
			    	  		    	    string += '<option value="'+SysDictionary.dicId+'">'+ SysDictionary.itemName +'</option>';
			    	  		    	});
			    	  		       string += '</select>';
			    	  		       $('#selectProjectStatus_div_updetaProject').append(string);
			    	  		       }else{
			    	  		    	alert("数据异常");
			    	  		       }
			    	  	  },
			    	  	  error: function(){
			  			    alert("数据加载失败");
			  		      }
		    	   }); */
		});
		       var b;
		 //修改编辑项目时加载编辑框内所有元素
		 function updetaProject(s){
			   b = s.parentNode.parentNode.rowIndex;
	    	   //获取选中的项目信息加载到编辑框
	    	   var projectId = $("table tr:eq(" + b + ") td:eq(0)").text();//项目ID--6
	    	   var projectTypeId = $("table tr:eq(" + b + ") td:eq(1)").text();//项目类型ID--10
	    	   var projectLongitude = $("table tr:eq(" + b + ") td:eq(2)").text();//经度--4
	    	   var projectLatitude = $("table tr:eq(" + b + ") td:eq(3)").text();//纬度--5
	    	   var projectAddress = $("table tr:eq(" + b + ") td:eq(4)").text();//项目地址_String--1
	    	   var projectStatusString =  $("table tr:eq(" + b + ") td:eq(5)").text();//项目状态
	    	   var projectName = $("table tr:eq(" + b + ") td:eq(6)").text();//项目名--2
	    	   var projectDescription = $("table tr:eq(" + b + ") td:eq(9)").text();//项目描述--3
	    	   var projectStatus =  $("table tr:eq(" + b + ") td:eq(10)").text();//项目状态_int--9
	    	   var projectBeginTime =  $("table tr:eq(" + b + ") td:eq(11)").text();//开始时间--7
	    	   var projectEndTime =  $("table tr:eq(" + b + ") td:eq(12)").text();//结束时间--8
			   $('#projectAddress_updetaProject').val(projectAddress);
	       	   $('#projectName_updetaProject').val(projectName);
	       	   $('#projectDescription_updetaProject').val(projectDescription);
	       	   $('#projectLongitude_updetaProject').val(projectLongitude);
	       	   $('#projectLatitude_updetaProject').val(projectLatitude);
	       	   $('#projectId_updetaProject').val(projectId);
		       $('#projectBeginTime_updetaProject').val(projectBeginTime);
			   $('#projectEndTime_updetaProject').val(projectEndTime);
	       	   $("#selectProjectStatus_selected option[value='"+projectStatus+"']").prop("selected",true);
	       	   //修改项目时显示当前选中项目的所属用户和项目类型
	       	   $.ajax({
		   		  type:'post',
		   	  	  url: 'rest/project/showSelectUserAndProjectType',
		   	  	  data: {projectId:projectId,projectTypeId:projectTypeId},
		   	  	  success: function(data){
		   	  	    $("#selectProjectType_selected option[value='"+data.sysDictionary.dicId+"']").prop("selected",true);
		   	    	$("#selectUserType_selected option[value='"+data.userId+"']").prop("selected",true);
		   	  	  }
			   });
	       	   /*$.ajax({
		   		  type:'post',
		   	  	  url: 'rest/project/showSelectProjectStatus',
		   	  	  data: {projectStatusString:projectStatusString},
		   	  	  success: function(data){
		   	  	    $("#selectProjectType_selected option[value='"+data.sysDictionary.dicId+"']").attr("selected","selected");
		   	    	$("#selectUserType_selected option[value='"+data.userId+"']").attr("selected","selected");
		   	  	  }
			   });*/
  	     }
		 
		//页面tr点击跳转到页面详情====
		 /*function test(tr_projectId){
			 alert(tr_projectId);
			
			 $.ajax({
		   		  type:'post',
		   	  	  url: 'rest/project/obtainProject',
		   	  	  data: {projectId:tr_projectId},
		   	  	  success: function(data){
		   	  	    var hreftt='rest/project_detail/'+tr_projectId+":"+data.projectName;
		   	  	  	window.location.href='rest/project_detail/'+tr_projectId+":"+data.projectName;
			 		window.open( hreftt ,'top'); 
		   	  	  }
			      });
			}*/
		
		//系统自带
		function simpleLoad(btn, state) {
			if (state) {
				btn.children().addClass("fa-spin");
				btn.contents().last().replaceWith(" Loading")
			} else {
				setTimeout(function() {
					btn.children().removeClass("fa-spin");
					btn.contents().last().replaceWith(" Refresh")
				}, 2000)
			}
		};
		
	   	//确定修改项目响应事件
   		$(".sureAddProject_updetaProject").click(function(){
   		    //修改项目验证
			if(!$('#form_updetaProject').valid()){
				return false;
			}
   		       var t = b;
   			   var userIds = $("#selectUser_div_updetaProject option:selected").val();
   			   var projectTypeIds = $("#selectProjectType_div_updetaProject option:selected").val();
   			   var projectNames = $("#projectName_updetaProject").val();
   			   var projectAddresss = $("#projectAddress_updetaProject").val();
   			   var projectDescriptions = $("#projectDescription_updetaProject").val();
   			   var projectLongitudes = $("#projectLongitude_updetaProject").val();
   			   var projectLatitudes = $("#projectLatitude_updetaProject").val();
   			   var projectIds = $("#projectId_updetaProject").val();
   			   var projectBeginTimes = $('#projectBeginTime_updetaProject').val();
   			   var projectEndTimes = $('#projectEndTime_updetaProject').val();
   			   //var projectStatuss = $("#selectProjectStatus_div_updetaProject option:selected").val();
   	       	   var jsonData = '{"userId":"'
   					       		+ userIds
   					       		+ '","projectId":"'
								+ projectIds
   								+ '","projectTypeId":"'
   								+ projectTypeIds
   								+ '","projectName":"'
   								+ projectNames
   								+ '","projectAddress":"'
   								+ projectAddresss
   								+ '","projectBeginTime":"'
   								+ projectBeginTimes
   								+ '","projectEndTime":"'
   								+ projectEndTimes
   								+ '","projectLongitude":"'
   								+ projectLongitudes
   								+ '","projectLatitude":"'
   								+ projectLatitudes
   								//+ '","projectStatus":"'
   								//+ projectStatuss
   								+ '","projectDescription":"'
   								+ projectDescriptions + '"}';
   	       	 //确定修改，将数据插入数据库 
   	       	 $.ajax({
   		   		  type:'post',
   		   	  	  url: 'rest/project/selectProject',
   		   	  	  contentType:"application/json",
   		   	  	  dataType : 'json',
   		   	  	  data: jsonData,
   		   	  	  success: function(data){
   		   	  		  if(data){
   		   	  		    //修改成功后当前页面的当前项目修改
   		   	  		    layer.msg('修改成功（该提示1s后自动关闭）', {
								time : 1000, //1s后自动关闭
								btn : [ '知道了' ]
							});
			    	   $("table tr:eq(" + t + ") td:eq(5) span").text(data.projectStatusString);//项目状态_String
			    	   $("table tr:eq(" + t + ") td:eq(5) span").attr('class','label label-primary statusColor'+data.projectStatus);
			    	   $("table tr:eq(" + t + ") td:eq(6) a").text(data.projectName);//项目名
			    	   $("table tr:eq(" + t + ") td:eq(9) small").text(data.projectDescription);//项目描述
			    	   $("table tr:eq(" + t + ") td:eq(7) small").text(data.projectBeginTime);//创建时间
			    	   
			    	   var nowTime = new Date().getTime();
	  		    	   var beginTime = stringToData(data.projectBeginTime);
	  		    	   var endTime = stringToData(data.projectEndTime);
	  		    	   var percentage=0;;
	  		    	   if(nowTime > endTime){
	  		    		   percentage=100;
	  		    	   }else if(nowTime < beginTime){
	  		    		   percentage=0;
	  		    	   }else{
	  		    		   percentage = ((nowTime-beginTime)/(endTime-beginTime)*100).toFixed(2); 
	  		    	   }	  		    
			    	   $("table tr:eq(" + t + ") td:eq(8) small").text("当前进度： "+percentage+"%");//当前进度
			    	   $("table tr:eq(" + t + ") td:eq(8) .progress-bar").css("width",percentage+"%");//当前进度
			    	   $('#offUpdetaProject').trigger("click"); 
			    	   $('.statusColor22').css("background-color","#1ab394"); 
	  	  	 		   $('.statusColor21').css("background-color","#FF8547"); 
	  	  	 		   $('.statusColor23').css("background-color","#F54545"); 
	  	  			   $('.statusColor24').css("background-color","#696969");
   		   	  		  }else {
  						alert("抱歉！您为非管理员用户，修改项目信息请联系对应管理员！");
   					  }
   		   	  	  },
   	       	 	  error: function(){
   	       	 		alert("权限不足，修改项目信息请联系相关管理员");
   	  		      }
   			  }); 
   		}); 
	   	
		//确认添加项目响应事件
		$(".sureAddProject_addProject").click(function(){
			//添加项目验证
			if(!$('#form_addProject').valid()){
				return false;
			} 
			var userId = $("#selectUser_div_addProject option:selected").val();
			var projectTypeId = $("#selectProjectType_div_addProject option:selected").val();
			var projectName = $("#projectName_addProject").val();
			var projectAddress = $("#projectAddress_addProject").val();
			var projectDescription = $("#projectDescription_addProject").val();
			var projectLongitude = $("#projectLongitude_addProject").val();
			var projectLatitude = $("#projectLatitude_addProject").val();
			var projectBeginTime = $("#projectBeginTime_addProject").val();
			var projectEndTime = $("#projectEndTime_addProject").val();
			$("#projectName_addProjects").val(projectName);
			var jsonData = '{"userId":"'
							+ userId
							+ '","projectTypeId":"'
							+ projectTypeId
							+ '","projectName":"'
							+ projectName
							+ '","projectAddress":"'
							+ projectAddress
							+ '","projectBeginTime":"'
							+ projectBeginTime
							+ '","projectEndTime":"'
							+ projectEndTime
							+ '","projectLongitude":"'
							+ projectLongitude
							+ '","projectLatitude":"'
							+ projectLatitude
							+ '","projectDescription":"'
							+ projectDescription + '"}';
			$.ajax({
				type : 'post',
				url : 'rest/project/addProject',
				contentType : 'application/json',
				dataType : 'json',
				data : jsonData,
				success : function(data) {
					if(data) {
						if(data.userId!=2){
							layer.msg('项目添加成功（该提示1s后自动关闭）', {
								time : 1000, //1s后自动关闭
								btn : [ '知道了' ]
							});
						var nowTime = new Date().getTime();
	  		    		var beginTime = stringToData(data.projectBeginTime);
	  		    		var endTime = stringToData(data.projectEndTime);
	  		    		var percentage=0;;
	  		    		if(nowTime > endTime){
	  		    			percentage=100;
	  		    		}else if(nowTime < beginTime){
	  		    			percentage=0;
	  		    		}else{
	  		    			percentage = ((nowTime-beginTime)/(endTime-beginTime)*100).toFixed(2); 
	  		    		}
					     var viewData = '<tr id="project_'+ data.projectId +'" onclick="test('+data.projectId+')" style="height:100px">'+
									    '<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + data.projectId + '</span>'+
										'</td>'+
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + data.projectTypeId + '</span>'+
										'</td>'+
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + data.projectLongitude + '</span>'+
										'</td>'+
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + data.projectLatitude + '</span>'+
										'</td>'+
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + data.projectAddress + '</span>'+
										'</td>'+
										'<td class="project-status" style="width:80px">'+
											'<span class="label label-primary statusColor'+data.projectStatus+'">' + data.projectStatusString + '</span>'+
										'</td>'+
										'<td class="project-title" style="width:150px">'+
											'<a class="J_menuItem" href="rest/project_detail/'+data.projectId+":"+data.projectName+'" name="项目详情">' + 
											data.projectName + 
											'</a><br />'+
										'</td>'+
										'<td class="project-title" style="width:200px">'+
											'<a href="javascript:;">创建时间</a><br />'+
											'<small>' + data.projectBeginTime + '</small>'+
								    	'</td>'+
										'<td class="project-completion" style="width:320px">'+
											'<small>当前进度： '+percentage+'%</small>'+
											'<div class="progress progress-mini">'+
												'<div style="width: '+percentage+'%;" class="progress-bar"></div>'+
											'</div>'+
										'</td>'+
										'<td class="project-title" style="width:300px">'+
											'<a href="javascript:;">项目描述</a><br />'+
											'<p id="trhight">' + data.projectDescription + '</p>'+
										'</td>'+
										'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + data.projectStatus + '</span>'+
								    	'</td>'+
								    	'<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + data.projectBeginTime + '</span>'+
									    '</td>'+
									    '<td class="project-status" style="display:none">'+
											'<span class="label label-primary">' + data.projectEndTime + '</span>'+
								    	'</td>'+
								    	'<td class="project-title" style="width:20px">'+
										'</td>'+
										'<td class="project-title" style="width:140px">'+
											'<a href="javascript:;">告警次数(<i class="fa fa-bell"></i><span class="label label-primary">0</span>)</a><br />'+
										'</td>'+
										'<td class="project-title" style="width:20px">'+
										'</td>'+
										
										'<td class="project-status" style="width:70px">'+
											'<a href="rest/detectionPoint/'+data.projectTypeId+':'+data.projectName+':'+data.projectId+'" class="J_menuItem" name="测点">'+
												 '测点'+
											'</a>'+
										'</td>'+
										'<td class="project-status" style="width:70px">'+
											'<a href="rest/terminals/'+data.projectTypeId+':'+data.projectName+'" class="J_menuItem" name="采集器">采集器</a>'+
										'</td>'+
										'<td class="project-status" style="width:70px">'+
											'<a href="rest/thresHold/'+data.projectId+':'+data.projectName+'" class="J_menuItem" name="阀值">'+
												'阀值 '+
											'</a>'+
										'</td>'+
										'<td class="project-status" style="width:70px">'+
											'<a href="rest/image/'+data.projectId+':'+data.userId+':'+data.projectName+':'+data.projectTypeId+'" class="J_menuItem" name="图片">'+
												'图片 '+
											'</a>'+
										'</td>'+
										'<td class="project-actions">'+
										    '<a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">'+
												'<i class="fa fa-pencil"></i> 修改 '+
											'</a>'+
											'<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ data.projectId +')">'+
												'<i class="fa fa-times-circle"></i> 删除 '+
										    '</a>'+
										'</td>'+
									'</tr>';
								    $('#hover_table').prepend(viewData);
								    $('.statusColor22').css("background-color","#1ab394"); 
				  	  	 			$('.statusColor21').css("background-color","#FF8547"); 
				  	  	 			$('.statusColor23').css("background-color","#F54545"); 
				  	  				$('.statusColor24').css("background-color","#696969");
								    $('#projectAddress_addProject').val("");
									$('#projectName_addProject').val("");
									$('#projectDescription_addProject').val("");
									$('#projectLongitude_addProject').val("");
									$('#projectLatitude_addProject').val("");
									$('#projectBeginTime_addProject').val("");
									$('#projectEndTime_addProject').val("");
									$('#offAddProject').trigger("click");
								  
                           }else{
                            	alert("抱歉！您为非管理员用户，添加项目请联系对应管理员！");
                            	$('#projectAddress_addProject').val("");
        						$('#projectName_addProject').val("");
        						$('#projectDescription_addProject').val("");
        						$('#projectLongitude_addProject').val("");
        						$('#projectLatitude_addProject').val("");
        						$('#projectBeginTime_addProject').val("");
        						$('#projectEndTime_addProject').val("");
						    }
						} else {
							alert("数据异常");
						}
					}
				});
		});
		
		//删除项目
		function deleteProject(projectId){
			layer.msg('玩命提示中');
			layer.confirm('确定要删除该项目么？(包括项目下所有测点和传感器)', {
				btn : [ '取消删除', '确定删除' ] //按钮
			}, function() {
				layer.msg('已取消', {icon : 1});
			}, function() {
				$.ajax({
					type : 'post',
					url : 'rest/project/deleteProject',
					data : {projectId:projectId},
					success : function(data) {
						if(data=="1"){
							$("#project_"+projectId).remove();
							layer.msg('删除成功（该提示3s后自动关闭）', {
								time : 3000, //3s后自动关闭
								btn : [ '知道了' ]
							});
						}else{
							alert("抱歉！您为非管理员用户，删除项目请联系对应管理员！");
						}
					}
				});
			});
		}
		
		$(function(){(function(){
				//分页请求后台获取数据函数 , 参数jsonData为查询条件集合json数据 , loadLaypage是分页组件函数
				function projectPageAjax(jsonData, loadLaypage){
					 //显示loading提示
	                 var loading = layer.load(2, {
	                	  shade: [0.1,'#fff'] //0.1透明度的白色背景
	                 });
					 $.ajax({
							type : 'post',
							url : 'rest/project/projectPageList',
							dataType : 'json',
							contentType : 'application/json',
							data : JSON.stringify(jsonData),
							success : function(data) {
								 if(data){
					  	  		    var asthtml = '';
					  	  		    var reStr = '<td class="project-status" style="display:none"><span class="label label-primary">';
					  	  		   	$.each(data.projectList,function(idx,item){
					  	  		    	var nowTime = new Date().getTime();
					  	  		    	var beginTime = stringToData(item.projectBeginTime);
					  	  		    	var endTime = stringToData(item.projectEndTime);
					  	  		    	var percentage=0;;
					  	  		    	if(nowTime > endTime){
					  	  		    		percentage=100;
					  	  		    	}else if(nowTime < beginTime){
					  	  		    		percentage=0;
					  	  		    	}else{
					  	  		    		percentage = ((nowTime-beginTime)/(endTime-beginTime)*100).toFixed(2); 
					  	  		    	}
					  	  		    	var spanClass,alarmHref;
					  	  		    	if(item.alarmCount == 0){
					  	  		    		spanClass = 'label-primary';
					  	  		    	    alarmHref = 'javascript:;';
					  	  		    	}else{
					  	  		    		spanClass = 'label-warning';
					  	  		    		alarmHref = 'rest/alarm/alarmList/project/'+item.projectId;
					  	  		    	}
					  	  		    				 asthtml += '<tr id="project_'+ item.projectId +'" onclick="test('+item.projectId+')" style="height:100px">'+
																    '<td class="project-status" style="display:none">'+
																		'<span class="label label-primary">' + item.projectId + '</span>'+
																	'</td>'+
																	'<td class="project-status" style="display:none">'+
																		'<span class="label label-primary">' + item.projectTypeId + '</span>'+
																	'</td>'+
																	'<td class="project-status" style="display:none">'+
																		'<span class="label label-primary">' + item.projectLongitude + '</span>'+
																	'</td>'+
																	'<td class="project-status" style="display:none">'+
																		'<span class="label label-primary">' + item.projectLatitude + '</span>'+
																	'</td>'+
																	'<td class="project-status" style="display:none">'+
																		'<span class="label label-primary">' + item.projectAddress + '</span>'+
																	'</td>'+
																	'<td class="project-status" style="width:80px">'+
																		'<span class="label label-primary statusColor'+item.projectStatus+'">' + item.projectStatusString + '</span>'+
																	'</td>'+
																	'<td class="project-title" style="width:150px">'+
																		'<a class="J_menuItem" href="rest/project_detail/'+item.projectId+":"+item.projectName+'" name="项目详情">' + 
																		 item.projectName + 
																		'</a><br />'+
																	'</td>'+
																	'<td class="project-title" style="width:200px">'+
																		'<a href="javascript:;">创建时间</a><br />'+
																		'<small>' + item.projectBeginTime + '</small>'+
															    	'</td>'+
																	'<td class="project-completion" style="width:320px">'+
																		'<small>当前进度： '+percentage+'%</small>'+
																		'<div class="progress progress-mini">'+
																			'<div style="width: '+percentage+'%;" class="progress-bar"></div>'+
																		'</div>'+
																	'</td>'+
																	'<td class="project-title" style="width:300px">'+
																		'<a href="javascript:;">项目描述</a><br />'+
																		'<p id="trhight">' + item.projectDescription + '</p>'+
																	'</td>'+
																	'<td class="project-status" style="display:none">'+
																		'<span class="label label-primary">' + item.projectStatus + '</span>'+
															    	'</td>'+
															    	'<td class="project-status" style="display:none">'+
																		'<span class="label label-primary">' + item.projectBeginTime + '</span>'+
																    '</td>'+
																    '<td class="project-status" style="display:none">'+
																		'<span class="label label-primary">' + item.projectEndTime + '</span>'+
															    	'</td>'+
															    	'<td class="project-title" style="width:20px">'+
																	'</td>'+
																	'<td class="project-title" style="width:140px">'+
																		'<a class="J_menuItem" name="告警管理" href="'+alarmHref+'">告警次数(<i class="fa fa-bell"></i><span class="label '+spanClass+'">'+item.alarmCount+'</span>)</a><br />'+
																	'</td>'+
																	'<td class="project-title" style="width:20px">'+
																	'</td>'+
																	'<td class="project-status" style="width:70px">'+
																		'<a href="rest/detectionPoint/'+item.projectTypeId+':'+item.projectName+':'+item.projectId+'" class="J_menuItem" name="测点">测点</a>'+
																	'</td>'+
																	'<td class="project-status" style="width:70px">'+
																		'<a href="rest/terminals/'+item.projectTypeId+':'+item.projectName+':'+item.projectId+'" class="J_menuItem" name="采集器">采集器</a>'+
																	'</td>'+														
																	'<td class="project-actions">'+
																	    '<a href="javascript:;" class="J_menuItem" onclick="hc(this)" data-toggle="modal" data-target="#myModal_updetaMMp">'+
																			'报表配置'+
																		'</a>'+
																    '</td>'+
																	'<td class="project-status" style="width:70px">'+
																		'<a href="rest/thresHold/'+item.projectId+':'+item.projectName+':'+item.projectTypeId+'" class="J_menuItem" name="阀值">阀值 </a>'+
																	'</td>'+
																	'<td class="project-status" style="width:70px">'+
																		'<a href="rest/project_image/'+item.projectId+':'+item.userId+':'+item.projectName+':'+item.projectTypeId+'" class="J_menuItem" name="图片">图片 </a>'+
																	'</td>'+
																		'<td class="project-actions">'+
																	    '<a href="javascript:;" class="J_menuItem" onclick="updetaProject(this)" data-toggle="modal" data-target="#myModal_updetaProject">'+
																			'<i class="fa fa-pencil"></i> 修改 '+
																		'</a>'+
																		'<a href="javascript:;" class="J_menuItem" onclick="deleteProject('+ item.projectId +')">'+
																			'<i class="fa fa-times-circle"></i> 删除 '+
																	    '</a>'+
																	'</td>'+
																'</tr>'; 
					  	  		    					});
					  	  		    $('#hover_table').html(asthtml);
					  	  		    
					  	  	 		$.each(data.projectList,function(idx,item){
					  	  	 			$('.statusColor22').css("background-color","#1ab394"); 
					  	  	 			$('.statusColor21').css("background-color","#FF8547"); 
					  	  	 			$('.statusColor23').css("background-color","#F54545"); 
					  	  				$('.statusColor24').css("background-color","#696969"); 
					  	  	 		});
					  	  		    if(loadLaypage){ //如果该参数有值
										loadLaypage(data.total, jsonData); //有查询条件时请求数据，需重新初始化分页组件
									}
									//加载完成后隐藏loading提示
				                   	layer.close(loading);
					  	  		}else{
					  	  		    alert("数据异常");
					  	  		}
							},
							error : function() {
								alert("数据加载失败");
							}
						});
				 }
				 
			
				 //初始化分页组件函数
				 function loadLaypage(dataTotal, jsonData){
					 var laypage = layui.laypage;
					 laypage.render({
						 elem: 'pageComponent', //分页组件div的id
						 count: dataTotal, //记录总条数
						 limit: jsonData.pageSize, //每页显示的条数
						 limits:[jsonData.pageSize, 10, 20, 30, 40, 50], //每页条数的选择项
					     groups: 5, //连续显示分页数
					     layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],
					     jump: function(obj, first){  //触发分页后的回调
					         if(!first){ //一定要加此判断，否则初始时会无限刷新
					        	 jsonData.pageNum = obj.curr;
					 			 jsonData.pageSize = obj.limit;
					 			 projectPageAjax(jsonData); //分页请求后台函数  参数jsonData查询条件参数
					         }
					     }
					 });
				 }
				
				 $('#searchButton').click(function(){
						var jsonData = {};
						if($('#searchProject').val()){
							jsonData.projectName = $('#searchProject').val();
						}
						jsonData.pageNum = 1;
						jsonData.pageSize = 6;
						projectPageAjax(jsonData, loadLaypage);
					});
				 //首次加载页面触发查询按钮初始化列表（无查询参数）
				 $('#searchButton').trigger("click");
			})();
		});
		function hc(a){
		
		
			cuurTableLine = a.parentNode.parentNode.rowIndex;
			   var projectName = $("table tr:eq(" + cuurTableLine + ") td:eq(6)").text();//项目名--2
				var projectId = $("table tr:eq(" + cuurTableLine + ") td:eq(0)").text();//项目ID--6
				   htmlBodyTyp = $zd.ajax({
						 url:'rest/sysDictionary/queryStatistic',
						 data:{typeCode:12}
					 })
					
				  htmlLiTopTypArray = $zd.ajax({
					 url:'rest/detectionPoint/queryDetectionPointName',
					 data:{projectId:projectId}
				 })
				$zd.myPall.loadPagingDage({
					projectName_parm:projectName,
					htmlBodyTyp_parm:htmlBodyTyp,
					htmlLiTopTypArray_parm:htmlLiTopTypArray,
					projectId_parm:projectId});
			/*var statistiCchart =	$zd.loadPagingDage({
					projectName_parm:projectName,
					htmlBodyTyp_parm:htmlBodyTyp,
					htmlLiTopTypArray_parm:htmlLiTopTypArray,
					projectId_parm:projectId});*/
				   $zd.myPall.addClick();
				
								
		}
		