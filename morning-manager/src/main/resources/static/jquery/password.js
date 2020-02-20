/*
	http://blog.sina.com.cn/chichudijiejue
	Download by http://blog.sina.com.cn/chichudijiejue
	author 彳亍籴孑孓 
	date 2012-11-29
*/
(function($){  
		$.fn.validatePassword = function(options){ 		 	
		 	 //默认属性、参数
			 var settings = {
				 //默认显示背景色
				 initcolor:"#EFEFEF",
				 //初级颜色
				 lowercolor:"#FF0000",
				  //初级颜色
				 middlecolor:"#FFCC00",
				  //初级颜色
				 highcolor:"#00B200",				
				 initminlen:6
			};
			//让默认参数复写plugs参数
			if (options) {
				$.extend(settings, options);
			};
			createShow(this);
			//触发校验
			$(this).keyup(function(){
				val=$(this).val();
				//alert(val);
				f=checkStrong(val);
				//alert(f);
				showTip(f,settings.highcolor,settings.middlecolor,settings.lowercolor,settings.initcolor);						
			});			
			//初始化密码提示框
			function createShow(obj){
				$(obj).after("<div  class='safeRank'><ul><li id='lowercolor'>低</li><li id='middlecolor'>中</li><li id='highcolor'>高</li></ul></div>");
				}			
			function showTip(flag,highcolor,middlecolor,lowercolor,initcolor){				
				switch(flag) { 
						case 0: 
							highcolor=middlecolor=lowercolor=initcolor; 
						case 1: 
							highcolor=middlecolor=initcolor;
						break; 
						case 2: 
							highcolor=lowercolor=initcolor; 
						break; 
							default: 
							middlecolor=lowercolor=initcolor; 
					} 
				document.getElementById("lowercolor").style.background=lowercolor;
				document.getElementById("middlecolor").style.background=middlecolor;
				document.getElementById("highcolor").style.background=highcolor;				
			}			 
			 //CharMode函数 
			//测试某个字符是属于哪一类. 
			function CharMode(iN){ 
				if (iN>=48 && iN <=57) //数字 
					return 1; 
				if (iN>=65 && iN <=90) //大写字母 
					return 2; 
				if (iN>=97 && iN <=122) //小写 
					return 4; 
				else 
					return 8; //特殊字符 
			} 
			//bitTotal函数 
			//计算出当前密码当中一共有多少种模式 
			function bitTotal(num){ 
				modes=0; 
				for (i=0;i<4;i++){ 
					if (num & 1) modes++; 
					num>>>=1; 
				} 
				return modes; 
			}			
			//返回密码的强度级别 
			function checkStrong(sPW){ 
				if (sPW.length<=settings.initminlen) 
				return 0; //密码太短 
				Modes=0; 
				for (i=0;i<sPW.length;i++){ 
					//测试每一个字符的类别并统计一共有多少种模式. 
					Modes|=CharMode(sPW.charCodeAt(i)); 
				} 
				return bitTotal(Modes); 
			} 			
		  }		  	
})(jQuery);