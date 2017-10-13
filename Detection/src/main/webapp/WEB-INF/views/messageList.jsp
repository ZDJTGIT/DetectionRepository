<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
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
<title>告警消息列表</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="stylesheet" href="assets/js/plugins/layui/css/layui.css" media="all"></link>
<link href="assets/css/plugins/datepicker/datepicker3.css" rel="stylesheet">
<link href="assets/css/plugins/datepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">


</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content  animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>告警消息表</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							</a> <a class="dropdown-toggle" data-toggle="dropdown"
								href="table_data_tables.html#"> <i class="fa fa-wrench"></i>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li><a href="table_data_tables.html#">选项1</a></li>
								<li><a href="table_data_tables.html#">选项2</a></li>
							</ul>
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row">
                            <!-- <div class="col-sm-2">
                                <div class="input-group">
                                    <label class="btn btn-sm">消息ID:</label>
                                    <input type="text" placeholder="消息ID" class="input-sm form-control">
                                </div>
                            </div>
                            <div class="col-sm-2">
                            	<label class="btn btn-sm">消息类型:</label>
                                <select class="input-sm form-control input-s-sm inline">
                                    <option value="0">请选择</option>
                                    <option value="1">选项1</option>
                                    <option value="2">选项2</option>
                                    <option value="3">选项3</option>
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <div class="input-group">
                                	<label class="btn btn-sm">消息内容:</label>
                                    <input type="text" placeholder="请输入关键词" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入关键词" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入关键词" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
                                </div>
                            </div>
                            <div class="col-sm-2">
                            	<label class="btn btn-sm">消息状态:</label>
                                <select class="input-sm form-control input-s-sm inline">
                                    <option value="0">请选择</option>
                                    <option value="1">选项1</option>
                                    <option value="2">选项2</option>
                                    <option value="3">选项3</option>
                                </select>
                            </div> -->
                            
							<form class="form-inline" role="form" id="formSearch">
							  <div class="form-group col-sm-2">
							    <label for="messageId">消息ID:</label>
							    <input type="text" class="form-control" id="messageId" name="messageId" placeholder="消息ID">
							  </div>
							  <div class="form-group col-sm-2">
							    <label for="messageType">消息类型:</label>
							    <select class="input-sm form-control input-s-sm inline" name="messageType">
                                    <option value="0">请选择</option>
                                    <option value="1">告警</option>
                                </select>
							  </div>
							  <div class="form-group col-sm-2">
							    <label for="messageContext">消息内容:</label>
							    <input type="text" class="form-control" id="messageContext" name="messageContext" value="" placeholder="消息内容">
							  </div>
							  <div class="form-group col-sm-2 date">
							    <label for="startCreateTime">起始时间:</label>
							    <input type="datetime" class="form-control" id="startCreateTime" name="startCreateTime" placeholder="起始时间">
							  </div>
							  <div class="form-group col-sm-2">
							    <label for="endCreateTime">结束时间:</label>
							    <input type="datetime" class="form-control" id="endCreateTime" name="endCreateTime" placeholder="结束时间">
							  </div>
							  <div class="form-group col-sm-2">
							    <label for="status">消息状态:</label>
							    <select class="input-sm form-control input-s-sm inline" name="status">
                                    <option value="0">请选择</option>
                                    <option value="1">已读</option>
                                    <option value="2">未读</option>
                                </select>
                                <button type="button" id="btnSearch" class="btn btn-sm btn-primary">提交</button>
							  </div>
							</form>
                            
                        </div>
						<table id="messageTable" class="table table-striped table-bordered table-hover">
							<thead>
							    <tr>
							      <th>消息ID</th>
							      <th>消息类型</th>
							      <th>消息内容</th>
							      <th>创建时间</th>
							      <th>消息状态</th>
							    </tr>
							</thead>
							<tbody></tbody>
						</table>
						<div style="margin-top:15px; text-align:center;" id="pageComponent"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/plugins/datepicker/moment-with-locales.min.js" charset="utf-8"></script>
	<script src="assets/js/plugins/datepicker/bootstrap-datetimepicker.min.js" charset="utf-8"></script>
	<script src="assets/js/plugins/layui/layui.all.js" charset="utf-8"></script>
	<!-- <script src="assets/js/demo.js"></script> -->
	<script type="text/javascript">

	$(function(){
		$('#startCreateTime').datetimepicker({
            locale: moment.locale('zh-cn'),
            showTodayButton:true,
            showClose:true,
            showClear:true,
            format: "YYYY-MM-DD HH:mm:ss",
            tooltips: {
                today: '选择今天',
                clear: '清除所选日期',
                close: '关闭日期选择器',
                selectTime: '选择时间',
            }
        }).on('dp.change', function (ev) {
        	$('#endCreateTime').data("DateTimePicker").minDate(ev.date);
            //var newDateTime = ev.date ? ev.date.format('yyyy-MM-dd HH:mm:ss') : "";
            //var oldDateTime = ev.oldDate ? ev.oldDate.format('yyyy-MM-dd HH:mm:ss') : "";
            var newDateTime = ev.date ? ev.date.format('YYYY-MM-DD') : "";
            var oldDateTime = ev.oldDate ? ev.oldDate.format('YYYY-MM-DD') : "";
            if (newDateTime != oldDateTime) {
                $(this).data("DateTimePicker").hide();
            }
        });
		
		$('#endCreateTime').datetimepicker({
            locale: moment.locale('zh-cn'),
            showTodayButton:true,
            format: "YYYY-MM-DD HH:mm:ss"
        }).on('dp.change', function (ev) {
        	$('#startCreateTime').data("DateTimePicker").maxDate(ev.date);
            //var newDateTime = ev.date ? ev.date.format('yyyy-MM-dd HH:mm:ss') : "";
            //var oldDateTime = ev.oldDate ? ev.oldDate.format('yyyy-MM-dd HH:mm:ss') : "";
            var newDateTime = ev.date ? ev.date.format('YYYY-MM-DD') : "";
            var oldDateTime = ev.oldDate ? ev.oldDate.format('YYYY-MM-DD') : "";
            if (newDateTime != oldDateTime) {
                $(this).data("DateTimePicker").hide();
            }
        });
		
		 var jsonData = {};	  
		 var laypage = layui.laypage;
		 function loadLaypage(dataTotal){
			 laypage.render({
				 elem: 'pageComponent',
				 count: dataTotal,
			     groups: 10, //连续显示分页数
			     layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],
			     jump: function(obj, first, fnCallback){  //触发分页后的回调
			         if(!first){ //一定要加此判断，否则初始时会无限刷新
			        	 jsonData.pageNum = obj.curr;
			 			 jsonData.pageSize = obj.limit;
			 			 alert(JSON.stringify(jsonData));
			        	 $.ajax({
								type : 'post',
								url : 'rest/message/messagePageList',
								dataType : 'json',
								contentType : 'application/json',
								data : JSON.stringify(jsonData),
								success : function(data) {
									if (data) {
										var htmlData = '';
										$.each(data.messageList,function(idx,item){
											htmlData +='<tr><td>'+item.messageId+'</td><td>'+item.messageType+'</td><td>'+item.messageContext+'</td><td>'+item.createTime+'</td><td>'+item.status+'</td></tr>'
										});
										$("#messageTable tbody").html(htmlData);
									} else {
										alert("数据异常");
									}
								},
								error : function() {
									alert("数据加载失败");
								}
							});
			        	 console.log(obj);
			         }
			     }
			 });	 
		 }
		 
		 $('#btnSearch').click(function(){
				var jsonData = {};
				$('#formSearch .form-control').each(function(index,item){
					if($(this).val() && $(this).val()!=0){
						jsonData[$(this).attr("name")] = $(this).val();
					}
				});
				jsonData.pageNum = 1;
				jsonData.pageSize = 10;
				$.ajax({
					type : 'post',
					url : 'rest/message/messagePageList',
					dataType : 'json',
					contentType : 'application/json',
					data : JSON.stringify(jsonData),
					success : function(data) {
						if (data) {
							var htmlData = '';
							$.each(data.messageList,function(idx,item){
								htmlData +='<tr><td>'+item.messageId+'</td><td>'+item.messageType+'</td><td>'+item.messageContext+'</td><td>'+item.createTime+'</td><td>'+item.status+'</td></tr>'
							});
							$("#messageTable tbody").html(htmlData);
							loadLaypage(data.total);
						} else {
							alert("数据异常");
						}
					},
					error : function() {
						alert("数据加载失败");
					}
				});
			});
		 
		 $('#btnSearch').trigger("click");
		
	/* 	demo.initLaypage('pageComponent',111,messagePageAjax(jsonData));	
			
		function messagePageAjax(jsonData){
			$.ajax({
				type : 'post',
				url : 'rest/message/messagePageList',
				dataType : 'json',
				contentType : 'application/json',
				data : JSON.stringify(jsonData),
				success : function(data) {
					if (data) {
						var htmlData = '';
						$.each(data.messageList,function(idx,item){
							htmlData +='<tr><td>'+item.messageId+'</td><td>'+item.messageType+'</td><td>'+item.messageContext+'</td><td>'+item.createTime+'</td><td>'+item.status+'</td></tr>'
						});
						$("#messageTable tbody").html(htmlData);
						demo.initLaypage('pageComponent',data.total,messagePageAjax(jsonData));
					} else {
						alert("数据异常");
					}
				},
				error : function() {
					alert("数据加载失败");
				}
			});	
		}
			
			
			
		$('#btnSearch').click(function(){
			jsonData = {};
			$('#formSearch .form-control').each(function(index,item){
				alert($(this).attr("name")+":"+$(this).val());
				if($(this).val() && $(this).val()!=0){
					jsonData[$(this).attr("name")] = $(this).val();
				}
			});
			jsonData.pageNum = 1;
			jsonData.pageSize = 10;
			alert(JSON.stringify(jsonData));
			messagePageAjax(jsonData);
		});  */
	});
		 
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
