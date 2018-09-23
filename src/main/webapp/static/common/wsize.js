/*!
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 * 
 * 主框架窗口大小调整
 * @author ThinkGem
 * @version 2013-11-09
 */

$("#left").width(leftWidth);
$("#openCloseBtn").click(function(){
	if($("#openClose").hasClass("close")){
		$("#openClose").removeClass("close");
		$("#openClose").addClass("open");
		$("#left").animate({width:0,opacity:"hide"});
		$("#openClose").animate({left:""});
		//var curIframe = $(".curholder").children().attr("id");
		$("iframe").animate({width:($("iframe").width() + 242)});
		//$("#" + curIframe).width(($("#" + curIframe).width() + 242));

		var iframeHeight = $("#content").height();
		$("#right").animate({width:$("#content").width()-$("#openClose").width()-5},function(){
			if(typeof openCloseClickCallBack == 'function'){
				openCloseClickCallBack(true);
			}			
			wSize();			
			$(".tab_content").height(iframeHeight);
			$("#jerichotab_contentholder").height(iframeHeight);
			$("iframe").height(iframeHeight);
			$.fn.jerichoTab.resize();
		});
	}else{
		$("#openClose").addClass("close");
		$("#openClose").removeClass("open");
		$("#left").animate({width:leftWidth,opacity:"show"});
		$("#openClose").animate({left:"242px"});
		//var curIframe = $(".curholder").children().attr("id");
		$("iframe").animate({width:($("iframe").width() - 242)});
		//$("#" + curIframe).width(($("#" + curIframe).width() - 242));
		var iframeHeight = $(".content").height();
		$("#right").animate({width:$("#content").width()-$("#openClose").width()-leftWidth-9},function(){
			if(typeof openCloseClickCallBack == 'function'){
				openCloseClickCallBack(true);
			}
			wSize();
			$(".tab_content").height(iframeHeight);
			$("#jerichotab_contentholder").height(iframeHeight);
			$("iframe").height(iframeHeight);
			$.fn.jerichoTab.resize();
		});
	}
});
if(!Array.prototype.map)
	Array.prototype.map = function(fn,scope) {
	var result = [],ri = 0;
	for (var i = 0,n = this.length; i < n; i++){
	  if(i in this){
	    result[ri++]  = fn.call(scope ,this[i],i,this);
	  }
	}
	return result;
};
var getWindowSize = function(){
	return ["Height","Width"].map(function(name){
	  return window["inner"+name] ||
		document.compatMode === "CSS1Compat" && document.documentElement[ "client" + name ] || document.body[ "client" + name ];
	});
};
$(window).resize(function(){
	wSize();
});
wSize(); // 在主窗体中定义，设置调整目标