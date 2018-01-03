$.namespace = function() {  
	var a = arguments, o = null, i, j, d;    
	for (i = 0; i < a.length; i++) {        
		d = a[i].split("."); o = window;        
		for (j = 0;j < d.length; j++) {            
			o[d[j]] = o[d[j]] || {};            
			o = o[d[j]];        
        }    
    }    
    return o;
};
//console对象为firefox,谷歌等浏览器的专有对象，为适应IE下的代码调试增加此段代码,避免JS报错
if(window.console == undefined){
	window.console = {};
	console.log = function(value){
		//alert("console.log =>" + value);
	};
}

//新产品名称空间
var $zd = $.namespace('zdjc');
zdjc.mmp = function(){
	alert('mmp');
}
/**
 * 统一封装AJAX的处理
 * @param opt，包括ajaxType,url,data,dataType,asyncFlag...
 * @param cbfun 成功获取后的回调函数，可为空，此函数适应于异步获取数据
 * @param fmtfun 对于数组类型的返回值作格式化处理
 * @param retype in ('object','array','') 返回值的数据类型，可以是object--{}对象,array--[]数组,''--则表示基本的数据类型，比如字符，数字，boolean等
 */
/**
 * 统一封装AJAX的处理
 * @param opt，包括ajaxType,url,data,dataType,asyncFlag...
 * @param cbfun 成功获取后的回调函数，可为空，此函数适应于异步获取数据
 * @param fmtfun 对于数组类型的返回值作格式化处理
 * @param retype in ('object','array','') 返回值的数据类型，可以是object--{}对象,array--[]数组,''--则表示基本的数据类型，比如字符，数字，boolean等
 */
zdjc.ajax = function(opt,retype,fmtfun,cbfun,erfun){
	opt = opt || {}; var rs ;
	opt.async = opt.async === true ? true : false;
	
	if(opt.url){
		$.ajax({
			type     : opt.ajaxType === 'get'  || opt.ajaxType === 'GET' ? 'get' : 'post',
			url      : opt.url,
			data     : opt.data || null,
			dataType : opt.dataType || "json",	
			//async    : opt.async === true ? true : false,
			async    : opt.async,
			//不允许使用缓存
			cache : false,
			success  :  function(result) {
				if(opt.prompt){
					swal({
							title: "太帅了",
				            text: "小手一抖就成功了",
				            type: "success",
		                    confirmButtonColor: "#A7D5EA",
		                    confirmButtonText: "OK",
		                }, function () {
		                	$.isFunction(opt.success) ? opt.success.call(true):'';
		                	
		                });
				}
				
				
				rs = result//.outEntity;
					
			},
			beforeSend : function(XMLHttpRequest, textStatus){
				
			},
			error : $.isFunction(opt.error) ? opt.error : function(XMLHttpRequest, textStatus, errorThrown){
				swal({
	                    title: "操作失败",
	                    text: "添加失败，请尝试重新操作",
	                    type: "error"
	                });
			}
		});
	}
	
	//如果是同步请求，则返回结果
	if(opt.async === false){
		return rs;
	}else{
		return null;
	}
	
	/**
	 * 内部函数
	 */
	function resolveErrorCode(result,dataType){
		var errorCode = "";
		if(dataType == "json"){
			 errorCode = result != null ?  result.errorCode : "";
		}else if(dataType == "html"){
			if(result.indexOf("success") != -1 && result.indexOf("success") != -1){
				errorCode = result.substring(result.indexOf("errorCode")+12,result.indexOf("errorCode")+19);
			}
		}else{
			 errorCode = result != null ?  result.errorCode : "";
		}
		errorCode = errorCode||"";
		return errorCode;
	}
};

