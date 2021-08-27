package com.webrtc.service;

import java.util.List;


import com.webrtc.model.Geolocation;

public interface GeolocationService {

	public void addGeolocation(Geolocation geolocation);

	public List<Geolocation> listGeolocations(String sipuri);
	
	public Geolocation getGeolocation(String sipUri);
	
	public void deleteGeolocation(Geolocation geolocation);
	
}