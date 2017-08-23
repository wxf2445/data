<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<script src='<c:url value='/resources/js/common/Syunew3.js'/>'></script>
<script src="<c:url value='/resources/charisma-master/js/jquery-1.9.0.js'/>"></script>
<style>
.rightbox{display:none}
.main-menu{display:none}
</style>
<script type="text/javascript">
var bConnect=0;	
var UKEY_IN = false;
window.onload = function() {
	softDog_load();
}
function checkServiceSoftKey(){
	$.ajax({
	       type: "GET",
	       url: "<c:url value="/json/user/checksoftkey"  />",
	       data: {},
	       success: function (result) {
	    	   if(result.status == true){
	   				$(".main-menu").show();
	   				$(".rightbox").show();
	
						noty({
		        	        text: "UKEY验证通过",
		        	        layout: "top",
		        	        type: "success",
		        	        timeout: 1000,
		        	    });
	    	   }else{
	   				$(".main-menu").hide();
					$(".rightbox").hide();
	                //alert("UKEY已被拨出，被拨出的锁的路径是："+PnpData.DevicePath);
				    noty({
				        text: "UKEY未插入！",
				        layout: "top",
				        type: "failure",
				        timeout: 1000,
				    });
	    	   }
	       }
	   });
}
function getStr(str){
	$.ajax({
	       type: "GET",
	       url: "<c:url value="/json/user/getstr"  />",
	       data: {},
	       success: function (result) {
	    	   if(result.status == str){
					$(".main-menu").show();
					$(".rightbox").show();

					noty({
		       	        text: "UKEY验证通过",
		       	        layout: "top",
		       	        type: "success",
		       	        timeout: 1000,
		       	    });
					UKEY_IN = true;
	    	   }else{
					checkServiceSoftKey();
	    	   }
	    	   
	       }
	   });
}
function testSoftDog(){
	var s_simnew1;
    s_simnew1=new ActiveXObject("Syunew3A.s_simnew3");
    //建立操作我们的锁的控件对象，
	s_simnew1.FindPort(0);//'查找加密锁
	//DevicePath = s_simnew1.FindPort_2(0,1,  70967193);//'查找指定的加密锁（使用普通算法）
	if( s_simnew1.LastError!= 0 )
	{
		checkServiceSoftKey();
		return ;
		//window.alert ( "未发现加密锁，请插入加密锁");return false;
	}else{
		if(UKEY_IN)return;
		checkData_IE10();
		//window.clearInterval(int);
	}
}
function softDog_load()
{

    //如果是IE10及以下浏览器，则跳过不处理
    if(navigator.userAgent.indexOf("MSIE")>0 && !navigator.userAgent.indexOf("opera") > -1){
    	var int=self.setInterval("testSoftDog()",2000);
	    
    	return;
    }
    try
    {
        var s_pnp=new SoftKey3W();//创建UK类
         s_pnp.Socket_UK.onopen = function() 
        {
            bConnect=1;//代表已经连接，用于判断是否安装了客户端服务
           	checkData();
        } 
        
        //在使用事件插拨时，注意，一定不要关掉Sockey，否则无法监测事件插拨
        s_pnp.Socket_UK.onmessage =function got_packet(Msg) 
        {
            var PnpData = JSON.parse(Msg.data);
            if(PnpData.type=="PnpEvent")//如果是插拨事件处理消息
            {
                if(PnpData.IsIn) 
                {
                	checkData();
                    //    alert("UKEY已被插入，被插入的锁的路径是："+PnpData.DevicePath);
                }
                else
                {
            		checkServiceSoftKey()

                }
            }
        } 
        
        s_pnp.Socket_UK.onclose = function()
        {
            
        }
   }
   catch(e)  
   {  
        alert(e.name + ": " + e.message);
        return false;
   }  
}
function checkData(){//如果是IE10及以下浏览器，则使用AVCTIVEX控件的方式
    if(navigator.userAgent.indexOf("MSIE")>0 && !navigator.userAgent.indexOf("opera") > -1) return checkData_IE10();
    
    //判断是否安装了服务程序，如果没有安装提示用户安装
    if(bConnect==0)
    {
	    noty({
	        text: "未安装软件狗支持程序，点击<a href='<c:url value="/resources/tools/SetUpAll.exe"/>'>此处</a>下载",
	        layout: "top",
	        type: "failure",
	        timeout: 15000,
	    });
	    return;
    }
	 try
	 {
			var DevicePath,mykey,outstring,nlen,address;
			
		    //由于是使用事件消息的方式与服务程序进行通讯，
		    //好处是不用安装插件，不分系统及版本，控件也不会被拦截，同时安装服务程序后，可以立即使用，不用重启浏览器
		    //不好的地方，就是但写代码会复杂一些
			var s_simnew1=new SoftKey3W(); //创建UK类
			
		    s_simnew1.Socket_UK.onopen = function() {
		   	   s_simnew1.ResetOrder();//这里调用ResetOrder将计数清零，这样，消息处理处就会收到0序号的消息，通过计数及序号的方式，从而生产流程
		    } 

            //写代码时一定要注意，每调用我们的一个UKEY函数，就会生产一个计数，即增加一个序号，较好的逻辑是一个序号的消息处理中，只调用我们一个UKEY的函数
		    s_simnew1.Socket_UK.onmessage =function got_packet(Msg) 
		    {
		        var UK_Data = JSON.parse(Msg.data);
		        if(UK_Data.type!="Process")return ;//如果不是流程处理消息，则跳过
		        switch(UK_Data.order) 
		        {
		            case 0:
		                {
		                    s_simnew1.FindPort(0);//查找加密锁
		                }
		                break;//!!!!!重要提示，如果在调试中，发现代码不对，一定要注意，是不是少了break,这个少了是很常见的错误
		            case 1:
		                {
	                    	if( UK_Data.LastError!=0){
	                    		checkServiceSoftKey();

	                    	s_simnew1.Socket_UK.close();return false;} 
	                    	DevicePath = UK_Data.return_value;//获得返回的UK的路径
	                    	
					        //读取字符串带长度
					        //先从地址0读到以前写入的字符串的长度
					        address=0;
					        s_simnew1.YReadEx(address, 1, "ffffffff", "ffffffff", DevicePath);
					    }
					    break;
					case 2:
					    {
					        //if( UK_Data.LastError!=0){window.alert("读取字符串长度错误。错误码为："+UK_Data.LastError.toString());s_simnew1.Socket_UK.close();return false;}
					        s_simnew1.GetBuf(0);//从缓冲区读取YREAD返回的数据
					    }
					    break;
					case 3:
					    {
					        //if( UK_Data.LastError!=0){window.alert("GetBuf从缓冲区返回数据时错误，错误码为："+UK_Data.LastError.toString());s_simnew1.Socket_UK.close();return false;}
					         nlen = UK_Data.return_value;
					        //再读取相应长度的字符串
					        address=1;
		                    s_simnew1.YReadString(address, nlen, "ffffffff", "ffffffff", DevicePath);
					    }
					    break;
					case 4:
					    {
					        //if( UK_Data.LastError!=0){window.alert("读取字符串(带长度)错误。错误码为："+UK_Data.LastError.toString());s_simnew1.Socket_UK.close();return false;}
					        outstring =UK_Data.return_value;
					        //window.alert("已成功读取字符串(带长度)：" + outstring);
					        
					        // s_simnew1.ContinueOrder();//如果要加入初始化的代码，则记得一定要将这里注释掉
					         
					        s_simnew1.DecString(outstring,  "1234567890ABCDEF1234567890ABCDEF");//对加密后的字符串进行解密
					    }
					    break;
					case 5:
					    {	
					        //if( UK_Data.LastError!=0){window.alert("使用增强算法一对字符串进行解密时错误，错误码为："+UK_Data.LastError.toString());s_simnew1.Socket_UK.close();return false;}
					        outstring = UK_Data.return_value;
					        
					        /*  alert("已成功成功对字符串进行解密，解密后的字符串为：" + outstring+" "(outstring==getStr()));  */
					        getStr(outstring);
					    }
					    break;
					}
		    } 
		    s_simnew1.Socket_UK.onclose = function(){

		    }
			return false;
	  }

	 catch(e)  
	  {  
		alert(e.name + ": " + e.message);
		return false;
	  }  

}
function checkData_IE10(){
	
	try
	    {
			var DevicePath,mylen,ret,keyid,username,mykey,outstring,address,mydata,i,InString,versionex,version,seed;
            
            //建立操作我们的锁的控件对象，
		    s_simnew1=new ActiveXObject("Syunew3A.s_simnew3");

			DevicePath = s_simnew1.FindPort(0);//'查找加密锁
			//DevicePath = s_simnew1.FindPort_2(0,1,  70967193);//'查找指定的加密锁（使用普通算法）
			if( s_simnew1.LastError!= 0 )
			{

				checkServiceSoftKey();
				return false;
			}
			else
			{ 
				
				//读取字符串带长度
				{
	
		            //先从地址0读到以前写入的字符串的长度
		            ret = s_simnew1.YReadEx(0, 1, "ffffffff", "ffffffff", DevicePath);
		            nlen =s_simnew1.GetBuf(0);
		            if( ret != 0 )
		            {
		                //window.alert("读取字符串长度错误。错误码：" );

						checkServiceSoftKey();
		            }
		          //再读取相应长度的字符串
		            outString = s_simnew1.YReadString(1, nlen, "ffffffff", "ffffffff", DevicePath);
		            if( s_simnew1.LastError != 0 )
		                //window.alert("读取字符串(带长度)错误。错误码：" );
						noty({
		        	        text: "读取字符串(带长度)错误",
		        	        layout: "top",
		        	        type: "failure",
		        	        timeout: 1000,
		        	    });
		            /* else
	               		window.alert("已成功读取字符串(带长度)：" + outString); */
	               		
	               		
	              	//对加密后的字符串进行解密
          	        var outstring = s_simnew1.DecString(outString,  "1234567890ABCDEF1234567890ABCDEF");
                    if (s_simnew1.LastError != 0) { 
						noty({
		        	        text: "解密字符串出现错误",
		        	        layout: "top",
		        	        type: "failure",
		        	        timeout: 1000,
		        	    });
						return false; }
                    //window.alert("已成功成功对字符串进行解密，解密后的字符串为：" + outstring);
			        /* if(outstring==getStr()){
	    				$(".main-menu").show();
	    				$(".rightbox").show();
						noty({
		        	        text: "UKEY验证通过",
		        	        layout: "top",
		        	        type: "success",
		        	        timeout: 1000,
		        	    });
						
	    				UKEY_IN = true;
					}else{
						checkServiceSoftKey();
					} */
                    getStr(outstring);
			     }
			}
		}
	 catch(e)  
	  {  
		alert(e.name + ": " + e.message);
		return false;
	  }  
}

</script>

