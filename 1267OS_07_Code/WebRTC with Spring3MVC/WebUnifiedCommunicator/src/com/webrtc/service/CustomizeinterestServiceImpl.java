package com.webrtc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.webrtc.bean.CustomizeinterestBean;
import com.webrtc.dao.CustomizeinterestDao;

import com.webrtc.model.Customizeinterest;

@Service("customizeinterestService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CustomizeinterestServiceImpl implements CustomizeinterestService{
	@Autowired
	private CustomizeinterestDao customizeinterestDao;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void addCustomizeinterest(Customizeinterest customizeinterest) {
		// TODO Auto-generated method stub
		customizeinterestDao.addCustomizeinterest(customizeinterest);
	}

	
	@Override
	public List<Customizeinterest> listCustomizeinterestss(String sipuri) {
		// TODO Auto-generated method stub
		return customizeinterestDao.listCustomizeinterestss(sipuri);
	}
}
