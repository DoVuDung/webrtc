package com.framework.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import sun.security.jgss.LoginConfigImpl;

import com.framework.dao.CredentialsDAO;
import com.framework.dao.CredentialsDAOImpl;
import com.framework.domain.Credentials;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements ModelDriven<Credentials> {

	private static final long serialVersionUID = -6659925652584240539L;

	private Credentials credentials = new Credentials();
	private List<Credentials> credentialsList = new ArrayList<Credentials>();
	private CredentialsDAO credentialsDAO = new CredentialsDAOImpl();
	
	public Credentials getModel() {
		System.out.println("Credentials - get model");
		return credentials;
	}
	
	public String nothing()
	{
		return SUCCESS;
	}
	
	public String login()
	{
			HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
			System.out.println("login - "+request.getParameter("sipuri") +" : password "+ request.getParameter("password") );

			credentials = credentialsDAO.searchlogin(request.getParameter("sipuri"),request.getParameter("password"));
			System.out.println("Results of login fetched ");
		if(credentials!=null)
			return SUCCESS;
		else
			return ERROR;
	}


	public Credentials getCredentials() {
		System.out.println("get credentials");
		return credentials;
	}


	public void setCredentials(Credentials Credentials) {
		System.out.println("set credentials");
		this.credentials = Credentials;
	}
	
	public String add()
	{
		System.out.println(" credentials - add");
		credentialsDAO.saveUser(credentials);
		return SUCCESS;
	}
	
	public String list()
	{
		System.out.println(" credentials - list");
		credentialsList = credentialsDAO.listCredentials();
		return SUCCESS;
	}

	public List<Credentials> getUserList() {
		System.out.println(" user - get user list");
		return credentialsList;
	}

	public void setUserList(List<Credentials> userList) {
		System.out.println(" user - set user list");
		this.credentialsList = userList;
	}


}
