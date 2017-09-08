
//bt淡出淡入；
function danru(){
	$(function(){
		$("#ul").mouseover(function(){	
//		  $(".span_box").show();
		      var i=0;
			     $(".span_box").click(function(){
			     	i++;
			     	if(i==1){
		               $("#div_box").css({"width":"65px","overflow":"hidden"});
		               $(".fti").css({"margin": "3px -10px 20px -10px"});
		               $(".ft").hide();
		               $(".active").css("height","51px");
		               $(".active_bg").css({"width":"100%","height":"50px"});
	               $("#mydiv").css({"position": "relative","left":"-160px","width":"110%", "transition": ".3s"});
		            }
			     	if(i==2){
			       	 	i=0;
			            $("#div_box").css({"width":"243px","overflow":"hidden"});
			            $(".ft").show()
			            $(".fti").css({"margin": "0px 10px 0px 0px"})
			            $("#mydiv").css({"position": "relative","left":"0px","width":"100%", "transition": ".3s"});
			     	}
	            })
		
		        
		   }).mouseout(function(){
//			 $(".span_box").hide();
		})
	})
}

 