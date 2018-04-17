
var cocharbubble="true";
var co_data;

function lodingbgin(){
//	var _this = $(this);//将当前的pimg元素作为_this传入函数
    // imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
    var src = "assets/img/loding1.gif";//获取当前点击的pimg元素中的src属性
    $("#bigimg").attr("src", src);//设置#bigimg元素的src属性

        /*获取当前点击图片的真实大小，并显示弹出层及大图*/
    $("<img/>").attr("src", src).load(function(){
        var windowW = $(window).width();//获取当前窗口宽度
        var windowH = $(window).height();//获取当前窗口高度
        var realWidth = this.width;//获取图片真实宽度
        var realHeight = this.height;//获取图片真实高度
        var imgWidth, imgHeight;
        var scale = 0.8;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放

        if(realHeight>windowH*scale) {//判断图片高度
            imgHeight = windowH*scale;//如大于窗口高度，图片高度进行缩放
            imgWidth = imgHeight/realHeight*realWidth;//等比例缩放宽度
            if(imgWidth>windowW*scale) {//如宽度扔大于窗口宽度
                imgWidth = windowW*scale;//再对宽度进行缩放
            }
        } else if(realWidth>windowW*scale) {//如图片高度合适，判断图片宽度
            imgWidth = windowW*scale;//如大于窗口宽度，图片宽度进行缩放
                        imgHeight = imgWidth/realWidth*realHeight;//等比例缩放高度
        } else {//如果图片真实高度和宽度都符合要求，高宽不变
            imgWidth = realWidth;
            imgHeight = realHeight;
        }
                $( "#bigimg").css("width",imgWidth);//以最终的宽度对图片缩放

        var w = (windowW-imgWidth)/2;//计算图片与窗口左边距
        var h = (windowH-imgHeight)/2;//计算图片与窗口上边距
        $("#innerdiv").css({"top":h, "left":w});//设置#innerdiv的top和left属性
        $("#outerdiv").fadeIn("fast");//淡入显示#outerdiv及.pimg
    });
}

$("#cobutton").click(function(){
	cocharbubble=$("#cobutton").val();
	if(cocharbubble=="false"){
		$("#cobutton").attr("value","true");
		$("#cobutton").text("打开气泡");
	}else{
		$("#cobutton").attr("value","false");
		$("#cobutton").text("关闭气泡");
	}
	
	method_chart(co_data);
});


var clickType="button";
var dateRange='';
$('#selectdata').change(function(){
	dateRange = $(this).val();
	clickType="select";
	dataAjax()
});

$('#btnSearchstatic').click(function(){
	clickType="button";
	dataAjax()
});

$('#btnSearchstatic').trigger('click');

function dataAjax(){
	$("#loadgif").hide();
	
	lodingbgin();
	
	
	$.ajax({
		type:'post',
	  	  	url: 'rest/statistiCchart/dataAnalysis.gzip',
//	  	  	headers : {'Accept-Encoding' : 'gzip'}, 
	  	  	data: {projectId:$('#projectId').text(),begin:$("#startCreateTime").val(),end:$("#endCreateTime").val(),dateRange:dateRange,clickType:clickType},
	  	    dataType: 'json',
	  	  	success: function(data){
	  	  		co_data=data;
	  	  		method_chart(data);
	  	  	
	  	  	},
	  	  	error: function(){
	  	  		alert('数据加载失败');
	  	  		$("#outerdiv").fadeOut("fast");
	  	  		chart.hideLoading();
	  	  	}
	    });	
	
//	$("#loadgif").show();
}

