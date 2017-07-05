/*更换背景图*/
//页面等比缩放
/*window.addEventListener("resize",setRemSize,false);
function setRemSize(){
    var _clientWidth=document.documentElement.clientWidth/19.2+"px";
    document.documentElement.style.fontSize=_clientWidth;
}
setRemSize();*/
var t = n = 0, count;
$(function(){
    count=$(".banner_info_box .banner_info").length;
    $(".banner_info_box .banner_info:first-child").show(2000);
    var url=$(".banner_info_box .banner_info").attr("src");
    var url1920=$(".banner_info_box .banner_info").attr("src1920");
    resetbg(url,url1920);
    $("#fouse li").click(function() {
        var i = $(this).text() - 1;//获取Li元素内的值，即1，2，3，4
        n = i;
        if (i >= count) return;
        resetbg($(this).attr("src"),$(this).attr("src1920"));
        $(".banner_info_box .banner_info").filter(":visible").hide().parent().children().eq(i).show(2000);
        $(this).toggleClass("active");
        $(this).siblings().removeAttr("class");
    });

    t = setInterval("showAuto()", 6000);
    $("#fouse li").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 6000);});

});

function showAuto(){
    n = n >=(count - 1) ? 0 : ++n;
    $("#fouse li").eq(n).trigger('click');
}
function resetbg(url_val,url_val1920){
    var screen_width = $(window).width();
    var img1440 = "url("+url_val+")",img1920 = "url("+url_val1920+")";
    (screen_width<=1440) ? $("body").css("background-image",img1440):$("body").css("background-image",img1920);
}

/*function resetbg(n){
    var screen_width = $(window).width();
    var img1440 = "url(themes/simplebootx/Public/assets/images/new/banner1440_"+n+".png)",img1920 = "url(__TMPL__Public/assets/images/new/banner1920_"+n+".png)";
    (screen_width<=1440) ? $("body").css("background-image",img1440):$("body").css("background-image",img1920);
}*/