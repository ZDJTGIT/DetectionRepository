<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<% response.setContentType("application/vnd.ms-excel;charset=GBK"); %>
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
    <title>统计图表</title>
    <meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
    <meta name="description" content="中大检测平台">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="assets/css/style.min.css" rel="stylesheet">
	
</head>

<body class="gray-bg">
	<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:999;width:100%;height:100%;display:none;">
		<div id="innerdiv" style="position:absolute;"><img id="bigimg"  alt="加载中..." src="assets/img/loding1.gif" />
		</div>
	</div>
	<label style="display: none;" id="projectId">${projectId}</label>
    <div class="wrapper wrapper-content animated fadeInRight">
    	 <div class="row">
    		<div class="col-sm-12">
                <div class="ibox float-e-margins" id="small-chat1" style="width: 100%" >
                    <div class="ibox-content" style="background: rgba(255,255,255, 0.5);height: 65px;">
                        <form class="form-inline"  >
                        	<div class="row">
                        			<div class="form-group col-md-1 date">
									    <select class="form-control" id="selectdata">
										    <option>最近一周</option>
										    <option>最近一月</option>
										    <option>最近三个月</option>
										    <option>最近六个月</option>
										    <option>最近一年</option>
										    <option>全部</option>
										 </select>
									 </div>
							  		<div class="form-group col-md-3 date">
									    <label for="startCreateTime">起始时间:</label>
									    <input type="datetime" class="form-control" id="startCreateTime" name="startCreateTime" placeholder="起始时间">
									 </div>
									 <div class="form-group col-md-3">
									    <label for="endCreateTime">结束时间:</label>
									    <input type="datetime" class="form-control" id="endCreateTime" name="endCreateTime" placeholder="结束时间">
									 </div>
									 <button type="button" id="btnSearchstatic"  class="btn btn-md btn-primary query" >查询</button>
							  	</div>
                        </form>
                    </div>
                </div>
            </div>
    	</div> 
   		 <div class="row">
    		<div class="col-sm-12" style="height: 65px">
                
                </div>
            </div> 
            
        <div class="row" id="rowstatistic">
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>	
<!--     <script src="assets/js/plugins/datepicker/moment-with-locales.min.js" charset="utf-8"></script>
	<script src="assets/js/plugins/datepicker/bootstrap-datetimepicker.min.js" charset="utf-8"></script> -->
	<script src="assets/js/plugins/laydate/laydate.js" charset="utf-8"></script>
	<script src="assets/js/plugins/layui/layui.all.js" charset="utf-8"></script>
	<script type="text/javascript">
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
			   
	</script>
    
	
    <!-- ECharts -->
    <script src="assets/js/plugins/echarts/echarts-all.js"></script>
    <!-- 自定义js -->
    <script src="assets/js/content.js"></script>

    <!-- ECharts demo data -->
     <script src="assets/js/statistic_chart.js"></script>
     <script src="assets/js/plugins/jeditable/jquery.jeditable.js"></script>
   
</body>

</html>
