$(".form  img").click(function(){
	$(this).attr("src", "vcode.jpg?" + new  Date().getTime());
});