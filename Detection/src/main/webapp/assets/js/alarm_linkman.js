

var table_basic_datatable;

$('#addAlarmBasic').on('click','.deletebutton',function(){
	var deleteid =$(this).attr("name").substring(6);
	var table = $('#addAlarmBasic').DataTable();
	var parenttr = $(this).closest('tr');
	if ( parenttr.hasClass('selected') ) {
		parenttr.removeClass('selected');
    }
    else {
        table.$('tr.selected').removeClass('selected');
        parenttr.addClass('selected');
    }
	swal({
        title: "您确定要删除这条信息吗",
        text: "删除后将无法恢复，请谨慎操作！",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "是的，我要删除！",
        cancelButtonText: "让我再考虑一下…",
        closeOnConfirm: false,
        closeOnCancel: false
    },function (isConfirm) {
        if (isConfirm) {
        	$.ajax({
        		url:"rest/project/deletealarm",
        		data:{alarmLinkmanId:deleteid},
        		success:function(data){
        			if(data=="true"){
        				swal("删除成功！", "您已经永久删除了这条信息。", "success");
        				table.row('.selected').remove().draw( false );
        			}else{
        				swal("删除失败", "请您重新尝试。", "error");
        			}
        		}
        	});
            
        } else {
            swal("已取消", "您取消了删除操作！", "error");
        }
    });

	
});

	$(document).ready(function(){
		
		table_basic_datatable = $('#addAlarmBasic').dataTable({
			ordering:false
		});
		$('#addAlarmBasic_filter') .css({'float':'right'});
		 
		var istrue = true;//修改成功或失败的开关
		 $('body').on('click','.onoffswitch-checkbox',function(){
			if(istrue){
				 $(this).attr("checked");
				 var id = $(this).attr('id');
				 id=id.substring(7);
				 var status = 28;
				 var statusString = "禁用";
				 var isTrue = $(this).is(':checked');
				 if(isTrue){
					 status=27;
					 statusString="启用";
				 }
				 $.ajax({
					 url: 'rest/project/updateAlarmLinmanStatus',
					 data: {status:status,alarmLinkmanId:id},
					 success: function(data){
						 if(data=="true"){//修改成功
							 $('#status'+id).html(statusString);
						 }else{//修改失败
							 istrue = false;
							 $("#example"+id).trigger("click");
							 alert("修改失败,请重新尝试");
						 }
					 }
				 });
			}else{
				istrue=true;
			}
		 });  
		 	
	 	
	});
	
		 $('#allckekout_tablebasic').on('ifClicked', '#nidaoshika', function(){
			 var a = document.querySelector('#nidaoshika');
			  if (a.checked) {
	            $("#allckekout_tablebasic :checkbox").prop("checked", false);  
	        } else {
	        	$("#allckekout_tablebasic :checkbox").prop("checked", true); 
	        }  
		});  
		 //加载任务复选框
		 var table_basic_istrue = true;
		 $("#table_basic_addalarm").click(function(){
			 if(table_basic_istrue){
				 $.ajax({
						url: 'rest/project/selectAllProject',
						dataType: 'json',
						success: function(data){
							$(data).each(function(index,val){
								var label = "<div class='checkbox checkbox-success checkbox-inline'><input name='tale_basic_checkbox' type='checkbox' id='"+val.projectId+","+val.projectName+"'><label  for='"+val.projectId+","+val.projectName+"'>"+val.projectName+" </label></div>";	
								$("#checkout_basic_all").append(label);
							});
						}
				 });
				 table_basic_istrue=false;
			 }
		 });
		 
		 
		 //提交添加的联系人
	 var istrue = false;
	  //validate插件使用  首先还是文档加载后执行 funcion函数
    $(function(){
        //获取form表单元素对象使用validate方法
        // 手机号码验证
		jQuery.validator.addMethod("isMobile", function(value, element) {
		  var length = value.length;
		  var mobile = /^(((1[0-9]{1}[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
		  return this.optional(element) || (length == 11 && mobile.test(value));
		}, "请正确填写您的手机号码"); 

		//邮箱 
		jQuery.validator.addMethod("email", function (value, element) {
			var mail = /^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$/;
			return this.optional(element) || (mail.test(value));
		}, "邮箱格式不正确");

		//验证成功后执行的代码
		$.validator.setDefaults({
            submitHandler: function (form) {
      			  var name = $('#table_basic_userName').val();
      		  	  var phone = $('#table_basic_phone').val();
      		  	  var email = $('#table_basic_email').val();
      			  var status=$('input:radio[name="table_basic_radioInline"]:checked').val();
      			  var project=$('input:checkbox[name="tale_basic_checkbox"]:checked');
      			  var alarmLinkmanList = [];
      			  
      			  $(project).each(function(index,val){
      				  var projectList = $(val).attr("id").split(",")
      				  var alarmLinkman = {"userName":name,"projectId":projectList[0],"projectName":projectList[1],"phone":phone,"email":email,"status":status}
      				  alarmLinkmanList.push(alarmLinkman);
      			  });
                		
      			  $.ajax({
      					url: 'rest/project/insertAlarmLinkmanList',
      					dataType: 'json',
      					type: 'post',
      					contentType: 'application/json',
      					data: JSON.stringify(alarmLinkmanList),
      					success: function(data){
      						 if(data.length>0){
      							istrue= true;
      							//操作成功窗口
      							swal({
      								title: "太帅了",
      					            text: "小手一抖就成功了",
      					            type: "success",
      			                    confirmButtonColor: "#A7D5EA",
      			                    confirmButtonText: "OK",
      			                }, function () {
      			                	$(data).each(function(index,val){
      				      				var statu = "<div id='status"+val.alarmLinkmanId+"'>禁用</div>";
      				      				var label = "<div class='onoffswitch' ><input type='checkbox' class='onoffswitch-checkbox' id='example"+val.alarmLinkmanId+"'><label class='onoffswitch-label' for='example"+val.alarmLinkmanId+"' ><span class='onoffswitch-inner'></span><span class='onoffswitch-switch'></span></label></div>";
      				      				var statuslabel;
      				      				if(val.status==27){
      			      					statu="<div id='status"+val.alarmLinkmanId+"'>启用</div>";
      			      					label = "<div class='onoffswitch' ><input type='checkbox' checked class='onoffswitch-checkbox' id='example"+val.alarmLinkmanId+"'><label class='onoffswitch-label' for='example"+val.alarmLinkmanId+"' ><span class='onoffswitch-inner'></span><span class='onoffswitch-switch'></span></label></div>"
      				      				}
      				      				deletes="<button class='btn btn-danger btn-circle deletebutton' name='delete"+val.alarmLinkmanId+"' type='button'><i class='fa fa-times'></i></button>";
      				      				table_basic_datatable.fnAddData([val.userName,val.projectName,val.phone,val.email,statu,label,deletes]);
      			      			  	});
      			                	$("#table_basic_close").trigger("click");
      			                });
      						}else{
      							swal({
      			                    title: "操作失败",
      			                    text: "添加失败，请尝试重新操作",
      			                    type: "error"
      			                });
      						} 
      					}
      			 });
            }
        });
		
		

        $("#signupForm").validate({
           // 加入debug:true; //可以进入调试状态不会不会请求服务器 只在页面进行验证调试
                debug:true,
            //rules要验证的元素包裹进rules中
                rules:{
                //username 注意这里的username和文本框的name是一一对应的
                username:{
                    required:true,//是否必填验证 true是必须填写 false文本框可以不用填写
                    minlength:1,//最小长度
                    maxlength:10//最大长度
                },
                //密码验证
                email:{
                    required:true,
                    email:true
                },
                phone:{
                	required:true,
                	isMobile:true
                },
                tale_basic_checkbox:{
                	required:true,
                } 
            },
            //提示信息
            messages:{
                    username:{
                    required:"必须填写用户名",//如果没有填写用户名称显示错误信息
                    minlength:"用户名不能小于1位", //如过输入文字小于两个显示错误信息
                    maxlength:"用户名不能大于10位"
                },
                email:{
                    required:"必须填写邮箱",//如果没有填写用户名称显示错误信息
                },
                phone:{
                	required:"必填电话号码",
                },
                 tale_basic_checkbox:{
                	required:"必选"
                },
            }

        });
    });
		  