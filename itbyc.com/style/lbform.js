$(function(){
    function tabs(tabTit,on,tabCon){
	$(tabCon).each(function(){
	  $(this).children().eq(0).show();
	  });
	$(tabTit).each(function(){
	  $(this).children().eq(0).addClass(on);
	  });
     $(tabTit).children().hover(function(){
        $(this).addClass(on).siblings().removeClass(on);
         var index = $(tabTit).children().index(this);
         $(tabCon).children().eq(index).show().siblings().hide();
    });
     }
   tabs(".tab-hd","active",".tab-bd");
	$('.homesbox:odd').addClass('ml6');
	 
	 
 
  $('.navbox li.level').mousemove(function(){
    $(this).find('ul').slideDown();//you can give it a speed
	$(this).addClass('navclass');
  });
  $('.navbox li.level').mouseleave(function(){
    $(this).find('ul').slideUp("fast");
	$(this).removeClass('navclass');
  });

});

function CheckAll(form,cheOrclear)
	{		
		var ische = cheOrclear;
		for (var i=0;i<form.elements.length;i++)  //用来历遍form中所有控件,
		{
			var e = form.elements[i];
			if (e.Type="checkbox")					//当是checkbox时才执行下面
			{
				if(ische==1)
				{
					if(!e.checked)						//当是checkbox未被选取时才执行下面
					{
						e.checked=true;					
					}
				}
				else if(ische==8)
				{	
					e.checked=false;
				}
				else
				{
					if(!e.checked)						//当是checkbox未被选取时才执行下面
					{
						e.checked=true;		
					}
					else
					{
						e.checked=false;
					}
							
				}
			}
		}
	}

function ranArray(n)
{
	var a,r,l=n.length,x,d=new Array(l);
	for(x=l-1;x>=0;x--)
	{
		r=Math.floor(Math.random()*(x+1));
		d[x]=n[r];
		n[r]=n[x];
	}
	return d;
}
function SelectRandAll(form){
	var k=[];
	for(var i=0;i<form.elements.length;i++){
		var e = form.elements[i];
		e.checked = false;
		k[i]=i;
	}
	var newform=ranArray(k);
	var l=[];
	for (var i=0;i<newform.length && i<form.elements.length/2;i++){
		l[i]=newform[i];
		var e = form.elements[newform[i]];
		e.checked = true;
	}
	MusicPlay(form)
}

function MusicPlay(form){
var newurl="";
var doc=form;
var k=0
	for (var i=0;i<doc.t.length;i++)
	{
		var e = form.elements[i];
		if (e.name == 't')
		{
			if (e.checked==false)
			{
			}
			else
			{
				newurl=newurl+e.value+","; //+"_"+u;
				k=k+1;
			}
		}
	}
	
	if(newurl==""){
	alert('请您选择后再播放');
	}else{
	     if(k>100){
	         alert('您只能连播100首歌')
	     }else{
		window.open("bofang/play5445.html?id="+newurl,'t');
	     }
        }

	return false;
}



function ck(id){

var newurl="";
var doc="form";
var e = myform.elements[id-1];
if (e.checked==false)
{
	e.checked=true;
}
else
{
	e.checked=false;
}
	return false;
}