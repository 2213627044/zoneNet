var sms = { 
		callerId : '',
		password : '',
		appId : '',
		templateId:'',
		param:'',
		code:'',
		
		config :function(array){
			sms.callerId=array['callerId'];
			sms.password=array['password'];
			//sms.appId=array['appId'];
			sms.templateId=array['templateId'];
			//param=array['param'];
		},
		
		sendCaptcha : function(phoneId){
	    	var phone = document.getElementById(phoneId).value;
	    	if(phone =="" || phone == undefined || phone == null){
	    		 phone = document.getElementsByName(phoneId).value;
	    	}
	    	if(phone =="" || phone == undefined || phone == null){
	    		alert("请输入手机号码..");
	    		return false;
	    	}
	    	
	    	if(sms.callerId == "" || sms.callerId == undefined || sms.callerId == null){
	    		alert("客户ID为空,请进行设置..");
	    		return false;
	    	}
	    	if(sms.password == "" || sms.password == undefined || sms.password == null){
	    		alert("客户密码为空,请进行设置..");
	    		return false;
	    	}
	    	
	    	//if(sms.appId == "" || sms.appId == undefined || sms.appId == null){
	    	//	alert("客户应用ID为空,请进行设置..");
	    	//	return false;
	    	//}
	    	//var url = "http://120.197.89.93/EOPS1.0/captcha/get/"+phone+";callerId="+sms.callerId+";password="+sms.password+";appId="+sms.appId+";templateId=402894b24e45614e014e45a407e70012;";
	    	var url = "http://120.197.89.93/EOPS1.0/captcha/get/"+phone+";callerId="+sms.callerId+";password="+sms.password+";templateId=402894b24e45614e014e45a407e70012;";
	    	if (window.XMLHttpRequest){
	  	      // code for IE7+, Firefox, Chrome, Opera, Safari
	    		request=new XMLHttpRequest();
	    	}else{// code for IE6, IE5
	    		request=new ActiveXObject("Microsoft.XMLHTTP");
	    	}
	        request.open("GET", url, true);
	        request.setRequestHeader ("CONTENT-TYPE", "application/x-www-form-urlencoded" );
	        request.send(null);
	        request.onreadystatechange = function() {
	            if (request.readyState == 4) {
	                if (request.status == 200){
	                	if(request.responseText=='00'){
	                	}else if(request.responseText=='01'){
	                		alert("发送失败,格式错误 ");
	                	}else if(request.responseText=='02'){
	                		alert("发送失败, 用户名或密码错误");
	                	}else if(request.responseText=='02'){
	                		alert("发送失败,余额不足");
	                	}else{
	                		//alert("发送失败, 其他原因");
	                	}
	                }
	            }
	        };
	        
	    },
	   
	    sendSMSCaptcha : function(phoneId,backurl){
	    	var phone = document.getElementById(phoneId).value;
	    	if(phone =="" || phone == undefined || phone == null){
	    		 phone = document.getElementsByName(phoneId).value;
	    	}
	    	if(phone =="" || phone == undefined || phone == null){
	    		alert("请输入手机号码..");
	    		return false;
	    	}
	    	
	    	if(sms.callerId == "" || sms.callerId == undefined || sms.callerId == null){
	    		alert("客户ID为空,请进行设置..");
	    		return false;
	    	}
	    	if(sms.password == "" || sms.password == undefined || sms.password == null){
	    		alert("客户密码为空,请进行设置..");
	    		return false;
	    	}

	    	//if(sms.appId == "" || sms.appId == undefined || sms.appId == null){
	    	//	alert("客户应用ID为空,请进行设置..");
	    	//	return false;
	    	//}
//	    	var url = "http://120.197.89.93/EOPS1.0/captcha/get/"+phone+";callerId="+sms.callerId+";password="+sms.password+";appId="+sms.appId+";templateId=402894b24e45614e014e45a407e70012;";
	    	var url = "http://120.197.89.93/EOPS1.0/captcha/get/"+phone+";callerId="+sms.callerId+";password="+sms.password+";templateId=402894b24e45614e014e45a407e70012;";
	    	if (window.XMLHttpRequest){
	  	      // code for IE7+, Firefox, Chrome, Opera, Safari
	    		request=new XMLHttpRequest();
	    	}else{// code for IE6, IE5
	    		request=new ActiveXObject("Microsoft.XMLHTTP");
	    	}
	        request.open("GET", url, true);
	        request.setRequestHeader ("CONTENT-TYPE", "application/x-www-form-urlencoded" );
	        request.send(null);
	        request.onreadystatechange = function() {
	            if (request.readyState == 4) {
	                if (request.status == 200){
	                	if(request.responseText==0){
	                		sms.authSMSCaptcha(phone,backurl);
	                	}else{
	                		alert("短信提交失败");
	                	}
	                }
	            }
	        };
	        
	    },

	    authSMSCaptcha : function(phone,respUrl){
	    	var url = "http://120.197.89.93/EOPS1.0/captcha/demo/authSMS/"+phone+";callerId="+sms.callerId+";password="+sms.password+";appId="+sms.appId;
	    	if (window.XMLHttpRequest){
	  	      // code for IE7+, Firefox, Chrome, Opera, Safari
	    		request=new XMLHttpRequest();
	    	}else{// code for IE6, IE5
	    		request=new ActiveXObject("Microsoft.XMLHTTP");
	    	}
	        request.open("GET", url, true);
	        request.setRequestHeader ("CONTENT-TYPE", "application/x-www-form-urlencoded" );
	        request.send(null);
	        request.onreadystatechange = function() {
	            if (request.readyState == 4) {
	                if (request.status == 200){
	                	if(request.responseText==10){
	                		window.location.href=respUrl;
	                	}else if(request.responseText==11){
	                		//alert("验证错误  ");
	                		window.setTimeout("sms.authSMSCaptcha('"+phone+"','"+respUrl+"')",5000);
	                	}else if(request.responseText==19){
	                		alert("数据格式错误");
	                	}else{
	                		alert("未知错误");
	                	}
	                }
	            }
	        };
	        
	    },
	    
	    authCaptchaCode : function (phoneId,code){
	    	var phone = document.getElementById(phoneId).value;
	    	if(phone =="" || phone == undefined || phone == null){
	    		 phone = document.getElementsByName(phoneId).value;
	    	}
	    	if(phone =="" || phone == undefined || phone == null){
	    		alert("请输入手机号码..");
	    		return false;
	    	}
	    	
	    	var captchaCode = document.getElementById(code).value;
	    	if(captchaCode =="" || captchaCode == undefined || captchaCode == null){
	    		captchaCode = document.getElementsByName(code).value;
	    	}
	    	if(captchaCode =="" || captchaCode == undefined || captchaCode == null){
	    		return "11";
	    	}
	    	
	    	if(sms.callerId == "" || sms.callerId == undefined || sms.callerId == null){
	    		return "11";
	    	}
	    	if(sms.password == "" || sms.password == undefined || sms.password == null){
	    		return "11";
	    	}
	    	
	    	//if(sms.appId == "" || sms.appId == undefined || sms.appId == null){
	    	//	return "11";
	    	//}
	    	var code = "";
	    	$.ajax({
	            type: "GET", contentType: "application/x-www-form-urlencoded",
	            url: "http://120.197.89.93/EOPS1.0/captcha/auth/"+phone+";callerId="+sms.callerId+";password="+sms.password+";randomCode="+captchaCode,
	            //url: "http://120.197.89.93/EOPS1.0/captcha/auth/"+phone+";callerId="+sms.callerId+";password="+sms.password+";randomCode="+captchaCode,
	            async: false,
	            success: function (msg) {
	                code = msg;
	            }
	        }); 
	    	return code;
	    },
	    
	    authCaptcha : function(phoneId,code,respUrl){
	    	var phone = document.getElementById(phoneId).value;
	    	if(phone =="" || phone == undefined || phone == null){
	    		 phone = document.getElementsByName(phoneId).value;
	    	}
	    	if(phone =="" || phone == undefined || phone == null){
	    		alert("请输入手机号码..");
	    		return false;
	    	}
	    	
	    	var captchaCode = document.getElementById(code).value;
	    	if(captchaCode =="" || captchaCode == undefined || captchaCode == null){
	    		captchaCode = document.getElementsByName(code).value;
	    	}
	    	if(captchaCode =="" || captchaCode == undefined || captchaCode == null){
	    		alert("请输入验证码..");
	    		return false;
	    	}
	    	
	    	if(sms.callerId == "" || sms.callerId == undefined || sms.callerId == null){
	    		alert("客户ID为空,请进行设置..");
	    		return false;
	    	}
	    	if(sms.password == "" || sms.password == undefined || sms.password == null){
	    		alert("客户密码为空,请进行设置..");
	    		return false;
	    	}
	    	//if(sms.appId == "" || sms.appId == undefined || sms.appId == null){
	    	//	alert("客户应用ID为空,请进行设置..");
	    	//	return false;
	    	//}
	    	//var url = "http://120.197.89.93/EOPS1.0/captcha/auth/"+phone+";callerId="+sms.callerId+";password="+sms.password+";appId="+sms.appId+";randomCode="+captchaCode;
	    	var url = "http://120.197.89.93/EOPS1.0/captcha/auth/"+phone+";callerId="+sms.callerId+";password="+sms.password+";randomCode="+captchaCode;
	    	if (window.XMLHttpRequest){
	  	      // code for IE7+, Firefox, Chrome, Opera, Safari
	    		request=new XMLHttpRequest();
	    	}else{// code for IE6, IE5
	    		request=new ActiveXObject("Microsoft.XMLHTTP");
	    	}
	        request.open("GET", url, true);
	        request.setRequestHeader ("CONTENT-TYPE", "application/x-www-form-urlencoded" );
	        request.send(null);
	        request.onreadystatechange = function() {
	            if (request.readyState == 4) {
	                if (request.status == 200){
	                	if(request.responseText==10){
	                		window.location.href=respUrl;
	                	}else if(request.responseText==10){
	                		alert("验证错误  ");
	                	}else if(request.responseText==19){
	                		alert("数据格式错误");
	                	}else{
	                		alert("未知错误");
	                	}
	                }
	            }
	            
	        };
	        
	    },
	    
	    sendSystemCaptcha : function(phoneId){
	    	var phone = document.getElementById(phoneId).value;
	    	if(phone =="" || phone == undefined || phone == null){
	    		 phone = document.getElementsByName(phoneId).value;
	    	}
	    	if(phone =="" || phone == undefined || phone == null){
	    		alert("请输入手机号码..");
	    		return false;
	    	}
	    	
	    	if(sms.callerId == "" || sms.callerId == undefined || sms.callerId == null){
	    		alert("客户ID为空,请进行设置..");
	    		return false;
	    	}
	    	if(sms.password == "" || sms.password == undefined || sms.password == null){
	    		alert("客户密码为空,请进行设置..");
	    		return false;
	    	}
	    	if(sms.templateId == "" || sms.templateId == undefined || sms.templateId == null){
	    		alert("模板ID为空,请进行设置..");
	    		return false;
	    	}
			
	    	var url = "http://120.197.89.93/EOPS1.0/captcha/get/"+phone+";callerId="+sms.callerId+";password="+sms.password+";templateId="+sms.templateId+"?jsonpCallback=sendSystemCaptcha";
			sms.code = '';
	    	$.ajax({
				type:"get",
				async: true,
				url:url,
				data:{},
				dataType:"jsonp",
				jsonp: "callback",
	            jsonpCallback:"sendSystemCaptcha",
				success : function(data) {
					console.log(data.result);
					var result = data.result;
					if(result=='01'){
                		alert("发送失败,格式错误 ");
						sms.code = '01';
                	}else if(result=='02'){
                		alert("发送失败, 用户名或密码错误");
						sms.code = '02';
                	}else if(result=='03'){
                		alert("发送失败,余额不足");
						sms.code = '03';
                	}else{
						console.log(result[0].code == '00');
                		if(result[0].code == '00'){
    						sms.code = result[0].code;
    					}
                	}
				}
			});
			console.log(sms.code)
	    },
		
	    sendParamCaptcha : function(phoneId,param){
	    	var phone = document.getElementById(phoneId).value;
	    	if(phone =="" || phone == undefined || phone == null){
	    		 phone = document.getElementsByName(phoneId).value;
	    	}
	    	if(phone =="" || phone == undefined || phone == null){
	    		alert("请输入手机号码..");
	    		return false;
	    	}
	    	
	    	if(sms.callerId == "" || sms.callerId == undefined || sms.callerId == null){
	    		alert("客户ID为空,请进行设置..");
	    		return false;
	    	}
	    	if(sms.password == "" || sms.password == undefined || sms.password == null){
	    		alert("客户密码为空,请进行设置..");
	    		return false;
	    	}
	    	if(sms.templateId == "" || sms.templateId == undefined || sms.templateId == null){
	    		alert("模板ID为空,请进行设置..");
	    		return false;
	    	}
	    	var url = "http://120.197.89.93/EOPS1.0/captcha/get_01/"+phone+";callerId="+sms.callerId+";password="+sms.password+";templateId="+sms.templateId+";param="+param+"?jsonpCallback=sendParamCaptcha";
	    	$.ajax({
				type:"get",
				url:url,
				data:{},
				dataType:"jsonp",
				jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
	            jsonpCallback:"sendParamCaptcha",//
				success : function(data) {
					if(data.result=='00'){
                	}else if(data.result=='01'){
                		alert("发送失败,格式错误 ");
                	}else if(data.result=='02'){
                		alert("发送失败, 用户名或密码错误");
                	}else if(data.result=='03'){
                		alert("发送失败,余额不足");
                	}else{
                		//alert("发送失败, 其他原因");
                	}
				}
			});
	    }
} 