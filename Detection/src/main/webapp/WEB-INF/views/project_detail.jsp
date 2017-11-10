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
<title>项目详情</title>
<meta name="keywords" content="detection,plat,inspection,ZDJT,zhongdajiance">
<meta name="description" content="中大检测平台">
<link rel="shortcut icon" href="favicon.ico">
</head>
<body class="gray-bg">
	<div class="row">
		<div class="col-sm-12">
			<div class="wrapper wrapper-content animated fadeInUp">
				<div class="ibox">
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-12">
								<div class="m-b-md">
									<h2>${projectName}</h2>
								</div>
								<dl class="dl-horizontal">
								<dt>项目状态：&nbsp;&nbsp;&nbsp;</dt>
									<dd id="dd_projectStatus">
								    </dd>
								</dl>
								<dl class="dl-horizontal">
								<dt>当前进度：&nbsp;&nbsp;&nbsp;</dt>
									<dd id="dd_schedule">
										<div class="progress progress-striped active m-b-sm">
											<div id="schedule_div" style="width: 62.63%;" class="progress-bar"></div>
										</div>
										<small>当前已完成项目总进度的 <strong id="schedule_strong">62.63%</strong></small>
									</dd>
								</dl>
							</div>
						</div>
						<!-- <div class="row">
							<div class="col-sm-1">
							</div>
							<div class="col-sm-2">
								<dl class="dl-horizontal">
									<dt>测点记录：&nbsp;&nbsp;&nbsp;</dt>
									<dd id="dd_detectionPointCont">0</dd>
									<dt>阀值记录：&nbsp;&nbsp;&nbsp;</dt>
									<dd id="dd_thresHoldCont">0</dd>
									<dt>图片记录：&nbsp;&nbsp;&nbsp;</dt>
									<dd id="dd_imageCont">0</dd>
									<dt>传感器记录：</dt>
									<dd id="dd_sensorInfoCont">0</dd>
								</dl>
							</div>
							<div class="col-sm-7" id="cluster_info">
								<dl class="dl-horizontal">
									<dt>创建时间：</dt>
									<dd id="dd_beginTime">2017-05-10 00:00:00</dd>
									<dt>结束时间：</dt>
									<dd id="dd_endTime">2018-02-25 19:14:24</dd>
									<dt>项目地点：</dt>
									<dd id="dd_address">湖南长沙</dd>
									<dt>项目经度：</dt>
									<dd id="dd_Longitude">12''45'</dd>
									<dt>项目纬度：</dt>
									<dd id="dd_Latitude">13''14</dd>
								</dl>
							</div>
						</div> -->
						<div class="row">
							<div class="col-sm-1" style="width:5%">
							</div>
							<div class="col-sm-6" id="project_content">
								<div class="ibox-content">
			                        <div class="echarts" id="project_column_div" style="height: 260px">
			                        </div>
			                    </div>
							</div>
						</div>
						<div class="row m-t-sm">
							<div class="col-sm-12">
								<div class="panel blank-panel">
									<div class="panel-heading">
										<div class="panel-options">
											<ul class="nav nav-tabs">
												<li><a href="project_detail.html#tab-1"
													data-toggle="tab">测点</a></li>
												<li class=""><a href="project_detail.html#tab-5"
													data-toggle="tab">采集器</a></li>
												<li class=""><a href="project_detail.html#tab-2"
													data-toggle="tab">传感器</a></li>
												<li class=""><a href="project_detail.html#tab-6"
													data-toggle="tab">结构健康</a></li>
												<li class=""><a href="project_detail.html#tab-4"
													data-toggle="tab">阀值</a></li>
												<li><a href="project_detail.html#tab-3"
													data-toggle="tab">图片</a></li>
											</ul>
										</div>
									</div>

									<div class="panel-body">
										<div class="tab-content">
											<div class="tab-pane active" id="tab-1">
												<div class="feed-activity-list">
													<table class="table table-striped">
													<thead>
														<tr>
															<th>名称</th>
															<th>类型</th>
															<th>经度</th>
															<th>纬度</th>
															<th>描述</th>
														</tr>
													</thead>
													<tbody id="tbody_detectionPoint">
													</tbody>
													</table>
												</div>
											</div>
											<!-- 采集器，未更新，4,5写死展示 -->
											<div class="tab-pane" id="tab-5">
												<div class="feed-activity-list">
													<table class="table table-striped">
													<thead>
														<tr>
															<th>采集器编号</th>
															<th>创建时间</th>
															<th>更新时间</th>
															<th>采集器信号强度</th>
															<th>采集时间间隔</th>
															<th>采集器状态</th>
															<th>采集器电压</th>
														</tr>
													</thead>
													<tbody id="tbody_terminals">
															<tr>
																<td><span class="label label-primary">
																<i class=""></i>2017100004</span></td>
																<td>2017-10-24 14:23:55</td>
																<td>2017-11-10 08:32:23</td>
																<td>31</td>
																<td></td>
																<td>在线</td>
																<td></td>
															</tr>
															<tr>
																<td><span class="label label-primary">
																<i class=""></i>2017100005</span></td>
																<td>2017-10-24 14:55:54</td>
																<td>2017-11-10 08:32:46</td>
																<td>31</td>
																<td></td>
																<td>在线</td>
																<td></td>
															</tr>
													</tbody>
													</table>
												</div>
											</div>
											<div class="tab-pane" id="tab-2">
												<table class="table table-striped">
													<thead>
														<tr>
															<th>所属测点</th>
															<th>编号</th>
															<th>类型</th>
															<th>模型</th>
															<th>深度</th>
														</tr>
													</thead>
													<tbody id="tbody_sensorInfo">
													</tbody>
												</table>
											</div>
											<div class="tab-pane" id="tab-6">
												<div class="feed-activity-list">
													<table class="table table-striped">
													<thead>
														<tr>
															<th>测点ID</th>
															<th>采集器编号</th>
															<th>传感器ID</th>
															<th>告警类型</th>
															<th>告警内容</th>
															<th>产生时间</th>
															<th>告警等级</th>
															<th>同类消息产生次数</th>
														</tr>
													</thead>
													<tbody id="tbody_alarm">
													</tbody>
													</table>
												</div>
											</div>
											<div class="tab-pane" id="tab-4">
												<table class="table table-striped">
													<thead>
														<tr>
															<th>测点类型</th>
															<th>阀值类型</th>
															<th>最小警戒值</th>
															<th>最大警戒值</th>
															<th>最小意外剧烈变化幅度大的值</th>
															<th>最大意外剧烈变化幅度大的值</th>
														</tr>
													</thead>
													<tbody id="tbody_thresHold">
													</tbody>
												</table>
											</div>
											<div class="tab-pane" id="tab-3">
												<table class="table table-striped">
													<thead>
														<tr>
															<th>测点类型</th>
															<th>热点图</th>
															<th>现场图</th>
														</tr>
													</thead>
													<tbody id="tbody_image">
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/content.js"></script>
	<script src="assets/js/plugins/echarts/echarts-all.js"></script>
	<script type="text/javascript">
	 	var projectId = '${projectId}';
        //指定图标的配置和数据
        
        var placeHoledStyle = {
		    normal:{
		        barBorderColor:'rgba(0,0,0,0)',
		        color:'rgba(26,179,148)',
		        label : {
		            show: true,
		            position: 'insideLeft',
		        }
		    },
		    emphasis:{
		        barBorderColor:'rgba(0,0,0,0)',
		        color:'rgba(0,0,0,0)'
		    }
		}; 
        //26,179,148
		var dataStyle = { 
		    normal: {
		        label : {
		            show: true,
		            position: 'insideLeft',
		        }
		    }
		};
		var option = {
            title:{
                text: '结构物报表统计分析',
                subtext: 'From ExcelHome',
                sublink: 'http://e.weibo.com/1341556070/AiEscco0H'
            },
            tooltip:{
            	 trigger: 'axis',
                 axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                     type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                 },
            },
            //选项（正常值和异常值）
            legend:{
                data:['正常','非正常']
            },
            
            xAxis : [
                     {
                         type : 'value',
                         //position: 'top',
                         //splitLine: {show: false},
                         //axisLabel: {show: false},
                     }
            ],
            //纵坐标
            yAxis:{
                type : 'category',
                splitLine: {show: false},
                data : ['结构健康', '采集器', '传感器', '测点数量']
            },
            
            series : [
                      /*  {
                          name:'正常',
                          type:'bar',
                          stack: '总量',
                          itemStyle : dataStyle,
                          data:[0,0,0,0]
                      },  */
                        {
                          name:'正常',
                          type:'bar',
                          stack: '总量',
                          itemStyle: placeHoledStyle,
                          data:[0, 0, 0, 0]
                      } ,  
                      {
                          name:'非正常',
                          type:'bar',
                          stack: '总量',
                          itemStyle : dataStyle,
                          data:[0,0,0,0]
                      }  
                      /* {
                          name:'非正常',
                          type:'bar',
                          stack: '总量',
                          itemStyle: placeHoledStyle,
                          data:[1,2,1,2]
                      }  */
                  ]
        };
		//初始化echarts实例
        var myChart = echarts.init(document.getElementById('project_column_div'));
		myChart.setOption(option);
		myChart.showLoading();
        
        var content=[];     //项目下正常内容数量数组（实际用来盛放X轴坐标值）
        var contenterror=[];//项目下异常内容数量数组（实际用来盛放X轴坐标值）
        
        //获取测点数量，传感器数量，阀值数量，图片数量。
	    $.ajax({
		        type:'post',
			    url: 'rest/project/obtainCount',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	 if(data){   
				    		 content.push(data.alarmCount);//告警信息条数（alarm表）
				    		 content.push(2);//改成采集器数量---
				    		 content.push(data.sensorInfoCount);
				    		 content.push(data.detectionPointCount);
				    		 myChart.hideLoading();
				    		 myChart.setOption({        //加载数据图表
			                        series: [{
			                            // 根据名字对应到相应的系列
			                            data: content
			                        }]
			                 });
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    error: function(){
			  			   	  alert("数据加载失败");
			  		         }
		    	});
	     
    </script>
    
	<script>
		//传字符串型时间转化为时间
	function stringToData(strin){
		var beginArray = strin.split(" ");
	   	var dateArray = beginArray[0].split("-");
	   	var timeArray = beginArray[1].split(":");
	   	var date = new Date(dateArray[0], dateArray[1]-1, dateArray[2], timeArray[0], timeArray[1], timeArray[2]);
	   	return date.getTime();
		}
	
	     var projectId = '${projectId}';
	     var projectName = '${projectName}';
	     //var username = $("#dd_user").text();
	     //$("#dd_user").text("456");
	     $.ajax({
		        type:'post',
			    url: 'rest/project/obtainProject',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	if(data){
				    		var nowDate = new Date().getTime();
					    	var beginDate = stringToData(data.projectBeginTime);
					    	var endDate = stringToData(data.projectEndTime);
					    	var percentage=0;
					    	if(nowDate > endDate){
					    	 	percentage=100;
					    	}else if(nowDate < beginDate){
					    	 	percentage=0;
					    	}else{
					    	 	percentage = ((nowDate-beginDate)/(endDate-beginDate)*100).toFixed(2);
					    	} 
				    	  	$("#dd_projectStatus").append('<span class="label label-primary statusColor'+data.projectStatus+'">'+data.projectStatusString+'</span>');
				    	  	$("#dd_beginTime").text(data.projectBeginTime);
				    	  	$("#dd_endTime").text(data.projectEndTime);
				    	  	$("#dd_address").text(data.projectAddress);
				    	  	$("#dd_Longitude").text(data.projectLongitude);
				    	  	$("#dd_Latitude").text(data.projectLatitude);
				    	  	$("#schedule_div").css("width",percentage+"%");//当前进度
				    	  	$("#dd_schedule small").text("当前进度： "+percentage+"%");//当前进度
				    	  	$('.statusColor22').css("background-color","#1ab394"); 
		  	  	 			$('.statusColor21').css("background-color","#FF8547"); 
		  	  	 			$('.statusColor23').css("background-color","#F54545"); 
		  	  				$('.statusColor24').css("background-color","#696969");
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
		    	   });
	    //获取项目下所有测点
	     $.ajax({
		        type:'post',
			    url: 'rest/detectionPoint/showProjectDetectionPoint',
			    data: {projectName:projectName},
			    contextType:"application/json",
			    success: function(data){
			    	if(data){
			    	  		 var string = "";
			    	  		 $.each(data,function(idx,item){
			    	  		 string += '<tr>'+
											'<td><span class="label label-primary">'+
											'<i class=""></i>'+item.detectionName+'</span></td>'+
											'<td>'+item.itemName+'</td>'+
											'<td>'+item.detectionLatitude+'</td>'+
											'<td>'+item.detectionLongitude+'</td>'+
											'<td>'+
												'<p class="small">第一个测点</p>'+
											'</td>'+
										'</tr>';
					    	 });
			    	  		 $('#tbody_detectionPoint').append(string); 		
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
		    	 });
	    //获取项目下所有采集器
	    
	    //获取项目下所有传感器
	     $.ajax({
		        type:'post',
			    url: 'rest/sensorInfo/showProjectSensorInfo',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	if(data){
			    	  		 var string = "";
			    	  		 $.each(data,function(idx,item){
			    	  		 string += '<tr>'+
											'<td><span class="label label-primary">'+
											'<i class=""></i>'+item.detectionName+'</span></td>'+
											'<td>'+item.sensorId+'</td>'+
											'<td>'+item.sensorType+'</td>'+
											'<td>'+item.sensorModel+'</td>'+
											'<td>'+
												'<p class="small">'+item.sensorDepth+'</p>'+
											'</td>'+
										'</tr>';
					    	 });
			    	  		 $('#tbody_sensorInfo').append(string); 		
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
		    	 });
	    //获取项目下所有告警信息
	    $.ajax({
		        type:'post',
			    url: 'rest/alarm/showProjectAlarm',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	if(data){
			    	  		 var string = "";
			    	  		 $.each(data,function(idx,item){
			    	  		 string += '<tr>'+
							    	  		'<td><span class="label label-primary">'+
											'<i class=""></i>'+item.detectionName+'</span></td>'+
											'<td>'+item.smuCmsId+'</td>'+
											'<td>'+item.sensorId+'</td>'+
											'<td>'+item.alarmType+'</td>'+
											'<td>'+item.alarmContext+'</td>'+
											'<td>'+item.createTime+'</td>'+
											'<td>'+item.alarmLevel+'</td>'+
											'<td>'+item.frequency+'</td>'+
										'</tr>';
					    	 });
			    	  		 $('#tbody_alarm').append(string); 		
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
		    	 });
	    //获取项目下所有阀值
	     $.ajax({
		        type:'post',
			    url: 'rest/threshold/showProjectThreshold',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	if(data){
			    	  		 var string = "";
			    	  		 $.each(data,function(idx,item){
			    	  		 string += '<tr>'+
											'<td><span class="label label-primary">'+
											'<i class=""></i>'+item.detectionTypeName+'</span></td>'+
											'<td>'+item.thresholdTypeName+'</td>'+
											'<td>'+item.minThresholdValue+'</td>'+
											'<td>'+item.maxThresholdValue+'</td>'+
											'<td>'+item.minDrasticThresholdValue+'</td>'+
											'<td>'+item.maxDrasticThresholdValue+'</td>'+
										'</tr>';
					    	 });
			    	  		 $('#tbody_thresHold').append(string); 		
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
		    	 });
	    //获取项目下所有图片
        $.ajax({
		        type:'post',
			    url: 'rest/image/showProjectImage',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	if(data){
			    	  		 var string = "";
			    	  		 $.each(data,function(idx,item){
			    	  		 string += '<tr>'+
											'<td><span class="label label-primary">'+
											'<i class=""></i>'+item.detectionTypeName+'</span></td>'+
											'<td>'+
												'<img alt="未上传图片" src="'+item.heatImageUrl+'" style="height:110px; width:300px">'+
											'</td>'+
											'<td>'+
												'<img alt="未上传图片" src="'+item.physicalImageUrl+'" style="height:110px; width:300px">'+
											'</td>'+
										'</tr>';
					    	 });
			    	  		 $('#tbody_image').append(string); 		
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
		    	 });
	    //获取测点数量，传感器数量，阀值数量，图片数量。
	    /* $.ajax({
		        type:'post',
			    url: 'rest/project/obtainCount',
			    data: {projectId:projectId},
			    contextType:"application/json",
			    success: function(data){
			    	 if(data){   
				    		 $("#dd_detectionPointCont").text(data.detectionPointCount);
				    	  	 $("#dd_thresHoldCont").text(data.thresholdCount);
				    	  	 $("#dd_imageCont").text(data.imageCount);
				    	  	 $("#dd_sensorInfoCont").text(data.sensorInfoCount);
			    	  		 }else{
			    	  		  alert("数据异常");
			    	  		 }
			    	  	     },
			    	 error: function(){
			  			      alert("数据加载失败");
			  		         }
		    	 }); */
		$(document).ready(function() {
			$("#loading-example-btn").click(function() {
				btn = $(this);
				simpleLoad(btn, true);
				simpleLoad(btn, false)
			})
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
	</script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
