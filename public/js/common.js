// JavaScript Document
window.onload=function(){
	banner();
    nav();

//下拉列表
$(".show-box span").click(function(event){
	   $(".frideshop ul").hide();
	$(".text-down").slideToggle("slow");
	event.stopPropagation(); 
	});
   $(".text-down li").click(function(){
	     var txt=$(this).text();
	     $(".show-box span").text($(this).text());
		 $(".text-down").hide();
})
//友情链接下拉
$(".frideshop span").click(function(event){
	$(".text-down").hide();
	$(".frideshop ul").slideToggle("slow");
	event.stopPropagation(); 
});
   $(".frideshop ul li").click(function(){
	     var txt=$(this).text();
	     $(".frideshop span").text($(this).text());
		 $(".frideshop ul").hide();
		
});
   
   $(document).click(function(){
	   $(".frideshop ul").hide();
	   $(".text-down").hide();
   });
   

//投诉下拉
$(".inputeselect span").click(function(){
	$(".inputeselect ul").slideToggle("slow");
	});
   $(".inputeselect ul li").click(function(){
	     var txt=$(this).text();
	     $(".inputeselect span").text($(this).text());
	     if(txt=="投诉"){
	    	  $(".inputeselect input").val('1');
	     }else if(txt=="建议"){
	    	 $(".inputeselect input").val('2');
	     }
	     
	   
		 $(".inputeselect ul").hide();
})

/*//省市下拉
$(".inputeselect1 span").click(function(){
	$(".inputeselect1 ul").slideToggle("slow");
	});
   $(".inputeselect1 ul li").click(function(){
	     var txt=$(this).text();
	     $(".inputeselect1 span").text($(this).text());
		 $(".inputeselect1 ul").hide();
})

//省市下拉
$(".inputeselect2 span").click(function(){
	$(".inputeselect2 ul").slideToggle("slow");
	});
   $(".inputeselect2 ul li").click(function(){
	     var txt=$(this).text();
	     $(".inputeselect2 span").text($(this).text());
		 $(".inputeselect2 ul").hide();
})*/
//二级菜单hover
var _index1=$(".conNaw ul li.current").index();
	  $(".conNaw ul li").mouseenter(function(){
	  $(this).addClass("current").siblings().removeClass("current");;
	}).mouseleave(function(){
	  $(this).removeClass("current");
	  $(".conNaw ul li").eq(_index1).addClass("current");

})

}
//导航
function nav() {
    var i = $(".naw>ul>li.on").index();
    $(".naw li").bind("mouseenter", function () {
        $(this).addClass("on");
        $(this).siblings().removeClass("on");
        $(this).children(".subnav").stop(true, true).slideDown();
    });

    $(".naw li").bind("mouseleave", function () {
        $(this).removeClass("on");
        $(this).children(".subnav").stop(true, true).slideUp();
    });

    if (i > 0 || i == 0) {
        $(".naw li").bind("mouseleave", function () {
            $(".naw li").eq(i).addClass("on");
        });
    };
};

/*大banner*/
function banner(){	
	var bn_id = 0;
	var bn_id2= 1;
	var speed33=5000;
	var qhjg = 1;
    var MyMar33;
	$("#banner .d1").hide();
	$("#banner .d1").eq(0).fadeIn("slow");
	if($("#banner .d1").length>1)
	{
		$("#banner_id li").eq(0).addClass("nuw");
		function Marquee33(){
			bn_id2 = bn_id+1;
			if(bn_id2>$("#banner .d1").length-1)
			{
				bn_id2 = 0;
			}
			$("#banner .d1").eq(bn_id).css("z-index","2");
			$("#banner .d1").eq(bn_id2).css("z-index","1");
			$("#banner .d1").eq(bn_id2).show();
			$("#banner .d1").eq(bn_id).fadeOut("slow");
			$("#banner_id li").removeClass("nuw");
			$("#banner_id li").eq(bn_id2).addClass("nuw");
			bn_id=bn_id2;
		};
	
		MyMar33=setInterval(Marquee33,speed33);
		
		$("#banner_id li").click(function(){
			var bn_id3 = $("#banner_id li").index(this);
			if(bn_id3!=bn_id&&qhjg==1)
			{
				qhjg = 0;
				$("#banner .d1").eq(bn_id).css("z-index","2");
				$("#banner .d1").eq(bn_id3).css("z-index","1");
				$("#banner .d1").eq(bn_id3).show();
				$("#banner .d1").eq(bn_id).fadeOut("slow",function(){qhjg = 1;});
				$("#banner_id li").removeClass("nuw");
				$("#banner_id li").eq(bn_id3).addClass("nuw");
				bn_id=bn_id3;
			}
		})
		$("#banner_id").hover(
			function(){
				clearInterval(MyMar33);
			}
			,
			function(){
				MyMar33=setInterval(Marquee33,speed33);
			}
		)	
	}
	else
	{
		$("#banner_id").hide();
	}
}