//
////bt淡出淡入；
//function danru(){
//	var i=0;
//	$(function(){
//		$(".span_box").click(function(){
//			$("#div_box").toggleClass("hide_div_box");
//            $(".fti").toggleClass("hide_fti");
//            $(".ft").toggle();
//            $(".active").toggleClass("hide_active");
//            $(".active_bg").toggleClass("hide_active_bg");
//            $("#mydiv").toggleClass("hide_mydiv");
//		});
//
////		$("#ul").mouseover(function(){
////			  $(".span_box").show();
////			     $(".span_box").click(function(){
////			     	i++;
////			     	if(i==1){
////		               $("#div_box").css({"width":"65px","overflow":"hidden"});
////		               $(".fti").css({"margin": "3px -10px 20px -10px"});
////		               $(".ft").hide();
////		               $(".active").css("height","51px");
////		               $(".active_bg").css({"width":"100%","height":"50px"});
////	               $("#mydiv").css({"position": "relative","left":"-160px","width":"110%", "transition": ".3s"});
////		            }
////			     	if(i==2){
////			       	 	i=0;
////			            $("#div_box").css({"width":"243px","overflow":"hidden"});
////			            $(".ft").show()
////			            $(".fti").css({"margin": "0px 10px 0px 0px"})
////			            $("#mydiv").css({"position": "relative","left":"0px","width":"100%", "transition": ".3s"});
////			     	}
////	            })
////		}).mouseout(function(){
////////			 $(".span_box").hide();
////		})
//	})
//}

$(function() {
	var Index = (function() {
		var me = {};

        // 处理一级菜单点击
        me.handleMenuClick = function() {
            $('#page-sidebar-menu > li').click(function(e) {
                var menu = $('#page-sidebar-menu');
                var li = menu.find('li.active').removeClass('active').addClass("active_bg");
                // 添加选中 打开的样式
                $(this).removeClass('active_bg').addClass('active');
            });
        };

        // 处理子菜单点击
        me.handleSubMenuClick = function() {
            $('#page-sidebar-menu li a').click(function(e) {
                e.preventDefault();
                var url = this.href;
                if (url != null && url.indexOf('#farmland') <= 0) {
                    $.get(url, function(data) {
                        $('#main-content').html(data);
                    });
                }
            });
        };

        me.init = function() {
            me.handleMenuClick();
            me.handleSubMenuClick();
        };

        return me;
    })();

    Index.init();

    $('#btn-home').trigger("click");

});

//处理侧边栏折叠
function danru(index){
	if(index==1){
		$("#div_box").css({"width":"65px","overflow":"hidden"});
		$(".fti").css({"margin": "3px -10px 20px -10px"});
		$(".ft").hide();
		$(".active").css("height","51px");
		$(".active_bg").css({"width":"100%","height":"50px"});
		$("#main-content").css({"position": "relative","left":"-160px","width":"110%", "transition": ".3s"});
		$("#span_box_1").hide();
		$("#span_box_2").show();
	}
	if(index==2){
	 	i=0;
	 	$("#div_box").css({"width":"243px","overflow":"hidden"});
	 	$(".ft").show()
	 	$(".fti").css({"margin": "0px 10px 0px 0px"})
	 	$("#main-content").css({"position": "relative","left":"0px","width":"100%", "transition": ".3s"});
	 	$("#span_box_2").hide();
	 	$("#span_box_1").show();
	}
}
