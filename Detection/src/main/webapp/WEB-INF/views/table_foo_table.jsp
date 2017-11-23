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
<title>操作日志表</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="shortcut icon" href="favicon.ico">
 	<!-- Data Tables -->
    <link href="assets/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<link href="assets/css/plugins/datepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<link href="assets/css/plugins/datepicker/datepicker3.css" rel="stylesheet">
    <link href="assets/css/style.min.css" rel="stylesheet">
	<link href="assets/css/plugins/footable/footable.core.css" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row" >
			<div class="col-sm-12" id="数据信息">
				<div class="ibox float-e-margins">
					<div class="ibox-title" style="text-align: center;">
						<div class="row" >
							<div class="col-sm-11">
								<h5>日志信息</h5>
							</div>
						</div>
					</div>
					 <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover display" id="logtabel"  cellspacing="0" width="100%"> 
                            <thead>
                                <tr>
                                	<td>日志ID</td>
									<td>用户名称</td>
									<td>操作内容</td>
									<td>操作描述</td>
									<td>操作时间</td>
								</tr>
                            </thead>
                        </table>

                    </div>
				</div>
			</div>
		</div> 
	</div>
	<!-- Data Tables -->
    <script src="assets/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    
	<script src="assets/js/plugins/footable/footable.all.min.js"></script>
	<script src="assets/js/content.js"></script>
	<script type="text/javascript">
	 $('#logtabel').dataTable({
         "bProcessing": true, // 是否显示取数据时的那个等待提示
         "bServerSide": true,//这个用来指明是通过服务端来取数据
         "bPaginate": true,  //是否显示分页
         "sAjaxSource": "rest/operationlog/selectlog",//这个是请求的地址
         "fnServerData": retrieveData, // 获取数据的处理函数
         "aoColumns": [
                       { "mData": "logId"},
                       { "mData": "userName"},
                       { "mData": "operationContext"},
                       { "mData": "operationDescription"},
                       { "mData": "operationTime"},
                   ] //对应表格中的每一列
         
 	});
	 function retrieveData( sSource111,aoData111, fnCallback111) {
	        $.ajax({
	            url : sSource111,//这个就是请求地址对应sAjaxSource
	            data : {"aoData":JSON.stringify(aoData111)},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
	            type : 'post',
	            dataType : 'json',
	            async : false,
	            success : function(result) {
	                fnCallback111(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
	            },
	            error : function(msg) {
	            }
	        });
	    }
	</script>
	
</body>
</html>
