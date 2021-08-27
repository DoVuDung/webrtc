<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<title>Communication Client</title>

<%-- <script src="resources/ajax/jquery.js"></script> --%>
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->

 <link href="http://code.google.com//apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css">
 <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
 
<script src="resources/metroui/scripts/jquery-1.6.1.min.js" type="text/javascript"></script>

<link href="resources/metroui/assets/css/bootstrap.css" title="style" rel="stylesheet" type="text/css" />
<link href="resources/metroui/css/style.css" title="style" rel="stylesheet" type="text/css" /> 
<link href="resources/metroui/css/reveal.css" rel="stylesheet" />
<link type="text/css" href="resources/metroui/css/start/jquery-ui-1.10.3.custom.css" rel="stylesheet" />

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css" type="text/css" media="screen" rel="stylesheet"/>

<script src="resources/metroui/scripts/jquery.masonry.min.js" type="text/javascript"></script>
<script src="resources/metroui/scripts/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="resources/metroui/scripts/MetroJs.lt.js" type="text/javascript"></script>

<script src="resources/metroui/scripts/jquery.fancybox-1.3.4.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/metroui/scripts/jquery.flexslider-min.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/metroui/scripts/hoverintent.js" type="text/javascript"	charset="utf-8"></script>
<script src="resources/metroui/scripts/jquery.jplayer.min.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/metroui/scripts/organictabs.jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="resources/metroui/scripts/javascript.js" type="text/javascript" ></script>
<script src="resources/metroui/scripts/mediaplayer.js" type="text/javascript"></script>
<script src="resources/release/SIPml-api.js" type="text/javascript"></script>
<script type="text/javascript" src="resources/metroui/scripts/jquery.reveal.js"></script>
<link type="text/css" rel="stylesheet" href="resources/metroui/css/ui.notify.css" />
<script src="resources/metroui/scripts/jquery-ui-1.10.3.custom.js"></script>
<script src="resources/metroui/scripts/jquery.notify.js" type="text/javascript"></script>
<link href="resources/metroui/css/gemoticons.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="resources/metroui/scripts/jquery.gemoticons.js"></script>

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

<!------------------------sip functions ------------ -->
<script type="text/javascript">
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
        }
        
    };

    
    window.onbeforeunload = function sipPuru()
    {    	
    oSipStack.stop();
        //sipUnRegister();
         return '';        //comment out 'return' to suppress prompt
    }

  
function sendDataToDiv(from,message)
{
var text=$('<div class="chat" style="color:gray">'+from+' : '+ message+ '</div>');
$('.chatbox').append(text);
$(text).gemoticon();
}

 /*   main('empty'); */
 
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

    // sends SIP REGISTER request to login
    function sipRegister() {
        // catch exception for IE (DOM not ready)
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
                            { name: 'Organization', value: 'Independent' }
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
 	oConfigMsg = {
             
             events_listener: { events: '*', listener: onSipEventSession },
             sip_caps: [
                             { name: '+g.oma.sip-im' },
                             { name: '+sip.ice' },
                             { name: 'language', value: '\"en,fr\"' }
                         ]
         };
 	var uri=document.getElementById("uri").value;
 	var desturi="sip:"+uri+"@domain.com";
 	
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
 	oSipSessionMessage = oSipStack.newSession(s_type,oConfigMsg);
 	extraContent="[{trxnid}]";
 	addInt=extraContent+msgId;
 	msgId++;
 	finalMsg=content+addInt;	 
 	oSipSessionMessage.send(desturi,finalMsg, 'text/plain;charset=utf8');
 	
 	}
 	}
    
  //presence
