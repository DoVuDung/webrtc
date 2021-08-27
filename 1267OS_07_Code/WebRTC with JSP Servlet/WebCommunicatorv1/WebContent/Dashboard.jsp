<%@page import="java.io.File"%>
<%@page import="com.webrtc.bean.*" %>
<%@page import="java.util.*"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%
		Userdetail login1= new Userdetail(); 
		ArrayList<String> friendList= new ArrayList<String>();
	%>
	<%
		if(session.getAttribute("data")!=null && !((Userdetail)session.getAttribute("data")).getPrivateIdentity().equalsIgnoreCase("")){
			login1= (Userdetail)session.getAttribute("data");
			friendList=login1.getSipuriFrd();
			session.setAttribute("ID", "true");
			}
			else{
		response.sendRedirect("Login.jsp");return;
			}
	%>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<title>WebRTC Communication Client</title>

<link href="assets/css/bootstrap.css" title="style" rel="stylesheet" type="text/css" />
<link href="style.css" title="style" rel="stylesheet" type="text/css" /> 
<link rel="stylesheet" href="reveal.css">
<link rel="stylesheet" type="text/css" href="assets/css/jquery.ui.chatbox.css"  />
<link rel="stylesheet" type="text/css" href="css/buttonstyle.css"  />
<link type="text/css" rel="stylesheet" href="css/ui.notify.css" />
<link rel="stylesheet" type="text/css" href="css/start/jquery-ui-1.10.3.custom.css"/>
<link href="css/gemoticons.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css" type="text/css" media="screen" />

<script src="scripts/jquery-1.6.1.min.js" type="text/javascript"></script>
<script src="scripts/jquery.masonry.min.js" type="text/javascript"></script>
<script src="scripts/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="scripts/MetroJs.lt.js" type="text/javascript"></script>
<script src="scripts/jquery.fancybox-1.3.4.js" type="text/javascript" charset="utf-8"></script>
<script src="scripts/jquery.flexslider-min.js" type="text/javascript" charset="utf-8"></script>
<script src="scripts/hoverintent.js" type="text/javascript"	charset="utf-8"></script>
<script src="scripts/jquery.jplayer.min.js" type="text/javascript" charset="utf-8"></script>
<script src="scripts/organictabs.jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="scripts/javascript.js" type="text/javascript"></script>
<script src="scripts/mediaplayer.js" type="text/javascript"></script>
<script src="scripts/SIPml-api.js" type="text/javascript"></script>
<script src="scripts/googleMapsApi.js" type="text/javascript"></script>
<script type="text/javascript" src="scripts/jquery.reveal.js"></script>
<script src="scripts/jquery-ui-1.10.3.custom.js"></script>
<script src="scripts/jquery.notify.js" type="text/javascript"></script>
<script type="text/javascript" src="scripts/jquery.gemoticons.js"></script>
<script type="text/javascript" src="scripts/jquery.ui.chatbox.js"></script>
<script type="text/javascript" src="scripts/jstz-1.0.4.min.js"></script>
<script type="text/javascript">
	function noBack() { window.history.forward(); }
</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
		.big-link {
			display: block;
			margin-top: 100px;
			text-align: center;
			font-size: 70px;
			color: #06f;
		}
		.full-screen{
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        .normal-screen{
            position: relative;
        }
        .call-options {
          padding: 5px;
          background-color: #f0f0f0;
          border: 1px solid #eee;
          border: 1px solid rgba(0, 0, 0, 0.08);
          -webkit-border-radius: 4px;
          -moz-border-radius: 4px;
          border-radius: 4px;
          -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
          -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
          -webkit-transition-property: opacity;
          -moz-transition-property: opacity; 
          -o-transition-property: opacity; 
          -webkit-transition-duration: 2s;
          -moz-transition-duration: 2s;
          -o-transition-duration: 2s;
        }
        .tab-video,
        .div-video{
            width: 100%; 
            height: 0px; 
            -webkit-transition-property: height;
            -moz-transition-property: height;
            -o-transition-property: height;
            -webkit-transition-duration: 2s;
            -moz-transition-duration: 2s;
            -o-transition-duration: 2s;
        }
        .label-align {
            display: block;
            padding-left: 15px;
            text-indent: -15px;
        }
        .input-align {
            width: 13px;
            height: 13px;
            padding: 0;
            margin:0;
            vertical-align: bottom;
            position: relative;
            top: -1px;
            *overflow: hidden;
        }
        .glass-panel{
            z-index: 99;
            position: fixed;
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            top: 0;
            left: 0;
            opacity: 0.8;
            background-color: Gray;
        }
        .div-keypad {
            z-index: 100;
            position: fixed;
            -moz-transition-property: left top;
            -o-transition-property: left top;
            -webkit-transition-duration: 2s;
            -moz-transition-duration: 2s;
            -o-transition-duration: 2s;
        }
        #profilePicContent{
 	 	  position:relative;
    	  z-index:0;
		}
		#profilePicContent:hover .removePic{
   	 	display:block;
		}
        
