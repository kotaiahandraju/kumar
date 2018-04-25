$.fn.makeMultipartRequest = function(method, url, processData, formData,
		contentType, dataType, successFunction) {
	
	$.ajax({
		type : method,
		url : url,
		processData : processData,
		data : formData,
		contentType : contentType,
		dataType : dataType,
		 beforeSend : function() {
//             $.blockUI({ message: '<img src="../img/cylinder.jpg" height="50px" class="fa fa-spin cylinder" />'});
			 $.blockUI({ message: '<img class="animated flip infinite" src="../img/cylinder.jpg" height="50px" />'});
//             return false;
          }, 
          
		success : successFunction,
		complete: function () {
            
            $.unblockUI();
       },
		error :  function(e){$.unblockUI();console.log(e);}
	});
	$("#loadAjax").hide();
};

$.fn.makeRequest = function (method,url,data,successFunction)
{
	$.ajax
	({
		type		: method,	  			// Ex: 'POST' or 'GET'
		url			: url,       			// Ex:  'home/filelist.html'
		data		: data,     
		success		: successFunction,		// The call back function to be called on success.   
		error 		: function(jqXHR, textStatus){
			if(textStatus === 'timeout'){
				try{
				 $(".loader").hide();
				 $(".loader_storage").parent().html("0 Bytes");
				 $(".loader_storage").hide();
				 displayErrorBanner(ERR_COMMON);
				}catch(e){
					
				}
			}
		}, 
		xhrFields: {withCredentials: true},
		timeout: 30000
	});
};