zdjc.myPall = (function($) {       
	kc=function(){
		alert('I am kc()');
	},
	createPagingDage=function(id){
		if(!$('#'+id)){
			alert(id+"该层不存在");
			return;
			
		}
		var htmls = ' <div class="modal fade" id="myModal_updetaMMp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">'+
		
		 '<form id="form_updetaProject"> '+
		
		  '<div class="modal-dialog" role="document">'+
		    '<div class="modal-content">'+
		     ' <div class="modal-header" id='+'xx'+'>'+
		     ' <h4 class="modal-title" id="myModalLabel_updetaProject">选择mmp</h4>'+
		     ' </div>'+
		      '<div class="modal-body"'+" id ='mmp'>"+				
		      '</div>'+
		      '<div class="modal-footer">'+
		        '<button type="button" id="offUpdetammp"  class="btn btn-default" data-dismiss="modal">关闭</button>'+	 
		        '  <button type="button" class="btn btn-primary sureAddProject_addmmp" >提交</button>'+
		      '</div>'+
		    '</div>'+
		    '</from>'
		  '</div>';
		 $('#'+id).html(htmls);
		 
		 
	},
	loadPagingDage=function(opt){
		var allHtml = '';
		var html = '';
		var divId=1;
		var maxlength=0;
		var projectId = opt.projectId_parm;
		var htmlBodyTyp = opt.htmlBodyTyp_parm;
		var checkArray =[];
		var htmlLiTopTypArray = opt.htmlLiTopTypArray_parm;
		 $('#mmp').html(html);	
		 var statistiCchart   = $zd.ajax({
			 url:'rest/statistiCchart/allDataByProjectId',
			 data:{projectId:projectId}
		 });
		$.each(htmlLiTopTypArray,function(j,jtem){
			 var htmlStar =	'<table ><caption class="mmptd">'+'<span class="label label-default mmpclass">'+j+'</span></caption><tr>';
			
			 var htmlBody='' ;
			 var isAll = true;
			 $.each(htmlBodyTyp,function(k,kitem){
				 maxlength=maxlength>kitem.length?maxlength:kitem.length;
				 $.each(statistiCchart,function(t,tem){		
					 var str = tem.attributes//attributes			
					if(tem.detectionTypeName==j && str.indexOf(kitem)>-1){
						isAll = false;

						return false;
					}else{
						isAll = true
					}									
						
					});
				 var temp = kitem.length;
					
				 for(var i=0;i<maxlength-temp;i++){
					 kitem+='&nbsp&nbsp&nbsp';
				 }
				 if(isAll){
					
					
					 htmlBody +=
							"<td ><div class='checkbox checkbox-success checkbox-inline'>"+
							"<input name='tale_basic_checkbox' type='checkbox' class='temp1' id='"+divId+"'>"+
							"<label id='mylabel"+divId+"' for='"+divId+"' >"+kitem+"</label>"+
							"</div></td>";
					
					
				 }else {
					 htmlBody +=
							"<td ><div class='checkbox checkbox-success checkbox-inline'>"+
							"<input name='tale_basic_checkbox' type='checkbox' class='temp' id='"+divId+"'>"+
							"<label id='mylabel"+divId+"' for='"+divId+"' >"+kitem+"</label>"+
							"</div></td>";
					 checkArray.push(divId);
					 
				 }
				 console.log(checkArray);
				 if(divId%2==0){
					 
					 htmlBody+='</tr>'
				 }else if(maxlength%2!=0 && k==maxlength-1){
					 htmlBody+="<td ><div>"+"</div></td>";
				 }
				 divId++;
			 })
			 
				
			 var htmlEnd =
	 		
				"</table>"+			 
			    '</div>';
		 allHtml += htmlStar +htmlBody+htmlEnd;
		
		 });
		 $('#mmp').html(allHtml);
		
		 $.each(checkArray,function(x,t){
				$('#'+t).attr("checked",true);
				$('#'+t).attr("disabled","disabled");
			 });
		 
	},
	addClick=function(){
		//各页签对应得点击事件
		$('#myModal').on('click', '.sureAddProject_addmmp', function(e){
			var allopt=[];
			var objArry=[];
			var opt={};
			var allPoit='';
			var projectId1 ='';
			var commit =false;
			var statistiCchart ='';
			$('#mmp>table>').each(function(j,jtem){
				
				var target='';
				
			if($(this).attr('class')=='mmptd'){
				 target =$(this).text();					
				opt.projectId =htmlLiTopTypArray[target].projectId //项目ID--6
				opt.detectionTypeId=htmlLiTopTypArray[target].detectionTypeId;
				opt.detectionTypeName=htmlLiTopTypArray[target].itemName;
				  statistiCchart   = $zd.ajax({
					 url:'rest/statistiCchart/allDataByProjectId',
					 data:{projectId:opt.projectId}
				 });
				
			}else{
				
				$(this).find('input').each(function(){
					
					if($(this).is(':checked')){
						
						var id = $(this).attr('id');
						objArry.push($('#mylabel'+id).html());
					}
					
				});
				$.each(objArry,function(i,item){
					if(i==objArry.length-1) allPoit+=item.split('&')[0]
					else  allPoit+=item.split('&')[0]+',' ;
				});
				opt.attributes=allPoit;				
				if(j%2==1 ){
					
					
					 if(statistiCchart.length!=0 && statistiCchart!=undefined){
						 $.each(statistiCchart,function(o,otem){
							
							 if(otem.detectionTypeId==opt.detectionTypeId){
								 if(otem.attributes==opt.attributes){
									 console.log(otem.attributes);
									 console.log(opt.attributes);
									 commit=true;
								 }else{
									 commit=false;
								 }
								 opt.statisticChartId=otem.statisticChartId;
								
								 return false;
							 }else{
								 commit=true;
							 }
						 });
						 if(!commit){
							 $zd.ajax({
								 url:'rest/statistiCchart/updateByPrimaryKeySelective',
								 data:opt,
								 success:function(){		
						            $("#offUpdetammp").trigger("click");			               						
								 },
								 prompt:true
							 });
						 }else{
							
							 $zd.ajax({
								 url:'rest/statistiCchart/insertStatisticChart',
								 data:opt,
								 success:function(){	
						            $("#offUpdetammp").trigger("click");			               						
								 },
								 prompt:true
							 });		
						 }
						
					 }else{
						 
							$zd.ajax({
								 url:'rest/statistiCchart/insertStatisticChart',
								 data:opt,
								 success:function(){	
						            $("#offUpdetammp").trigger("click");			               						
								 },
								 prompt:true
							 });
							
					 }
					opt={};
					allopt=[];
					objArry=[];
					allPoit='';
				}
			}
				
			
			});
			

			
		});
	}
	return {
		mykc:function(){
			alert()
			kc();
		},
		createPagingDage:function(id){//生产面板
			createPagingDage(id);
		},
		loadPagingDage:function(opt){//动态加载面板
			loadPagingDage(opt);
		},
		addClick:function(){
			addClick();
		}
	}
	})(jQuery);    