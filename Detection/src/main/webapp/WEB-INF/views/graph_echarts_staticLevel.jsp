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
    <title> 沉降</title>
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
                    <div class="ibox-content" style="background: rgba(255,255,255, 0.5);height: 65px;">
                        <form class="form-inline"  >
                        	<div class="row">
                        		<div class="col-sm-3">
	                                <label for="startCreateTime">选择日期:</label>
								   	<input type="datetime" class="form-control" id="diapladata" style="ime-mode: disabled" value="${currentTime }">
	                            <button class="btn btn-primary " id="selectstaticleveldata" type="button" style="margin-top: 5px;">&nbsp;查询</button>
	                        	</div>
	                            <div class="col-sm-1" style="margin-top: 12px;">
	                            	<label for="startCreateTime"><a href="#热点图片">热点图片</a></label>
	                            </div>
	                            <div class="col-sm-1" style="margin-top: 12px;">
	                            	<label for="startCreateTime"><a href="#现场图片">现场图片</a></label>
	                            </div>
	                            <div class="col-sm-1" style="margin-top: 12px;">
	                            	<label for="startCreateTime"><a href="#实时数据">实时数据</a></label>
	                            </div>
	                            <div class="col-sm-1" style="margin-top: 12px;">
	                            	<label for="startCreateTime"><a href="#累计变化量">累计变化量</a></label>
	                            </div>
	                            <div class="col-sm-1" style="margin-top: 12px;">
	                            	<label for="startCreateTime"><a href="#变化速率">变化速率</a></label>
	                            </div>
	                            <div class="col-sm-1" style="margin-top: 12px;">
	                            	<label for="startCreateTime"><a href="#单次变化量">单次变化量</a></label>
	                            </div>
	                            <div class="col-sm-1" style="margin-top: 12px;">
	                            	<label for="startCreateTime"><a href="#数据信息">数据信息</a></label>
	                            </div>
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
            
    	<c:set value="${fn:split(image.physicalImageUrl,',') }" var="names" />
        <div class="row">
            <div class="col-sm-6" id="热点图片">
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
                    	<c:choose>
                    		<c:when test="${not empty  image.heatImageUrl}">
                    			<img class="pimg" alt="图片未加载" src="${image.heatImageUrl }" style="width: 100%;height: 360px" >
                    		</c:when>
                    		<c:otherwise>
                    			<h2 class="logo-name" style="height: 360px;">没有图片</h2>
                    		</c:otherwise>
                    	</c:choose>
                        
                    </div>
                </div>
            </div>
            <div class="col-sm-6" id="现场图片">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>现场图片</h5>
                    </div>
                    <div class="ibox-content " >
                        <div class="carousel slide" id="carousel2" >
                            <ol class="carousel-indicators">
                            	<c:forEach var="num" items="${names}" varStatus="status"> 
                            		<c:choose>
                            			<c:when test="${status.index eq 0}">
                            				<li data-slide-to="${status.index }" data-target="#carousel2" class="active"></li>
                            			</c:when>
                            			<c:otherwise>
                            				<li data-slide-to="${status.index }" data-target="#carousel2"></li>
                            			</c:otherwise>
                            		</c:choose>
					       		</c:forEach>
                            </ol>
                            <div class="carousel-inner" >
                            	<c:forEach var="num" items="${names}" varStatus="status">
                            		<c:choose>
                            			<c:when test="${status.index eq 0}">
                            				<div class="item active">
			                                    <img alt="image" class="img-responsive" src="${num }" style="margin: 0 auto;"> 
			                                    <!-- <div class="carousel-caption">
			                                        <p>This is simple caption 1</p>
			                                    </div> -->
			                                </div>
                            			</c:when>
                            			<c:otherwise>
                            				<div class="item ">
			                                    <img alt="image" class="img-responsive" src="${num }" style="margin: 0 auto;">
			                                    <!-- <div class="carousel-caption">
			                                        <p>This is simple caption 2</p>
			                                    </div> -->
			                                </div>
                            			</c:otherwise>
                            		</c:choose>
                            	</c:forEach>
                            </div>
                            <a data-slide="prev" href="carousel.html#carousel2" class="left carousel-control">
                                <span class="icon-prev"></span>
                            </a>
                            <a data-slide="next" href="carousel.html#carousel2" class="right carousel-control">
                                <span class="icon-next"></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
	        <div class="col-sm-12" id="实时数据">
                <div class="ibox float-e-margins">
                    <div class="ibox-title" style="text-align: center;">
                        <h5>实时数据</h5>
                        <div class="btn-group" >
                         </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-displacement-chart" style="height: 360px"></div>
                    </div>
                </div>
            </div>
        	<div class="col-sm-12" id="累计变化量">
                <div class="ibox float-e-margins" >
                    <div class="ibox-title" style="text-align: center;">
                        <h5>累计变化量</h5>
                         <div class="btn-group" >
                         </div>
                    </div>
                    <div class="ibox-content" >
                        <div class="echarts" id="echarts-rate-chart" style="height: 360px"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12" id="变化速率">
                <div class="ibox float-e-margins">
                    <div class="ibox-title" style="text-align: center;">
                        <h5>变化速率</h5>
                        <div class="btn-group">
                         </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-single-chart" style="height: 360px"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12" id="单次变化量">
                <div class="ibox float-e-margins">
                    <div class="ibox-title" style="text-align: center;">
                        <h5>单次变化量</h5>
                        <div class="btn-group" >
                         </div>
                    </div>
                    <div class="ibox-content">
                        <div class="echarts" id="echarts-grandtotal-chart" style="height: 360px"></div>
                    </div>
                </div>
            </div>
        </div>
         <div class="row" >
			<div class="col-sm-12" id="数据信息">
				<div class="ibox float-e-margins">
					<div class="ibox-title" style="text-align: center;">
						<div class="row" >
							<div class="col-sm-11">
								<h5>数据信息</h5>
								<div class="btn-group" name="staticlevel_detectionButtion">
                        		 </div>
							</div>
							<div class="col-sm-1">
								<a href="" id="laserRangexcel_a">
									<button  name="" class="btn btn-info  dim" type="button" title="导成Excel"><i class="fa fa-upload"></i>
                   					</button>
								</a>
							</div>
						</div>
					</div>
					 <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover display" id="statictable"  cellspacing="0" width="100%"> 
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
									<td>终端编号(DTU)</td>
									<td>采集器通道</td>
									<td>温度(℃)</td>
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
	<!-- Data Tables -->
    <script src="assets/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    
    <!-- <script>
	    var oTabel;
	    $(document).ready(function() {
	    	
	    });
	</script> -->
	
    <!-- ECharts -->
    <script src="assets/js/plugins/echarts/echarts-all.js"></script>
    <!-- 自定义js -->
    <script src="assets/js/content.js"></script>

    <!-- ECharts demo data -->
     <script src="assets/js/staticLevel.js"></script>
     <script src="assets/js/plugins/jeditable/jquery.jeditable.js"></script>
   
</body>

</html>
