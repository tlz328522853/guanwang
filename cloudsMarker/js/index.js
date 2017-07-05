/*更换背景图*/
//页面等比缩放
window.addEventListener("resize",setRemSize,false);
function setRemSize(){
    var _clientWidth=document.documentElement.clientWidth/19.2+"px";
    document.documentElement.style.fontSize=_clientWidth;
}
setRemSize();
function showAuto(){
    n = n >=(count - 1) ? 0 : ++n;
    $("#fouse li").eq(n).trigger('click');
}
//设置body的背景图片，根据屏幕宽度使用不同的背景图片
function resetbg(n){
    var screen_width = $(window).width();
    var img1440 = "url(images/banner1440_"+n+".png)",img1920 = "url(images/banner1920_"+n+".png)";
    (screen_width<=1440) ? $("body").css("background-image",img1440):$("body").css("background-image",img1920);
}
/*获取参数*/
function request(paras){ 
    var urlTest = location.search;
    var url = urlTest.substring(urlTest.lastIndexOf("?"));
	//var url = location.search; 
	var paraString = url.substring(url.indexOf("?")+1,url.length).split("&"); 
	var paraObj = {} 
	for (i=0; j=paraString[i]; i++){ 
	paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length); 
	} 
	var returnValue = paraObj[paras.toLowerCase()]; 
	if(typeof(returnValue)==undefined){ 
		return ""; 
	}else{ 
		return returnValue; 
	} 
}
//图片轮播
	var isNow=0;
	var moving=false;
	var timer=null;
	function slideMove(width){
		if(isNow>5){//isNow=4,显示到第3张，isNow+1,isNow=5,等于1，=1，显示第2张
			
			$(".img_ulist").css("left",0);
			isNow=1;
		}
		if(isNow<0){				
			$(".img_ulist").css("left",-5*width);//左边第一张换成右边第一张
			isNow=4;
		}
		
		//运动到第5张时切回第一张，
		moving=true;
		$(".img_ulist").animate({left:-isNow*width},"slow","linear",function(){
			moving=false;
			console.log(moving);
		});
		
		
	}
	$("#home_imgp_left").click(function(){
		if(moving==true){
			return;
		};
		var width=$(".home_imgpBox").find("li").eq(0).width();
		isNow--;
		slideMove(width);
	})
	$("#home_imgp_right").click(function(){
		if(moving==true){
			return;
		}
		isNow++;
		var width=$(".home_imgpBox").find("li").eq(0).width();
		slideMove(width);
	})