function method_chart(data){
//		console.log(data)
		$("#rowstatistic").empty();
		$(data['detectionList']).each(function(index,value){
			if(data[value.detectionTypeName].length<=0){
				alert(value.detectionTypeName+"没有数据");
				$("#outerdiv").fadeOut("fast");
			}else{
			$(data[value.detectionTypeName+'1']).each(function(ind,val){
				var label="<div class='col-sm-12' id='"+val+"'><div class='ibox float-e-margins'><div class='ibox-title' style='text-align: center;'><h5>"+val+"("+(value.detectionTypeName)+")</h5><div class='btn-group' ></div></div><div class='ibox-content'><div class='echarts' id='"+val+(value.detectionTypeName)+"' style='height: 360px'></div></div></div></div>";
				$("#rowstatistic").append(label);
				var chart = echarts.init(document.getElementById(val+value.detectionTypeName));
				chart.showLoading();
				var selected = {};//设置测点数据加载时是否显示
				var displacementlegen = [];//legend属性中的data数据，添加测点个数
				var displacementSeries = [];
				
				$(data[value.detectionTypeName]).each(function(index_d,value_d){
					displacementlegen.push(value_d.detectionName);
					if(index_d>1){
						selected[value_d.detectionName]=false;
					}
					var displacementData = [];
					
					/*应付领导的代码*/
					var currentData1=0;
					var total1=0;
					var speedChange1=0;
					var currentLaserChange1=0;
					/*应付领导的代码*/
					
					
					$(value_d.universalDataList).each(function(index_data,value_data){
	  					var datas = [];
	  					var temper=value_data.currentTimes;
	  					var dt = new Date(temper.substring(0,4),temper.substring(5,7)-1,temper.substring(8,10),temper.substring(11,13),temper.substring(14,16),temper.substring(17,19));
	  					datas.push(dt);
	  					if(val=="实时数据"){
	  						/*零时代码*/
	  						var currentData12=value_data.currentData;
	  						if(value.detectionTypeName=="沉降"){
//	  							if(currentData12>400){
//	  								currentData12=currentData1;
//	  							}
	  							datas.push(currentData12*(-1));
	  						}else if(value.detectionTypeName=="收敛"){
	  							if(currentData12<-500){
	  								currentData12=currentData1;
	  							}
	  							datas.push(currentData12);
	  						}else{
	  							datas.push(currentData12);
	  						}
	  						currentData1=currentData12;
	  						/*零时代码*/
	  					}else if(val=="累计变化量"){
	  						/*零时代码*/
	  						var total2=value_data.totalLaserChange;
	  						if(value.detectionTypeName=="沉降"){
	  							if(total2>200){
	  								total2=total1;
	  							}
	  							datas.push(total2*(-1));
	  						}else if(value.detectionTypeName=="收敛"){
	  							if(total2<-800){
	  								total2=total1;
	  							}
	  							datas.push(total2);
	  						}else{
	  							datas.push(total2);
	  						}
	  						total1=total2;
	  						/*零时代码*/
	  						
	  					}else if(val=="变化速率"){
	  						/*零时代码*/
	  						var speedChange2=value_data.speedChange;
	  						if(value.detectionTypeName=="沉降"){
	  							if(speedChange2>1 || speedChange2<-1){
	  								speedChange2=speedChange1;
	  							}
	  							datas.push(speedChange2*(-1));
	  						}else if(value.detectionTypeName=="收敛"){
	  							if(speedChange2<-800){
	  								speedChange2=speedChange1;
	  							}
	  							datas.push(speedChange2);
	  						}else{
	  							datas.push(speedChange2);
	  						}
	  						speedChange1=speedChange2;
	  						/*零时代码*/
	  						
	  					}else if(val=="单次变化量"){
	  						/*零时代码*/
	  						var currentLaserChange2=value_data.currentLaserChange;
	  						if(value.detectionTypeName=="沉降"){
	  							if(currentLaserChange2>500 || currentLaserChange2<-500){
	  								currentLaserChange2=currentLaserChange1;
	  							}
	  							datas.push(currentLaserChange2*(-1));
	  						}else if(value.detectionTypeName=="收敛"){
	  							if(currentLaserChange2>400 || currentLaserChange2<-400){
	  								currentLaserChange2=currentLaserChange1;
	  							}
	  							datas.push(currentLaserChange2);
	  						}else{
	  							datas.push(currentLaserChange2);
	  						}
	  						currentLaserChange1=currentLaserChange2;
	  						/*零时代码*/
	  						
	  					}
	  					displacementData.push(datas);
					});
	  				if(cocharbubble=="true"){
	  					var displacementpoint ={name: value_d.detectionName, type: 'line',symbol:'circle',showAllSymbol: true,data: displacementData,markPoint : {data : [ {type : 'max',name : '最大值'}, {type : 'min',name : '最小值'} ]}, formatter : function (params){return params.name+'<br>'+params } };
	  				}else{
	  					var displacementpoint ={name: value_d.detectionName, type: 'line',symbol:'circle',showAllSymbol: true,data: displacementData};
	  				}
	  				displacementSeries.push(displacementpoint);
				});
				
	  			var displacement = {
	  					tooltip : {
				        trigger: 'axis',
				        formatter : function (params) {
				            var date = new Date(params.value[0]);
				            var minute = date.getMinutes();
				            var seconds = date.getSeconds();
				            var hours = date.getHours();
				            var year= date.getFullYear();
				            var month =date.getMonth()+1 ;
			                var day = date.getDate(); 
			                if(month<10){
			                	month='0'+month;
			                }
			                if(day<10){
			                	day='0'+day;
			                }
				            if(minute<10){
				            	minute='0'+minute;
				            }
				            if(seconds<10){
				            	seconds='0'+seconds;
				            }
				            if(hours<10){
				            	hours='0'+hours;
				            }
				            data =year+'-'+month+'-'+day+' '+ hours  + ':'
				                   + minute+':'+seconds;
				            return '测点名称：'+params[0]+'<br/>'+'时间：'+data + '<br/>'
				                   + '实时数据：'+params.value[1]
				        },
				        position:function(p){   //其中p为当前鼠标的位置
				            return [p[0] -50, p[1] - 50];
				        }
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    dataZoom: {
				        show: true,
				        start : 90
				    },
				    legend : {
				    	selected:selected,
				        data : displacementlegen
				    },
				    grid: {
				        y2: 80
				    },
				    xAxis : [
				        {
				            type : 'time',
				            splitNumber:10
				        }
				    ],
				    yAxis : [
			            {
				            type : 'value',
				            axisLabel : {
				                formatter: '{value} mm'
				            },
				            splitArea : { // 分隔区域
								show : true, // 默认不显示，属性show控制显示与否
								areaStyle : { // 属性areaStyle（详见areaStyle）控制区域样式
									color : [ 'rgba(250,250,250,0.3)', 'rgba(200,200,200,0.3)' ]
								}
							}
				        }
				    ],
				    series : displacementSeries
				                    
				};
	  			chart.clear();
	  			chart.setOption(displacement);
			window.addEventListener('resize',function(){
				chart.resize();
		    });//表格自适应
			chart.hideLoading();
			
			
	  		});
			}
	  	});
		$("#outerdiv").fadeOut("fast");
	
}
