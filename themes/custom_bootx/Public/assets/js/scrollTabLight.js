(function($){
		$.fn.scrollTabLight=function(options){
			return this.each(function(){
				var defaults={
					childItem:"li",//高亮的节点
					attribute: "data-href",
					highlight:"current",//高亮节点添加的类名
					buffer:0,//距离节点的距离
					concelFlag:true,//当超过节点时是否取消高亮
					container:window,
				}
				var opts=$.extend({}, defaults, options),
				obj=$(this),
				buffer=opts.buffer,
				highlight=opts.highlight,
				childItem=opts.childItem,
				attribute=opts.attribute,
				$con=$(opts.container),
				$w=$(window);				
		        var resizeTimer,navOffsetTop,t,item = obj.find(childItem),i = 0,len = item.length,wrap = [],anchor = [],listOffsetHeight=[],listOuterHeight=[];
					for(;i<len;i++){
						anchor.push(item.eq(i).attr(attribute)); //获取需要高亮的所有节点
					}
		        	
		        setTimeout(getNavHeight, 100);      
		        $con.on("scroll", function() {
			        	clearTimeout(t);
			        	t=setTimeout(onScroll,100);
					});			
					// 当发现调整屏幕大小时，重新执行代码
				$con.on("resize", function() {
					clearTimeout(resizeTimer);
					resizeTimer = setTimeout(getNavHeight, 100);
				});
				obj.find("li").click(function(){
					var index=$(this).index();
					$("html,body").animate({
						scrollTop: listOffsetHeight[index]
					}, 300);
					
				})
		        function onScroll(){
		        	var listLen=listOffsetHeight.length;
		        	var winTop=Math.floor($w.scrollTop());
		        	if( winTop>=navOffsetTop){
		        		obj.addClass("navFixed")
		        	}else{
		        		obj.removeClass("navFixed")
		        	}
		        	for(var i=0;i<listLen;i++){
		        		for(var j=0;j<listLen;j++){
		        			if(winTop>=listOffsetHeight[i]&&winTop<=listOffsetHeight[i]+listOuterHeight[i]){
		        				obj.find("li").removeClass(highlight).eq(i).addClass(highlight);
		        			}else if($w.height()+winTop==$("body").outerHeight()){
		        				obj.find("li").removeClass(highlight).eq(listLen-1).addClass(highlight);
		        			}else if(winTop==0){
		        				obj.find("li").removeClass(highlight).eq(0).addClass(highlight);
		        			}
		        		}
		        	}
		        	
		        }
		        function getNavHeight(){
			        listOffsetHeight=[];
			        listOuterHeight=[];
		            navOffsetTop=Math.floor(obj.offset().top);
		         	navOuterHeight=Math.floor(obj.outerHeight());
		        	
		        	for(var i=0;i<len;i++){
		        		listOffsetHeight.push(Math.floor($(anchor[i]).offset().top)-2*navOuterHeight);
		        		listOuterHeight.push(Math.floor($(anchor[i]).outerHeight()));
		        	}     
		        	console.log(navOffsetTop+"   "+navOuterHeight+"   "+listOffsetHeight+"   "+listOuterHeight)
		        	
		       }
			})
		}
	})(jQuery)