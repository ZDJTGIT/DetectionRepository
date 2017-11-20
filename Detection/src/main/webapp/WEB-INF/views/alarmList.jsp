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
<title>告警列表</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="stylesheet" href="assets/js/plugins/layui/css/layui.css" media="all"></link>
<link href="assets/css/plugins/iCheck/custom.css" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content  animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>告警列表</h5>
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
						<div class="container">
							<form class="form-inline" role="form" id="AlarmSearchForm">
								<div class="row">
							  		<div class="form-group col-md-3">
							    		<label for="alarmId">&nbsp;&nbsp;&nbsp;告警ID:</label>
							    		<input type="text" class="form-control" id="alarmId" name="alarmId" value="${alarmId}" placeholder="告警ID">
							  		</div>
							  		<div class="form-group col-md-3">
							    		<label for="projectId">所属项目:</label>
							    		<input type="text" class="form-control" id="projectId" name="projectName" placeholder="所属项目">
							  		</div>
							  		<div class="form-group col-md-3">
							    		<label for="smuCmsId">采集器编号:</label>
							    		<input type="text" class="form-control" id="smuCmsId" name="smuCmsId" placeholder="采集器编号">
							  		</div>
							  		<div class="form-group col-md-3">
									    <label for="alarmTypeId">告警类型:</label>
									    <select  class="form-control" name="alarmTypeId" id="alarmTypeId">
		                                    <option value="0">请选择</option>
		                                </select>
									 </div>
							  	</div>
							  	<div class="row">
							  		<div class="form-group col-md-3">
									    <label for="alarmContext">告警内容:</label>
									    <input type="text" class="form-control" id="alarmContext" name="alarmContext" value="" placeholder="告警内容">
									</div>
									<div class="form-group col-md-3">
							    		<label for="detectionId">所在测点:</label>
							    		<input type="text" class="form-control" id="detectionId" name="detectionId" placeholder="所在测点">
							  		</div>
							  		<div class="form-group col-md-3">
							    		<label for="sensorId">传感器编号:</label>
							    		<input type="text" class="form-control" id="sensorId" name="sensorId" placeholder="传感器编号">
							  		</div>
							  		<div class="form-group col-md-3">
									    <label for="status">告警状态:</label>
									    <select  class="form-control" name="status" id="status">
		                                    <option value="0">请选择</option>
		                                </select>
									 </div>
							  	</div>
							  	<div class="row">
							  		<div class="form-group col-md-3 date">
									    <label for="startCreateTime">起始时间:</label>
									    <input type="datetime" class="form-control" id="startCreateTime" name="startCreateTime" placeholder="起始时间">
									 </div>
									 <div class="form-group col-md-3">
									    <label for="endCreateTime">结束时间:</label>
									    <input type="datetime" class="form-control" id="endCreateTime" name="endCreateTime" placeholder="结束时间">
									 </div>
									 <div class="form-group col-md-3 col-md-offset-3" style="margin-top: 10px;text-align: center">
									  	<button type="button" id="btnSearch" class="btn btn-md btn-primary query" >查询</button>
									 </div>
							  	</div>								
                        	</form>
						</div>
                        <div id="checkboxTip"></div>
						<table id="alarmTable" class="table table-striped table-bordered table-hover topy">
							<thead>
							    <tr>
							      <th><input type="checkbox" id="checkbox-all">全选</th>
							      <th>告警ID</th>
							      <th>所属项目</th>
							      <th>所在测点</th>
							      <th>采集器（终端）编号</th>
							      <th>传感器编号</th>
							      <th>告警类型</th>
							      <th>告警内容</th>
							      <th>产生时间</th>
							      <th>告警状态</th>
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

	<script src="assets/js/plugins/iCheck/icheck.min.js" charset="utf-8"></script>
	<script src="assets/js/plugins/laydate/laydate.js" charset="utf-8"></script>
	<script src="assets/js/plugins/layui/layui.all.js" charset="utf-8"></script>
	<script type="text/javascript">
	$(document).ready(function(){

			//日期范围限制
	        var start = {
	            elem: '#startCreateTime',
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
	            elem: '#endCreateTime',
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

	        $('#alarmTable').on('click','.layerOpen',function(){
	        	layer.open({
		        	  type: 1,
		        	  shade: false,
		        	  title: '消息内容',
		        	  anim: 6,
		        	  content: $(this) //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
		        	});
	        });

	       (function(){
				//分页请求后台获取数据函数 , 参数jsonData为查询条件集合json数据 , loadLaypage是分页组件函数
				function alarmPageAjax(jsonData, loadLaypage){
					 //显示loading提示
	                 var loading = layer.load(2, {
	                	  shade: [0.1,'#fff'] //0.1透明度的白色背景
	                 });
					 $.ajax({
							type : 'post',
							url : 'rest/alarm/alarmPageList',
							dataType : 'json',
							contentType : 'application/json',
							data : JSON.stringify(jsonData),
							success : function(data) {
								if (data) {
									var htmlData = '';
									$.each(data.alarmList,function(idx,item){
										htmlData +='<tr><td style="text-align:center"><input type="checkbox"></td><td>'+item.alarmId+'</td><td>'+item.projectName+'</td><td>'+item.detectionId+'</td><td>'+item.smuCmsId+'</td><td>'+item.sensorId+'</td><td>'+item.alarmType+'</td><td class="layerOpen">'+item.alarmContext+'</td><td>'+item.createTime+'</td><td>'+item.alarmStatus+'</td></tr>'
									});
									$("#alarmTable tbody").html(htmlData);
									if(loadLaypage){ //如果该参数有值
										loadLaypage(data.total, jsonData); //有查询条件时请求数据，需重新初始化分页组件
									}
									//对新生成的checkbox应用iCheck
									$('input[type="checkbox"]').iCheck({
									    checkboxClass: 'icheckbox_square-green',
									    increaseArea: '20%' // optional
									});
									$('#checkbox-all').iCheck('uncheck');
									//加载完成后隐藏loading提示
				                    layer.close(loading);
								} else {
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
					     groups: 10, //连续显示分页数
					     layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],
					     jump: function(obj, first){  //触发分页后的回调
					         if(!first){ //一定要加此判断，否则初始时会无限刷新
					        	 jsonData.pageNum = obj.curr;
					 			 jsonData.pageSize = obj.limit;
					 			 alarmPageAjax(jsonData); //分页请求后台函数  参数jsonData查询条件参数
					         }
					     }
					 });
				 }

				 $('#btnSearch').click(function(){
						var jsonData = {};
						$('#AlarmSearchForm .form-control').each(function(index,item){
							if($(this).val() && $(this).val()!=0){
								jsonData[$(this).attr("name")] = $(this).val();
							}
						});
						jsonData.pageNum = 1;
						jsonData.pageSize = 10;
						alarmPageAjax(jsonData, loadLaypage);
					});
				 //首次加载页面触发查询按钮初始化列表（无查询参数）
				 $('#btnSearch').trigger("click");
		})();

		 //全选checkbox
		 $('#alarmTable').on("ifClicked", '#checkbox-all', function(event){
		    if(event.target.checked){
		      $('#alarmTable tbody').find('[type="checkbox"]').iCheck('uncheck');
		    }else{
		      $('#alarmTable tbody').find('[type="checkbox"]').iCheck('check');
		    }
		 });

		 //反选checkbox
		 $('#alarmTable tbody').on('ifClicked', '[type="checkbox"]', function(event){
			 alert(event.target.checked);
			 var checkLength = $('#alarmTable tbody').find('[type="checkbox"]:checked').length;
			 var totalLength = $('#alarmTable tbody').find('[type="checkbox"]').length;
			 if(event.target.checked){
				 if(checkLength == totalLength){
					  $('#checkbox-all').iCheck('uncheck');
				 }
			 }else{
				 if(checkLength == totalLength - 1){
					  $('#checkbox-all').iCheck('check');
				 }
			 }
		 });
		 
		 (function (){
			 $.ajax({
					type : 'post',
					url : 'rest/sysDictionary/alarmTypeAndStatus',
					dataType : 'json',
					data : {alarmType:'alarmType',alarmStatus:'alarmStatus'},
					success : function(data) {
						if (data) {
							var typeData = '';
							var statusData = '';
							$.each(data, function(idx,item){
								if(item.typeValue == 'alarmType'){
									typeData +='<option value="'+item.dicId+'">'+item.itemName+'</option>'
								}else if(item.typeValue == 'alarmStatus'){
									statusData +='<option value="'+item.dicId+'">'+item.itemName+'</option>'
								}
							});
							$("#alarmTypeId").append(typeData);
							$("#status").append(statusData);
						} else {
							alert("数据异常");
						}
					},
					error : function() {
						alert("数据加载失败");
					}
			}); 
		})();
	});
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
