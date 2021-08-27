package com.framework.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.framework.domain.Otheraccount;
import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;


public class OtheraccountDAOImpl implements OtheraccountDAO {

	@SessionTarget
	Session session;
	
	@TransactionTarget
	Transaction transaction;

	/**
	 * Used to save or update a email.
	 */
	public void saveOrUpdateEmail(Otheraccount email) {
		try {
			session.saveOrUpdate(email);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		}
	}

	/**
	 * Used to delete a email.
	 */
	public void deleteEmail(String sipuri) {
		try {
			Otheraccount email = (Otheraccount) session.get(Otheraccount.class, sipuri);
			session.delete(email);
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} 
	}
	
	/**
	 * Used to list all the emails.
	 */
	@SuppressWarnings("unchecked")
	public List<Otheraccount> listEmail() {
		List<Otheraccount> courses = null;
		try {
			courses = session.createQuery("from Email").list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return courses;
	}

	/**
	 * Used to list a single email by Id.
	 */
	public Otheraccount listEmailById(String sipuri) {
		Otheraccount email = null;
		try {
			email = (Otheraccount) session.get(Otheraccount.class, sipuri);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return email;
	}


}
