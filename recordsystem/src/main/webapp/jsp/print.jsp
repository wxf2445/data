<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmtutc" uri="/tags/utcdate" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="<c:url value="/resources/js/excanvas.js"/>"></script>
        <title></title>
        <style>
        	body{
        		margin: 0px 0px;
        		background:#F0F0F0;
        	}
        	button{ 
        			height:32px;
				} 
        </style>
        
<script src="<c:url value='/resources/js/sonic.js'/>"></script>
    <script src="<c:url value='/resources/charisma-master/js/jquery-1.12.1.min.js'/>"></script>
<script>
var operation_type = "", divv_left=0,divv_top=0; 
var origin_canvas,origin_image,image_scare=1;
var isDone = true;
function getMousePos(canvas, evt) {
    var rect = canvas.getBoundingClientRect();
    return {
          x:(evt.clientX-rect.left),
          y:(evt.clientY-rect.top)
    };

}
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
    var r = window.location.search.substr(1).match(reg); 
    if (r != null) return unescape(r[2]); return null; 
}
function openImage(){
	var image = new Image();
	//var image_src = encodeURI(encodeURI(getQueryString("url")));
	var image_src = getQueryString("url");
	var image_srcs = image_src.split('.');
	if(image_srcs[image_srcs.length-1].toLowerCase()=='pdf')
		image.src = "<c:url value='/file/getPicture'/>?filepath="+image_src+"&pagenum="+getQueryString("pagenum");
	else
		image.src = "<c:url value='/file/openfile'/>?n=true&filepath="+image_src;
	image.onload = function(){
		var canvas = document.getElementById("myCanvas");
		if(image.width/document.body.offsetWidth>0.8){
			image_scare = (screen.availWidth*0.8)/image.width;
		}
		canvas.width = image.width*image_scare;
		canvas.height = image.height*image_scare;
		//canvas.getContext("2d").drawImage(image, 0, 0);   
	    canvas.getContext("2d").drawImage(image,0,0,canvas.width,canvas.height);

		var canvas2 = document.getElementById("myCanvas2");
		if(image.width/document.body.offsetWidth>0.8){
			image_scare = (screen.availWidth*0.8)/image.width;
		}
		canvas2.width = image.width*image_scare;
		canvas2.height = image.height*image_scare;
		//canvas.getContext("2d").drawImage(image, 0, 0);   
	    canvas2.getContext("2d").drawImage(image,0,0,canvas.width,canvas.height);
	    
		document.getElementById("img").src = image.src;
		
		origin_image = image;
		origin_canvas = document.createElement("canvas");
		origin_canvas.width = image.width;
		origin_canvas.height = image.height;
		origin_canvas.getContext("2d").drawImage(image, 0, 0);   
			
		divv_left = document.getElementById("myCanvas").offsetLeft;
		divv_top = document.getElementById("divv").offsetTop;
		
		setTimeout('cancelLoading()',image.width*5+4000);
	}
}
function buttonInit(){
	document.getElementById("cutDiv").style.background = "";
	document.getElementById("cutDiv").style.border = "";
	document.getElementById("cutDiv").style.color = "";
	document.getElementById("canvasPencil").style.background = "";
	document.getElementById("canvasPencil").style.border = "";
	document.getElementById("canvasPencil").style.color = "";
}
function canvasPencil(this_){
	if(!isDone)return;
	document.getElementById("canvasPencil").style.background = "#898989";
	document.getElementById("canvasPencil").style.color = "#fff";
	document.getElementById("canvasPencil").style.border = "#898989 1px solid";
	document.getElementById("cutDiv").style.background = "";
	document.getElementById("cutDiv").style.border = "";
	document.getElementById("cutDiv").style.color = "";
	//document.getElementById("myCanvas").style.cursor = "url('image/pencil.png'),default";
/* 	canvas_div.style.width = "0px";
	canvas_div.style.height =  "0px";
	canvas_div.style.display = "none"; */
	operation_type = "pencil";
}
function cutDiv(){
	if(!isDone)return;
	document.getElementById("cutDiv").style.background = "#898989";
	document.getElementById("cutDiv").style.border = "#898989 1px solid";
	document.getElementById("cutDiv").style.color = "#fff";
	document.getElementById("canvasPencil").style.background = "";
	document.getElementById("canvasPencil").style.border = "";
	document.getElementById("canvasPencil").style.color = "";
	//document.getElementById("myCanvas").style.cursor = "url('image/div.png'),default";
	operation_type = "cut";
}
function myPrint(){
	//var t_img,isLoad = false; 

    var canvas = document.getElementById("myCanvas2");
/* 	if(last_x==0){
		canvas = document.getElementById("myCanvas2");
	} */

    preImage(canvas.toDataURL("image/png"),function(){  
	     var newWindow=window.open("","_blank");
	     newWindow.document.write('<img src="'+this.src+'"/>');
	     newWindow.document.close();
	     newWindow.print();
	     newWindow.close();
    });  
    
    function preImage(url,callback){  
        var img = new Image(); //创建一个Image对象，实现图片的预下载  
        img.src = url;  
        
       if (img.complete) { // 如果图片已经存在于浏览器缓存，直接调用回调函数  
            callback.call(img);  
           return; // 直接返回，不用再处理onload事件  
        }  
     
        img.onload = function () { //图片下载完毕时异步调用callback函数。  
            callback.call(img);//将回调函数的this替换为Image对象  
        };  
   }  
    
/*     var image = new Image();
    image.onload = function(){
    	isLoad = true;
    }
    
    image.src = canvas.toDataURL("image/png"); */
    /* var div = document.getElementById("target1");
    div.innerHTML = "";
    div.appendChild(image); */
    /* checkfunction(isLoad);
	function checkfunction(){
		if(isLoad){
	        clearTimeout(t_img); 
		
		     var newWindow=window.open("","_blank");
		     //var docStr = div.innerHTML;
		     newWindow.document.write('<img src="'+image.src+'"/>');
		     newWindow.document.close();
		     newWindow.print();
		     newWindow.close();
	  }else{
	        t_img = setTimeout(function(){
	             checkfunction()// 递归扫描
	        },500); // 我这里设置的是500毫秒就扫描一次，可以自己调整
	    }
	} */
    
}

