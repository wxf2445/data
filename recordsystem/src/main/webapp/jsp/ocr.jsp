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
var divv_left=0,divv_top=0; 
var isDone = true;
var map = new Array();
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
		/* if(image.width/document.body.offsetWidth>0.8){
			image_scare = (screen.availWidth*0.8)/image.width;
		}
		canvas.width = image.width*image_scare;
		canvas.height = image.height*image_scare;  
	    canvas.getContext("2d").drawImage(image,0,0,canvas.width,canvas.height); */
		canvas.width = image.width;
		canvas.height = image.height;  
		canvas.getContext("2d").drawImage(image, 0, 0); 
	    cancelLoading();
		divv_left = document.getElementById("myCanvas").offsetLeft;
		divv_top = document.getElementById("divv").offsetTop;
		
	}
}
function buttonInit(){
	/* document.getElementById("cutDiv").style.background = "";
	document.getElementById("cutDiv").style.border = "";
	document.getElementById("cutDiv").style.color = ""; */
}


window.onload = function(){
	openImage();
	loading();
	
	var canvas_div = document.getElementById("canvas_div");
	var canvas = document.getElementById("myCanvas");
	var ocr_div = $("#active_div")[0];
	//var cans = canvas.getContext("2d"); 
	var last_x = 0, last_y = 0 ,locked = 0;
	canvas.addEventListener('mousedown', function(evt) {
		
	   	var mousePos = getMousePos(canvas, evt);
	   	locked = 1;

	   	ocr_div.style.display = "";
	   	ocr_div.style.width = "0px";
	   	ocr_div.style.height =  "0px";
		
	   	ocr_div.style.left = (mousePos.x + divv_left)+"px";
	   	ocr_div.style.top = (mousePos.y + divv_top)+"px";
    	last_x = mousePos.x;
    	last_y = mousePos.y;

    });
	canvas.addEventListener('mouseup', function(evt) {
		
    	locked = 0;
    	is_down = true;
    	var mousePos = getMousePos(canvas, evt);
    	var canvas_div_width = (mousePos.x - last_x );
    	var canvas_div_height = (mousePos.y - last_y );
    	$("#divv .active").width(canvas_div_width);
    	$("#divv .active").height(canvas_div_height);
	    	
    });
	canvas.addEventListener('mousemove', function(evt) {
		if(locked!=1)return ;
    	var mousePos = getMousePos(canvas, evt);
    	
   		ocr_div.style.width =  (mousePos.x - last_x) +"px";
   		ocr_div.style.height =  (mousePos.y - last_y) +"px";

    	//canvas_div.innerHTML ="x:"+mousePos.x+" y:"+mousePos.y;
    });

	ocr_div.addEventListener('mousedown', function(evt) {
		
	   	var mousePos = getMousePos(canvas, evt);
	   	locked = 1;

	   	ocr_div.style.display = "";
	   	ocr_div.style.width = "0px";
	   	ocr_div.style.height =  "0px";
		
	   	ocr_div.style.left = (mousePos.x + divv_left)+"px";
	   	ocr_div.style.top = (mousePos.y + divv_top)+"px";
    	last_x = mousePos.x;
    	last_y = mousePos.y;

    });
	ocr_div.addEventListener('mouseup', function(evt) {
		
    	locked = 0;
    	is_down = true;
    	var mousePos = getMousePos(canvas, evt);
   		ocr_div.style.width =  "0px";
   		ocr_div.style.height =  "0px";
    	
   		var new_div = document.createElement("div");
   		new_div.style.cssText = "position:absolute;border:1px solid #f00";
   		new_div.style.left = ocr_div.style.left;
   		new_div.style.top = ocr_div.style.top;
   		new_div.style.width = (mousePos.x - last_x) +"px";
   		new_div.style.height = (mousePos.y - last_y) +"px";
   		document.getElementById("divv").appendChild(new_div);
   		

   		var new_div_data =  {};
   		new_div_data['x'] = parseInt(last_x);
   		new_div_data['y'] = parseInt(last_y);
   		new_div_data['w'] = parseInt(mousePos.x - last_x);
   		new_div_data['h'] = parseInt(mousePos.y - last_y);
   		map.push(new_div_data);
	    	
    });
	ocr_div.addEventListener('mousemove', function(evt) {
		if(locked!=1)return ;
    	var mousePos = getMousePos(canvas, evt);
    	
   		ocr_div.style.width =  (mousePos.x - last_x) +"px";
   		ocr_div.style.height =  (mousePos.y - last_y) +"px";

    	//canvas_div.innerHTML ="x:"+mousePos.x+" y:"+mousePos.y;
    });
	
    
    function backup(){
    	location.reload();
    }
}
function orc(){
	
/*     var dataurl = document.getElementById("myCanvas").toDataURL("image/png"); 
     // 为安全 对URI进行编码 
     // data%3Aimage%2Fpng%3Bbase64%2C 开头 

     var imagedata = encodeURIComponent(dataurl);  */

 	var image_src = getQueryString("url");
	$.ajax({
	       type: "GET",
	       url: "<c:url value="/json/file/orcresult"  />",
	       data: {divs:JSON.stringify(map),image_src : image_src},
	       success: function (result) {
	    	   alert(result.result);
	       }
	   });
}
        </script>
        <style>
        .ocr_div{border:1px dashed #F00;position: absolute;}
        </style>
    </head>
    <body>
    <center>
	    <div id="divv">
			<canvas id="myCanvas"></canvas>
			<div id="active_div" style="border:1px dashed #F00;position: absolute;"></div>
	    </div>
		<button onclick="orc()">识别</button> 
    </center>
    <div id="result"></div>
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
