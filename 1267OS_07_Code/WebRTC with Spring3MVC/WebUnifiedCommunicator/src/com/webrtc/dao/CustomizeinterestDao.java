package com.webrtc.dao;


import java.util.List;


import com.webrtc.bean.CustomizeinterestBean;
import com.webrtc.model.Customizeinterest;

public interface CustomizeinterestDao {
	public void addCustomizeinterest(Customizeinterest customizeinterest);
	public List<Customizeinterest> listCustomizeinterestss(String sipuri);
}
