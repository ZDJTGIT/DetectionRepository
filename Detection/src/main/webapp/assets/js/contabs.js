
$(function () {

    //计算元素集合的总宽度
    function calSumWidth(elements) {
        var width = 0;
        $(elements).each(function () {
            width += $(this).outerWidth(true);
        });
        return width;
    }
    //滚动到指定选项卡
    function scrollToTab(element) {
        var marginLeftVal = calSumWidth($(element).prevAll()), marginRightVal = calSumWidth($(element).nextAll());
        // 可视区域非tab宽度
        var tabOuterWidth = calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
        //可视区域tab宽度
        var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".page-tabs-content").outerWidth() < visibleWidth) {
            scrollVal = 0;
        } else if (marginRightVal <= (visibleWidth - $(element).outerWidth(true) - $(element).next().outerWidth(true))) {
            if ((visibleWidth - $(element).next().outerWidth(true)) > marginRightVal) {
                scrollVal = marginLeftVal;
                var tabElement = element;
                while ((scrollVal - $(tabElement).outerWidth()) > ($(".page-tabs-content").outerWidth() - visibleWidth)) {
                    scrollVal -= $(tabElement).prev().outerWidth();
                    tabElement = $(tabElement).prev();
                }
            }
        } else if (marginLeftVal > (visibleWidth - $(element).outerWidth(true) - $(element).prev().outerWidth(true))) {
            scrollVal = marginLeftVal - $(element).prev().outerWidth(true);
        }
        $('.page-tabs-content').animate({
            marginLeft: 0 - scrollVal + 'px'
        }, "fast");
    }

    // 左移按扭 查看左侧隐藏的选项卡
    $('.J_tabLeft').click(function(){
    	var marginLeftVal = Math.abs(parseInt($('.page-tabs-content').css('margin-left')));
        // 可视区域非tab宽度
        var tabOuterWidth = calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
        //可视区域tab宽度
        var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".page-tabs-content").width() < visibleWidth) {
            return false;
        } else {
            var tabElement = $(".J_menuTab:first");
            var offsetVal = 0;
            while ((offsetVal + $(tabElement).outerWidth(true)) <= marginLeftVal) {//找到离当前tab最近的元素
                offsetVal += $(tabElement).outerWidth(true);
                tabElement = $(tabElement).next();
            }
            offsetVal = 0;
            if (calSumWidth($(tabElement).prevAll()) > visibleWidth) {
                while ((offsetVal + $(tabElement).outerWidth(true)) < (visibleWidth) && tabElement.length > 0) {
                    offsetVal += $(tabElement).outerWidth(true);
                    tabElement = $(tabElement).prev();
                }
                scrollVal = calSumWidth($(tabElement).prevAll());
            }
        }
        $('.page-tabs-content').animate({
            marginLeft: 0 - scrollVal + 'px'
        }, "fast");
    });

    // 右移按扭 查看右侧隐藏的选项卡
    $('.J_tabRight').click(function(){
    	var marginLeftVal = Math.abs(parseInt($('.page-tabs-content').css('margin-left')));
        // 可视区域非tab宽度
        var tabOuterWidth = calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
        //可视区域tab宽度
        var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".page-tabs-content").width() < visibleWidth) {
            return false;
        } else {
            var tabElement = $(".J_menuTab:first");
            var offsetVal = 0;
            while ((offsetVal + $(tabElement).outerWidth(true)) <= marginLeftVal) {//找到离当前tab最近的元素
                offsetVal += $(tabElement).outerWidth(true);
                tabElement = $(tabElement).next();
            }
            offsetVal = 0;
            while ((offsetVal + $(tabElement).outerWidth(true)) < (visibleWidth) && tabElement.length > 0) {
                offsetVal += $(tabElement).outerWidth(true);
                tabElement = $(tabElement).next();
            }
            scrollVal = calSumWidth($(tabElement).prevAll());
            if (scrollVal > 0) {
                $('.page-tabs-content').animate({
                    marginLeft: 0 - scrollVal + 'px'
                }, "fast");
            }
        }
    });

    //给每一个导航项，添加对应的选项卡以及显示对应的内容
    $('body').on('click', '.J_menuItem', function(e) {
        e.preventDefault();
        var url = this.href;
        menuName = $.trim($(this).text());
        flag = true;
        if (url != null && url.indexOf('javascript:;') < 0) {

        	var supMenu = $(this);
        	if($(supMenu).hasClass("secondMenu")){
        		$.ajax({url:url,dataType:"json",success:function(data){
        			$.each(data,function(idx,item){
        				var labelItem = '<li class="dropdown"><a class="dropdown-toggle thirdMenu J_menuItem" data-toggle="dropdown" href="rest/sensor/'+item.projectId+'"><i class="fa fa-columns"></i><span class="nav-label">'+item.projectName+'</span><span class="fa arrow"></span></a><ul class="nav nav-four-level dropdown-menu"></ul></li>';
        				$(supMenu).next().append(labelItem);
        			});
        	    }});
        		$(supMenu).removeClass("secondMenu");
        		this.href = 'javascript:;';
        		return false;
        	}else if($(supMenu).hasClass("thirdMenu")){
        		$.ajax({url:url,dataType:"json",success:function(data){
        			$.each(data,function(idx,item){
        				var labelItem = '<li><a class="fourMenu J_menuItem" href="rest/'+item.sysDictionary.typeValue+item.sysDictionary.itemValue+'/project/'+item.projectId+'">'+item.sysDictionary.itemName+'</a><ul class="nav nav-five-level"></ul></li>';
        				$(supMenu).next().append(labelItem);
        			});
        	    }});
        		$(supMenu).removeClass("thirdMenu");
        		this.href = 'javascript:;';
        		return false;
        	}

        	// 选项卡菜单已存在
            $('.J_menuTab').each(function () {
                if (url.indexOf($(this).attr('href')) >= 0) {
                    if (!$(this).hasClass('active')) {
                        $(this).addClass('active').siblings('.J_menuTab').removeClass('active');
                        scrollToTab(this);
                        // 显示tab对应的内容区
                        $.get(url, function(data) {
                            $('#content-main').html(data);
                        });
                    }
                    flag = false;
                    return false;
                }
            });

            // 选项卡菜单不存在
            if (flag) {
                var str = '<a href="'+url+'" class="active J_menuTab">' + menuName + ' <i class="fa fa-times-circle"></i></a>';
                $('.J_menuTab').removeClass('active');

                //显示loading提示
//                var loading = layer.load();
                // 显示tab对应的内容区
                $.get(url, function(data) {
                    $('#content-main').html(data);
                    //加载完成后隐藏loading提示
//                    layer.close(loading);
                });

                // 添加选项卡
                $('.J_menuTabs .page-tabs-content').append(str);
                scrollToTab($('.J_menuTab.active'));
            }
        }
    });

    //默认打开首页
    $('#btn-home').trigger("click");

    //点击选项卡显示对应的内容
    $('.J_menuTabs').on('click', '.J_menuTab', function(e) {
    	e.preventDefault();
        var url = this.href;
        if (url != null && url.indexOf('javascript:;') < 0) {
        	if (!$(this).hasClass('active')) {
                // 显示tab对应的内容区
            	 $.get(url, function(data) {
                     $('#content-main').html(data);
                 });
                $(this).addClass('active').siblings('.J_menuTab').removeClass('active');
                scrollToTab(this);
            }
        }
    });

    // 关闭选项卡菜单
    $('.J_menuTabs').on('click', '.J_menuTab i', function(e) {

    	e.preventDefault();
        var currentWidth = $(this).parents('.J_menuTab').width();

        // 当前元素处于活动状态
        if ($(this).parents('.J_menuTab').hasClass('active')) {

            // 当前元素后面有同辈元素，使后面的一个元素处于活动状态
            if ($(this).parents('.J_menuTab').next('.J_menuTab').size()) {

                var url = $(this).parents('.J_menuTab').next('.J_menuTab:eq(0)').attr('href');
                $(this).parents('.J_menuTab').next('.J_menuTab:eq(0)').addClass('active');

                // 显示tab对应的内容区
           	 	$.get(url, function(data) {
                    $('#content-main').html(data);
                });


                var marginLeftVal = parseInt($('.page-tabs-content').css('margin-left'));
                if (marginLeftVal < 0) {
                    $('.page-tabs-content').animate({
                        marginLeft: (marginLeftVal + currentWidth) + 'px'
                    }, "fast");
                }

                //  移除当前选项卡
                $(this).parents('.J_menuTab').remove();

            }

            // 当前元素后面没有同辈元素，使当前元素的上一个元素处于活动状态
            if ($(this).parents('.J_menuTab').prev('.J_menuTab').size()) {

           	 var url = $(this).parents('.J_menuTab').prev('.J_menuTab:last').attr('href');
                $(this).parents('.J_menuTab').prev('.J_menuTab:last').addClass('active');

                // 显示tab对应的内容区
                $.get(url, function(data) {
                    $('#content-main').html(data);
                });

                //  移除当前选项卡
                $(this).parents('.J_menuTab').remove();
            }
        }
        // 当前元素不处于活动状态
        else {
            //  移除当前选项卡
            $(this).parents('.J_menuTab').remove();

            scrollToTab($('.J_menuTab.active'));
        }
        return false;
    });

    //关闭其他选项卡
    $('.J_tabCloseOther').click(function(){
    	$('.page-tabs-content').children(".J_menuTab").not(":first").not(".active").each(function () {
            $(this).remove();
        });
        $('.page-tabs-content').css("margin-left", "0");
    });

    //定位当前选项卡 滚动到已激活的选项卡
    $('.J_tabShowActive').click(function(){
    	scrollToTab($('.J_menuTab.active'));
    });

    // 关闭全部选项卡
    $('.J_tabCloseAll').click(function (){
        $('.page-tabs-content').children(".J_menuTab").not(":first").each(function () {
            $(this).remove();
        });
        $('.page-tabs-content').children(".J_menuTab:first").each(function () {
        	var url = this.href;
        	// 显示tab对应的内容区
       	 	$.get(url, function(data) {
                $('#content-main').html(data);
            });
            $(this).addClass("active");
        });
        $('.page-tabs-content').css("margin-left", "0");
    });
});

