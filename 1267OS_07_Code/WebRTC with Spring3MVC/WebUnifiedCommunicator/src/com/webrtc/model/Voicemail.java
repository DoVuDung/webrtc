package com.webrtc.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

public class Voicemail implements Serializable{
	  String voicemailid;
	  String voicemailfromUser;
	  String voicemailtoUser;
	  Date voicemailmailTime;
	  Blob voicemailvoiceMail;
}
