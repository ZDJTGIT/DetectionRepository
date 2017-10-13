type = [ '', 'info', 'success', 'warning', 'danger' ];

demo = {
	initPickColor : function() {
		$('.pick-class-label').click(function() {
			var new_class = $(this).attr('new-class');
			var old_class = $('#display-buttons').attr('data-class');
			var display_div = $('#display-buttons');
			if (display_div.length) {
				var display_buttons = display_div.find('.btn');
				display_buttons.removeClass(old_class);
				display_buttons.addClass(new_class);
				display_div.attr('data-class', new_class);
			}
		});
	},

	initChartist : function() {

		var dataSales = {
			labels : [ '9:00AM', '12:00AM', '3:00PM', '6:00PM', '9:00PM',
					'12:00PM', '3:00AM', '6:00AM' ],
			series : [ [ 287, 385, 490, 562, 594, 626, 698, 895, 952 ],
					[ 67, 152, 193, 240, 387, 435, 535, 642, 744 ],
					[ 23, 113, 67, 108, 190, 239, 307, 410, 410 ] ]
		};

		var optionsSales = {
			lineSmooth : false,
			low : 0,
			high : 1000,
			showArea : true,
			height : "245px",
			axisX : {
				showGrid : false,
			},
			lineSmooth : Chartist.Interpolation.simple({
				divisor : 3
			}),
			showLine : true,
			showPoint : false,
		};

		var responsiveSales = [ [ 'screen and (max-width: 640px)', {
			axisX : {
				labelInterpolationFnc : function(value) {
					return value[0];
				}
			}
		} ] ];

		Chartist.Line('#chartHours', dataSales, optionsSales, responsiveSales);

		var data = {
			labels : [ 'Jan', 'Feb', 'Mar', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug',
					'Sep', 'Oct', 'Nov', 'Dec' ],
			series : [
					[ 542, 543, 520, 680, 653, 753, 326, 434, 568, 610, 756,
							895 ],
					[ 230, 293, 380, 480, 503, 553, 600, 664, 698, 710, 736,
							795 ] ]
		};

		var options = {
			seriesBarDistance : 10,
			axisX : {
				showGrid : false
			},
			height : "245px"
		};

		var responsiveOptions = [ [ 'screen and (max-width: 640px)', {
			seriesBarDistance : 5,
			axisX : {
				labelInterpolationFnc : function(value) {
					return value[0];
				}
			}
		} ] ];

		Chartist.Line('#chartActivity', data, options, responsiveOptions);

		var dataPreferences = {
			series : [ [ 25, 30, 20, 25 ] ]
		};

		var optionsPreferences = {
			donut : true,
			donutWidth : 40,
			startAngle : 0,
			total : 100,
			showLabel : false,
			axisX : {
				showGrid : false
			}
		};

		Chartist.Pie('#chartPreferences', dataPreferences, optionsPreferences);

		Chartist.Pie('#chartPreferences', {
			labels : [ '62%', '32%', '6%' ],
			series : [ 62, 32, 6 ]
		});
	},

	/* 百度地图 */
	initAMap : function() {
		var map = new BMap.Map("mapContent", {
			mapType : BMAP_SATELLITE_MAP
		}); // 创建地图实例
		var point = new BMap.Point(112.59, 28.12); // 创建点坐标
		map.centerAndZoom(point, 5); // 初始化地图，设置中心点坐标和地图级别
		map.clearOverlays();// 清空原来的标注
		map.enableScrollWheelZoom();


		var icon = new BMap.Icon('assets/img/tit.png', new BMap.Size(20, 32), {// 是引用图标的名字以及大小，注意大小要一样
			anchor : new BMap.Size(10, 30)
		// 这句表示图片相对于所加的点的位置
		});

		var marker = new BMap.Marker(new BMap.Point(100.26, 26.49), {
			icon : icon
		});
		marker.addEventListener("click", attribute);
		map.addOverlay(marker);// 添加标注

		map.enableContinuousZoom(); // 启用地图惯性拖拽，默认禁用
		map.addControl(new BMap.NavigationControl()); // 添加默认缩放平移控件
		map.addControl(new BMap.OverviewMapControl()); // 添加默认缩略地图控件
		map.addControl(new BMap.OverviewMapControl({
			isOpen : true,
			anchor : BMAP_ANCHOR_BOTTOM_RIGHT
		})); // 右下角，打开
		map.addControl(new BMap.ScaleControl());
		map.addControl(new BMap.MapTypeControl());
		var lng;// 经度
		var lat;// 纬度
		// 获取标注经纬度
		function attribute() {
			alert("marker的位置是" + lng + "," + lat);
		}

		var infoWindow;// 信息窗口
		marker.addEventListener("onmouseover", function() {
			lng = marker.getPosition().lng; // 获取marker的位置经度
			lat = marker.getPosition().lat;// 获取纬度
			var opts = {
				enableAutoPan : true,
				width : 120, // 信息窗口宽度
				height : 90, // 信息窗口高度
				title : "云南丽江金沙" // 信息窗口标题
			}
			var datainfo = "经度:" + lng + ", 纬度" + lat + "边坡信息......";
			infoWindow = new BMap.InfoWindow(datainfo, opts); // 创建信息窗口对象
			this.openInfoWindow(infoWindow); // 打开信息窗口
		});
		// 移开关闭信息窗口
		marker.addEventListener("mouseout", function() {
			this.closeInfoWindow(infoWindow);
		});
	},

	showNotification : function(from, align) {
		color = Math.floor((Math.random() * 4) + 1);

		$
				.notify(
						{
							icon : "ti-gift",
							message : "Welcome to <b>Paper Dashboard</b> - a beautiful freebie for every web developer."

						}, {
							type : type[color],
							timer : 4000,
							placement : {
								from : from,
								align : align
							}
						});
	},
	initDocumentationCharts : function() {
		// init single simple line chart
		var dataPerformance = {
			labels : [ '6pm', '9pm', '11pm', '2am', '4am', '8am', '2pm', '5pm',
					'8pm', '11pm', '4am' ],
			series : [ [ 1, 6, 8, 7, 4, 7, 8, 12, 16, 17, 14, 13 ] ]
		};

		var optionsPerformance = {
			showPoint : false,
			lineSmooth : true,
			height : "200px",
			axisX : {
				showGrid : false,
				showLabel : true
			},
			axisY : {
				offset : 40,
			},
			low : 0,
			high : 16,
			height : "250px"
		};

		Chartist.Line('#chartPerformance', dataPerformance, optionsPerformance);

		// init single line with points chart
		var dataStock = {
			labels : [ '\'07', '\'08', '\'09', '\'10', '\'11', '\'12', '\'13',
					'\'14', '\'15' ],
			series : [ [ 22.20, 34.90, 42.28, 51.93, 62.21, 80.23, 62.21,
					82.12, 102.50, 107.23 ] ]
		};

		var optionsStock = {
			lineSmooth : false,
			height : "200px",
			axisY : {
				offset : 40,
				labelInterpolationFnc : function(value) {
					return '$' + value;
				}

			},
			low : 10,
			height : "250px",
			high : 110,
			classNames : {
				point : 'ct-point ct-green',
				line : 'ct-line ct-green'
			}
		};

		Chartist.Line('#chartStock', dataStock, optionsStock);

		// init multiple lines chart
		var dataSales = {
			labels : [ '9:00AM', '12:00AM', '3:00PM', '6:00PM', '9:00PM',
					'12:00PM', '3:00AM', '6:00AM' ],
			series : [ [ 287, 385, 490, 562, 594, 626, 698, 895, 952 ],
					[ 67, 152, 193, 240, 387, 435, 535, 642, 744 ],
					[ 23, 113, 67, 108, 190, 239, 307, 410, 410 ] ]
		};

		var optionsSales = {
			lineSmooth : false,
			low : 0,
			high : 1000,
			showArea : true,
			height : "245px",
			axisX : {
				showGrid : false,
			},
			lineSmooth : Chartist.Interpolation.simple({
				divisor : 3
			}),
			showLine : true,
			showPoint : false,
		};

		var responsiveSales = [ [ 'screen and (max-width: 640px)', {
			axisX : {
				labelInterpolationFnc : function(value) {
					return value[0];
				}
			}
		} ] ];

		Chartist.Line('#chartHours', dataSales, optionsSales, responsiveSales);

		// pie chart
		Chartist.Pie('#chartPreferences', {
			labels : [ '62%', '32%', '6%' ],
			series : [ 62, 32, 6 ]
		});

		// bar chart
		var dataViews = {
			labels : [ 'Jan', 'Feb', 'Mar', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug',
					'Sep', 'Oct', 'Nov', 'Dec' ],
			series : [ [ 542, 443, 320, 780, 553, 453, 326, 434, 568, 610, 756,
					895 ] ]
		};

		var optionsViews = {
			seriesBarDistance : 10,
			classNames : {
				bar : 'ct-bar'
			},
			axisX : {
				showGrid : false,

			},
			height : "250px"

		};

		var responsiveOptionsViews = [ [ 'screen and (max-width: 640px)', {
			seriesBarDistance : 5,
			axisX : {
				labelInterpolationFnc : function(value) {
					return value[0];
				}
			}
		} ] ];

		Chartist.Bar('#chartViews', dataViews, optionsViews,
				responsiveOptionsViews);

		// multiple bars chart
		var data = {
			labels : [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug',
					'Sep', 'Oct', 'Nov', 'Dec' ],
			series : [
					[ 542, 543, 520, 680, 653, 753, 326, 434, 568, 610, 756,
							895 ],
					[ 230, 293, 380, 480, 503, 553, 600, 664, 698, 710, 736,
							795 ] ]
		};

		var options = {
			seriesBarDistance : 10,
			axisX : {
				showGrid : false
			},
			height : "245px"
		};

		var responsiveOptions = [ [ 'screen and (max-width: 640px)', {
			seriesBarDistance : 5,
			axisX : {
				labelInterpolationFnc : function(value) {
					return value[0];
				}
			}
		} ] ];

		Chartist.Line('#chartActivity', data, options, responsiveOptions);

	}

}
