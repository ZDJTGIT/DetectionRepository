demo = {

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
		$.notify({
				icon : "ti-gift",
				message : "Welcome to <b>Paper Dashboard</b> - a beautiful freebie for every web developer."
			},
			{
				type : type[color],
				timer : 4000,
				placement : {
					from : from,
					align : align
				}
			}
		);
	}

}
