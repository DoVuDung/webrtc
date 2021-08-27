package com.framework.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.framework.domain.Friend;
import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;


public class FriendDAOImpl implements FriendDAO {
	@SessionTarget
	Session session;
	@TransactionTarget
	Transaction transaction;

	@SuppressWarnings("unchecked")
	public List<Friend> listFriend() {
		List<Friend> courses = null;
		try {
			courses = session.createQuery("from Friend").list();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return courses;
	}

	@Override
	public void saveFriend(Friend friend) {
		// TODO Auto-generated method stub
		try {
			session.save(friend);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}


}