</style>
<style type="text/css">
		.table1 td{ padding-top:2px;text-align:left;font-size: 12px;color: black;}
		.table1 th{background: #B8B8B8;padding-top:5px;text-align:left;font-size: 16px;color: black;font-style: bold;}
		.table1 tr.odd td{ background:#f8f8f8; }
		.table1 tr:hover td{ background:#B8B8B8 ; }
		.pg-normal1{
		color: black;
		font-weight: normal;
		font-size:12px;
		text-decoration: none;
		cursor: pointer;
		}
		.pg-selected1 {
		color: black;
		font-weight: bold;
		font-size:12px;
		text-decoration: underline;
		cursor: pointer;
		}
</style>
<script type="text/javascript">
		function Pager(tableName, itemsPerPage) {
		this.tableName = tableName;
		this.itemsPerPage = itemsPerPage;
		this.currentPage = 1;
		this.pages = 0;
		this.inited = false;
		
		this.showRecords = function(from, to) {
		var rows = document.getElementById(tableName).rows;
		for (var i = 1; i < rows.length; i++) {
		if (i < from || i > to){
			rows[i].style.display = 'none';	
		}
		else{
			rows[i].style.display = '';	
		}
		}
		}
		
		this.showPage = function(pageNumber) {
		if (! this.inited) {
		
		return;
		}
		
		var oldPageAnchor = document.getElementById('pg'+this.currentPage);
		oldPageAnchor.className = 'pg-normal1';
		
		this.currentPage = pageNumber;
		var newPageAnchor = document.getElementById('pg'+this.currentPage);
		newPageAnchor.className = 'pg-selected1';
		
		var from = (pageNumber - 1) * itemsPerPage + 1;
		var to = from + itemsPerPage - 1;
		this.showRecords(from, to);
		}
		
		this.prev = function() {
		if (this.currentPage > 1)
		this.showPage(this.currentPage - 1);
		}
		
		this.next = function() {
		if (this.currentPage < this.pages) {
		this.showPage(this.currentPage + 1);
		}
		}
		
		this.init = function() {
		var rows = document.getElementById(tableName).rows;
		var records = (rows.length - 1);
		this.pages = Math.ceil(records / itemsPerPage);
		this.inited = true;
		}
		
		this.showPageNav = function(pagerName, positionId) {
		if (! this.inited) {
	
		return;
		}
		var element = document.getElementById(positionId);
		
		var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal1">&lt;&lt;Prev &nbsp;&nbsp;&nbsp;</span>';
		for (var page = 1; page <= this.pages; page++)
		pagerHtml += '<span id="pg' + page + '" class="pg-normal1" onclick="' + pagerName + '.showPage(' + page + ');"></span> ';
		pagerHtml += '<span onclick="'+pagerName+'.next();" class="pg-normal1"> Next&gt;&gt;</span>';
		
		element.innerHTML = pagerHtml;
		}
		}
</script>
<!-----------------------------------------Scriptlets---------------------------------- -->
	
	<script type="text/javascript">
	document.onmousedown=disableclick;
	status="Right Click Disabled";
	function disableclick(event)
	{
  		if(event.button==2)
  		 {
     		alert(status);
     		return false;    
  		 }
	}
</script>
<!-- Javascript code -->
 <!--Error validations are in this script-->
<script>
 function msgError(){
	 if(document.getElementById("uri").value=="" || document.getElementById("uri").value=="Enter username eg: John"){
		 document.getElementById("toError").innerHTML="Please enter friend's name";
		 return false;
	 }
	 else{
		 document.getElementById("toError").innerHTML="";
		 return true;
		 }
}
  function callError(){
 	if(document.getElementById("txtPhoneNumber").value=="" && document.getElementById("btnCall").value!="Answer"){
 		document.getElementById("txtPhoneNumberError").innerHTML="Please enter friend's name";
		 return false;
	 }
	 else{
		 document.getElementById("txtPhoneNumberError").innerHTML="";
	 return true;
	}
 }  	
  function offlineMsgValidation(){
		 if((document.getElementById("message1").value=="" || document.getElementById("message1").value=="Please enter your message here")
			&& document.getElementById("sipurireceiver").value==""){
			 document.getElementById("sipurireceiverError").innerHTML="Please select the receiver's name";
			 document.getElementById("message1Error").innerHTML="Please enter the message to be sent";
			 return false;
		 }
		 else if((document.getElementById("message1").value=="" || document.getElementById("message1").value=="Please enter your message here")
					&& !(document.getElementById("sipurireceiver").value=="")){
			 document.getElementById("sipurireceiverError").innerHTML="";
			 document.getElementById("message1Error").innerHTML="Please enter the message to be sent";
			 return false;
		 }
		 else if(!(document.getElementById("message1").value=="" || document.getElementById("message1").value=="Please enter your message here")
					&& (document.getElementById("sipurireceiver").value=="")){
			 document.getElementById("sipurireceiverError").innerHTML="Please select the receiver's name";
			 document.getElementById("message1Error").innerHTML="";
			 return false;
		 }
		 else{
			 document.getElementById("sipurireceiverError").innerHTML="";
			 document.getElementById("message1Error").innerHTML="";
			 return true;
			 }
	 }
</script>
<script type="text/javascript">
	var arrCall="";  //Array Variable declared globally
	var requestFreshCallLogs=true;
	var xmlHttpRequest;
	var xmlHttpRequest1;
	var xmlHttpRequest2;
	var xmlHttpRequestForRefresh;
	var clientsTimeZone = jstz.determine(); // Determines the time zone of the browser client
	if(window.XMLHttpRequest)
	{
	xmlHttpRequest=new XMLHttpRequest();
	xmlHttpRequest1=new XMLHttpRequest();
	xmlHttpRequest2=new XMLHttpRequest();
	xmlHttpRequestForRefresh=new XMLHttpRequest(); 
	}
	else if(window.ActiveXObject)
	{
	xmlHttpRequest=new ActiveXObject(MICROSOFT.XMLHTTP);
	xmlHttpRequest1=new ActiveXObject(MICROSOFT.XMLHTTP);
	xmlHttpRequest2=new ActiveXObject(MICROSOFT.XMLHTTP);
	xmlHttpRequestForRefresh=new ActiveXObject(MICROSOFT.XMLHTTP);
	}
    var sTransferNumber;
    var oRingTone, oRingbackTone;
    var oSipStack, oSipSessionRegister, oSipSessionCall, oSipSessionTransferCall;
    var videoRemote, videoLocal, audioRemote;
    var bFullScreen = false;
    var oNotifICall;
    var oReadyStateTimer;
    var bDisableVideo = false;
    var viewVideoLocal, viewVideoRemote; // <video> (webrtc) or <div> (webrtc4all)
    var oConfigCall;
    var oConfigMsg;
    var oSipSessionMessage;
    var oSipPublish;
    var subscribeSession;
    var oConfigSub;
    var infoArray=new Array(20);
    var r;
   	var to=new Array();
    var friendslist = new Array();
    var friends = new Array();
    var chkURI=new Array();
    var xmlHttpRequest;
    
    var msgId=0;
    var extraContent;
    var addInt;
    var finalMsg;
    var mainCont;
  
     var cbVideoDisable;
    var cbAVPFDisable;
    var txtWebsocketServerUrl;
    var txtSIPOutboundProxyUrl;
    var txtInfo; 
	
    C = 
    {
        divKeyPadWidth: 220
    };

    window.onload = function () {
    	noBack();
        if(window.console) {
            window.console.info("location=" + window.location);
        }
        cbVideoDisable = document.getElementById("cbVideoDisable");
        cbRTCWebBreaker = document.getElementById("cbRTCWebBreaker");
        txtWebsocketServerUrl = document.getElementById("txtWebsocketServerUrl");
        txtSIPOutboundProxyUrl = document.getElementById("txtSIPOutboundProxyUrl");
        txtInfo = document.getElementById("txtInfo");
    
        videoLocal = document.getElementById("video_local");
        videoRemote = document.getElementById("video_remote");
        audioRemote = document.getElementById("audio_remote");

        document.onkeyup = onKeyUp;
        document.body.onkeyup = onKeyUp;
        divCallCtrl.onmousemove = onDivCallCtrlMouseMove;

        // set debug level
        SIPml.setDebugLevel((window.localStorage && window.localStorage.getItem('org.doubango.expert.disable_debug') == "true") ? "error" : "info");

        loadCallOptions();

        // Initialize call button
        uiBtnCallSetText("Call");

        oReadyStateTimer = setInterval(function () {
            if (document.readyState === "complete") {
                clearInterval(oReadyStateTimer);
                // initialize SIPML5
                SIPml.init(postInit);
            }
        },
        500);
        settingsSave();
	
		document.getElementById("loading").style.display="none";
        if (uRIContactPage.value!="null"){
          
        	txtPhoneNumber.value=uRIContactPage.value;
        	uRIContactPage.value="null";
        
        	setTimeout(function(){sipCall("call-audiovideo"); },1000);        
        };
        
    };

    function logoutFromClient(){
    	console.log('User opted to logout from the client');
    	location.href="Last.jsp";
    }
    
    window.onbeforeunload = function()
    {    
    		console.log("Before unload");
    		alert("Error in stoping stack");
    		try{
  			oSipStack.stop();
    		}
    		catch(err){
    			alert("Error in stoping stack");
    		}
  			xmlHttpRequest.open("POST", "<%=request.getContextPath()%>/Controller?action=logout", false);
  			alert("Error in stoping stack");
  			xmlHttpRequest.send(); 
         	//return '';
    }
    
    //read server ip from file
   var ip;
   function readip()
   {
	   var pathOfFileToRead = "presentation_server_config.txt";
	   ip = FileHelper.readStringFromFileAtPath
	   	(
	   		pathOfFileToRead
	   	);
   } 

   function FileHelper()
   {
	   	FileHelper.readStringFromFileAtPath = function(pathOfFileToReadFrom)
	   	{
	   		var request = new XMLHttpRequest();
	   		request.open("GET", pathOfFileToReadFrom, false);
	   		request.send(null);
	   		var returnValue = request.responseText;
	   		return returnValue;
	   	}
	   	readip();
	 
   }
   
   function sendDataToDiv(from,message)
	{
	
			var text=$('<div class="chat" style="color:gray">'+from+' : '+ message+ '</div>');
			$('.chatbox').append(text);
			$(text).gemoticon();
	}
   
    //fetch buddy list
    function main(param)
 	{
	 	if("empty".match(param))
	 	{
	 		friendslist= new Array(<%String[] arrFrnd=new String[login1.getSipuriFrd().size()];
			arrFrnd=login1.getSipuriFrd().toArray(arrFrnd);
   			for(int i = 0; i < arrFrnd.length; i++)
   			{  
    			out.print("\""+arrFrnd[i]+"\""); 
     			if(i+1 < arrFrnd.length) 
     			{  
       				out.print(",");  
     			}  
   			}  %>);
	 	}
	 	else
	 		{
	 		friendslist=new Array();
	 		for(var k=0;k<param.length;k++)
	 			{
	 			friendslist[k]=param[k];
	 			}
	 		}
	 } 
    main('empty');
    
    function postInit() {
        // check webrtc4all version
        if (SIPml.isWebRtc4AllSupported() && SIPml.isWebRtc4AllPluginOutdated()) {            
            if (confirm("Your WebRtc4all extension is outdated ("+SIPml.getWebRtc4AllVersion()+"). A new version with critical bug fix is available. Do you want to install it?\nIMPORTANT: You must restart your browser after the installation.")) {
                window.location = 'http://code.google.com/p/webrtc4all/downloads/list';
                return;
            }
        }

        // check for WebRTC support
        if (!SIPml.isWebRtcSupported()) {
            // is it chrome?
            if (SIPml.getNavigatorFriendlyName() == 'chrome') {
                    if (confirm("You're using an old Chrome version or WebRTC is not enabled.\nDo you want to see how to enable WebRTC?")) {
                        window.location = 'http://www.webrtc.org/running-the-demos';
                    }
                    else {
                        window.location = "index.html";
                    }
                    return;
            }
                
            // for now the plugins (WebRTC4all only works on Windows)
            if (SIPml.getSystemFriendlyName() == 'windows') {
                // Internet explorer
                if (SIPml.getNavigatorFriendlyName() == 'ie') {
                    // Check for IE version 
                    if (parseFloat(SIPml.getNavigatorVersion()) < 9.0) {
                        if (confirm("You are using an old IE version. You need at least version 9. Would you like to update IE?")) {
                            window.location = 'http://windows.microsoft.com/en-us/internet-explorer/products/ie/home';
                        }
                        else {
                            window.location = "index.html";
                        }
                    }

                    // check for WebRTC4all extension
                    if (!SIPml.isWebRtc4AllSupported()) {
                        if (confirm("webrtc4all extension is not installed. Do you want to install it?\nIMPORTANT: You must restart your browser after the installation.")) {
                            window.location = 'http://code.google.com/p/webrtc4all/downloads/list';
                        }
                        else {
                            // Must do nothing: give the user the chance to accept the extension
                            // window.location = "index.html";
                        }
                    }
                    // break page loading ('window.location' won't stop JS execution)
                    if (!SIPml.isWebRtc4AllSupported()) {
                        return;
                    }
                }
                else if (SIPml.getNavigatorFriendlyName() == "safari" || SIPml.getNavigatorFriendlyName() == "firefox" || SIPml.getNavigatorFriendlyName() == "opera") {
                    if (confirm("Your browser don't support WebRTC.\nDo you want to install WebRTC4all extension to enjoy audio/video calls?\nIMPORTANT: You must restart your browser after the installation.")) {
                        window.location = 'http://code.google.com/p/webrtc4all/downloads/list';
                    }
                    else {
                        window.location = "index.html";
                    }
                    return;
                }
            }
            // OSX, Unix, Android, iOS...
            else {
                if (confirm('WebRTC not supported on your browser.\nDo you want to download a WebRTC-capable browser?')) {
                    window.location = 'https://www.google.com/intl/en/chrome/browser/';
                }
                else {
                    window.location = "index.html";
                }
                return;
            }
        }

        // checks for WebSocket support
        if (!SIPml.isWebSocketSupported() && !SIPml.isWebRtc4AllSupported()) {
            if (confirm('Your browser don\'t support WebSockets.\nDo you want to download a WebSocket-capable browser?')) {
                window.location = 'https://www.google.com/intl/en/chrome/browser/';
            }
            else {
                window.location = "index.html";
            }
            return;
        }

        // FIXME: displays must be per session

        // attachs video displays
        if (SIPml.isWebRtc4AllSupported()) {
            viewVideoLocal = document.getElementById("divVideoLocal");
            viewVideoRemote = document.getElementById("divVideoRemote");
            WebRtc4all_SetDisplays(viewVideoLocal, viewVideoRemote); // FIXME: move to SIPml.* API
        }
        else{
            viewVideoLocal = videoLocal;
            viewVideoRemote = videoRemote;
        }

        if (!SIPml.isWebRtc4AllSupported() && !SIPml.isWebRtcSupported()) {
            if (confirm('Your browser don\'t support WebRTC.\naudio/video calls will be disabled.\nDo you want to download a WebRTC-capable browser?')) {
                window.location = 'https://www.google.com/intl/en/chrome/browser/';
            }
        }
        
        btnRegister.disabled = false;
        document.body.style.cursor = 'default';
        oConfigCall = {
            audio_remote: audioRemote,
            video_local: viewVideoLocal,
            video_remote: viewVideoRemote,
            bandwidth: { audio:undefined, video:undefined },
            video_size: { minWidth:undefined, minHeight:undefined, maxWidth:undefined, maxHeight:undefined },
            events_listener: { events: '*', listener: onSipEventSession },
            sip_caps: [
                            { name: '+g.oma.sip-im' },
                            { name: '+sip.ice' },
                            { name: 'language', value: '\"en,fr\"' }
                        ]
        };
        sipRegister();   	
    }

    function loadCallOptions() {
        if (window.localStorage) {
            var s_value;
            if ((s_value = window.localStorage.getItem('org.doubango.call.phone_number'))) txtPhoneNumber.value = s_value;
            bDisableVideo = (window.localStorage.getItem('org.doubango.expert.disable_video') == "true");

            txtCallStatus.innerHTML = '<i>Video ' + (bDisableVideo ? 'disabled' : 'enabled') + '</i>';
        }
    }

    function saveCallOptions() {
        if (window.localStorage) {
            window.localStorage.setItem('org.doubango.call.phone_number', txtPhoneNumber.value);
            window.localStorage.setItem('org.doubango.expert.disable_video', bDisableVideo ? "true" : "false");
        }
    }

    function saveCredentials() {
        
    	if (window.localStorage) {
        	
            window.localStorage.setItem('org.doubango.identity.display_name', txtDisplayName.value);
            window.localStorage.setItem('org.doubango.identity.impi', txtPrivateIdentity.value);
            window.localStorage.setItem('org.doubango.identity.impu', txtPublicIdentity.value);
            window.localStorage.setItem('org.doubango.identity.password', txtPassword.value);
            window.localStorage.setItem('org.doubango.identity.realm', txtRealm.value);
        }
    };
     function settingsSave() {
        window.localStorage.setItem('org.doubango.expert.disable_video', cbVideoDisable.checked ? "true" : "false");
        window.localStorage.setItem('org.doubango.expert.enable_rtcweb_breaker', cbRTCWebBreaker.checked ? "true" : "false");
        if (!txtWebsocketServerUrl.disabled) {
            window.localStorage.setItem('org.doubango.expert.websocket_server_url', txtWebsocketServerUrl.value);
        }
        window.localStorage.setItem('org.doubango.expert.sip_outboundproxy_url', txtSIPOutboundProxyUrl.value);
        window.localStorage.setItem('org.doubango.expert.ice_servers', txtIceServers.value);
        window.localStorage.setItem('org.doubango.expert.bandwidth', txtBandwidth.value);
        window.localStorage.setItem('org.doubango.expert.video_size', txtSizeVideo.value);
        window.localStorage.setItem('org.doubango.expert.disable_early_ims', cbEarlyIMS.checked ? "true" : "false");
        window.localStorage.setItem('org.doubango.expert.disable_debug', cbDebugMessages.checked ? "true" : "false");
        window.localStorage.setItem('org.doubango.expert.enable_media_caching', cbCacheMediaStream.checked ? "true" : "false");
        window.localStorage.setItem('org.doubango.expert.disable_callbtn_options', cbCallButtonOptions.checked ? "true" : "false");

    }
     
     function successCallback(stream) {
         // Set the source of the video element with the stream from the camera
        //alert("working");
        
     }

     function errorCallback(error) {
         alert("Please Check your camera for hassel free video call");
     }


    // sends SIP REGISTER request to login
    function sipRegister() {
        // catch exception for IE (DOM not ready)
        
        navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
				
            	// Call the getUserMedia method with our callback functions
                if (navigator.getUserMedia) {
                	
                    navigator.getUserMedia({video: true,audio: true}, successCallback, errorCallback);
                   
                } else {
                    console.log('Native web camera streaming (getUserMedia) not supported in this browser.');
                    // Display a friendly "sorry" message to the user
                } 
        
        
        
        try {
        	btnRegister.disabled = true;
            if (!txtRealm.value || !txtPrivateIdentity.value || !txtPublicIdentity.value) {
                txtRegStatus.innerHTML = '<b>Please fill madatory fields (*)</b>';
                btnRegister.disabled = false;
                return;
            }
            var o_impu = tsip_uri.prototype.Parse(txtPublicIdentity.value);
            if (!o_impu || !o_impu.s_user_name || !o_impu.s_host) {
                txtRegStatus.innerHTML = "<b>[" + txtPublicIdentity.value + "] is not a valid Public identity</b>";
                btnRegister.disabled = false;
                return;
            }

            // enable notifications if not already done
            if (window.webkitNotifications && window.webkitNotifications.checkPermission() != 0) {
                window.webkitNotifications.requestPermission();
            }

            // save credentials
            saveCredentials();
            window.localStorage.setItem('com.s.v.bool', "true");
            // update debug level to be sure new values will be used if the user haven't updated the page
            SIPml.setDebugLevel((window.localStorage && window.localStorage.getItem('org.doubango.expert.disable_debug') == "true") ? "error" : "info");

            // create SIP stack
            oSipStack = new SIPml.Stack({
                    realm: txtRealm.value,
                    impi: txtPrivateIdentity.value,
                    impu: txtPublicIdentity.value,
                    password: txtPassword.value,
                    display_name: txtDisplayName.value,
                    websocket_proxy_url: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.websocket_server_url') : null),
                    outbound_proxy_url: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.sip_outboundproxy_url') : null),
                    ice_servers: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.ice_servers') : null),
                    enable_rtcweb_breaker: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.enable_rtcweb_breaker') == "true" : false),
                    events_listener: { events: '*', listener: onSipEventStack },
                    enable_early_ims: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.disable_early_ims') != "true" : true), // Must be true unless you're using a real IMS network
                    enable_media_stream_cache: (window.localStorage ? window.localStorage.getItem('org.doubango.expert.enable_media_caching') == "true" : false),
                    bandwidth: (window.localStorage ? tsk_string_to_object(window.localStorage.getItem('org.doubango.expert.bandwidth')) : null), // could be redefined a session-level
                    video_size: (window.localStorage ? tsk_string_to_object(window.localStorage.getItem('org.doubango.expert.video_size')) : null), // could be redefined a session-level
                    sip_headers: [
                            { name: 'User-Agent', value: 'IM-client/OMA1.0 sipML5-v1.2013.08.10B' },
                            { name: 'Organization', value: 'TCS' }
                    ]
                }
            );
            if (oSipStack.start() != 0) {
                txtRegStatus.innerHTML = '<b>Failed to start the SIP stack</b>';
            }
            else return;
        }
        catch (e) {
            txtRegStatus.innerHTML = "<b>2:" + e + "</b>";
        }
        btnRegister.disabled = false;
    }

    // sends SIP REGISTER (expires=0) to logout
    function sipUnRegister() {
        if (oSipStack) {
            oSipStack.stop(); // shutdown all sessions
        }
    }
    

    function enterpressalert(e){
    	 if(e.keyCode===13){
    		 sipIM("message");
    	 }
     }
    
    function sipIM(s_type){ 
    if(msgError()){
 	 oConfigMsg = {
             
             events_listener: { events: '*', listener: onSipEventSession },
             sip_caps: [
                             { name: '+g.oma.sip-im' },
                             { name: '+sip.ice' },
                             { name: 'language', value: '\"en,fr\"' }
                         ]
         };
 		var uri=document.getElementById("uri").value;
 		var desturi="sip:"+uri+"@tcs.com";
 		
 		//alert("dest"+desturi); 
 		var content=document.getElementById("msg").value;
 		content=content.replace(/^\s+/, '').replace(/\s+$/, '');
 		if(content ===''){
 			return;
 		}
 		else{
 		document.getElementById("msg").value="";
  		sendDataToDiv("me",content);
		document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
 		/* if (oSipStack && !oSipSessionMessage && !tsk_string_is_null_or_empty(txtPhoneNumber.value))*/
 		oSipSessionMessage = oSipStack.newSession(s_type,oConfigMsg);
  		extraContent="[{trxnid}]";
 		addInt=extraContent+msgId;
 		msgId++;
 		finalMsg=content+addInt;
 		 
 		oSipSessionMessage.send(desturi,finalMsg, 'text/plain;charset=utf8');
 		}
 	   }
 	}
    
  //presence
	function sipPublis(s_type) {
		oSipPublish = oSipStack.newSession('publish', {
			expires : 100,
			sip_headers : [ {
				name : 'Event',
				value : 'presence'
			} ],
			sip_caps : [ {
				name : '+g.oma.sip-im'
			}, {
				name : '+sip.ice'
			}, {
				name : 'language',
				value : '\"en,fr\"'
			} ],
			events_listener : {
				events : '*',
				listener : onSipEventSession
			}
		});
		var loggedInUser=document.getElementById("txtPublicIdentity").value;
		
		var contentType = 'application/pidf+xml';
		var content = '<?xml version="1.0" encoding="UTF-8"?>\n'
				+ '<presence xmlns="urn:ietf:params:xml:ns:pidf">\n' +

				'<tuple id="a">\n' + '<status>\n' + '<basic>open</basic>\n'
				+ '<contact>'+loggedInUser+'</contact>\n'
				+ '<note>online</note></status>\n' + '</tuple>\n'
				+ '</presence>';
				
		oSipPublish.publish(content, contentType);
		sipSubscribe();
	
	}	
	//presence ends
	main('empty');
	
	var publishTimer=setInterval(function(){
		 sipPublis("publish");
		},90000);
	//subscribe
	function sipSubscribe() {
		for(var i=0;i<friendslist.length;i++)
			 {
			 	
				oConfigSub = {
					expires : 100,
					events_listener : {
						events : '*',
						listener : onSipEventSession
					},
					sip_headers : [ {
						name : 'Event',
						value : 'presence'
					}, // only notify for 'presence' events
					{
						name : 'Accept',
						value : 'application/pidf+xml'
					} // supported content types (COMMA-sparated)
					],
					sip_caps : [ {
						name : '+g.oma.sip-im'
					}, {
						name : '+sip.ice'
					}, {
						name : 'language',
						value : '\"en,fr\"'
					} ]
		
				};
		
				subscribeSession = oSipStack.newSession("subscribe", oConfigSub);
					to[i]=friendslist[i];
					subscribeSession.subscribe(to[i]);
					
			}
	}	
	//subscribe ends
    
    // makes a call (SIP INVITE)
    function sipCall(s_type) {	
	   /*  alert("making call"); */
	   	if(callError()){
		document.getElementById("ulCallOptions").style.visibility="hidden";
		arrCall=new Array(); 
		arrCall[arrCall.length]=document.getElementById("txtPublicIdentity").value;
		arrCall[arrCall.length]=document.getElementById("txtPhoneNumber").value;
		var startTime=new Date();
		arrCall[arrCall.length]=startTime.getTime();
        if (oSipStack && !oSipSessionCall && !tsk_string_is_null_or_empty(txtPhoneNumber.value)) {
            if(s_type == 'call-screenshare') {
                if(!SIPml.isScreenShareSupported()) {                
                    return;
                }
               //changed from https to http 
                if (!location.protocol.match('http')){
                    if (confirm("Screen sharing requires https://. Do you want to be redirected?")) {
                        sipUnRegister();
                        window.location = 'https://ns313841.ovh.net/call.htm';
                    }
                    return;
                }                
            }
            btnCall.disabled = true;
            btnHangUp.disabled = false;
            if(window.localStorage) {
/*                 alert("Local Storage");
 */            	//oConfigCall.bandwidth = tsk_string_to_object(window.localStorage.getItem('org.doubango.expert.bandwidth')); // already defined at stack-level but redifined to use latest values
            
               // oConfigCall.video_size = tsk_string_to_object(window.localStorage.getItem('org.doubango.expert.video_size')); // already defined at stack-level but redifined to use latest values
            }
            
            // create call session
            oSipSessionCall = oSipStack.newSession(s_type, oConfigCall);
            /* alert("Establishing COnnection"); */
            // make call
            
            if (oSipSessionCall.call(txtPhoneNumber.value) != 0) {
                oSipSessionCall = null;
                txtCallStatus.value = 'Failed to make call';
                btnCall.disabled = false;
                btnHangUp.disabled = true;
                return;
            }
            saveCallOptions();
        }
        else if (oSipSessionCall) {
        	alert("Inside answering if of sip call");
            txtCallStatus.innerHTML = '<i>Connecting...</i>';
            oSipSessionCall.accept(oConfigCall);
        	}
		}
    }
	 function answerCall(){
		if (oSipSessionCall) {
            txtCallStatus.innerHTML = '<i>Connecting...</i>';
            oSipSessionCall.accept(oConfigCall);
        	}
		btnHangUp.onclick=function(){sipHangUp();};
		btnCall.onclick=function(){setVisibility();};
		
		
	} 

    // transfers the call
    function sipTransfer() {
        if (oSipSessionCall) {
            var s_destination = prompt('Enter destination number', '');
            if (!tsk_string_is_null_or_empty(s_destination)) {
                btnTransfer.disabled = true;
                if (oSipSessionCall.transfer(s_destination) != 0) {
                    txtCallStatus.innerHTML = '<i>Call transfer failed</i>';
                    btnTransfer.disabled = false;
                    return;
                }
                txtCallStatus.innerHTML = '<i>Transfering the call...</i>';
            }
        }
    }
    
    // holds or resumes the call
    function sipToggleHoldResume() {
        if (oSipSessionCall) {
            var i_ret;
            btnHoldResume.disabled = true;
            txtCallStatus.innerHTML = oSipSessionCall.bHeld ? '<i>Resuming the call...</i>' : '<i>Holding the call...</i>';
            i_ret = oSipSessionCall.bHeld ? oSipSessionCall.resume() : oSipSessionCall.hold();
            if (i_ret != 0) {
                txtCallStatus.innerHTML = '<i>Hold / Resume failed</i>';
                btnHoldResume.disabled = false;
                return;
            }
        }
    }

    // terminates the call (SIP BYE or CANCEL)
    function sipHangUp() {
    	var endTime=new Date();
    	arrCall[arrCall.length]=endTime.getTime();
    	sendDataToUpload();   	
    	requestFreshCallLogs=false;
    	if (oSipSessionCall) {
            txtCallStatus.innerHTML = '<i>Terminating the call...</i>';
            oSipSessionCall.hangup({events_listener: { events: '*', listener: onSipEventSession }});
         
        }
    }
    
   	function sipSendDTMF(c){
        if(oSipSessionCall && c){
            if(oSipSessionCall.dtmf(c) == 0){
                try { dtmfTone.play(); } catch(e){ }
            }
        }
    }

    function startRingTone() {
        try { ringtone.play(); }
        catch (e) { }
    }
    
    function stopRingTone() {
        try { ringtone.pause(); }
        catch (e) { }
    }

    function startRingbackTone() {
        try { ringbacktone.play(); }
        catch (e) { }
    }

    function stopRingbackTone() {
        try { ringbacktone.pause(); }
        catch (e) { }
    }
    
    function startMsgTone() {
        try { msgtone.play(); }
        catch (e) { }
    }
    
    function toggleFullScreen() {
        if (videoRemote.webkitSupportsFullscreen) {
            fullScreen(!videoRemote.webkitDisplayingFullscreen);
        }
        else {
            fullScreen(!bFullScreen);
        }
    }

    function openKeyPad(){
        divKeyPad.style.visibility = 'visible';
        divKeyPad.style.left = ((document.body.clientWidth - C.divKeyPadWidth) >> 1) + 'px';
        divKeyPad.style.top = '70px';
        divGlassPanel.style.visibility = 'visible';
    }

    function closeKeyPad(){
        divKeyPad.style.left = '0px';
        divKeyPad.style.top = '0px';
        divKeyPad.style.visibility = 'hidden';
        divGlassPanel.style.visibility = 'hidden';
    }

    function fullScreen(b_fs) {
        bFullScreen = b_fs;
        if (tsk_utils_have_webrtc4native() && bFullScreen && videoRemote.webkitSupportsFullscreen) {
            if (bFullScreen) {
                videoRemote.webkitEnterFullScreen();
            }
            else {
                videoRemote.webkitExitFullscreen();
            }
        }
        else {
            if (tsk_utils_have_webrtc4npapi()) {
                try { if(window.__o_display_remote) window.__o_display_remote.setFullScreen(b_fs); }
                catch (e) { divVideo.setAttribute("class", b_fs ? "full-screen" : "normal-screen"); }
            }
            else {
                divVideo.setAttribute("class", b_fs ? "full-screen" : "normal-screen");
            }
        }
    }

    function showNotifICall(s_number) {
        // permission already asked when we registered
        if (window.webkitNotifications && window.webkitNotifications.checkPermission() == 0) {
            if (oNotifICall) {
                oNotifICall.cancel();
            }
            oNotifICall = window.webkitNotifications.createNotification('Call Notification', 'Incoming call from ' + s_number);
            oNotifICall.onclose = function () { oNotifICall = null; };
            oNotifICall.show();
        }
    }

    function onKeyUp(evt) {
        evt = (evt || window.event);
        if (evt.keyCode == 27) {
            fullScreen(false);
        }
        else if (evt.ctrlKey && evt.shiftKey) { // CTRL + SHIFT
            if (evt.keyCode == 65 || evt.keyCode == 86) { // A (65) or V (86)
                bDisableVideo = (evt.keyCode == 65);
                txtCallStatus.innerHTML = '<i>Video ' + (bDisableVideo ? 'disabled' : 'enabled') + '</i>';
                window.localStorage.setItem('org.doubango.expert.disable_video', bDisableVideo);
            }
        }
    }

    function onDivCallCtrlMouseMove(evt) {
        try { // IE: DOM not ready
            if (tsk_utils_have_stream()) {
                btnCall.disabled = (!tsk_utils_have_stream() || !oSipSessionRegister || !oSipSessionRegister.is_connected());
                document.getElementById("divCallCtrl").onmousemove = null; // unsubscribe
            }
        }
        catch (e) { }
    }

    function uiOnConnectionEvent(b_connected, b_connecting) { // should be enum: connecting, connected, terminating, terminated
        btnRegister.disabled = b_connected || b_connecting;
        btnUnRegister.disabled = !b_connected && !b_connecting;
        btnCall.disabled = !(b_connected && tsk_utils_have_webrtc() && tsk_utils_have_stream());
        btnHangUp.disabled = !oSipSessionCall;
    }

    function uiVideoDisplayEvent(b_local, b_added) {
        var o_elt_video = b_local ? videoLocal : videoRemote;

        if (b_added) {
            if (SIPml.isWebRtc4AllSupported()) {
                if (b_local){ if(window.__o_display_local) window.__o_display_local.style.visibility = "visible"; }
                else { if(window.__o_display_remote) window.__o_display_remote.style.visibility = "visible"; }
                   
            }
            else {
                o_elt_video.style.opacity = 1;
            }
            uiVideoDisplayShowHide(true);
        }
        else {
            if (SIPml.isWebRtc4AllSupported()) {
                if (b_local){ if(window.__o_display_local) window.__o_display_local.style.visibility = "hidden"; }
                else { if(window.__o_display_remote) window.__o_display_remote.style.visibility = "hidden"; }
            }
            else{
                o_elt_video.style.opacity = 0;
            }
            fullScreen(false);
        }
    }

    function uiVideoDisplayShowHide(b_show) {
        if (b_show) {
            tdVideo.style.height = '340px';
            divVideo.style.height = navigator.appName == 'Microsoft Internet Explorer' ? '100%' : '340px';
        }
        else {
            tdVideo.style.height = '0px';
            divVideo.style.height = '0px';
        }
        btnFullScreen.disabled = !b_show;
    }

    function uiDisableCallOptions() {
        if(window.localStorage) {
            window.localStorage.setItem('org.doubango.expert.disable_callbtn_options', 'true');
            uiBtnCallSetText('Call');
        }
    }

    function uiBtnCallSetText(s_text) {
    	 switch(s_text) {
         case "Call":
             {
                 var bDisableCallBtnOptions = (window.localStorage && window.localStorage.getItem('org.doubango.expert.disable_callbtn_options') == "true");
                 btnCall.value = btnCall.innerHTML = bDisableCallBtnOptions ? 'Call' : 'Call <span id="spanCaret" class="caret">';
                 if(!bDisableCallBtnOptions && ulCallOptions.parentNode == divBtnCallGroup){
               
                 }
                 else if(bDisableCallBtnOptions && ulCallOptions.parentNode != divBtnCallGroup) {
                 }
                 
                 break;
             }
         default:
             {
                 btnCall.value = btnCall.innerHTML = s_text;
                 btnCall.setAttribute("class", "btn btn-primary dropdown-toggle");
                // btnCall.onclick = function(){ sipCall(bDisableVideo ? 'call-audio' : 'call-audiovideo'); };
                 btnCall.onclick = function(){answerCall();};
                 ulCallOptions.style.visibility = "hidden";
                 if(ulCallOptions.parentNode == divBtnCallGroup){
                 }
                 break;
             }
     	}
    }

    function uiCallTerminated(s_description){    	
        uiBtnCallSetText("Call");
        btnHangUp.value = 'HangUp';
        btnHoldResume.value = 'hold';
        btnCall.disabled = false;
        btnHangUp.disabled = true;
        oSipSessionCall = null;
        stopRingbackTone();
        stopRingTone();
        txtCallStatus.innerHTML = "<i>" + s_description + "</i>";
        uiVideoDisplayShowHide(false);
        divCallOptions.style.opacity = 0;

        if (oNotifICall) {
            oNotifICall.cancel();
            oNotifICall = null;
        }
        uiVideoDisplayEvent(true, false);
        uiVideoDisplayEvent(false, false);
        setTimeout(function () { if (!oSipSessionCall) txtCallStatus.innerHTML = ''; }, 2500);
       requestFreshCallLogs;
        
    }

	
	function setVisibility(){
		 if(ulCallOptions.style.visibility === "hidden")			 
			 ulCallOptions.style.visibility = "visible";
		 else
			 ulCallOptions.style.visibility = "hidden";
	}
	    
    // Callback function for SIP Stacks
    function onSipEventStack(e /*SIPml.Stack.Event*/) {
        tsk_utils_log_info('==stack event = ' + e.type);
        switch (e.type) {
            case 'started':
                {
                    // catch exception for IE (DOM not ready)
                    try {
                        // LogIn (REGISTER) as soon as the stack finish starting
                        oSipSessionRegister = this.newSession('register', {
                            expires: 200,
                            events_listener: { events: '*', listener: onSipEventSession },
                            sip_caps: [
                                        { name: '+g.oma.sip-im', value: null },
                                        { name: '+audio', value: null },
                                        { name: 'language', value: '\"en,fr\"' }
                                ]
                        });
                        oSipSessionRegister.register();
                        sipPublis("publish");
                    }
                    catch (e) {
                        txtRegStatus.value = txtRegStatus.innerHTML = "<b>1:" + e + "</b>";
                        btnRegister.disabled = false;
                    }
                    break;
                }
            case 'stopping': case 'stopped': case 'failed_to_start': case 'failed_to_stop':
                {	
                    var bFailure = (e.type == 'failed_to_start') || (e.type == 'failed_to_stop');
                    oSipStack = null;
                    oSipSessionRegister = null;
                    oSipSessionCall = null;

                    uiOnConnectionEvent(false, false);

                    stopRingbackTone();
                    stopRingTone();

                    uiVideoDisplayShowHide(false);
                    divCallOptions.style.opacity = 0;

                    txtCallStatus.innerHTML = '';
                    txtRegStatus.innerHTML = bFailure ? "<i>Disconnected: <b>" + e.description + "</b></i>" : "<i style='color:red'>Offilne</i>";
                    break;
                }
                
            case 'i_new_message':
			{
					oSipSessionMessage=e.newSession;
					oSipSessionMessage.accept();
					oSipSessionMessage.setConfiguration(oConfigMsg);
					 var str =oSipSessionMessage.getRemoteFriendlyName();
									
					 var firstString=str.replace("<","");
					 var sRemoteUri=firstString.replace(">","");
					 var doc=e.getContentString();
					 var fstring=str+doc;
					 chkURI.push(fstring);
					 var cont=doc.split("[");
					startMsgTone();
					 document.getElementById("uri").value =str;
					 document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
					 //document.getElementById("textArea").value += str+" : "+cont[0]+ "\n" ;
					 sendDataToDiv(str,cont[0]);
					 $containerN = $("#containerMsg").notify();
					 create("default", { title:'New Message Received', text:str+' says: '+cont[0]});
            		break;
			}
            case 'i_new_call':
                {
                    if (oSipSessionCall) {
                        // do not accept the incoming call if we're already 'in call'
                       // e.newSession.hangup(); // comment this line for multi-line support
                    }
                    else {
                        oSipSessionCall = e.newSession;
                        // start listening for events
                        oSipSessionCall.setConfiguration(oConfigCall);
                        uiBtnCallSetText('Answer');
                        btnHangUp.disabled = false;
                        startRingTone(); 
                        customOpenModal('callModal');
                        var sRemoteNumber = (oSipSessionCall.getRemoteFriendlyName() || 'unknown');                        
                        txtCallStatus.innerHTML = "<i>Incoming call from [<b>" + sRemoteNumber + "</b>]</i>";
                        
                        showNotifICall(sRemoteNumber);
                        
                        arrCall=new Array(); 
                		arrCall[arrCall.length]="sip:"+sRemoteNumber+"@tcs.com";
                		arrCall[arrCall.length]=document.getElementById("txtPublicIdentity").value;
                		var startTime=new Date();
                		arrCall[arrCall.length]=startTime.getTime();
                    }
                    break;
                }

            case 'm_permission_requested':
                {
                    divGlassPanel.style.visibility = 'visible';
                    break;
                }
            case 'm_permission_accepted':
            case 'm_permission_refused':
                {
                    divGlassPanel.style.visibility = 'hidden';
                    if(e.type == 'm_permission_refused'){
                        uiCallTerminated('Media stream permission denied');
                    }
                    break;
                }

            case 'starting': default: break;
        }
    };

    function dummyUnregister(){
    	  window.localStorage.setItem('com.s.v.bool', "false");
    	  sipUnRegister();
    }
    
    function dummyRegister(){
      	if (window.localStorage.getItem('com.s.v.bool')=="true") {
      		setTimeout(function(){sipRegister();},700);     		
      	}      	
    }
    
    // Callback function for SIP sessions (INVITE, REGISTER, MESSAGE...)
    function onSipEventSession(e /* SIPml.Session.Event */) {
        tsk_utils_log_info('==session event = ' + e.type);

        switch (e.type) {
            case 'connecting': case 'connected':
                {
                    var bConnected = (e.type == 'connected');
                    
                    if (e.session == oSipSessionRegister) {
                        uiOnConnectionEvent(bConnected, !bConnected);      
	                      if(e.description.match("connecting") ){
	                    	  txtRegStatus.innerHTML = "<i>" + e.description + "</i>";
	                        }
	                      else{
	                    	  txtRegStatus.innerHTML = "<i style='color:green'>Online</i>";
	                      }                       
                    }
                    
                    else if (e.session == oSipSessionCall) {
                        btnHangUp.value = 'HangUp';
                        btnCall.disabled = true;
                        btnHangUp.disabled = false;
                        btnTransfer.disabled = false;

                        if (bConnected) {
                            stopRingbackTone();
                            stopRingTone();

                            if (oNotifICall) {
                                oNotifICall.cancel();
                                oNotifICall = null;
                            }
                        }

                        txtCallStatus.innerHTML = "<i>" + e.description + "</i>";
                        divCallOptions.style.opacity = bConnected ? 1 : 0;

                        if (SIPml.isWebRtc4AllSupported()) { // IE don't provide stream callback
                            uiVideoDisplayEvent(true, true);
                            uiVideoDisplayEvent(false, true);
                        }
                    }
                    break;
                } // 'connecting' | 'connected'
            case 'terminating': case 'terminated':
                {
                    if (e.session == oSipSessionRegister) {
                        uiOnConnectionEvent(false, false);

                        oSipSessionCall = null;
                        oSipSessionRegister = null;

                        txtRegStatus.innerHTML = "<i>" + e.description + "</i>";
                    }
                    else if (e.session == oSipSessionCall) {
                        uiCallTerminated(e.description);
                    }
                    break;
                } // 'terminating' | 'terminated'

            case 'i_notify': {
				console.info('NOTIFY content = ' + e.getContentString());
				console.info('NOTIFY content-type = ' + e.getContentType());				
				
				if (e.getContentType() == 'application/pidf+xml') {
					if (window.DOMParser) {
						var parser = new DOMParser();
						var xmlDoc = parser ? parser.parseFromString(e
								.getContentString(), "text/xml") : null;
			
						var presenceNode = xmlDoc ? xmlDoc
								.getElementsByTagName("presence")[0] : null;
						if (presenceNode) {
							var entityUri = presenceNode.getAttribute("entity");
			
							var tupleNode = presenceNode
									.getElementsByTagName("tuple")[0];
								
							var statusNode = tupleNode
									.getElementsByTagName("status")[0];
			
							if (tupleNode) {
								var statusNode = tupleNode
										.getElementsByTagName("status")[0];
					
								var noteNode = tupleNode
										.getElementsByTagName("note")[0];
			
								      var check = noteNode.textContent;
									  var contactNode=tupleNode.getElementsByTagName ("contact")[0];
									  var contactUri=contactNode.textContent;
	
										if (statusNode) {
											
											var basicNode = statusNode
													.getElementsByTagName("basic")[0];

											if (basicNode) {
															var basicValue=basicNode.textContent;
															if(basicValue==="open"){
																userStatus="online";
																xmlHttpRequest.open("POST", "PresenceServlet?friend1="+contactUri+"&friend1status=online", true);
																xmlHttpRequest.onreadystatechange=receiveMessageFromServer;
																xmlHttpRequest.send();
														}
															else{
																xmlHttpRequest.open("POST", "PresenceServlet?friend1="+contactUri+"&friend1status=offline", true);
																xmlHttpRequest.onreadystatechange=receiveMessageFromServer;
																xmlHttpRequest.send();
															}
												console.info('Presence notification: Uri = '
																+ entityUri
																+ ' status = '
																+ basicNode.textContent);
											}
										}
									}
								}
							}
						}
				
				break;
			}
			  
            case 'm_stream_video_local_added':
                {
                    if (e.session == oSipSessionCall) {
                        uiVideoDisplayEvent(true, true);
                    }
                    break;
                }
            case 'm_stream_video_local_removed':
                {
                    if (e.session == oSipSessionCall) {
                        uiVideoDisplayEvent(true, false);
                    }
                    break;
                }
            case 'm_stream_video_remote_added':
                {
                    if (e.session == oSipSessionCall) {
                        uiVideoDisplayEvent(false, true);
                    }
                    break;
                }
            case 'm_stream_video_remote_removed':
                {
                    if (e.session == oSipSessionCall) {
                        uiVideoDisplayEvent(false, false);
                    }
                    break;
                }

            case 'm_stream_audio_local_added':
            case 'm_stream_audio_local_removed':
            case 'm_stream_audio_remote_added':
            case 'm_stream_audio_remote_removed':
                {
                    break;
                }

            case 'i_ect_new_call':
                {
                    oSipSessionTransferCall = e.session;
                    break;
                }

            case 'i_ao_request':
                {
                    if(e.session == oSipSessionCall){
                        var iSipResponseCode = e.getSipResponseCode();
                        if (iSipResponseCode == 180 || iSipResponseCode == 183) {
                            startRingbackTone();
                            txtCallStatus.innerHTML = '<i>Remote ringing...</i>';
                        }
                    }
                    break;
                }

            case 'm_early_media':
                {
                    if(e.session == oSipSessionCall){
                        stopRingbackTone();
                        stopRingTone();
                        txtCallStatus.innerHTML = '<i>Early media started</i>';
                    }
                    break;
                }

            case 'm_local_hold_ok':
                {
                    if(e.session == oSipSessionCall){
                        if (oSipSessionCall.bTransfering) {
                            oSipSessionCall.bTransfering = false;
                            // this.AVSession.TransferCall(this.transferUri);
                        }
                        btnHoldResume.value = 'Resume';
                        btnHoldResume.disabled = false;
                        txtCallStatus.innerHTML = '<i>Call placed on hold</i>';
                        oSipSessionCall.bHeld = true;
                    }
                    break;
                }
            case 'm_local_hold_nok':
                {
                    if(e.session == oSipSessionCall){
                        oSipSessionCall.bTransfering = false;
                        btnHoldResume.value = 'Hold';
                        btnHoldResume.disabled = false;
                        txtCallStatus.innerHTML = '<i>Failed to place remote party on hold</i>';
                    }
                    break;
                }
            case 'm_local_resume_ok':
                {
                    if(e.session == oSipSessionCall){
                        oSipSessionCall.bTransfering = false;
                        btnHoldResume.value = 'Hold';
                        btnHoldResume.disabled = false;
                        txtCallStatus.innerHTML = '<i>Call taken off hold</i>';
                        oSipSessionCall.bHeld = false;

                        if (SIPml.isWebRtc4AllSupported()) { // IE don't provide stream callback yet
                            uiVideoDisplayEvent(true, true);
                            uiVideoDisplayEvent(false, true);
                        }
                    }
                    break;
                }
            case 'm_local_resume_nok':
                {
                    if(e.session == oSipSessionCall){
                        oSipSessionCall.bTransfering = false;
                        btnHoldResume.disabled = false;
                        txtCallStatus.innerHTML = '<i>Failed to unhold call</i>';
                    }
                    break;
                }
            case 'm_remote_hold':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = '<i>Placed on hold by remote party</i>';
                    }
                    break;
                }
            case 'm_remote_resume':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = '<i>Taken off hold by remote party</i>';
                    }
                    break;
                }

            case 'o_ect_trying':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = '<i>Call transfer in progress...</i>';
                    }
                    break;
                }
            case 'o_ect_accepted':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = '<i>Call transfer accepted</i>';
                    }
                    break;
                }
            case 'o_ect_completed':
            case 'i_ect_completed':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = '<i>Call transfer completed</i>';
                        btnTransfer.disabled = false;
                        if (oSipSessionTransferCall) {
                            oSipSessionCall = oSipSessionTransferCall;
                        }
                        oSipSessionTransferCall = null;
                    }
                    break;
                }
            case 'o_ect_failed':
            case 'i_ect_failed':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = '<i>Call transfer failed</i>';
                        btnTransfer.disabled = false;
                    }
                    break;
                }
            case 'o_ect_notify':
            case 'i_ect_notify':
                {
                    if(e.session == oSipSessionCall){
                        txtCallStatus.innerHTML = "<i>Call Transfer: <b>" + e.getSipResponseCode() + " " + e.description + "</b></i>";
                        if (e.getSipResponseCode() >= 300) {
                            if (oSipSessionCall.bHeld) {
                                oSipSessionCall.resume();
                            }
                            btnTransfer.disabled = false;
                        }
                    }
                    break;
                }
            case 'i_ect_requested':
                {
                    if(e.session == oSipSessionCall){                        
                        var s_message = "Do you accept call transfer to [" + e.getTransferDestinationFriendlyName() + "]?";//FIXME
                        if (confirm(s_message)) {
                            txtCallStatus.innerHTML = "<i>Call transfer in progress...</i>";
                            oSipSessionCall.acceptTransfer();
                            break;
                        }
                        oSipSessionCall.rejectTransfer();
                    }
                    break;
                }
        	}
   	 }
