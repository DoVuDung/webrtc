package com.webrtc.bean;

import java.util.ArrayList;

public class Login {
	ArrayList<String> sipuriFrd;
	private String displayName;
	private String privateIdentity;
	private String sipuri;
	private String realm;	
	private String password;
	ArrayList<String> presenceStatus;
	public ArrayList<String> getSipuriFrd() {
		return sipuriFrd;
	}
	public void setSipuriFrd(ArrayList<String> sipuriFrd) {
		this.sipuriFrd = sipuriFrd;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getPrivateIdentity() {
		return privateIdentity;
	}
	public void setPrivateIdentity(String privateIdentity) {
		this.privateIdentity = privateIdentity;
	}
	public String getSipuri() {
		return sipuri;
	}
	public void setSipuri(String sipuri) {
		this.sipuri = sipuri;
	}
	public String getRealm() {
		return realm;
	}
	public void setRealm(String realm) {
		this.realm = realm;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public ArrayList<String> getPresenceStatus() {
		return presenceStatus;
	}
	public void setPresenceStatus(ArrayList<String> presenceStatus) {
		this.presenceStatus = presenceStatus;
	}

	

}
