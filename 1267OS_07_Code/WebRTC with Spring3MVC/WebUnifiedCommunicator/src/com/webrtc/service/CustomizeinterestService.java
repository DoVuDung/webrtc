package com.webrtc.service;


import java.util.List;


import com.webrtc.bean.CustomizeinterestBean;
import com.webrtc.model.Customizeinterest;

public interface CustomizeinterestService {
	public void addCustomizeinterest(Customizeinterest customizeinterest);
	public List<Customizeinterest> listCustomizeinterestss(String sipuri);
}