</script>

	<!-- Hidden fields for calling -->
	

	<script type="text/javascript">
		
		var xmlHttpRequest;
		var xmlHttpRequestGeo;
		if(window.XMLHttpRequest){
			xmlHttpRequest=new XMLHttpRequest();
			xmlHttpRequestGeo=new XMLHttpRequest();
		}
		else if(window.ActiveXObject){
			xmlHttpRequest=new ActiveXObject(MICROSOFT.XMLHTTP);
			xmlHttpRequestGeo=new ActiveXObject(MICROSOFT.XMLHTTP);
		} 

		function addFriend()
		{
			var notFriend=document.getElementById("notfriend").value;
			var privateIdentity=document.getElementById("privateIdentity").value;
			var password=document.getElementById("txtPassword").value;
			xmlHttpRequest.open("post","<%=request.getContextPath()%>/Controller?action=addFriend&notfriend="+notFriend+"&privateIdentity="+privateIdentity+"&password="+password+"",true);
			xmlHttpRequest.onreadystatechange=responseFromServlet;
			xmlHttpRequest.send();
		}
	 function removeFrnd()
	 {
	 		var sipUri="";
			var friends = document.getElementsByName('friend');
			var privateIdentity=document.getElementById('privateIdentity').value;
			var password=document.getElementById("txtPassword").value;
			for(var i = 0; i < friends.length; i++){
			    if(friends[i].checked){
			    	sipUri = friends[i].value;
			    }			   
			}
			if (sipUri==null || sipUri=="")
			{
				document.getElementById("user-error").innerHTML="Select from the given list";				
			}
			else
			{
				document.getElementById("user-error").innerHTML="";
				document.getElementById("displayDetails").style.display="none";
				xmlHttpRequest2.open("post","<%=request.getContextPath()%>/Controller?action=delete&privateIdentity="+privateIdentity+"&friend="+sipUri+"&password="+password+"",true);
				xmlHttpRequest2.onreadystatechange=responseFromServletForAddFrd;
				xmlHttpRequest2.send();
			} 		 
	 } 	
	</script>	
	<script type="text/javascript">
		var freshListOfFriends=new Array();
		var timer=setInterval(function(){
		var privateIdentity=document.getElementById("privateIdentity").value;
		var password=document.getElementById("txtPassword").value;
		xmlHttpRequest2.open("POST","<%=request.getContextPath()%>/Controller?action=getFreshData&privateIdentity="+privateIdentity+"&password="+password,false);
		xmlHttpRequest2.onreadystatechange=responseFromServletForRefresh;
		xmlHttpRequest2.send();
		},20000);

		function responseFromServletForRefresh(){
		
		if(xmlHttpRequest2.readyState==4&&xmlHttpRequest2.status==200)
		{
			document.getElementById("frndDiv").innerHTML=""; // dynamo woh div h jisme tumahri lists display ho rhin h
			document.getElementById("notFrndDiv").innerHTML="";
			freshListOfFriends=new Array();
			var table=$('<table id="frndTable" class="table1 table"></table>');
			var jsonResponseFromServer=eval('('+xmlHttpRequest2.responseText+')');
			var i=0;
			$.each(jsonResponseFromServer.Friends, function(key, val) {
				 var tr=$('<tr></tr>');
				 i++;
				
				$.each(val, function(k, v){
					
					if(k.match("NAME")){
						$('<td><input type="radio" onclick="getFriend();" name="friend" id="friends'+i+'" value="'+v+'">'+v.replace("sip:","")+'</td>').appendTo(tr);
						freshListOfFriends[freshListOfFriends.length]=v;
					}
					else{
						if("offline".match(v)){
							$('<td><img src="images/offline.gif" style="width: 10px;height: 10px;"</td>').appendTo(tr);
						}
						else
							{
							$('<td><img src="images/online.png" style="width: 10px;height: 10px;"</td>').appendTo(tr);
							}
					}
		    	});
				tr.appendTo(table);
			});
			table.appendTo('#frndDiv');			
			
			var j=0;
			var table1=$('<table id="notFrndTable" class="table1 table"></table>');
			$.each(jsonResponseFromServer.NotFriends,function(key,val)
					{
					var tr=$('<tr></tr>');
					 j++;
					$.each(val, function(k, v){
					$('<td><input type="radio" name="notfriend" id="friends'+j+'" value="'+v+'">'+v.replace("sip:","")+'</td>').appendTo(tr);
		    	});
				tr.appendTo(table1);
					});
			table1.appendTo('#notFrndDiv');
			main(freshListOfFriends);
			$('#callContacts').html($('#frndDiv').html());
			$('#ContactsOffline').html($('#frndDiv').html());
			} 
	 }	
	
	 function addToFriendList()
	 {
			var notFriend1=document.getElementsByName("notfriend");
			for(var i = 0; i < notFriend1.length; i++){
			    if(notFriend1[i].checked){
			    	friend = notFriend1[i].value;
			    }
			} 
			var privateIdentity=document.getElementById("privateIdentity").value;
			var password=document.getElementById("txtPassword").value;
			xmlHttpRequest2.open("POST","<%=request.getContextPath()%>/Controller?action=addFriend&privateIdentity="+privateIdentity+"&friendPrivateIdentity="+friend+"&password="+password+"",false);
			xmlHttpRequest2.onreadystatechange=responseFromServletForAddFrd;
			xmlHttpRequest2.send();			
	 } 
	 
		 function responseFromServletForAddFrd(){
			 
				if(xmlHttpRequest2.readyState==4&&xmlHttpRequest2.status==200)
				{
					document.getElementById("frndDiv").innerHTML=""; // dynamo woh div h jisme tumahri lists display ho rhin h
					document.getElementById("notFrndDiv").innerHTML="";
					var table=$('<table id="frndTable" class="table1 table"></table>');
					var jsonResponseFromServer=eval('('+xmlHttpRequest2.responseText+')');
					var i=0;
					freshListOfFriends1=new Array();
					$.each(jsonResponseFromServer.Friends, function(key, val) {
						 var tr=$('<tr></tr>');
						 i++;
						
						$.each(val, function(k, v){
							
							if(k.match("NAME")){
								$('<td><input type="radio" name="friend" onclick="getFriend();" id="friends'+i+'" value="'+v+'">'+v.replace("sip:","")+'</td>').appendTo(tr);
								freshListOfFriends1[freshListOfFriends1.length]=v;
							}
							else{
								if("offline".match(v)){
									$('<td><img src="images/offline.gif" style="width: 10px;height: 10px;"</td>').appendTo(tr);
								}
								else
									{
									$('<td><img src="images/online.png" style="width: 10px;height: 10px;"</td>').appendTo(tr);
									}
							}
				    	});
						tr.appendTo(table);
					});
					table.appendTo('#frndDiv');
					
					var j=0;
					var table1=$('<table id="notFrndTable" class="table1 table"></table>');
					$.each(jsonResponseFromServer.NotFriends,function(key,val)
							{
							var tr=$('<tr></tr>');
							 j++;
							$.each(val, function(k, v){
							$('<td><input type="radio" name="notfriend" id="friends'+j+'" value="'+v+'">'+v.replace("sip:","")+'</td>').appendTo(tr);
				    	});
						tr.appendTo(table1);
							});
					table1.appendTo('#notFrndDiv');
					main(freshListOfFriends1);
					sipSubscribe();
					$('#callContacts').html($('#frndDiv').html());
					$('#ContactsOffline').html($('#frndDiv').html());
				} 
			 }	
		 function getFriend(){
				var sipUri="";
				var friends = document.getElementsByName('friend');
				for(var i = 0; i < friends.length; i++){
				    if(friends[i].checked){
				    	sipUri = friends[i].value;
				    }				   
				}
				if (sipUri==null || sipUri=="")
				{
					document.getElementById("user-error").innerHTML="Select from the given list";					
				}
				else
					{
					document.getElementById("user-error").innerHTML="";
					document.getElementById("displayDetails").style.display="";
					document.getElementById("txtPhoneNumber").value=sipUri;
					document.getElementById("sipurireceiver").value=sipUri;
					var uriForMsg=sipUri.replace("sip:","");
					uriForMsg=uriForMsg.replace("@tcs.com","");
					document.getElementById("txtPhoneNumber").value=sipUri;
					document.getElementById("uri").value=uriForMsg;
					xmlHttpRequest.open("post","<%=request.getContextPath()%>/Controller?action=viewFriend&friend="+sipUri+"",true);
					xmlHttpRequest.onreadystatechange=responseFromServlet;
					xmlHttpRequest.send();
					}				
			}

		function responseFromServlet(){
			if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200){
				 var JSONObject=new Object();
				 JSONObject=eval('('+xmlHttpRequest.responseText+')');
				 document.getElementById("displayName1").value=JSONObject.record.DisplayName ; 
				 document.getElementById("publicIdentity1").value=JSONObject.record.PublicIdentity ; 
				 document.getElementById("privateIdentity1").value=JSONObject.record.PrivateIdentity ; 
				 document.getElementById("realm1").value=JSONObject.record.Realm ;
				 var uriForImage=JSONObject.record.PrivateIdentity.replace("sip:","");
		  		 uriForImage=uriForImage.replace("@","");
	    		 uriForImage=uriForImage.replace(".","");
				 document.getElementById("friendImage").src="User-Images/"+uriForImage+".png";
			}
		}
	</script>
	<script type="text/javascript">
		 function callFunc()
		 {
			 
			 var id="";
			 var sipUri="";
				var friends = document.getElementsByName('friend');
				for(var i = 0; i < friends.length; i++)
				{
				    if(friends[i].checked)
				    {
				    	sipUri = friends[i].value;
				    }				   
				}
				if (sipUri==null || sipUri=="")
				{
					document.getElementById("user-error").innerHTML="Select from the given list";					
				}
				else
				{
					document.getElementById("user-error").innerHTML="";
					document.getElementById("txtPhoneNumber").value=sipUri;
					customOpenModal('callModal');		
				}
		 }
		 function messageFunc()
		 {
			 var id="";
			 var sipUri="";
				var friends = document.getElementsByName('friend');
				for(var i = 0; i < friends.length; i++)
				{
				    if(friends[i].checked)
				    {
				    	sipUri = friends[i].value;
				    }
				}
				if (sipUri==null || sipUri=="")
				{
					document.getElementById("user-error").innerHTML="Select from the given list";
				}
				else
					{
					document.getElementById("user-error").innerHTML="";
					var uriForMsg=sipUri.replace("sip:","");
					uriForMsg=uriForMsg.replace("@tcs.com","");
					document.getElementById("txtPhoneNumber").value=sipUri;
					document.getElementById("uri").value=uriForMsg;
					customOpenModal('callModal');				
					}
		 }
		 function showFrnd(){
			 $('#friendMap').load('geolocationtogether.jsp');
			 var e= document.getElementById("friendMap");
		       if(e.style.opacity == 0){
		    	   document.getElementById("map-canvas").style.opacity=0;
		    	   document.getElementById("shareGeoLoc").style.display="none";
		    	   document.getElementById("user").style.display="none";
		    	   e.style.opacity = 1;
		       }		         
		 }
		 function hideFrnd(){
			 var e= document.getElementById("friendMap");
		       if(e.style.opacity == 1){
		    	   e.style.opacity = 0;
		    	   document.getElementById("shareGeoLoc").style.display="block";
		    	   document.getElementById("user").style.display="block";
			       document.getElementById("map-canvas").style.opacity=1;
		       }
		 }		         
	</script> 
	<script type="text/javascript">

	function updateProfile()
	{
		
		var displayName=document.getElementById("displayName").value;
		if(!"".match(displayName)){
		
		var publicIdentity=document.getElementById("publicIdentity").value;
		var realm=document.getElementById("realm2").value;
		var privateIdentity=document.getElementById("privateIdentity").value;
		xmlHttpRequest1.open("POST","<%=request.getContextPath()%>/Controller?action=updateProfile&displayName="+displayName+"&publicIdentity="+publicIdentity+"&realm="+realm+"&privateIdentity="+privateIdentity+"",true);
		xmlHttpRequest1.onreadystatechange=responseForUpdatedData;
		xmlHttpRequest1.send();
		}
		else{
			alert("Please enter Display Name");
		}
	}
	
	function removeProfile()
	{	
		var privateIdentity=document.getElementById("privateIdentity").value;
		xmlHttpRequest1.open("POST","<%=request.getContextPath()%>/Controller?action=removeProfile&privateIdentity="+privateIdentity+"",true);
		xmlHttpRequest1.onreadystatechange=responseForRemoveData;
		xmlHttpRequest1.send();
	}
	
	function responseForUpdatedData()
	{
		if(xmlHttpRequest1.readyState==4&&xmlHttpRequest1.status==200){
			 var JSONObject=new Object();
			 JSONObject=eval('('+xmlHttpRequest1.responseText+')');
			 document.getElementById("displayName").value=JSONObject.recordUpdated.DisplayNameUpdated ; 
			 document.getElementById("publicIdentity").value=JSONObject.recordUpdated.PublicIdentityUpdated ; 
		
			 document.getElementById("realm2").value=JSONObject.recordUpdated.RealmUpdated ;
			 document.getElementById("spanId").innerHTML="Welcome "+JSONObject.recordUpdated.DisplayNameUpdated ; 
			 document.getElementById("updateMsg").innerHTML="Display Name has been updated";

			};

		}}
	}	

