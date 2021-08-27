package com.framework.dao;

import java.util.List;

import com.framework.domain.Otheraccount;



public interface OtheraccountDAO {

	public void saveOrUpdateEmail(Otheraccount email);
	public List<Otheraccount> listEmail();
	public Otheraccount listEmailById(String sipuri);
	public void deleteEmail(String sipuri);
}