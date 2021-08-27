package com.framework.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import sun.security.jgss.LoginConfigImpl;

import com.framework.dao.OtheraccountDAO;
import com.framework.dao.OtheraccountDAOImpl;
import com.framework.domain.Otheraccount;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class OtheraccountAction extends ActionSupport implements ModelDriven<Otheraccount> {

	private Otheraccount email = new Otheraccount();
	private List<Otheraccount> emailList = new ArrayList<Otheraccount>();
	private OtheraccountDAO otheraccountDAO = new OtheraccountDAOImpl();
	
	public Otheraccount getModel() {
		return email;
	}
	
	/**
	 * To save or update email.
	 * @return String
	 */
	public String saveOrUpdate()
	{	
		otheraccountDAO.saveOrUpdateEmail(email);
		return SUCCESS;
	}
	
	/**
	 * To list all emails.
	 * @return String
	 */
	public String list()
	{
		emailList = otheraccountDAO.listEmail();
		return SUCCESS;
	}
	
	/**
	 * To delete a email.
	 * @return String
	 */
	public String delete()
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		otheraccountDAO.deleteEmail(request.getParameter("sipuri"));
		return SUCCESS;
	}
	
	/**
	 * To list a single email by Id.
	 * @return String
	 */
	public String edit()
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		email = otheraccountDAO.listEmailById(request.getParameter("sipuri"));
		return SUCCESS;
	}
	
	public Otheraccount getEmail() {
		return email;
	}

	public void setEmail(Otheraccount email) {
		this.email = email;
	}

	public List<Otheraccount> getEmailList() {
		return emailList;
	}

	public void setEmailList(List<Otheraccount> emailList) {
		this.emailList = emailList;
	}
}