</script>
<script>
function stopStack(){
	alert("inside stop");
	oSipStack.stop();
	}
</script>
<script type="text/javascript">
		$(function(){
			  $("#callContacts").html($("#frndDiv").html());
			  $("#ContactsOffline").html($("#frndDiv").html());
		});
		/* function stopStack(){
		oSipStack.stop();
		} */
</script>

</head>

<body oncontextmenu="return false">

<input type="hidden" style="width:100%; height: 100%;" id="txtRealm" value="<%=login1.getRealm().toString()%>" autocomplete='off' />
	<input type="hidden" style="width:100%; height: 100%;" id="txtPublicIdentity" value="<%=login1.getSipuri().toString()%>" autocomplete='off' />
	<input type="hidden" style="width:100%; height: 100%;" id="txtPrivateIdentity" value="<%=login1.getPrivateIdentity().toString()%>" autocomplete='off' />
	<input type="hidden" style="width:100%; height: 100%;" id="txtPassword"	value="<%=login1.getPassword().toString()%>" autocomplete='off' /> 
	<input type="hidden" style="width:100%; height: 100%;" id="txtDisplayName" value="<%=login1.getDisplayName().toString()%>" autocomplete="off" />

	<div class="header">	
		<p>	WebRTC Unified Communicator
			<a class="header-anchor" href="#" onclick="logoutFromClient();"><font color="#ffffff">Logout</font></a>		
		</p>		
	</div>
	
	 <div id="loading" style="top:10%; width: 80%;height: 2%; color:white; margin-left:0%; font-size:6px; background-color: black; opacity:1;"><h1>Please wait while the page loads...</h1></div> 		
	<div class="navbar" align="center" style="display:none;">
		<input type="button" class="btn" value="Enable Calls" id="btnRegister"
			style="width: 100px;" onclick='sipRegister();' /> 			
		<input type="button" id="btnUnRegister" class="btn" style="width: 140px;"
			value="Go in Offline Mode" disabled onclick='dummyUnregister();' />
		<input type="button" class="btn" value="Publish My Status"
			style="width: 130px;" onclick='sipPublis("publish")' />
		<input type="button" class="btn" style="width: 100px;" value="Check Status"
			onclick='sipSubscribe()' /> 
		<input type="button" class="btn" style="width: 100px;" value="Settings"
			onclick='openSettings()' /> 
	</div>
	
	<div id="callModal" >
		<h2>Instant Connect</h2>
		
		<div style="width:100%;height:100%;">	
		<div style="width:40%;height:100%;display:table-cell;float:left;">	
			<h6 style="margin-left:20%;">People in your phone book</h6>
			<div id="callContacts" class="span6 well" style="height:30%;overflow:auto;"></div>
			<!-- <input type="button" onclick="incrementValue()" value="Increment Value" />
			<input type="hidden" id="number" value="0"/>
				<div id="notification" style="width:20px;height:15px;">
					<div id="number1" style="margin:0 auto;color:white;"></div>
				</div> -->
		      <div id="divMsgCtrl" class="span6 well" style='display:table-cell;' style="background-color:#DDA0DD; position:fixed;">
		 		<table>
				<tr><td width="50px" style="color:black">To:</td><td><input type="text" style="width:100%;" id="uri" placeholder="Enter username eg: John"  /></td></tr>
				<tr><td width="50px"></td><td><span style="width:100%;color: red;" id="toError"></span></tr>
				<tr><td width="50px"></td><td><div class="chatbox" id="sipMsgs" style="width: 150px;height: 100px;overflow: auto;border: 1px solid rgb(201, 197, 197);background-color: white;margin-bottom: 20px;"></div></td></tr>		
				<tr><td width="50px" style="color:black">Chat:</td><td><input type="text" style="width:100%;" id="msg" onKeyPress="enterpressalert(event)"/></td>
				<tr><td width="50px"></td><td><input type="button" value="Send" style="width:50px; margin-left: 30%;" class="buttonblue1" onclick="sipIM('message');"/></td></tr>
				<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				</table>
			</div>
		</div>
			<div id="divCallCtrl" class="span7 well" style='display:table-cell; vertical-align:middle' style="background-color:#DDA0DD">
			<table>
				<tr>
					<td><img id="userImage" class="imagecall" src="User-Images/<%= imageName%>" onerror="this.src='User-Images/Default.png';"></td>
					<td><label class="labelcall">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=login1.getDisplayName().toString()%></label></td>
				</tr>                    
            </table> 
	            <label id="txtRegStatus" style="margin-left: 1.2%;padding-top: 1%;padding-bottom: 1%; font-weight: bold;"></label>
	            <label style="width: 100%;" align="center" id="txtCallStatus"> </label>
	            <table style='width: 100%;'>
	                  <tr>                     
	                       <td style="white-space:nowrap;">
	                       <input type="text" style="width: 100%; height:100%" id="txtPhoneNumber" value="" />                       
	                      </td>                         
	                   </tr>
	               		<tr>                     
	                       <td style="white-space:nowrap;">
	                       <span style="width: 100%; height:100%;color: red;" id="txtPhoneNumberError"></span>                       
	                      </td>                         
	                   </tr>
	                   <tr>
	                      <td colspan="1" align="right">
	                          <div class="btn-toolbar"
									style="margin: 0; vertical-align: middle">
									<div id="divBtnCallGroup" class="btn-group open">
										<button id="btnCall" onclick="setVisibility();" class="btn btn-primary dropdown-toggle"
											data-toggle="dropdown"
											value="Call &lt;span id=&quot;spanCaret&quot; class=&quot;caret&quot;&gt;">
											Call <span id="spanCaret" class="caret"></span>
										</button>
										
										<ul id="ulCallOptions" class="dropdown-menu"
											style="visibility: hidden;">
											<li><a href="#"	onclick="sipCall(&quot;call-audio&quot;);">Audio</a></li>
											<li><a href="#"	onclick="sipCall(&quot;call-audiovideo&quot;);">Video</a></li>		
										</ul>
										 <!-- advertisment component -->	
																<!-- <script>
																$(document).ready(function() {
																    $("#ulCallOptions").click(function() {
																        $("#iframe1").show().delay(12000).hide(700);
																    });
																});
																</script> -->
										<!-- End advertisment compoenent -->
									</div>
						
									<div class="btn-group">
										<input type="button" id="btnHangUp"
											style="margin: 0; vertical-align: middle; height: 100%;"
											class="btn btn-primary" value="HangUp" onclick="sipHangUp();"
											disabled="">
									</div>								
								</div>                  
	                         </td>               
						</tr>											
	                    <tr>
	                        <td id="tdVideo" class='tab-video'>
	                        	<!--  Advertisement  -->
						                   <!--   <iframe id="iframe1" style="display:none;" src="showAdvertisement.jsp" width="400" height="300" ></iframe> --> 
						         <!--  End Advertisement  -->
	                            <div id="divVideo" class='div-video'>
	                                <div id="divVideoRemote" style='border:1px solid #000; height:100%; width:100%'>
	                                    <video class="video" width="100%" height="100%" id="video_remote" autoplay="autoplay" style="opacity: 0; 
	                                        background-color: #000000; -webkit-transition-property: opacity; -webkit-transition-duration: 2s;">
	                                    </video>
	                                </div>
	                                <div id="divVideoLocal" style='border:0px solid #000'>
	                                    <video class="video" width="88px" height="72px" id="video_local" autoplay="autoplay" muted="true" style="opacity: 0;
	                                        margin-top: -80px; margin-left: 5px; background-color: #000000; -webkit-transition-property: opacity;
	                                        -webkit-transition-duration: 2s;">
	                                    </video>
	                                </div>
	                            </div>
	                        </td>
	                    </tr>
	                     <tr style="display:none;">
	                       <td align='center'>
	                            <div id='divCallOptions' class='call-options' style='opacity: 0; margin-top: 3px'>
	                                <input type="button" class="btn" style="" id="btnFullScreen" value="FullScreen" disabled onclick='toggleFullScreen();' /> &nbsp;
	                                <input type="button" class="btn" style="" id="btnHoldResume" value="Hold" onclick='sipToggleHoldResume();' /> &nbsp;
	                                <input type="button" class="btn" style="" id="btnTransfer" value="Transfer" onclick='sipTransfer();' /> &nbsp;
	                                <input type="button" class="btn" style="" id="btnKeyPad" value="KeyPad" onclick='openKeyPad();' />
	                            </div>
	                        </td>
	                    </tr> 
	                </table>
	        </div>
		</div>
	</div>
	<!--callModal ends here  -->
	
	
	<div id="userProfile" >
	<h2>Your Profile</h2>
			<fieldset style="border: none">	<div style="height: 100%;width: 100%;" align="center">
				<table class="profiletable">
				<tr><td >Profile Picture</td>
				<td><div id="profilePicContent">
				<img id="userImage3" src="User-Images/<%=imageName %>" onerror="this.src='User-Images/Default.png';" title="Click to change the profile picture" style="margin-bottom: 10px;">
				<img id="setDefault" class="removePic" onclick="removeProfile();" style="width:15px;height:15px;" src="images/close_button.jpg" title="Click here to remove your profile-picture.">
				
				</div>
				</td>
				</tr>
				
				<tr><td></td>
				<td><input type="file" id="profilePic" ></td>
				</tr>
				<tr><td>Display Name</td>
					<td><input type="text" id="displayName" name="displayName" value=<%=login1.getDisplayName()%> class="round full-width-input"/></td>
				</tr>
				<tr><td >Public Identity</td>
					<td><input type="hidden" id="publicIdentity" name="publicIdentity" value=<%=login1.getPublicIdentity()%> class="round full-width-input"/><label><%=login1.getPublicIdentity()%></label></td>
				</tr>
				<tr><td >Private Identity</td>
					<td><input type="hidden" id="privateIdentity" name="privateIdentity" value=<%=login1.getPrivateIdentity() %> class="round full-width-input"/><label><%=login1.getPrivateIdentity()%></label> </td>
				</tr>
				<tr><td >Realm</td>
					<td> <input type="hidden" id="realm2" name="realm" value=<%=login1.getRealm()%> class="round full-width-input"/><label><%=login1.getRealm()%></label></td>
				</tr>
				</table>
			</div>
			<div style="height: 100%;width: 100%;" align="center">
			<span style="margin-top:5px;color: green; font-size: 15px;" id="updateMsg"></span>
			<div>
			<table>
			<tr>
				<td><input type="submit" name="updateProfile" value="Update Profile" onclick="updateProfile();" class="buttonblue"/></td><br/><br/>
			</tr>
			</table>
			</div>
			
			</div><br>
				<div style="height: 100%;width: 100%;" align="center">
						<a onclick="openLink();" style="font-size:15px;cursor: pointer">Link other accounts</a></div>
		</fieldset><br/>
	</div>
	<!--userProfile ends here  -->
	
	<div id="friendList" >
	<h2>Your Contacts</h2>	
	
	<div style="width: 45%; float: left;margin-top:20px;">
			<div style="height:45%;max-height:10%;">		
				<div style="height: 4%;">&nbsp;&nbsp;&nbsp;<span style="color: red;" id="user-error"></span></div>
				<h6 style="margin-left:20%;height:6%;margin-bottom:10px;">People in your phone book</h6>
				<div style="padding-top:2%;max-height:130px;overflow:auto;" id="frndDiv">				
				    <table border="1" id="frndTable" class="table1 table">		   
				     <%if(friendList!=null){	    	
				    	ArrayList<String> status=(ArrayList<String>)login1.getPresenceStatus();
				    	for(int i=0;i<friendList.size();i++)
				    	{
				    		String statusCheck=status.get(i);
			    	%>
			    <tr><td>
			    <input type="radio" name="friend" id="friend" value="<%=friendList.get(i)%>" onclick="getFriend();"><font><%=friendList.get(i).replace("sip:","")%></font><br>
				</td>
				<td><%if("offline".equalsIgnoreCase(statusCheck)) %><img src="images/.gif" style="width: 10px;height: 10px;"><%else %><img src="images/online.png" style="width: 10px;height: 10px;"></td>
				</tr>
				<%} }%>
				</table>
				</div>				
			</div>
			<h6 style="margin-left: 20%;margin-bottom:10px;margin-top:20px;">People you may know</h6>
			<div style="margin-top: 5%;max-height:130px;overflow:auto;" id="notFrndDiv">				
				<table class="table1 table" id="notFrndTable">
			    <%if(notFriend!=null){
			    for(String currentNotFriend: notFriend){
			    	%>
			    <tr><td>
			    <input type="radio" name="notfriend" id="notfriend" value="<%=currentNotFriend%>"><%=currentNotFriend.replace("sip:","") %><br>
				</td>
				</tr>
				<%} }%>
				</table>		
			</div>
		</div>
		<div style="width: 50%; margin-left:5%; float: right ;margin-top:20px;">
			<div style="height: 30%;">
			<button style="width: 50px; margin-right: 5px;" id="call" class="buttonblue1" onclick="callFunc();">Call</button>
			<button style="width: 90px; margin-right: 5px;" id="message" class="buttonblue1" onclick="messageFunc();">Message</button>
			<button style="width: 80px; margin-right: 5px;"id="removeFrnd" onclick="removeFrnd();"  class="buttonblue1">Remove</button>
			<button style="width: 50px; margin-right: 5px;" id="add" onclick="addToFriendList();" class="buttonblue1">Add </button>
			</div>
			<div style="height: 65%;display: none" id="displayDetails">
				<table style="margin-top:5%;">
					<tr><td><label for="login-username">Name</label></td>
			    	    <td><input style="border: none;" type="text" id="displayName1" name="displayName1"  class="round full-width-input" readonly="readonly"/></td>		
					</tr>
					<tr><td><label for="login-username">PublicIdentity</label></td>
						<td><input style="border: none;" type="text" id="publicIdentity1" name="publicIdentity1"  class="round full-width-input" readonly="readonly" /></td>
					</tr>
					<tr><td><label for="login-username">PrivateIdentity</label></td>
					<td><input style="border: none;" type="text" id="privateIdentity1" name="privateIdentity1"  class="round full-width-input" readonly="readonly"/></td>
					</tr>
					<tr><td><label for="login-username">Realm</label></td>
					<td><input style="border: none;" type="text" id="realm1" name="realm1" class="round full-width-input" readonly="readonly"/></td>
					</tr>		
					<tr><td></td><td><img id="friendImage" onerror="this.src='images/Default.png';" style="width:100px;height: 100px;border-radius:10px "></td>
					</tr>
				</table>
			</div>
		</div>		
	</div>
	<!-- friendList ends here -->		
	

	
	<script type="text/javascript">
		var xmlHttpRequest6;
		if(window.XMLHttpRequest){
			xmlHttpRequest6=new XMLHttpRequest();
		}
		else if(window.ActiveXObject){
			xmlHttpRequest6=new ActiveXObject(MICROSOFT.XMLHTTP);
		} 
		function sendtoyahoo(){
			if(offlineMsgValidation()){
			var message=document.getElementById("message1").value;
			var sipuriR=document.getElementById("sipurireceiver").value;
				xmlHttpRequest6.open("post","<%=request.getContextPath()%>/messageServlet?action=Send_to_yahoo&sipurireceiver="+sipuriR+"&message="+message+" ",true);
				xmlHttpRequest6.onreadystatechange=responseFromServlet1;
				xmlHttpRequest6.send();
				}
		}
		function responseFromServlet1(){
			if(xmlHttpRequest6.readyState==4&&xmlHttpRequest6.status==200){
				alert(xmlHttpRequest6.responseText);
			}
		}
		function sendtogmail(){
			if(offlineMsgValidation()){
			var message=document.getElementById("message1").value;
			var sipuriR=document.getElementById("sipurireceiver").value;
			xmlHttpRequest6.open("post","<%=request.getContextPath()%>/messageServlet?action=Send_to_gmail&sipurireceiver="+sipuriR+"&message="+message+" ",true);
			xmlHttpRequest6.onreadystatechange=responseFromServlet2;
			xmlHttpRequest6.send();
			}
		}
		function responseFromServlet2(){
				if(xmlHttpRequest6.readyState==4&&xmlHttpRequest6.status==200){
					alert(xmlHttpRequest6.responseText);
				}
		}
		function sendtofacebook(){
			if(offlineMsgValidation()){
			var message=document.getElementById("message1").value;
			var sipuriR=document.getElementById("sipurireceiver").value;
			xmlHttpRequest6.open("post","<%=request.getContextPath()%>/messageServlet?action=Send_to_facebook&sipurireceiver="+sipuriR+"&message="+message+" ",true);
			xmlHttpRequest6.onreadystatechange=responseFromServlet5;
			xmlHttpRequest6.send();
			}
		}
		function responseFromServlet5(){
					if(xmlHttpRequest6.readyState==4&&xmlHttpRequest6.status==200){
						alert(xmlHttpRequest6.responseText);
					}
		}		
		function reloadCode(){
			alert("here");
		$('#loadHere').append('<a class="close-reveal-modal">&#215;</a>').load('CustomInterest.jsp');
		}
	</script>	


	<!-- Audios -->
	<audio id="audio_remote" autoplay="autoplay"></audio>
	<audio id="ringtone" loop src="sounds/ringtone.wav"></audio>
	<audio id="ringbacktone" loop src="sounds/ringbacktone.wav"></audio>
	<audio id="dtmfTone" src="sounds/dtmf.wav"></audio>
	<audio id="msgtone" src="sounds/msg.mp3"></audio>

	
