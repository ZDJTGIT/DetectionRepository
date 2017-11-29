var projectId=document.getElementById("project_terminals_projectId").value;
var projectName=document.getElementById("project_terminals_projectName").value;
		
		//确定添加采集器响应事件
		$(".sureAddTerminals").click(function(){
			alert($('#form_addTerminals').valid());
			if(!$('#form_addTerminals').valid()){
				return false;
			}
			var smuId = $('#terminalsNum').val();//采集器编号
			var jsonData = '{"smuId":"'
							+ smuId
							+ '","projectId":"'
							+ projectId + '"}';
		$.ajax({
			   type:'post',
			   url: 'rest/terminals/addTerminals',
			   contentType:"application/json",
			   dataType : 'json',
			   data: jsonData,
			   success: function(data){
			   		if(data){
			   			//添加成功后清空输入层以便重复使用
			   			//添加成功之后刷新页面
						$('#terminalsNum').val("");
						
			 var viewData = '<tr id="'+data.data.smuId+'">'+
							'<td class="project-title" style="width:30px">'+
							'</td>'+
						    	'<td class="project-title" style="width:200px">'+
								''+data.data.createTime+''+
						    '</td>'+
						    '<td class="project-title" style="width:50px">'+
							'</td>'+
							'<td class="project-title" style="width:200px">'+
								''+data.data.updateTime+''+
							'</td>'+
							'<td class="project-title" style="width:260px">'+
								''+data.data.smuId+''+
							'</td>'+
							'<td class="project-title" style="width:260px">'+
								''+data.data.smuRssi+''+
							'</td>'+
							'<td class="project-title" style="width:260px">'+
								''+data.data.smuStatus+''+
							'</td>'+
							'<td class="project-title" style="width:260px">'+
								''+data.data.smuVoltage+''+
							'</td>'+
							'<td class="project-title" style="width:260px">'+
								''+data.data.timesInterval+''+
							'</td>'+
							'<td class="project-title" style="width:140px">'+
							'</td>'+
							'<td class="project-title" style="width:120px">'+
								'<a href="javascript:;" onclick="delateTerminals('+data.data.smuId+')">&nbsp;&nbsp;&nbsp;&nbsp;删除</a>'+
							'</td>'+
							'<td class="project-actions">'+
						    '</td>'+
							'</tr>';
			 
						$('#terminals_tbody').append(viewData);
						$('#offAddTerminals').trigger("click"); 
						layer.msg('添加成功（该提示1s后自动关闭）', {
							time : 1000, //1s后自动关闭
							btn : [ '知道了' ]
						});
			   		   	}else {
			  			alert("数据异常");
			   			}
			   		},
			   	  	error: function(){
					    alert("抱歉！您为非管理员用户，添加采集器请联系对应管理员！");
				    }
			   }); 	
		});
		
		//分页获取项目下所有采集器
		$(function(){(function(){
			
			var jsonData = {};
			jsonData.projectId = projectId;
			jsonData.pageNum = 1;
			jsonData.pageSize = 6;
			
			//初始化分页组件函数
			 function loadLaypage(dataTotal, jsonData){
				 var laypage = layui.laypage;
				 laypage.render({
					 elem: 'pageComponent_s', //分页组件div的id
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
			//分页请求后台获取数据函数 , 参数jsonData为查询条件集合json数据 , loadLaypage是分页组件函数
			function projectPageAjax(jsonData,loadLaypage){
				 //显示loading提示
                 var loading = layer.load(2, {
                	  shade: [0.1,'#fff'] //0.1透明度的白色背景
                 });
				 $.ajax({
					 type:'post',
						url: 'rest/terminals/showProjectTerminals',
						contentType:"application/json",
						dataType : 'json',
						data: JSON.stringify(jsonData),
						success : function(data) {
							 if(data){
				  	  		    var asthtml = '';
				  	  		   	$.each(data.terminalsInfoList,function(idx,item){
				  	  		   	asthtml +=  '<tr id="'+item.smuIdNu+'">'+
											'<td class="project-title" style="width:30px">'+
											'</td>'+
					    	  		    	'<td class="project-title" style="width:200px">'+
												''+item.createTime+''+
										    '</td>'+
										    '<td class="project-title" style="width:50px">'+
											'</td>'+
											'<td class="project-title" style="width:200px">'+
												''+item.updateTime+''+
											'</td>'+
											'<td class="project-title" style="width:260px">'+
												''+item.smuIdNu+''+
											'</td>'+
											'<td class="project-title" style="width:260px">'+
												''+item.smuRssi+''+
											'</td>'+
											'<td class="project-title" style="width:260px">'+
												''+item.smuStatus+''+
											'</td>'+
											'<td class="project-title" style="width:260px">'+
												''+item.smuVoltage+''+
											'</td>'+
											'<td class="project-title" style="width:260px">'+
												''+item.timesInterval+''+
											'</td>'+
											'<td class="project-title" style="width:140px">'+
											'</td>'+
											'<td class="project-title" style="width:120px">'+
												'<a href="javascript:;" onclick="delateTerminals('+item.smuIdNu+')">&nbsp;&nbsp;&nbsp;&nbsp;删除</a>'+
											'</td>'+
											'<td class="project-actions">'+
										    '</td>'+
											'</tr>';
				  	  		   	});
				  	  		    $('#terminals_tbody').html(asthtml);
								//加载完成后隐藏loading提示
			                   	layer.close(loading);
			                   	if(loadLaypage){
			                   		loadLaypage(data.total,jsonData);
			                   	}
				  	  		}else{
				  	  		    alert("数据异常");
				  	  		}
						},
						error : function() {
							alert("数据加载失败");
						}
					});
			 }
			projectPageAjax(jsonData,loadLaypage);
		})();
	});
		
		//删除采集器
		function delateTerminals(smuId){
			layer.msg('玩命提示中');
			layer.confirm('确定要删除该采集器么？', {
				btn : [ '取消删除', '确定删除' ] //按钮
			}, function() {
				layer.msg('已取消', {icon : 1});
			}, function() {
				$.ajax({
					type : 'post',
					url : 'rest/terminals/deleteTerminalsInfo',
					data : {smuId:smuId,projectId:projectId},
					success : function(data) {
						if(data=="1"){
							//删除成功后动态清除页面对应的记录
							$("#"+smuId).remove();
							layer.msg('删除成功（该提示3s后自动关闭）', {
								time : 3000, //3s后自动关闭
								btn : [ '知道了' ]
							});
						}else{
							alert("抱歉！您为非管理员用户，删除采集器请联系对应管理员！");
						}
					}
				});
			});
		}