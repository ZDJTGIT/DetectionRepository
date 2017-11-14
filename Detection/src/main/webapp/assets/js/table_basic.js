
var dlId=document.getElementById("table_basic_DLID").value;

table_basic_datatable = $('#mytable').dataTable({
			ordering:false
		});
	 $('#mytable_filter').hide();
	 
	var b;
    //修改用户信息
	function selectRow(s){
		b = s.parentNode.parentNode.rowIndex;
		var name = $("table tr:eq(" + b + ") td:eq(1)").text();
		var email= $("table tr:eq(" + b + ") td:eq(2)").text();
		var phone = $("table tr:eq(" + b + ") td:eq(3)").text();
		var company= $("table tr:eq(" + b + ") td:eq(4)").text();
		var linkman = $("table tr:eq(" + b + ") td:eq(5)").text();
		var id = $("table tr:eq(" + b + ") td:eq(0)").text();
		$('#modifyuser').show();
		$('#mdlinkman').val(linkman);
		$('#mdname').val(name);
		$('#mdcompany').val(company);
		$('#mdphone').val(phone);
		$('#mdemail').val(email);
		$('#mdid').val(id);
		$.ajax({
	   		  type:'post',
	   	  	  url: 'rest/user/showSelectUserRole',
	   	  	  data: {userId:dlId,userName:name},
	   	  	  contextType:"application/json",
	   	  	  success: function(data){
	   	  		document.getElementById("userRole")[data.roleid].selected=true;
	   	  	  }
		});
		return;
	}
    
	//切换用户状态
	function changStatus(s){
	    b = s.parentNode.parentNode.rowIndex;
		var userId = $("table tr:eq(" + b + ") td:eq(0)").text();
		var status = $("table tr:eq(" + b + ") td:eq(8)").text();
		$.ajax({
    		   type:'post',
	    	  	  url: 'rest/user/changUserStatus',
	    	  	  data: {userId:userId,status:status},
	    	  	  contextType:"application/json",
	    	  	  success: function(data){
	    	  		       if(data){
	    	  		    	 $("table tr:eq(" + b + ") td:eq(8)").text(data.status);
	    	  		       }else{
	    	  		    	alert("数据异常");
	    	  		       }
	    	  	  },
	    	  	  error: function(){
	  			    alert("数据加载失败");
	  		      }
    	   });
	} 
	
	//删除用户
	function deleteRow(s) {
		b = s.parentNode.parentNode.rowIndex;
		var t = $("table tr:eq(" + b + ") td:eq(1)").text();
		var jsonData = '{"userName":"' + t +'","userId":"' + dlId + '"}';
		
		layer.confirm('确定要删除该用户么？', {
			btn : [ '取消删除', '确定删除' ] //按钮
		}, function() {
			layer.msg('已取消', {icon : 1});
		}, function() {
			$.ajax({
				type : 'post',
				url : 'rest/user/delete',
				contentType : 'application/json',
				data : jsonData,
				success : function(data) {
					document.getElementById('mytable').deleteRow(b);
					layer.msg('删除成功（该提示3s后自动关闭）', {
						time : 3000, //3s后自动关闭
						btn : [ '知道了' ]
					});
				}
			});
		});
	}
	
	 $(document).ready(function(){
		  
		 $.ajax({
   		  type:'post',
   	  	  url: 'rest/user/showUserRole',
   	  	  data: {userId:dlId},
   	  	  contextType:"application/json",
   	  	  success: function(data){
   	  		       if(data){
   	  		    	var strings = '<select class="md_input" id="userRoles" name="userRoles">';   
   	  		    	var string = '<select class="md_input" id="userRole" name="userRole">';
   	  		    	$.each(data,function(idx,role){
   	  		    		//如果这个roleId和选中的user的roleId是相同的，就选中当前的option
   	  		    	    string += '<option value="'+role.roleId+'">'+ role.roleName +'</option>';
   	  		    	    strings += '<option value="'+role.roleId+'">'+ role.roleName +'</option>';
   	  		    	});
   	  		       string += '</select>';
   	  		       $('#userRole_div').append(string);
   	  		       $('#userRole_div_s').append(strings); 	
   	  		       }else{
   	  		    	alert("数据异常");
   	  		       }
   	  	  },
   	  	  error: function(){
 			    alert("数据加载失败");
 		      }
   	     });
	 
	
		$('#sureSearch').click(function(){
			var keyword = $('#keyword').val();
			$.ajax({
				  type:'post',
	    	  	  url: 'rest/user/keywordSearch',
	    	  	  data: {keyword:keyword,userId:dlId},
	    	  	  contextType:"application/json",
				  success : function(data) {
					if (data) {
						$("#mytable tbody").html("");
						$.each(data,function(idx,user){
						   var viewData = '<tr><td>'+ user.userId
										+ '</td><td>'+ user.userName
										+ '</td><td>'+ user.email
										+ '</td><td>'+ user.phone
										+ '</td><td>'+ user.company
										+ '</td><td>'+ user.linkman
										+ '</td><td>'+ user.createTime
										+ '</td><td>'
										+ '<a href="javascript:;" class="selectRow" onclick="selectRow(this)" data-toggle="modal" data-target="#myModal_modifyuser"><b>修改用户</b></a>'
										+ '<a href="javascript:;" class="deteteRow" onclick="deleteRow(this)"><b>删除用户</b></a>'
										+ "</td><td>"+ user.status
                            			+ "</td><td>"
                            			+ "<a href='javascript:;' class='changStatus' onclick='changStatus(this)'><b>切换状态</b></a>"
										+ '</td></tr>';
						   $('#userTableDeatil').append(viewData);
						});
					} else {
						alert("数据异常");
					}
				},
				error : function() {
					alert("查找失败");
				}
			});
		});
	    
		//确定修改（修改操作稍后改成看信息修改）
		$("#sureMdy").click(function() {
			if(!$('#form_modifyuser').valid()){
				return false;
			}
			        var t=b;
			        var role = $("#userRole option:selected").val();
					var idvalue = $('#mdid').val();
					var namevalue = $("#mdname").val();
					var linkmanvalue = $("#mdlinkman").val();
					var companyvalue = $("#mdcompany").val();
					var phonevalue = $("#mdphone").val();
					var emailvalue = $("#mdemail").val();
				    var jsonData = '{"userId":"'+idvalue+'","linkman":"'+linkmanvalue+'","roleId":"'+role+'","userName":"'+namevalue+
						           '","company":"'+companyvalue+'","phone":"'+phonevalue+'","email":"'+emailvalue +'"}';
					$('#modifyuser').hide();
					$.ajax({
						type : 'post',
						url : 'rest/user/modify',
						contentType : 'application/json',
						dataType : 'json',
						data : jsonData,
						success : function(data) {
							if (data) {
								$("table tr:eq(" + t + ") td:eq(1)").text(data.userName);
								$("table tr:eq(" + t + ") td:eq(2)").text(data.email);
								$("table tr:eq(" + t + ") td:eq(3)").text(data.phone);
								$("table tr:eq(" + t + ") td:eq(4)").text(data.company);
								$("table tr:eq(" + t + ") td:eq(5)").text(data.linkman);
								$('#offModifyUser').trigger("click"); 
								layer.msg('修改成功（该提示1s后自动关闭）', {
									time : 1000, //1s后自动关闭
									btn : [ '知道了' ]
								});
							} else {
								alert("数据异常");
							}
						},
						error : function() {
							alert("数据加载失败");
						}
					});
		});
	    
	 		//打开表格发送请求到控制器查数据库获取表格信息返回加载，
			//增删改都是通过发送请求到控制器查数据库获取表格信息返回加载
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			});
	 		
			//确定添加用户
			$('#sureAdd').click(function(){
				if(!$('#form_adduser').valid()){
					return false;
				}
				var role = $("#userRoles option:selected").val();
				var userNamevalue = $("#userName").val();
				var companyvalue = $("#company").val();
				var phonevalue = $("#phone").val();
				var linkmanvalue = $("#linkman").val();
				var emailvalue = $("#email").val();
				var jsonData = '{"userName":"'
							+ userNamevalue
							+ '","company":"'
							+ companyvalue
							+ '","phone":"'
							+ phonevalue
							+ '","linkman":"'
							+ linkmanvalue
							+ '","roleId":"'
							+ role
							+ '","email":"'
							+ emailvalue + '"}';
					$('#adduser').hide();
					$.ajax({
						type : 'post',
						url : 'rest/user/addUser',
						contentType : 'application/json',
						dataType : 'json',
						data : jsonData,
						success : function(data) {
							if(data) {
							var viewData = "<tr><td>"+ data.userId
										+ "</td><td>"+ data.userName
										+ "</td><td>"+ data.email
										+ "</td><td>"+ data.phone
										+ "</td><td>"+ data.company
										+ "</td><td>"+ data.linkman
										+ "</td><td>"+ data.createTime
										+ "</td><td>"
										+ "<a href='javascript:;' class='selectRow' onclick='selectRow(this)' data-toggle='modal' data-target='#myModal_modifyuser'><b>修改用户</b></a> "
										+ "<a href='javascript:;' class='deteteRow' onclick='deleteRow(this)'><b>删除用户</b></a>"
										+ "</td><td>"+ data.status
                            			+ "</td><td>"
                            			+ "<a href='javascript:;' class='changStatus' onclick='changStatus(this)'><b>切换状态</b></a>"
										+ "</td></tr>";
								layer.msg('添加成功（该提示1s后自动关闭）', {
									time : 1000, //1s后自动关闭
									btn : [ '知道了' ]
								});
								$('#offAddUser').trigger("click"); 	
								$('#userTableDeatil').append(viewData);
								} else {
									alert("数据异常");
								}
							}
						});
				}); 
	 });
	 
		$(function(){(function(){
			//分页请求后台获取数据函数 , 参数jsonData为查询条件集合json数据 , loadLaypage是分页组件函数
			function projectPageAjax(jsonData, loadLaypage){
				 //显示loading提示
                 var loading = layer.load(2, {
                	  shade: [0.1,'#fff'] //0.1透明度的白色背景
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
			/*$('#searchButton').click(function(){
					var jsonData = {};
					if($('#searchProject').val()){
						jsonData.projectName = $('#searchProject').val();
					}
					jsonData.pageNum = 1;
					jsonData.pageSize = 6;
					projectPageAjax(jsonData, loadLaypage);
				});
			 //首次加载页面触发查询按钮初始化列表（无查询参数）
			 $('#searchButton').trigger("click"); */
		})();
	});