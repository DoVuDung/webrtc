package com.webrtc.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Customizeinterest")
public class Customizeinterest implements Serializable{

	
	/*@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name="SequenceNumber")
	private int customizeSequenceNumber;*/
	@Id
	@Column(name="customizesipuri")
	private String customizesipuri;
	
	@Column(name = "customizeaccessories")
	private String customizeaccessories;
	
	@Column(name="customizeautomobile")
	private String customizeautomobile;
	
	@Column(name="customizefood")
	private String customizefood;

	/*public int getCustomizeSequenceNumber() {
		return customizeSequenceNumber;
	}

	public void setCustomizeSequenceNumber(int customizeSequenceNumber) {
		this.customizeSequenceNumber = customizeSequenceNumber;
	}
*/
	public String getCustomizesipuri() {
		return customizesipuri;
	}

	public void setCustomizesipuri(String customizesipuri) {
		this.customizesipuri = customizesipuri;
	}

	public String getCustomizeaccessories() {
		return customizeaccessories;
	}

	public void setCustomizeaccessories(String customizeaccessories) {
		this.customizeaccessories = customizeaccessories;
	}

	public String getCustomizeautomobile() {
		return customizeautomobile;
	}

	public void setCustomizeautomobile(String customizeautomobile) {
		this.customizeautomobile = customizeautomobile;
	}

	public String getCustomizefood() {
		return customizefood;
	}

	public void setCustomizefood(String customizefood) {
		this.customizefood = customizefood;
	}
	
	

}
