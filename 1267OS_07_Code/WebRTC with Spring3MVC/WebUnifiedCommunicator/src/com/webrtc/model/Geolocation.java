package com.webrtc.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Geolocation")

public class Geolocation implements Serializable {

	
	
private static final long serialVersionUID = -723583058586873479L;
	
	@Id
	@Column(name = "geosipuri")
	private String geosipuri;
	
	@Column(name="geolatitude")
	private String geoLatitude;
	
	@Column(name="geolongitude")
	private String geoLongitude;
	
	@Column(name="geodate")
	private String geodate;
	
	@Column(name="geotime")
	private String geotime;

	public String getGeosipuri() {
		return geosipuri;
	}

	public void setGeosipuri(String geosipuri) {
		this.geosipuri = geosipuri;
	}

	public String getGeoLatitude() {
		return geoLatitude;
	}

	public void setGeoLatitude(String geolatitude) {
		this.geoLatitude = geolatitude;
	}

	public String getGeoLongitude() {
		return geoLongitude;
	}

	public void setGeoLongitude(String geoLongitude) {
		this.geoLongitude = geoLongitude;
	}

	public String getGeodate() {
		return geodate;
	}

	public void setGeodate(String geodate) {
		this.geodate = geodate;
	}

	public String getGeotime() {
		return geotime;
	}

	public void setGeotime(String geotime) {
		this.geotime = geotime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
	
}