window.onload = function(){
	openImage();
	loading();
	
	var canvas_div = document.getElementById("canvas_div");
	var cut_div = document.getElementById("cut_div");
	var canvas = document.getElementById("myCanvas");
	//var cans = canvas.getContext("2d"); 
	var last_x = 0, last_y = 0 ,locked = 0,last_xx = 0,last_yy = 0;
	var start_x = 0,start_y = 0;
	canvas.addEventListener('mousedown', function(evt) {
		if(operation_type=="")return;

		canvas_div.style.display = "";
   		canvas_div.style.width = "0px";
   		canvas_div.style.height =  "0px";
	   	var mousePos = getMousePos(canvas, evt);
	   	locked = 1;
   		if(operation_type=="cut"){
   	    	canvas_div.style.display = "none";
   			cut_div.style.display = "";
   			cut_div.style.width = "0px";
   			cut_div.style.height =  "0px";
   			
   	    	cut_div.style.left = (mousePos.x + divv_left)+"px";
   	    	cut_div.style.top = (mousePos.y + divv_top)+"px";
   	    	last_x = mousePos.x;
   	    	last_y = mousePos.y;
   		}else if(operation_type=="pencil"){
   			canvas_div.style.left = (mousePos.x+divv_left)+"px";
   			canvas_div.style.top = (mousePos.y + divv_top)+"px";
   			start_x = mousePos.x;
   			start_y = mousePos.y;
   		}
    });
	canvas.addEventListener('mouseup', function(evt) {
		if(operation_type=="")return;
		if(operation_type=="pencil"){
			operation_type="";
	    	/*locked = 0;
			document.getElementById("img").src=canvas.toDataURL("image/png");*/
			locked = 0;
	    	//is_down = true;
	    	var mousePos = getMousePos(canvas, evt);
    		if(mousePos.x<start_x||mousePos.y<start_y)
    			return;
	    	var canvas_div_width = (mousePos.x - start_x );
	    	var canvas_div_height = (mousePos.y - start_y );
      		var context = canvas.getContext("2d");
      		context.beginPath(); 
            context.fillStyle = 'white';
            context.fillRect(start_x,start_y,canvas_div_width,canvas_div_height);
            context.closePath();
            context.stroke();

			document.getElementById("img").onload=function(){
				var origin_canvas_cxt = origin_canvas.getContext('2d');
				origin_canvas_cxt.fillStyle = 'white';
				origin_canvas_cxt.fillRect(start_x/image_scare,start_y/image_scare,canvas_div_width/image_scare,canvas_div_height/image_scare);
				origin_image.onload = function(){
					operation_type="pencil";
				}
				origin_image.src = origin_canvas.toDataURL("image/png");
			}
			document.getElementById("img").src=canvas.toDataURL("image/png");
			if(last_xx!=0){
		    	var imageObj = new Image();
		    	imageObj.src = canvas.toDataURL("image/png");
		    	var canvas_div_width = (last_xx - last_x + 1 );
		    	var canvas_div_height = (last_yy - last_y + 1);
				var context = canvas2.getContext('2d');
				context.drawImage(imageObj, last_x, last_y, canvas_div_width,canvas_div_height, 0, 0, canvas_div_width,canvas_div_height);
			}else{

				document.getElementById("myCanvas2_div").innerHTML = "";
				canvas2 = document.createElement("canvas");
				canvas2.setAttribute("id","myCanvas2");
				canvas2.width = canvas.width;
				canvas2.height = canvas.height;
		    	var imageObj = new Image();
		    	imageObj.src = canvas.toDataURL("image/png");

				var context = canvas2.getContext('2d');
				context.drawImage(imageObj, 0,0);
				
				document.getElementById("myCanvas2_div").appendChild(canvas2);
			}
		}else if(operation_type=="cut"){
	    	locked = 0;
	    	is_down = true;
	    	var mousePos = getMousePos(canvas, evt);
	    	var canvas_div_width = (mousePos.x - last_x );
	    	var canvas_div_height = (mousePos.y - last_y );
	    	
	    	var imageObj = new Image();
	    	imageObj.src = canvas.toDataURL("image/png");
	    	imageObj.onload=function(){
				document.getElementById("myCanvas2_div").innerHTML = "";
				canvas2 = document.createElement("canvas");
				canvas2.setAttribute("id","myCanvas2")
				document.getElementById("myCanvas2_div").appendChild(canvas2);
				
				var context = canvas2.getContext('2d');
				canvas2.width = canvas_div_width;
				canvas2.height = canvas_div_height;
				context.drawImage(imageObj, last_x, last_y, canvas_div_width,canvas_div_height, 0, 0, canvas_div_width,canvas_div_height);
				last_xx = mousePos.x;
				last_yy = mousePos.y;
				canvas2.style.border="1px dashed #F00";
		    	
				document.getElementById("img").src=canvas.toDataURL("image/png");
	    	}
	    	
		}
    });
	canvas.addEventListener('mousemove', function(evt) {
		if(operation_type=="")return;
		if(locked!=1)return ;
    	var mousePos = getMousePos(canvas, evt);
    	if(operation_type=="pencil"){
        	canvas_div.style.width =  (mousePos.x - start_x) +"px";
        	canvas_div.style.height =  (mousePos.y - start_y) +"px";
    	}else{
    		cut_div.style.width =  (mousePos.x - last_x) +"px";
    		cut_div.style.height =  (mousePos.y - last_y) +"px";
    	}
    	//canvas_div.innerHTML ="x:"+mousePos.x+" y:"+mousePos.y;
    });
	canvas_div.addEventListener('mousedown', function(evt) {
		if(operation_type=="")return;
    		canvas_div.style.display = "";
    		canvas_div.style.width = "0px";
    		canvas_div.style.height =  "0px";
	    	var mousePos = getMousePos(canvas, evt);
	    	locked = 1;
	   		if(operation_type=="cut"){
	   			cut_div.style.display = "";
	   			cut_div.style.width = "0px";
	   			cut_div.style.height =  "0px";

	   	    	cut_div.style.left = (mousePos.x + divv_left)+"px";
	   	    	cut_div.style.top = (mousePos.y + divv_top)+"px";
	   	    	last_x = mousePos.x;
	   	    	last_y = mousePos.y;
	   		}else if(operation_type=="pencil"){

	   			canvas_div.style.left = (mousePos.x+divv_left)+"px";
	   			canvas_div.style.top = (mousePos.y + divv_top)+"px";
	   			start_x = mousePos.x;
	   			start_y = mousePos.y;
	   		}
    });
    canvas_div.addEventListener('mouseup', function(evt) {
		if(operation_type=="")return;
		if(operation_type=="pencil"){
			operation_type="";
	    	/*locked = 0;
			document.getElementById("img").src=canvas.toDataURL("image/png");*/
			locked = 0;
	    	//is_down = true;
	    	var mousePos = getMousePos(canvas, evt);
    		if(mousePos.x<start_x||mousePos.y<start_y)
    			return;
	    	var canvas_div_width = (mousePos.x - start_x + 1);
	    	var canvas_div_height = (mousePos.y - start_y + 1);
      		var context = canvas.getContext("2d");
            context.fillStyle = 'white';
            context.fillRect(start_x,start_y,canvas_div_width,canvas_div_height);


			document.getElementById("img").onload=function(){
				var origin_canvas_cxt = origin_canvas.getContext('2d');
				origin_canvas_cxt.fillStyle = 'white';
				origin_canvas_cxt.fillRect(start_x/image_scare,start_y/image_scare,canvas_div_width/image_scare,canvas_div_height/image_scare);
				origin_image.onload = function(){
					operation_type="pencil";
				}
				origin_image.src = origin_canvas.toDataURL("image/png");
			}
			document.getElementById("img").src=canvas.toDataURL("image/png");
			if(last_xx!=0){
		    	var imageObj = new Image();
		    	imageObj.src = canvas.toDataURL("image/png");
		    	var canvas_div_width = (last_xx - last_x );
		    	var canvas_div_height = (last_yy - last_y );
				var context = canvas2.getContext('2d');
				context.drawImage(imageObj, last_x, last_y, canvas_div_width,canvas_div_height, 0, 0, canvas_div_width,canvas_div_height);
			}else{

				document.getElementById("myCanvas2_div").innerHTML = "";
				canvas2 = document.createElement("canvas");
				canvas2.setAttribute("id","myCanvas2");
				canvas2.width = canvas.width;
				canvas2.height = canvas.height;
		    	var imageObj = new Image();
		    	imageObj.src = canvas.toDataURL("image/png");

				var context = canvas2.getContext('2d');
				context.drawImage(imageObj, 0,0);
				
				document.getElementById("myCanvas2_div").appendChild(canvas2);
			}
		}else{
	    	locked = 0;
	    	//is_down = true;
	    	var mousePos = getMousePos(canvas, evt);
	    	var canvas_div_width = (mousePos.x - last_x );
	    	var canvas_div_height = (mousePos.y - last_y );
	    	
	    	var imageObj = new Image();
	    	imageObj.src = canvas.toDataURL("image/png");
	    	imageObj.onload = function(){
		    	
				document.getElementById("myCanvas2_div").innerHTML = "";
				canvas2 = document.createElement("canvas");
				canvas2.setAttribute("id","myCanvas2");
				document.getElementById("myCanvas2_div").appendChild(canvas2);
				
				var context = canvas2.getContext('2d');
				canvas2.width = canvas_div_width;
				canvas2.height = canvas_div_height;
				context.drawImage(imageObj, last_x, last_y, canvas_div_width,canvas_div_height, 0, 0, canvas_div_width,canvas_div_height);
				canvas2.style.border="1px dashed #F00";

				last_xx = mousePos.x;
				last_yy = mousePos.y;
				
				document.getElementById("img").src=canvas.toDataURL("image/png");
				
		    	cut_div.style.width =  (mousePos.x - last_x) +"px";
		    	cut_div.style.height =  (mousePos.y - last_y) +"px";
	    	};
	    }
    });
    canvas_div.addEventListener('mousemove', function(evt) {
			if(locked!=1)return ;
	    	var mousePos = getMousePos(canvas, evt);
	    	if(operation_type=="pencil"){
	        	canvas_div.style.width =  (mousePos.x - start_x) +"px";
	        	canvas_div.style.height =  (mousePos.y - start_y) +"px";
	    	}else{
	    		cut_div.style.width =  (mousePos.x - last_x) +"px";
	    		cut_div.style.height =  (mousePos.y - last_y) +"px";
	    	}
	    	
    });
    cut_div.addEventListener('mousedown', function(evt) {
		if(operation_type=="")return;
    		canvas_div.style.display = "";
    		canvas_div.style.width = "0px";
    		canvas_div.style.height =  "0px";
	    	var mousePos = getMousePos(canvas, evt);
	    	locked = 1;
	   		if(operation_type=="cut"){
	   			cut_div.style.display = "";
	   			cut_div.style.width = "0px";
	   			cut_div.style.height =  "0px";

	   	    	cut_div.style.left = (mousePos.x + divv_left)+"px";
	   	    	cut_div.style.top = (mousePos.y + divv_top)+"px";
	   	    	last_x = mousePos.x;
	   	    	last_y = mousePos.y;
	   		}else if(operation_type=="pencil"){

	   			canvas_div.style.left = (mousePos.x+divv_left)+"px";
	   			canvas_div.style.top = (mousePos.y + divv_top)+"px";
	   			start_x = mousePos.x;
	   			start_y = mousePos.y;
	   		}
    });
    cut_div.addEventListener('mouseup', function(evt) {
		if(operation_type=="")return;
		if(operation_type=="pencil"){
			operation_type="";
	    	/*locked = 0;
			document.getElementById("img").src=canvas.toDataURL("image/png");*/
			locked = 0;
	    	//is_down = true;
	    	var mousePos = getMousePos(canvas, evt);
    		if(mousePos.x<start_x||mousePos.y<start_y)
    			return;
	    	var canvas_div_width = (mousePos.x - start_x + 1);
	    	var canvas_div_height = (mousePos.y - start_y + 1);
      		var context = canvas.getContext("2d");
            context.fillStyle = 'white';
            context.fillRect(start_x,start_y,canvas_div_width,canvas_div_height);

			document.getElementById("img").onload=function(){
				var origin_canvas_cxt = origin_canvas.getContext('2d');
				origin_canvas_cxt.fillStyle = 'white';
				origin_canvas_cxt.fillRect(start_x/image_scare,start_y/image_scare,canvas_div_width/image_scare,canvas_div_height/image_scare);
				origin_image.onload = function(){
					operation_type="pencil";
				}
				origin_image.src = origin_canvas.toDataURL("image/png");
			}
			document.getElementById("img").src=canvas.toDataURL("image/png");
			
			if(last_xx!=0){
		    	var imageObj = new Image();
		    	imageObj.src = canvas.toDataURL("image/png");
		    	var canvas_div_width = (last_xx - last_x );
		    	var canvas_div_height = (last_yy - last_y );
				var context = canvas2.getContext('2d');
				context.drawImage(imageObj, last_x, last_y, canvas_div_width,canvas_div_height, 0, 0, canvas_div_width,canvas_div_height);
			}
			
		}else{
	    	locked = 0;
	    	//is_down = true;
	    	var mousePos = getMousePos(canvas, evt);
	    	var canvas_div_width = (mousePos.x - last_x );
	    	var canvas_div_height = (mousePos.y - last_y );
	    	
	    	var imageObj = new Image();
	    	imageObj.src = canvas.toDataURL("image/png");

	    	imageObj.onload = function(){
		    	
				document.getElementById("myCanvas2_div").innerHTML = "";
				canvas2 = document.createElement("canvas");
				canvas2.setAttribute("id","myCanvas2");
				document.getElementById("myCanvas2_div").appendChild(canvas2);
				
				var context = canvas2.getContext('2d');
				canvas2.width = canvas_div_width;
				canvas2.height = canvas_div_height;
				context.drawImage(imageObj, last_x, last_y, canvas_div_width,canvas_div_height, 0, 0, canvas_div_width,canvas_div_height);
				canvas2.style.border="1px dashed #F00";

				last_xx = mousePos.x;
				last_yy = mousePos.y;
				
				document.getElementById("img").src=canvas.toDataURL("image/png");
				
		    	cut_div.style.width =  (mousePos.x - last_x) +"px";
		    	cut_div.style.height =  (mousePos.y - last_y) +"px";
	    	};
	    }
    });
    cut_div.addEventListener('mousemove', function(evt) {
			if(locked!=1)return ;
	    	var mousePos = getMousePos(canvas, evt);
	    	if(operation_type=="pencil"){
	        	canvas_div.style.width =  (mousePos.x - start_x) +"px";
	        	canvas_div.style.height =  (mousePos.y - start_y) +"px";
	    	}else{
	    		cut_div.style.width =  (mousePos.x - last_x) +"px";
	    		cut_div.style.height =  (mousePos.y - last_y) +"px";
	    	}
	    	
    });
}	
    function getBigger(){
    	if(!isDone)return;
    	isDone = false;
    	loading();
    	buttonInit();
    	canvas_div.style.display = "none";
    	cut_div.style.display = "none";
    	operation_type = "";
    	image_scare = image_scare*1.1;

    	var canvas = document.getElementById("myCanvas");
		canvas.width = origin_image.width*image_scare;
		canvas.height = origin_image.height*image_scare;
		
		/* var imageObj = document.getElementById("img"); */
		var context = canvas.getContext('2d');
	    context.drawImage(origin_image,0,0,canvas.width,canvas.height);
	    
	    document.getElementById("img").onload = function(){
	    	isDone = true;
	    	cancelLoading();
	    }
		document.getElementById("img").src=canvas.toDataURL("image/png");
		
		divv_left = document.getElementById("myCanvas").offsetLeft;
		divv_top = document.getElementById("divv").offsetTop;
    }
    function getSmaller(){
    	if(!isDone)return;
    	loading();
    	buttonInit();
    	canvas_div.style.display = "none";
    	cut_div.style.display = "none";
    	operation_type = "";
    	
    	image_scare = image_scare*0.9;
    	
    	var canvas = document.getElementById("myCanvas");
		canvas.width = origin_image.width*image_scare;
		canvas.height = origin_image.height*image_scare;
		
		/* var imageObj = document.getElementById("img"); */
		var context = canvas.getContext('2d');
	    context.drawImage(origin_image,0,0,canvas.width,canvas.height);

	    document.getElementById("img").onload = function(){
	    	isDone = true;
	    	cancelLoading();
	    }
		document.getElementById("img").src=canvas.toDataURL("image/png");
		divv_left = document.getElementById("myCanvas").offsetLeft;
		divv_top = document.getElementById("divv").offsetTop;
    }
    
    function rotateImg(direction) {  
    	if(!isDone)return;
    	loading();
    	buttonInit();
    	document.getElementById("big_button").setAttribute("onclick", "");
    	document.getElementById("small_button").setAttribute("onclick", "");
    	canvas_div.style.display = "none";
    	cut_div.style.display = "none";
    	operation_type = "";
    	
        var degree = 0;  
        var img = document.getElementById('myCanvas');  
        if (img == null)return;  
        //img的高度和宽度不能在img元素隐藏后获取，否则会出错  
        var height = img.height;  
        var width = img.width;  
          
        var image = document.getElementById("img");
        var canvas = img;
        var ctx = canvas.getContext('2d');  
        ctx.translate(0,0);
        if (direction == 'left') {  
        	ctx.save();
        	degree = 270 * Math.PI / 180;
        	canvas.width = height;  
            canvas.height = width;  
            ctx.rotate(degree);  
            ctx.drawImage(image, -width, 0);  
            ctx.stroke();
            ctx.restore();
            
            document.getElementById("img").onload = function(){
                var origin_canvas_ctx = origin_canvas.getContext('2d');
                var origin_canvas_width = origin_canvas.width;
                origin_canvas.width=origin_canvas.height;
                origin_canvas.height = origin_canvas_width;

                origin_canvas_ctx.save();
                origin_canvas_ctx.translate(0,0);
                origin_canvas_ctx.rotate(degree); 

                origin_canvas_ctx.drawImage(origin_image, -origin_canvas.height, 0);  
                origin_canvas_ctx.stroke();
                origin_canvas_ctx.restore();
                origin_image.onload = function(){
                	document.getElementById("big_button").setAttribute("onclick", "getBigger()");
                	document.getElementById("small_button").setAttribute("onclick", "getSmaller()");
                	origin_image.onload = function(){};
                	document.getElementById("img").onload = function(){};
                    turnChange();
                }
                origin_image.src = origin_canvas.toDataURL("image/png");
            }
    		document.getElementById("img").src=canvas.toDataURL("image/png");
            
        } else {  
        	ctx.save();
        	degree = 90 * Math.PI / 180;
            canvas.width = height;  
            canvas.height = width;  
            ctx.rotate(degree);  
            ctx.drawImage(image, 0, -height); 
            ctx.stroke();
            ctx.restore(); 
            document.getElementById("img").onload = function(){
                var origin_canvas_ctx = origin_canvas.getContext('2d');
                var origin_canvas_width = origin_canvas.width;
                origin_canvas.width = origin_canvas.height;
                origin_canvas.height = origin_canvas_width;
                origin_canvas_ctx.save();
                origin_canvas_ctx.translate(0,0);
                origin_canvas_ctx.rotate(degree);  
                origin_canvas_ctx.drawImage(origin_image, 0, -origin_canvas.width); 
                origin_canvas_ctx.stroke();
                origin_canvas_ctx.restore(); 
                origin_image.onload = function(){
                	document.getElementById("big_button").setAttribute("onclick", "getBigger()");
                	document.getElementById("small_button").setAttribute("onclick", "getSmaller()");
                	origin_image.onload = function(){};
                	document.getElementById("img").onload = function(){};
                    turnChange();
                }
                origin_image.src = origin_canvas.toDataURL("image/png");
            }
    		document.getElementById("img").src=canvas.toDataURL("image/png");
        }  
		divv_left = document.getElementById("myCanvas").offsetLeft;
		divv_top = document.getElementById("divv").offsetTop;
    }  
     function turnChange(){
    	canvas_div.style.display = "none";
    	cut_div.style.display = "none";
    	operation_type = "";
    	
    	var canvas = document.getElementById("myCanvas");
		canvas.width = canvas.width*1;
		canvas.height = canvas.height*1;
		
		var imageObj = document.getElementById("img");
		var context = canvas.getContext('2d');
	    context.drawImage(imageObj,0,0,canvas.width,canvas.height);
    	document.getElementById("img").onload = function(){};
		document.getElementById("img").src=canvas.toDataURL("image/png");
		divv_left = document.getElementById("myCanvas").offsetLeft;
		divv_top = document.getElementById("divv").offsetTop;
		
    	cancelLoading();
    }  
    function backup(){
    	location.reload();
    }
    function addWatermark(){
    	var canvas2 = document.getElementById("myCanvas2");
		var ctx = canvas2.getContext('2d');
    	ctx.beginPath();
    	 
    	ctx.fillStyle = "rgba(0,0,0,0.3)";
    	 
    	ctx.font = "52pt Calibri";
    	ctx.textAlign = "center";

    	$.ajax({
            type: "POST",
            url: '<c:url value="/file/getwaterprint" />',
            data: {},
            success: function (result) {
            	ctx.save();
            	ctx.translate(canvas2.width/2, canvas2.height/2);
            	ctx.rotate(Math.PI/4*7);
            	ctx.fillText(result.water_print, 0, 0);
            	ctx.restore();
            	
            	/* ctx.save();
            	ctx.translate(canvas2.width/2, canvas2.height/2);
            	ctx.rotate(Math.PI/4*7);
            	ctx.fillText("档案管理", 0, 65); */
            	ctx.restore();
            }
        });
    }

    function addMark(){
    	var canvas2 = document.getElementById("myCanvas2");
		var ctx = canvas2.getContext('2d');
    	ctx.beginPath();
    	 
    	ctx.fillStyle = "rgba(0,0,0,1)";
    	 
    	ctx.font = "10pt Calibri";
    	ctx.textAlign = "center";

    	ctx.save();
    	ctx.translate(canvas2.width-80, canvas2.height-30);
    	ctx.fillText("查档人:<shiro:principal/>", 0, 0);
    	ctx.restore();
    }
        </script>
    </head>
    <body>
    <center>
		<button onclick="canvasPencil()" id="canvasPencil">遮盖框</button> 
		<button onclick="rotateImg('left')">向左旋转</button> 
		<button onclick="rotateImg('right')">向右旋转</button> 
		<button id="big_button" onclick="getBigger()">放大</button> 
		<button id="small_button" onclick="getSmaller()">缩小</button> 
		<button onclick="cutDiv()" id="cutDiv">剪切框</button> 
		<button onclick="backup()">还原图片</button> 
        <article class="sucaihuo-container">
            <div class="container">
                <div class="row">
                	<img id="img" style="display:none"/>
                    <div class="col-xs-12 col-md-6 col-lg-6" id="pimg">
                        <div id='target1' style="display: none;"></div>
                    </div>
                </div>
            </div>
        </article>
	    <div id="divv">
			<canvas id="myCanvas"></canvas>
			<div id="canvas_div" style="border:1px solid #000;position: absolute;"></div>
			<div id="cut_div" style="border:1px dashed #F00;position: absolute;"></div>
	    </div>
    </center>
	<br>
	<br>
	<center><h1>打印预览图:</h1></center>
	<br>
	<center>
	    <div id="myCanvas2_div">
			<canvas id="myCanvas2"></canvas>
	    </div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<button onclick="addMark()">添加查档人</button> 
	<button onclick="addWatermark()">添加水印</button> 
	<button onclick="myPrint()">打印</button> 
    </center>
    <div id="loading_div" style="position:absolute;left:50%;top:30%;width:150px;height:150px;z-index:10;
    		margin-left:-75px;border-radius:5px;background:#ccc; filter:alpha(opacity=80); -moz-opacity:0.8; -khtml-opacity: 0.8; opacity: 0.8;"></div>
<script type="text/javascript">
var circle = new Sonic({

    width: 50,
    height: 50,
    padding: 50,

    strokeColor: '#000',

    pointDistance: .01,
    stepsPerFrame: 3,
    trailLength: .7,

    step: 'fader',

    setup: function() {
    	this._.lineWidth = 5;
    },

    path: [
        ['arc', 25, 25, 25, 0, 360]
    ]

});
circle.play();
document.getElementById("loading_div").appendChild(circle.canvas);
 function loading(){
	 isDone = false;
		document.getElementById("loading_div").style.display="";
}
function cancelLoading(){
	 isDone = true;
	document.getElementById("loading_div").style.display="none";
} 

</script>
    </body>
</html>
