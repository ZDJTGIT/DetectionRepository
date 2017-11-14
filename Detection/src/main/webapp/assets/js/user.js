
var user_idvalue=document.getElementById("user_userInfo.userId").value;
var newpassword=document.getElementById("user_userInfo.password").value;

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
    //规定上传图片大小
    function creatImg(imgRUL){  
        var textHtml = "<img src='"+imgRUL+"'width='130px' height='100px'/>";  
        $(".ge_pic_icon_Infor").html(textHtml);  
    }  
    
    
       $(document).ready(function(){
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
    	  		       }/*else{
    	  		    	var  asthtmls='<div class="poj_External_div">'+
    	  		    					'<p>管理员无项目信息</p>'
    	  		    				  '</div>';
    	  		    	$('#allProject').append(asthtmls); 	
    	  		       }*/
    	  	  },
    	  	  error: function(){
  			    alert("数据加载失败");
  		      }
    	  });
    	  
       });
       
       //点击确定修改，提交修改的user信息，提交到控制器修改数据库数据
       $('#determineDelete').click(function(){
    	   layer.msg('加载中');
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
		    			  		  layer.msg('修改成功（该提示1s后自动关闭）', {
		    			  			  time : 1000, //1s后自动关闭
		    			  			  btn : [ '知道了' ]
								});
	    			       }else{
	    				    alert("数据异常");
	    			       }
	    		  },
	    		  error: function(){
	    			  alert("数据加载失败");
	    		  }
	    		  });
       });