<div class="container" style="display:none">
        <div class="span7 well">
            <label id="txtInfo"> </label>
            <h2> Expert settings</h2>
            <br />
            <table style='width: 100%'>
                <tr>
                    <td>
                        <label style="height: 100%">Disable Video:</label>
                    </td>
                    <td>
                        <input type='checkbox' id='cbVideoDisable' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Enable RTCWeb Breaker<sup><a href="#aRTCWebBreaker">[1]</a></sup>:</label>
                    </td>
                    <td>
                        <input type='checkbox' id='cbRTCWebBreaker' checked="checked"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">WebSocket Server URL<sup><a href="#aWebSocketServerURL">[2]</a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtWebsocketServerUrl" value="ws://192.66.36.206:443"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">SIP outbound Proxy URL<sup><a href="#aSIPOutboundProxyURL">[3]</a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtSIPOutboundProxyUrl" value="" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">ICE Servers<sup><a href="#aIceServers">[4]</a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtIceServers" value=""  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Max bandwidth (kbps)<sup><a href="#aBandwidth">[5]</a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtBandwidth" value=""  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Video size<sup><a href="#aSizeVideo">[6]</a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtSizeVideo" value="" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Disable 3GPP Early IMS<sup><a href="#aEarlyIMS">[7]</a></sup>:</label>
                    </td>
                    <td>
                        <input type='checkbox' id='cbEarlyIMS' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Disable debug messages<sup><a href="#aDebugMessages">[8]</a></sup>:</label>
                    </td>
                    <td>
                        <input type='checkbox' id='cbDebugMessages' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Cache the media stream<sup><a href="#aCacheMediaStream">[9]</a></sup>:</label>
                    </td>
                    <td>
                        <input type='checkbox' id='cbCacheMediaStream' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Disable Call button options<sup><a href="#aCallButtonOptions">[10]</a></sup>:</label>
                    </td>
                    <td>
                        <input type='checkbox' id='cbCallButtonOptions' />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <input type="button" class="btn-success" id="btnSave" value="Save" onclick='settingsSave();' />
                        &nbsp;
                        <input type="button" class="btn-danger" id="btnRevert" value="Revert" onclick='settingsRevert();' />
                    </td>
               </tr>

            </table>
        </div>
    </div> 
</body>
</html>
