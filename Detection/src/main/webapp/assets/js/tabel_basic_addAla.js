var table_basic_datatable;
	$(document).ready(function(){
		
		table_basic_datatable = $('#addAlarmBasic').dataTable();
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
		  $("#table_basic_commitadd").click(function(){
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
				      				table_basic_datatable.fnAddData([val.userName,val.projectName,val.phone,val.email,statu,label]);
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
		 });