function sipPublis(s_type) {
//alert("publish called ");
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
//alert(" subscribe called ");

<c:if test="${!empty contacts}">

<c:forEach items="${contacts}" var="contact">

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

 //  alert("subscribe for ${contact.friend} ");
   
   console.info('SUBSCRIBE  to =${contact.friend}');
   
subscribeSession = oSipStack.newSession("subscribe", oConfigSub);	
subscribeSession.subscribe("${contact.friend}" );

</c:forEach>

</c:if>

}	
//subscribe ends
    
    // makes a call (SIP INVITE)
    function sipCall(s_type) {	
  /*  alert("making call"); */
document.getElementById("ulCallOptions").style.visibility="hidden";
arr=new Array(); 
arr[arr.length]=document.getElementById("txtPublicIdentity").value;
arr[arr.length]=document.getElementById("txtPhoneNumber").value;
var startTime=new Date();
arr[arr.length]=startTime.getTime();
        if (oSipStack && !oSipSessionCall && !tsk_string_is_null_or_empty(txtPhoneNumber.value)) {
            if(s_type == 'call-screenshare') {
                if(!SIPml.isScreenShareSupported()) {                
                    return;
                }
               //changed from https to http 
                if (!location.protocol.match('http')){
                    if (confirm("Screen sharing requires https://. Do you want to be redirected?")) {
                        //sipUnRegister();
                        //window.location = 'https://ns313841.ovh.net/call.htm';
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
            txtCallStatus.innerHTML = '<i>Connecting...</i>';
            oSipSessionCall.accept(oConfigCall);
        }
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
/*  var endTime=new Date();
    arr[arr.length]=endTime.getTime();
    sendDataToUpload();  */ 
    console.info(' call hangup ');
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
                 btnCall.onclick = function(){ sipCall(bDisableVideo ? 'call-audio' : 'call-audiovideo'); };
                 ulCallOptions.style.visibility = "hidden";
                 if(ulCallOptions.parentNode == divBtnCallGroup){
                     document.body.appendChild(ulCallOptions);
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
        
    }
    
   
    
    function shareMyLocation(){
    user = document.getElementById("user").value;
    arr=new Array();
    arr[arr.length]=user;    
        arr[arr.length]=latitude;
    arr[arr.length]=longitude;
   
    var DateTime=new Date();
    arr[arr.length]=DateTime.getDate() + "/" + (DateTime.getMonth() + 1) + "/" + DateTime.getFullYear().toString().substr(2,2);
    arr[arr.length]= DateTime.getHours() + ':' + DateTime.getMinutes() + ':'+ DateTime.getSeconds();
   
    sendDataToUploadGeo();
    }    
    
    function sendDataToUploadGeo() //This function makes use of AJAX To Call the Servlet
    {
    xmlHttpRequest.open("POST", "GeolocationstoreServlet?action=shareMyLoc&sipuri="+arr[0]+"&latitude="+arr[1]+"&longitude="+arr[2]+"&date="+arr[4]+"&time="+arr[3], true);
    xmlHttpRequest.onreadystatechange=receiveMessageFromServerShare;
    xmlHttpRequest.send();    	
    }
    function receiveMessageFromServerShare()
{
if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200)
{
var JSONObject=new Object();
JSONObject=eval('('+xmlHttpRequest.responseText+')');
alert(JSONObject.recordUpdated.serverReply);
}
}
    
   //send data    
function eraseResponseMessage()	{
document.getElementById("serverReply").innerHTML="";
}
   
function receiveMessageFromServer()    
{
if(xmlHttpRequest.readyState==4&&xmlHttpRequest.status==200)
{
document.getElementById("serverReply").innerHTML=xmlHttpRequest.responseText;
}
}
//send data end
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
                    txtRegStatus.innerHTML = bFailure ? "<i>Disconnected: <b>" + e.description + "</b></i>" : "<i>Disconnected</i>";
                    break;
                }
                
            case 'i_new_message':
{
            if(oSipSessionMessage){
            oSipSessionMessage=e.newSession;
           
            oSipSessionMessage.accept();
            var si=oSipSessionMessage.getRemoteUri();
    oSipSessionMessage.setConfiguration(oConfigMsg);
    var str = oSipSessionMessage.getRemoteFriendlyName();//Receiver's name
    var i=0;
    var firstString=str.replace("<","");
    var sRemoteUri=firstString.replace(">","");  	 
      var doc=e.getContentString();

    mainCont=doc.split("[");
    var string2=str+doc;
    for(k=0;k<chkURI.length;k++){
    if(chkURI[k]===string2){
    return;
    }
    }

    if(chkURI.length<10){
    //added    	
   	chkURI.push(string2);
   	var b="sip:";
   	   	var c =b.concat(sRemoteUri);
   	var a="@";
   	var d=a.concat("domain.com");
   	   	var f=c.concat(d);
   	   	//Code to call jqurey function here 
   	   	sendDataToDiv(str,mainCont[0]);
   	   	document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
   	           document.getElementById("uri").value =str;
   	          // document.getElementById("textArea").value += str+" : "+mainCont[0]+ "\n" ;
    }
    else
    {
    chkURI.splice(0,1);
    chkURI.push(string2);
        var b="sip:";
           	var c =b.concat(sRemoteUri);
        var a="@";
        var d=a.concat("domain.com");
           	
           	var f=c.concat(d);
           	//alert("realm "+document.getElementById("txtRealm"));                       
           	sendDataToDiv(str,mainCont[0]);
           	document.getElementById("sipMsgs").scrollTop = document.getElementById("sipMsgs").scrollHeight;
           	document.getElementById("uri").value =str;
                  // document.getElementById("textArea").value += str+" : "+mainCont[0]+ "\n" ;
    } 
    }
            else{            	
oSipSessionMessage=e.newSession;
oSipSessionMessage.accept();
oSipSessionMessage.setConfiguration(oConfigMsg);
var str = (oSipSessionMessage.getRemoteFriendlyName() || 'unknown');
var firstString=str.replace("<","");
var sRemoteUri=firstString.replace(">","");
var doc=e.getContentString();
var fstring=str+doc;
chkURI.push(fstring);
var cont=doc.split("[");
var b="sip:";
var c =b.concat(sRemoteUri);
var a="@";
var d=a.concat("domain.com");
var f=c.concat(d);
//code for jqurey
document.getElementById("uri").value =str;
document.getElementById("sipMsgs").scrollTop =    document.getElementById("sipMsgs").scrollHeight;
//document.getElementById("textArea").value += str+" : "+cont[0]+ "\n" ;
sendDataToDiv(str,cont[0]);
 	}
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
                        btnHangUp.value = 'Reject';
                        btnCall.disabled = false;
                        btnHangUp.disabled = false;

                        startRingTone(); 
                        customOpenModal('callModal');
                        var sRemoteNumber = (oSipSessionCall.getRemoteFriendlyName() || 'unknown');                        
                        txtCallStatus.innerHTML = "<i>Incoming call from [<b>" + sRemoteNumber + "</b>]</i>";
                        
                        showNotifICall(sRemoteNumber);
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
                        txtRegStatus.innerHTML = "<i>" + e.description + "</i>";
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
             //   alert("i_notify called ");
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

//	alert("Presence  contact uri = " + contactUri);
if (statusNode) {
var basicNode = statusNode
.getElementsByTagName("basic")[0];

if (basicNode) {
var basicValue=basicNode.textContent;
if(basicValue==="open"){
userStatus="online";
console.info('Presence notification: Uri = '
+ contactUri
+ ' status = online ');
doAjaxPostPresence(contactUri,userStatus );
   }
else{
userStatus="offline";
console.info('Presence notification: Uri = '
+ contactUri
+ ' status = online ');
doAjaxPostPresence(contactUri,userStatus );
}
/* console.info('Presence notification: Uri = '
+ contactUri
+ ' status = '
+ basicNode.textContent); */
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
    
    function doAjaxPostPresence(sipuri , status ) {  

 var sipuri = sipuri;
 var status = status;
    console.info( "Prsence post ajax "+ sipuri+ " "+ status);
 
 $.ajax({  
   type: "POST",  
   url: "/WebUnifiedCommunicator/addpresenceajax.html",  
   data:  "sipuri=" + sipuri + "&status=" + status ,

   success: function(response){  
   // we have the response  
   //  $('#infoopenid').html(response);  
   },  
   error: function(e){  
   //  alert('Error: ' + e);  
   
   }  
 });  
}  

</script>

<script type="text/javascript">
function create( template, vars, opts ){
return $containerN.notify("create", template, vars, opts);
}	


 var refreshId2 = setInterval(function(){
$containerN = $("#containerNote").notify();	
$.ajax({
type:"POST",
url:'/WebUnifiedCommunicator/getFreshNotifications.html',
data:{userId:$("#txtPublicIdentity").val()},
success:function(data)
{
var jsonNotifcation=new Object();
jsonNotification=eval('('+data+')');
//alert(jsonNotification.Notifications);
$("#containerNote").html('');
   	$.each(jsonNotification.Notifications, function(key, val) {
//alert("inside loop");
if(val.TYPE.match("VOICEMAIL")){
create("withIcon", { title:'New VoiceMail Received!', text:val.DETAILS+' <a style="color:white;text-decoration:underline; cursor: pointer;"  id="'+val.ID+'" class="ui-notify-close" onclick="updateStatusVoiceMail(this);">Listen</a>', icon:'info.png' },{ 
expires:false
});
} 
 
 if(val.TYPE.match("CONFERENCE")){
// alert(val.TYPE);
create("withIcon", { title:'Conference Invite!', text:val.DETAILS+'  <a style="color:white;text-decoration:underline; cursor: pointer;"  id="'+val.ID+'" class="ui-notify-close" onclick="updateStatusConference(this);">Join</a> <a style="color:white;text-decoration:underline; cursor: pointer;"  id="'+val.ID+'" class="ui-notify-close" onclick="declineConference(this);">Decline</a>', icon:'info.png' },{ 
expires:false
});
}
}); 
}
});  
    }, 10000);


</script>

<script>
function addToFriendList()
{
   /* var notFriend1=$('#notfriend').val(); */
   var notFriend1=$("input:radio[name=notfriend]:checked").val();
   var sipuri=$('#privateIdentity').val();
 //  alert (" add contact data "+ sipuri+" " + notFriend1); 

   $.ajax({  
   type: "POST",  
   url: "/WebUnifiedCommunicator/addcontactajax.html",  
   data: "sipuri=" + sipuri + "&friend=" + notFriend1,  
   success: function(response){  	    
   	readfriendList();
   	
   },
   error: function(e){  
  //   alert('Error: ' + e);  
   }
 })
}



function removeFromFriendList()
{
  var notFriend1=$("input:radio[name=friend]:checked").val();
   var sipuri=$('#privateIdentity').val();
//  alert ("Remove contact data "+ sipuri+" " + notFriend1); 
   $.ajax({  
   type: "POST",  
   url: "/WebUnifiedCommunicator/removecontactajax.html",  
   data: "sipuri=" + sipuri + "&friend=" + notFriend1,  
   success: function(response){  	    

   	readfriendList();
   },
   error: function(e){  
  //   alert('Error: ' + e);  
   }
 })
}
</script>

<script>
function showDetail(){
var friend=$("input:radio[name=friend]:checked").val();
/*  alert (" show data "+friend); */
   $.ajax({  
   type: "POST",  
   url: "/WebUnifiedCommunicator/showuserdetail.html",  
   data: "friend=" + friend,  
   success: function(response){ 
   	$("#displayDetails").css('display','');
  var jsonObject=new Object();
  jsonObject=eval('('+response+')');
   	document.getElementById("displayName1").value=jsonObject.JsonFriend.displayName ; 
	document.getElementById("publicIdentity1").value=jsonObject.JsonFriend.publicIdentity ; 
	document.getElementById("privateIdentity1").value=jsonObject.JsonFriend.privateIdentity ; 
	document.getElementById("realm1").value=jsonObject.JsonFriend.realm ;	
   var uriForImage=jsonObject.JsonFriend.privateIdentity.replace("sip:","");
   uriForImage=uriForImage.replace("@domain.com","");	                     
   document.getElementById("friendImage").src="UserImage/"+uriForImage+".png";
   
   document.getElementById("txtPhoneNumber").value=jsonObject.JsonFriend.privateIdentity ; 
   document.getElementById("uri").value=jsonObject.JsonFriend.privateIdentity ; 
  
},  
   error: function(e){  
     alert('Error: ' + e);  
   }
 });
}
</script>

<!-- Hidden fields for calling -->
<input type="hidden" style="width:100%; height: 100%;" id="txtRealm" value="${userdetail.realm}" autocomplete='off' />
<input type="hidden" style="width:100%; height: 100%;" id="txtPrivateIdentity" value="${userdetail.publicIdentity}" autocomplete='off' />
<input type="hidden" style="width:100%; height: 100%;" id="txtPublicIdentity" value="${userdetail.privateIdentity}" autocomplete='off' />
<input type="hidden" style="width:100%; height: 100%;" id="txtPassword"	value="${userdetail.password}" autocomplete='off' /> 
<input type="hidden" style="width:100%; height: 100%;" id="txtDisplayName" value="${userdetail.displayName}" autocomplete="off" />

</head>
<body oncontextmenu="return false">
<div class="header">	
<p>	
Web Unified Communicator
<!-- <a class="header-anchor" href="dologout.html" onclick="stopStack();"><font color="#ffffff">Logout</font></a> -->	
  <a class="header-anchor" href='<c:url value="/j_spring_security_logout" />' onclick="stopStack();"><font color="#ffffff">Logout</font></a>
</p>	
</div>

<!-- Calling hidden Methods  -->
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
<!-- End calling hidden fucntions -->

<table style="width:100%;padding: 10px;">

<tr>

<td>
       <img id="userImage1" src="UserImage/${userdetail.displayName}.png">		<!-- Profile Modal starts  -->
		<form:form action="/WebUnifiedCommunicator/updateProfilePic.html" name="frm" method="POST" enctype="multipart/form-data">
		<table>
		<tr>
		<td><form:input path="fileData" id="image" type="file" /></td>  
		<td colspan="4" align="center"><input type="submit" value="Upload" /></td>
		
		</tr>
		</table>	
		</form:form>
		
		<div id="userProfile" style=" background-color:#20b2aa; ">
		<h5>Your Profile</h5>
		<form:form method="POST" action="saveuserdetail.html">
		  <table>
		   <tr>
		       <td><form:label path="privateIdentity">Sipuri :</form:label></td>
		       <td><form:input path="privateIdentity" value="" /></td>
		   </tr>
		   <tr>
		       <td><form:label path="displayName">Name  :</form:label></td>
		       <td><form:input path="displayName" value=""/></td>
		   </tr>
		   <tr>
		       <td><form:label path="publicIdentity">Private identity :</form:label></td>
		       <td><form:input path="publicIdentity" value=""/></td>
		   </tr>
		   <tr>
		       <td><form:label path="password">password :</form:label></td>
		       <td><form:input path="password" value=""/></td>
		   </tr>
		   <tr>
		       <td><form:label path="realm">realm :</form:label></td>
		       <td><form:input path="realm" value=""/></td>
		   </tr>
		   <tr>
		     <td colspan="2"><input type="submit" value="Submit"/></td>
		     </tr>
		</table> 
		</form:form>
		

		<script type="text/javascript">
		function doAjaxPostOpenid() {  
		
		 var sipuri = $('#sipuri').val();
		 var facebook = $('#facebook').val();
		 var google = $('#google').val();
		 var yahoo = $('#yahoo').val();
		
		//  alert( sipuri+ " "+ facebook +" "+ google+ " "+ yahoo);
		 
		 $.ajax({  
		   type: "POST",  
		   url: "/WebUnifiedCommunicator/addopenidajax.html",  
		   data:  "sipuri=" + sipuri + "&facebook=" + facebook + 
		   	 "&google=" + google + "&yahoo=" + yahoo ,
		 
		   success: function(response){  
		     // we have the response  
		     $('#infoopenid').html(response);
		 
		    /*  $('#sipuri').val('');
		   	$('#facebook').val('');
		    $('#google').val('');
		   	$('#yahoo').val(''); */
		 
		   },  
		   error: function(e){  
		    // alert('Error: ' + e);  
		   	$('#infoopenid').html(e);
		   }  
		 });  
		}  
		
		</script>
		
		<h2>Add Opensipuri Data</h2>
		<form:form method="POST" action="/WebUnifiedCommunicator/saveopenid.html">
		  <table>
		   <tr>
		       <td><form:label path="sipuri">Sipuri :</form:label></td>
		       <td><form:input path="sipuri" value="" id="sipuri" /></td>
		   </tr>
		   <tr>
		       <td><form:label path="google">Google :</form:label></td>
		       <td><form:input path="google" value="" id="google"/></td>
		   </tr>
		   <tr>
		       <td><form:label path="facebook">Facebook :</form:label></td>
		       <td><form:input path="facebook" value="" id="facebook"/></td>
		   </tr>
		   <tr>
		       <td><form:label path="yahoo">yahoo :</form:label></td>
		       <td><form:input path="yahoo" value="" id="yahoo"/></td>
		   </tr>
		   <tr>
		     <td><input type="button" value="Add Users" onclick="doAjaxPostOpenid()"></td>
		     <!-- <td colspan="2"><input type="submit" value="Submit"/></td> -->
		     </tr>
		</table> 
		</form:form>
		          <div id="infoopenid" style="color: green;"></div> 
		</div>
		<!--userProfile ends here  -->
</td>

<td>
		
		<!-- Message Modal starts  -->	
		<div align="center" style="width:80%;height:100%;background-color:#4682b4;"> 	
	
		  <div id="divMsgCtrl" style='display:table-cell;' >
			<h5>Message Box</h5>
			<table border ="0">
			<tr><td width="50px" style="color:black">To:</td><td><input type="text" style="width:100%;" id="uri" placeholder="Enter username eg: John"  /></td></tr>
			<tr><td width="50px"></td><td><div class="chatbox" id="sipMsgs" style="width: 150px;height: 100px;overflow: auto;border: 1px solid rgb(201, 197, 197);background-color: white;margin-bottom: 20px;"></div></td></tr>	
			<tr><td width="50px" style="color:black">Chat:</td><td><input type="text" style="width:100%;" id="msg" onKeyPress="enterpressalert(event)"/></td>
			<tr><td width="50px"></td><td><input type="button" value="Send" style="width:50px; margin-left: 30%;" class="btn btn-primary dropdown-toggle" onclick="sipIM("message");"/></td></tr>
			<tr>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			</table>
			</div>
		</div>

		<!-- Message modal ends  -->
		<br/></br>
		<!-- Call Modal starts  -->
		<div id="callModal" align="center" style="width:80%;height:100%;background-color:#87cefa;">
		                    
			<div id="divCallCtrl"  style='display:table-cell; vertical-align:middle' >
					<h5>Call Box</h5>
					<table>
						<tr>
						
						<td><label class="labelcall">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; user</label></td>
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
		                     <td colspan="1" align="right">
		                         <div class="btn-toolbar"	style="margin: 0; vertical-align: middle">
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
		                     <!--    <iframe id="iframe1" style="display:none;"  width="700" height="450" src="http://localhost:8080/WebRTCSolution_Test/CallServlet"></iframe> -->	                          
		                   <!--  <iframe id="iframe1" style="display:none;"  width="700" height="450" src="http://localhost:8080/WebUnifiedCommunicator/advertisement.html"></iframe>      
		 					-->        
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
		<!--callModal ends here  -->


</td>

<td>
		<script>
		function readfriendList()
		{
		 var sipuri="${userdetail.privateIdentity}";
		 
		//	 alert ("read contact data "+ sipuri); 
		   $.ajax({  
		   type: "POST",  
		   url: "/WebUnifiedCommunicator/readcontactajax.html",  
		   data: "sipuri=" + sipuri,  
		   success: function(response){  	
		   	    
		  /*$('#infocontact').html(response); */
		
		document.getElementById("frndDiv").innerHTML="";
		document.getElementById("notFrndDiv").innerHTML="";
		  var jsonObject=new Object();
		  var friendimg="";
		  jsonObject=eval('('+response+')');
		   	var table=$('<table align="left" border="1"  style="color:black;"></table>');
		   	var tr=$('<tr></tr>');
		   	$.each(jsonObject.Friends, function(key, val) {
		   	var tr=$('<tr></tr>');
		   	$.each(val, function(k, v){
		   	$('<td>').appendTo(tr);	
		   	friendimg=v;
		   	friendimg=friendimg.replace("sip:","");
		   	friendimg=friendimg.replace("@domain.com","");
		
		   	if(k.match("Friendsipuri")){
		   		 $('<td><img src="UserImage/'+friendimg+'.png" style="width: 30px;height: 30px;"></td>').appendTo(tr); 
		   	$('<td><input type="radio" name="friend" id="friend" value='+v+' onclick="showDetail();" ><font>'+v+'</font></td>').appendTo(tr);
		}
		else{
		 if("offline".match(v)){
		$('<td id="'+v+'status"><img src="resources/metroui/images/offline.gif" style="width: 10px;height: 10px;"></td>').appendTo(tr);
		}
		else
		{
		$('<td id="'+v+'status"><img src="resources/metroui/images/online.png" style="width: 10px;height: 10px;"></td>').appendTo(tr);
		} 
		}
		   	$('</td>').appendTo(tr);	
		   	tr.appendTo(table);
		   	});
		   	});
		   	table.appendTo('#frndDiv');
		   	
		
		   	var table=$('<table align="left" border="1"  style="color:black;"></table>');
		   	
		   	$.each(jsonObject.NotFriends, function(key, val) {	
		   	var tr=$('<tr></tr>');	
		   	$.each(val, function(k, v){	
		   	$('<td>').appendTo(tr);	
		           $('<input type="radio" name="notfriend" id="notfriend" value='+v+' ><font>'+v+'</font><br>').appendTo(tr);
		   	$('</td>').appendTo(tr);	
		   	tr.appendTo(table);
		   	});
		   	});
		   	table.appendTo('#notFrndDiv');
		
		      //load values into callcontact div of instant connecet 
		   	document.getElementById("callContacts").innerHTML="";
		   	$("#callContacts").html($("#frndDiv").html());
		   	 
		   },
		   error: function(e){  
		     //alert('Error: ' + e);  
		   }
		 })
		}
		   
		 //calling ajax function to read friend list 
		var refreshFriendlistTimer=setInterval(function(){
		readfriendList();;
		},3000);
		
		</script>
		
		<div id="friendList" align="center" style="width:80%;height:100%;background-color:#6495ed; ">
	
		<h6 style="margin-left:20%;height:6%;margin-bottom:10px;">Phone Book</h6>
		<div style="padding-top:2%;max-height:130px;overflow:auto;" id="frndDiv">	</div>	
		
		<button style="width: 50px; margin-right: 5px;"id="removeFrnd" onclick="removeFromFriendList();"  class="button">Remove</button>
		<button style="width: 50px; margin-right: 5px;" id="add" onclick="addToFriendList();" class="button">Add </button>
		</div>	
		</div>
		
		<!-- friendList ends here -->	
		<br/></br>
    
</td>

</tr>

</table>



<div id="bodypat">
<section id="container">

<!-- BEGIN HEADER -->
<header class="clearfix">

<div id="footer" style="width:100%;align:center;margin-top:5%;">
<p style="color:#00000;"><label>&copy; For academic use only.</label></p>
</div> <!-- end footer -->
<!-- END FOOTER -->
</section>
<!-- end #container -->
</div><!--bodypat ends here -->

<!-- Audios -->
<audio id="audio_remote" autoplay="autoplay"></audio>
<audio id="ringtone" loop src="resources/metroui/sounds/ringtone.wav"></audio>
<audio id="ringbacktone" loop src="resources/metroui/sounds/ringbacktone.wav"></audio>
<audio id="dtmfTone" src="resources/metroui/sounds/dtmf.wav"></audio>


<!-- expert script  -->	
<div class="container" >
        <div class="span7 well">
            <label align="center" id="txtInfo"> </label>
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
                        <label style="height: 100%">Enable RTCWeb Breaker<sup><a href="#aRTCWebBreaker"></a></sup>:</label>
                    </td>
                    <td>
                        <input type='checkbox' id='cbRTCWebBreaker' checked="checked"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">WebSocket Server URL<sup><a href="#aWebSocketServerURL"></a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtWebsocketServerUrl" value="ws://127.0.0.1:443"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">SIP outbound Proxy URL<sup><a href="#aSIPOutboundProxyURL"></a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtSIPOutboundProxyUrl" value="udp://127.0.0.1:5060"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">ICE Servers<sup><a href="#aIceServers"></a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtIceServers" value=""  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Max bandwidth (kbps)<sup><a href="#aBandwidth"></a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtBandwidth" value=""  />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Video size<sup><a href="#aSizeVideo"></a></sup>:</label>
                    </td>
                    <td>
                        <input type="text" style="width: 100%; height: 100%" id="txtSizeVideo" value="" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="height: 100%">Disable 3GPP Early IMS<sup><a href="#aEarlyIMS"></a></sup>:</label>
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