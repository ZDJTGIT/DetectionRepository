
demo = {
		
	/* 百度地图 */
	initAMap : function() {
		var map = new BMap.Map("mapContent", {
			mapType : BMAP_SATELLITE_MAP
		}); // 创建地图实例
		var point = new BMap.Point(112.59, 28.12); // 创建点坐标
		if(null!=indexmapzoom){
			map.centerAndZoom(indexmapcenter, indexmapzoom);
		}else {
			map.centerAndZoom(point, 5); // 初始化地图，设置中心点坐标和地图级别
		}
		map.clearOverlays();// 清空原来的标注
		map.enableScrollWheelZoom();

		var icon = new BMap.Icon('assets/img/tit.png', new BMap.Size(22, 32), {// 是引用图标的名字以及大小，注意大小要一样
			anchor : new BMap.Size(10, 30)
		// 这句表示图片相对于所加的点的位置
		});
		
		
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
		var infoWindow;// 信息窗口
		
		$(homeMapjsonObjss).each(function(index,val){
			var marker = new BMap.Marker(new BMap.Point(homeMapjsonObjss[index].projectLongitude,homeMapjsonObjss[index].projectLatitude), {
				icon : icon
			});
			marker.addEventListener("click", function(){
				var url = "rest/graph_echarts_slope";
				var indexAarry = $(".J_menuTabs").find('a');
				var isTrue = true;
				$(indexAarry).each(function(index,val){
					if((val+" ").indexOf(url)>=0){
						isTrue = false;
						if (!$(indexAarry[index]).hasClass('active')) {
	                        $(indexAarry[index]).addClass('active').siblings('.J_menuTab').removeClass('active');
	                        $.get(url, function(data) {
	                            $('#content-main').html(data);
	                        });
	                    }
					}
				});
				
				//如果没有当前选项卡
				if(isTrue){
					 var str = '<a href="'+url+'" class="active J_menuTab">' + homeMapjsonObjss[index].projectName + ' <i class="fa fa-times-circle"></i></a>';
		                $('.J_menuTab').removeClass('active');
		                $.get(url, function(data) {
		                    $('#content-main').html(data);
		                });
		                // 添加选项卡
		                $('.J_menuTabs .page-tabs-content').append(str);
				}
				//保存地图比例和中心坐标
				indexmapzoom=map.getZoom();
				indexmapcenter=map.getCenter();
			});
			
			map.addOverlay(marker);// 添加标注
			marker.addEventListener("onmouseover", function() {
				lng = marker.getPosition().lng; // 获取marker的位置经度
				lat = marker.getPosition().lat;// 获取纬度
				var opts = {
					enableAutoPan : true,
					width : 120, // 信息窗口宽度
					height : 90, // 信息窗口高度
					title : homeMapjsonObjss[index].projectName // 信息窗口标题
				}
				var datainfo = "经度:" + lng + ", 纬度" + lat + "边坡信息......";
				infoWindow = new BMap.InfoWindow(datainfo, opts); // 创建信息窗口对象
				this.openInfoWindow(infoWindow); // 打开信息窗口
			});
			// 移开关闭信息窗口
			marker.addEventListener("mouseout", function() {
				this.closeInfoWindow(infoWindow);
			});
			
		});
		
		
		
	},
	
	
	
	showNotification : function(from, align, type, message) {
		$.notify({
				icon : "ti-gift",
				message : message
			},
			{
				type : type,
				timer : 4000,
				placement : {
					from : from,
					align : align
				}
			}
		);
	}

}
