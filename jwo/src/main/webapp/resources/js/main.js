/* armataFont*/
WebFontConfig = {
 google: { families: [ 'Armata::latin' ] }
};
(function() {
 var wf = document.createElement('script');
 wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
   '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
 wf.type = 'text/javascript';
 wf.async = 'true';
 var s = document.getElementsByTagName('script')[0];
 s.parentNode.insertBefore(wf, s);
})();


/* 즐겨찾기*/
function bookmarksite(title, url){ 
	if (window.sidebar) {// firefox 
		window.sidebar.addPanel(title, url, ""); 
	}else if(window.opera && window.print){ // opera 
		var elem = document.createElement('a'); 
		elem.setAttribute('href',url); 
		elem.setAttribute('title',title); 
		elem.setAttribute('rel','sidebar'); 
		elem.click(); 
	} 
	else if(document.all){ // ie 
		window.external.AddFavorite(url, title); 
	} 
}



$(document).ready(function (){

	//이미지 롤오버
	 $(document).on('mouseover mouseout', '.ImgRollOver',function(event) {
	  if (event.type == 'mouseover') {
	   var src = $(this).attr("src");
	   $(this).attr("src", src.replace("_n", "_o"));
	  } else {
	   var src = $(this).attr("src");
	   $(this).attr("src", src.replace("_o", "_n"));
	  }
	 });
		
});

function endsWith(str, suffix) {
	return str.indexOf(suffix, str.length - suffix.length) !== -1; 
}

//인풋배경이미지제어
function inputBgImg(obj,clz,over){
	    if(over == 'over'){
			$(obj).removeClass(clz);    
		}
		else	{	
			if(!$(obj).val().length > 0){            
				$(obj).addClass(clz); 
			}
		}
}




function Pop_close()

{

	$("#layer_pop").hide();    

}


$(window).scroll(function(){
	
	if($("#locationWrap").hasClass("fixed")){
		
		if($(this).scrollTop() < 60){
			$("#locationWrap").removeClass("fixed");
		}
	}else{
		if($(this).scrollTop() > 60){
			$("#locationWrap").addClass("fixed");
		}
	}
});


/* flash */	
function flash_show(name,src,width,height, id){
	flashVars = '';
	wmode = 'transparent';
	altText = $('#'+id).html();
	if(!altText) altText = "";
	var str = '' +
	'<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,115,0" width="' + width + '" height="' + height + '" id="' + name + '">' +
		'<param name="movie" value="' + src + '" />' +
		'<param name="wmode" value="' + wmode + '" />' +
		'<param name="FlashVars" value="' + flashVars + '" />' +
		'<!--[if !IE]>-->' +
		'<object type="application/x-shockwave-flash" data="' + src + '" width="' + width + '" height="' + height + '" name="' + name + '">' +
			'<param name="wmode" value="' + wmode + '" />' +
			'<param name="FlashVars" value="' + flashVars + '" />' +
		'<!--<![endif]-->' +
			altText +
		'<!--[if !IE]>-->' +
		'</object>' +
		'<!--<![endif]-->' +
	'</object>';
	document.write(str);
}
