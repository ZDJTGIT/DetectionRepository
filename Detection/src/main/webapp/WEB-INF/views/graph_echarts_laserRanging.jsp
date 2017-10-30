<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 激光测距</title>
    <meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
    <meta name="description" content="中大检测平台">

    <link rel="shortcut icon" href="favicon.ico">
    <!-- Data Tables -->
    <link href="assets/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<link href="assets/css/plugins/datepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<link href="assets/css/plugins/datepicker/datepicker3.css" rel="stylesheet">
    <script type="text/javascript" src="assets/js/slop_photo.js"></script>
    <link href="assets/css/style.min.css" rel="stylesheet">
	
</head>

<body class="gray-bg">
	<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:999;width:100%;height:100%;display:none;">
		<div id="innerdiv" style="position:absolute;"><img id="bigimg" style="border:5px solid #fff;" src="assets/img/farmmap.jpg" />
		</div>
	</div>
	<label style="display: none;" id="projectId">${projectId }</label>
	<label style="display: none;" id="detectionTypeId">${detectionTypeId }</label>
    <div class="wrapper wrapper-content animated fadeInRight">
    	<div class="row">
    		<div class="col-sm-12">
                <div class="ibox float-e-margins" id="small-chat1" style="width: 100%" >
                    <div class="ibox-content" style="background: rgba(255,255,255, 0.5);">
                        <form class="form-inline" role="form" id="formSearch">
                            <div class="form-group">
                                <label for="startCreateTime">选择日期:</label>
							   	<input type="datetime" class="form-control" id="diapladata" >
                            </div>
                            <button class="btn btn-primary " id="selectdispladata" type="button" style="margin-top: 5px;">&nbsp;查询</button>
                            <!-- <div class="form-group" style="margin-left: 20px;">
                                <label for="startCreateTime">测试次数：第</label>
							   	<select class="form-control" id="displaallnumber">
							   	</select>
							   	<label>次检测数据 </label>
                            </div> -->
                            <!-- <div class="form-group" style="margin-left: 40px;">
                                <label for="startCreateTime">时间：</label>
							   	<select class="form-control" id="displaalltime">
							   	</select>
                            </div> -->
                        </form>
                    </div>
                </div>
            </div>
    	</div>
   		 <div class="row">
    		<div class="col-sm-12" style="height: 65px">
                
                </div>
            </div>
    	
        <div class="row">
            <div class="col-sm-5">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>热点图片</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="text-align: center;">
                        <img class="pimg" alt="图片未加载" src="assets/img/subway1.png" style="width: 100%;height: 360px" >
                    </div>
                </div>
            </div>
            <div class="col-sm-7" >
                <div class="ibox float-e-margins" >
                    <div class="ibox-title">
                        <h5>现场图片</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="height: 360px;text-align: center;">
                    	<h2 class="logo-name">假装有图片</h2>
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
        	<div class="col-sm-12" >
                <div class="ibox float-e-margins" >
                    <div class="ibox-title">
                        <h5>累计变化量</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" >
                        <div class="echarts" id="echarts-rate-chart" style="height: 360px"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>单次变化量</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-grandtotal-chart" style="height: 360px"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>变化速率</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-single-chart" style="height: 360px"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>实时数据</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="graph_flot.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="graph_flot.html#">选项1</a>
                                </li>
                                <li><a href="graph_flot.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-displacement-chart" style="height: 360px"></div>
                    </div>
                </div>
            </div>

        </div>
         <div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>告警处理表</h5>
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
                        <table class="table table-striped table-bordered table-hover display" id="editable"  cellspacing="0" width="100%"> 
                            <thead>
                                <tr>
                                	<td>测点名称</td>
									<td>初次测试值时间</td>
									<td>初次测试值(MM)</td>
									<td>前次测试时间</td>
									<td>前次测试值(MM)</td>
									<td>本次测试时间</td>
									<td>本次测试值(MM)</td>
									<td>单次变化量(MM)</td>
									<td>总变化量(MM)</td>
									<td>变化速率(MM/DAY)</td>
								</tr>
                            </thead>
                        </table>

                    </div>
				</div>
			</div>
		</div> 
    </div>
    <script src="assets/js/jquery.min.js"></script>	
    <script src="assets/js/plugins/datepicker/moment-with-locales.min.js" charset="utf-8"></script>
	<script src="assets/js/plugins/datepicker/bootstrap-datetimepicker.min.js" charset="utf-8"></script>
	<script src="assets/js/plugins/layui/layui.all.js" charset="utf-8"></script>
	<script type="text/javascript">
			
			$('#diapladata').datetimepicker({
	            locale: moment.locale('zh-cn'),
	            showTodayButton:true,
	            format: "YYYY-MM-DD"
	        })
	       
	</script>
    <!-- ECharts -->
    <script src="assets/js/plugins/echarts/echarts-all.js"></script>
    <!-- 自定义js -->
    <script src="assets/js/content.js"></script>

    <!-- ECharts demo data -->
     <script src="assets/js/laserRanging.js"></script>
     <script src="assets/js/plugins/jeditable/jquery.jeditable.js"></script>
    <!-- Data Tables -->
    <script src="assets/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    
    <script>
	    var oTabel;
	    $(document).ready(function() {
	    	oTabel= $('#editable').dataTable();
	    });
	</script>
</body>

</html>
