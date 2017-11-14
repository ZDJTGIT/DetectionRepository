$('#putverification').click(function(){
			//校验输入的邮箱或手机号码是否存在			
			var contect = $('#contect').val();
			$.ajax({
				  type: 'post',
	    		  url: 'rest/user/retunpassword',
	    		  data: {contect:contect},
	    		  contextType:"application/json",
	    		  success: function (data){
	    			  if(data.code!=null){
	    				  $("input[name=temporaryVerification]").val(data.code);
	    				  alert("验证码发送成功,请将收到的验证码填入");
	    			  }else{
	    				  alert("您输入的手机号/邮箱号有误,请确保您的输入格式正确且已绑定用户");
	    			  }
	    		  },
	    		  error: function(){
	    			  alert("验证码返回失败");
	    		  }
			      });
		});
		
  		$('#submitpw').click(function(){
  			//提交时检测验证码是否正确
  			var inputVerification = $('#verification').val();
  			var temporaryVerification = $('#temporaryVerification').val();
  			$.ajax({
  				type: 'post',
	    		url: 'rest/user/verIsQqual',
	    		data: {inputVerification:inputVerification,temporaryVerification:temporaryVerification},
	    		contextType:"application/json",
	    		success: function (data){
	    			if(data.bool=="1"){
			  				var newpassword = $('#password').val();
			  				var contect = $('#contect').val();
			  				alert("密码修改成功，您的新密码为："+newpassword);
			  				$.ajax({
			  					  type: 'post',
			  		    		  url: 'rest/user/selfChangPassword',
			  		    		  data: {newpassword:newpassword, contect:contect}
			  				});
	    			}else{
	    				alert("验证码输入有误，请核对后重新输入");
	    			}
	    		}
  			});
		});