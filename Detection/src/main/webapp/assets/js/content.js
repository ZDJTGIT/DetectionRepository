var $parentNode = window.parent.document;

function $childNode(name) {
    return window.frames[name]
}

// tooltips
$('.tooltip-demo').tooltip({
    selector: "[data-toggle=tooltip]",
    container: "body"
});

// 使用animation.css修改Bootstrap Modal
$('.modal').appendTo("body");

$("[data-toggle=popover]").popover();

//折叠ibox
$('.collapse-link').click(function () {
    var ibox = $(this).closest('div.ibox');
    var button = $(this).find('i');
    var content = ibox.find('div.ibox-content');
    content.slideToggle(200);
    button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
    ibox.toggleClass('').toggleClass('border-bottom');
    setTimeout(function () {
        ibox.resize();
        ibox.find('[id^=map-]').resize();
    }, 50);
});

//关闭ibox
$('.close-link').click(function () {
    var content = $(this).closest('div.ibox');
    content.remove();
});

//判断当前页面是否在iframe中
/*if (top == this) {
    var gohome = '<div class="gohome"><a class="animated bounceInUp" href="index.html?v=4.0" title="返回首页"><i class="fa fa-home"></i></a></div>';
    $('body').append(gohome);
}*/

//animation.css
function animationHover(element, animation) {
    element = $(element);
    element.hover(
        function () {
            element.addClass('animated ' + animation);
        },
        function () {
            //动画完成之前移除class
            window.setTimeout(function () {
                element.removeClass('animated ' + animation);
            }, 2000);
        });
}

//拖动面板
function WinMove() {
    var element = "[class*=col]";
    var handle = ".ibox-title";
    var connect = "[class*=col]";
    $(element).sortable({
            handle: handle,
            connectWith: connect,
            tolerance: 'pointer',
            forcePlaceholderSize: true,
            opacity: 0.8,
        })
        .disableSelection();
};

//单文件上传 (uploadBtn:选择图片按钮id  url:上传url  showImg:预览展示的img的id  showError:展示错误信息的p标签的id  confirmBtn:确认提交上传按钮id)
function uploadSingleImage(uploadBtn, url, imageId, showImg, showError, confirmBtn){
	var files, tmpIndex;	
	var upload = layui.upload;		
	var uploadObject = upload.render({
		elem: uploadBtn,
		url: url+imageId,
		accept: 'images',
		size : 800,
		auto: false,
		bindAction:confirmBtn,
		//选择文件的回调函数
		choose: function(obj){
			if(tmpIndex){			
				delete files[tmpIndex]; //删除对应的文件
			}		
			//将每次选择的文件追加到文件队列
		    files = obj.pushFile();
//		    $.each(files, function(idx, item1) {
//		        console.log(idx+":"+item1.name);
//		    });
			//预读本地文件示例，不支持ie8
			obj.preview(function(index, file, result){				
				tmpIndex = index;
				$(showImg).attr('src', result); //图片链接（base64）
			});
		},
		//文件上传前的回调函数
		before: function(obj){
			if(!$.isEmptyObject(files)){
				layer.load(2, {
					shade: [0.1,'#fff'] //0.1透明度的白色背景
			    });	
			}
		},
		//上传成功回调函数
		done: function(res, index, upload){
			//如果上传成功
			if(res.code == 0){
				$('#h'+imageId).attr('src', res.data);
//				if(res.data){
//					$('#h'+imageId).parent().next().find('a').text('重新上传');
//				}
				delete files[index]; //删除对应的文件
			}else{
				return layer.msg(res.msg);
			}
			//加载完成后隐藏loading提示
           	layer.closeAll('loading');
		},
		//上传失败回调函数
		error: function(){
			//演示失败状态，并实现重传
			var demoText = $(showError);
			demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini single-demo-reload">重试</a>');
			demoText.find('.single-demo-reload').on('click', function(){
				uploadObject.upload();
			});
			//加载完成后隐藏loading提示
			layer.closeAll('loading');
		}
	});			
}

//多文件上传 (uploadBtn:选择图片按钮id   url:上传url   confirmBtn:确认提交上传按钮id  allUploadDone:全部上传成功的回调函数)
function uploadMultipleImage(uploadBtn, url, confirmBtn, allUploadDone){
	console.log(url);
	var files;
	var upload = layui.upload;		
	var uploadObject = upload.render({
		elem: uploadBtn,
		url: url,
		accept: 'images',
		size : 800,
		multiple: true,
		auto: false,
		bindAction:confirmBtn,
		choose: function(obj){
			//将每次选择的文件追加到文件队列
			files = obj.pushFile();
			//预读本地文件示例，不支持ie8
			obj.preview(function(index, file, result){	
				console.log(index);
				if($('#demoList tr').length >= 5){
					layer.msg("暂时只支持上传5张图片！");
					delete files[index]; //删除对应的文件
					return false;
				}
				var tr = $(['<tr id="upload-'+ index +'">'
				            ,'<td><img class="layui-upload-img" src="'+result+'" style="height:110px; width:300px"></td>'
				            ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
				            ,'<td>等待上传</td>'
				            ,'<td>'
//				              ,'<button class="layui-btn layui-btn-mini multiple-demo-reload layui-hide">重传</button>'
				              ,'<button class="layui-btn layui-btn-mini layui-btn-danger multiple-demo-delete">删除</button>'
				            ,'</td>'
				          ,'</tr>'].join(''));
				//单个重传
//		        tr.find('.multiple-demo-reload').on('click', function(){
//		          obj.upload(index, file);
//		        });
		        
		        //删除
		        tr.find('.multiple-demo-delete').on('click', function(){
		          delete files[index]; //删除对应的文件
		          tr.remove();
		        });		       		
		        
		        $('#demoList').append(tr);
			});
		},
		//文件上传前的回调函数
		before: function(obj){
			if(!$.isEmptyObject(files)){
				layer.load(2, {
					shade: [0.1,'#fff'] //0.1透明度的白色背景
			    });
			}
		},
		//上传成功回调函数
		done: function(res, index, upload){
			if(res.code == 0){ //上传成功
		        var tr = $('#demoList').find('tr#upload-'+ index)
		        ,tds = tr.children();
		        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
		        tds.eq(3).html(''); //清空操作
		        delete files[index]; //删除文件队列已经上传成功的文件
		    }else{
		    	this.error(index, upload);
		    	delete files[index]; //删除文件队列已经上传失败的文件
		    }
			//如果队列中没有文件，则更改数据库路径
			if($.isEmptyObject(files)){
				if(allUploadDone){
			    	allUploadDone();
			    }
				//加载完成后隐藏loading提示
				layer.closeAll('loading');
			}
		},		
		//上传失败回调函数
		error: function(index, upload){					
			var tr = $('#demoList').find('tr#upload-'+ index)
		      ,tds = tr.children();
		      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
//		      tds.eq(3).find('.multiple-demo-reload').removeClass('layui-hide'); //显示重传
		      delete files[index]; //删除文件队列已经上传失败的文件
		    //如果队列中没有文件，则更改数据库路径
			if($.isEmptyObject(files)){			
				//加载完成后隐藏loading提示
				layer.closeAll('loading');
			}
		}
	});			
}
