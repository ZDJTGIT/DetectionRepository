<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>项目</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="shortcut icon" href="favicon.ico">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInUp">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox">
					<div class="ibox-title">
						<h5>所有项目</h5>
						<div class="ibox-tools">
							<a href="" id="addNewProjectOpen" class="btn btn-primary btn-xs">创建新项目</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row m-b-sm m-t-sm">
							<div class="col-md-1">
								<button type="button" id="loading-example-btn" class="btn btn-white btn-sm">
									<i class="fa fa-refresh"></i> 刷新
								</button>
							</div>
							<div class="col-md-11">
								<div class="input-group">
									<input type="text" id="searchProject" name="searchProject" placeholder="请输入项目名称" class="input-sm form-control"> 
									<span class="input-group-btn">
										<button type="button" id="searchButton" name="searchButton" class="btn btn-sm btn-primary">
											搜索
										</button>
									</span>
								</div>
							</div>
						</div>
						<div class="project-list">
							<table class="table table-hover" id="project_table">
								<tbody id="hover_table">
									
								</tbody>
							</table>
						</div>
						<!--div id="addNewProjectDiv" style="display:none;left:200px;top:200px;width:200px;height:200px;background-color:#F00">
						</div-->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/content.js"></script>
	<script>
		$(document).ready(function() {
			
			$("#loading-example-btn").click(function() {
				btn = $(this);
				simpleLoad(btn, true);
				simpleLoad(btn, false)
			})
			var dlId = '${userInfo.userId}';
	    	  $.ajax({
	    		  type:'post',
	    	  	  url: 'rest/project/showUsersProject',
	    	  	  data: {userId:dlId},
	    	  	  contextType:"application/json",
	    	  	  success: function(data){
	    	  		         if(data){
	    	  		       // var start = new Date();
	    	  		    	 var  asthtml="";
	    	  		    	 
	    	  		    	 $.each(data,function(idx,item){
	    	  		    		 
	    	  		    	  asthtml += '<tr>'+
				    	  		    	//'<td class="project-status" style="width:120px">'+
										//'<a href="project_detail.html">' + item.sysDictionary.itemName+'</a><br />'+
									    //'</td>'+
										'<td class="project-status" style="width:120px">'+
											'<span class="label label-primary">' + item.projectStatus + '</span>'+
										'</td>'+
										'<td class="project-title" style="width:220px">'+
											'<a href="project_detail.html">' + item.projectName + '</a><br />'+
											'<small>创建于 '+item.projectTime+'</small>'+
										'</td>'+
										'<td class="project-completion" style="width:460px">'+
											'<small>当前进度： '+idx+'8%</small>'+
											'<div class="progress progress-mini">'+
												'<div style="width: '+idx+'8%;" class="progress-bar"></div>'+
											'</div>'+
										'</td>'+
										'<td class="project-title" style="width:100px">'+
									    '</td>'+
										'<td class="project-title" style="width:360px">'+
											'<a href="project_detail.html">项目描述</a><br />'+
											'<small>' + item.projectDescription + '</small>'+
										'</td>'+
										'<td class="project-title" style="width:200px">'+
										'<a href="project_detail.html">项目告警信息('+ item.messageCount +')</a><br />'+
										'</td>'+
										'<td class="project-actions">'+
											'<a href="rest/project_detail" class="J_menuItem">'+
												'<i class="fa fa-folder"></i>'+
												'查看 '+
											'</a>'+
										        '<a href="projects.html#" class="J_menuItem">'+
												'<i class="fa fa-pencil"></i> 编辑 '+
											'</a>'+
										'</td>'+
									'</tr>';
	    	  		    	 });
	        	  		    	
	    	  		    	$('#hover_table').append(asthtml); 		
	    	  		    	
	    	  		       }else{
	    	  		    	alert("数据异常");
	    	  		       }
	    	  	  },
	    	  	  error: function(){
	  			    alert("数据加载失败");
	  		      }
	    	  });
			
		});
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
		
		//$('#addNewProjectOpen').click(function(){
		//	$('#addNewProjectDiv').show();
		//});
		
		$('#searchButton').click(function(){
			var keyword = $('#searchProject').val();
			var userid = '${userInfo.userId}';
			
			$.ajax({
				  type:'post',
	    	  	  url: 'rest/project/keywordSearchProject',
	    	  	  data: {keyWord:keyword,userId:userid},
	    	  	  contextType:"application/json",
				  success : function(data) {
					if (data) {
						$("#project_table tbody").html("");
						$.each(data,function(idx,item){
							   var viewData = '<tr>'+
					    	  		    	//'<td class="project-status" style="width:120px">'+
											//'<a href="project_detail.html">' + item.sysDictionary.itemName+'</a><br />'+
										    //'</td>'+
											'<td class="project-status" style="width:120px">'+
												'<span class="label label-primary">' + item.projectStatus + '</span>'+
											'</td>'+
											'<td class="project-title" style="width:220px">'+
												'<a href="project_detail.html">' + item.projectName + '</a><br />'+
												'<small>创建于 '+item.projectTime+'</small>'+
											'</td>'+
											'<td class="project-completion" style="width:260px">'+
												'<small>当前进度： '+idx+'8%</small>'+
												'<div class="progress progress-mini">'+
													'<div style="width: '+idx+'8%;" class="progress-bar"></div>'+
												'</div>'+
											'</td>'+
											'<td class="project-title" style="width:260px">'+
												'<a href="project_detail.html">项目描述</a><br />'+
												'<small>' + item.projectDescription + '</small>'+
											'</td>'+
											'<td class="project-title" style="width:400px">'+
											'<a href="project_detail.html">项目告警信息('+ item.messageCount +')</a><br />'+
											'</td>'+
											'<td class="project-actions">'+
												'<a href="rest/project_detail" class="J_menuItem">'+
													'<i class="fa fa-folder"></i>'+
													'查看 '+
												'</a>'+
											        '<a href="projects.html#" class="J_menuItem">'+
													'<i class="fa fa-pencil"></i> 编辑 '+
												'</a>'+
											'</td>'+
										'</tr>';
							
					                   $('#hover_table').append(viewData);
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
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
