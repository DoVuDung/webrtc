package com.webrtc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webrtc.bean.Login;
import com.webrtc.dao.MyLoginDao;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("Dashboard.jsp");
		
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id, password;
		HttpSession session = request.getSession(false);
		Login myLoginBean = new com.webrtc.bean.Login(); 				// Making an object of Service Class.
		MyLoginDao myLoginDao = new MyLoginDao();
		RequestDispatcher rd = null;
		String button = request.getParameter("submit");
		try {
			id = request.getParameter("userName"); 		// getting value of id from		
			password = request.getParameter("password");
			myLoginBean.setSipuri(id);
			
			myLoginBean.setPassword(password);
			Login login = new Login();
			
			if (button.equalsIgnoreCase("Login as Admin")) {
				if (id.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin")) {
					rd = request.getRequestDispatcher("admincontrolusers.jsp");
					rd.forward(request, response);
				}
				else{
					request.setAttribute("error","Login id or password do not match.");
					rd = request.getRequestDispatcher("Login.jsp");
					rd.forward(request, response);
				}
			} 
			
			else if (button.equalsIgnoreCase("Login as User")) {
				
				boolean flag = myLoginDao.verification(myLoginBean);
				if (flag) {		
				//if the user credentials exist
					myLoginBean.setSipuri(id);
					String user= myLoginDao.getPresentity(myLoginBean);
					if(user.equalsIgnoreCase(myLoginBean.getPrivateIdentity())){
						request.setAttribute("privateIdentity",	myLoginBean.getPrivateIdentity());
						request.setAttribute("password", myLoginBean.getPassword());
						rd = request.getRequestDispatcher("ConfirmLogin.jsp");
						rd.forward(request, response);
					} 
					else { 								// in case the user is offline
						login = myLoginDao.getData(myLoginBean);
						//System.out.println("DISPLAY NAME LoginCONTROLLER "+ login.getDisplayName());
						int count=myLoginDao.setLoggedIn(myLoginBean);
				//		System.out.println(count+"PRESENCE JAVA ---------------------------------------------");
						if(count>0){
							session = request.getSession(); // generating Session
							session.setAttribute("data", login);
							request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
						}
						else{
							request.setAttribute("error","An error has occurred. Please try and log in after sometime.");
							rd = request.getRequestDispatcher("Login.jsp");
							rd.forward(request, response);
						}
					}
				} else {
					request.setAttribute("error","Login id or password do not match.");
					rd = request.getRequestDispatcher("Login.jsp");
					rd.forward(request, response);
				}
			} 
			
			else if (button.equalsIgnoreCase("Yes")) { // On redirection from ConfirmLogin.jsp
			
			//	System.out.println("value in   confirm login  ********* "+request.getParameter("privateIdentity").toString());
				Login bean = new Login();
				bean.setSipuri(request.getParameter("sipuri").toString());
				bean.setPassword(request.getParameter("password").toString());
			//	System.out.println("DISPLAY NAME LoginCONTROLLER "+ request.getParameter("privateIdentity").toString());
				boolean flag = myLoginDao.verification(bean);
				if (flag) {
					login = myLoginDao.getData(bean);
					int count=myLoginDao.setLoggedIn(bean);
					if(count>0){
						session = request.getSession(); 	// generating Session
						session.setAttribute("data", login);
						request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
					}
					else{
						request.setAttribute("error","An error has occurred. Please try and log in after sometime.");
						rd = request.getRequestDispatcher("Login.jsp");
						rd.forward(request, response);
					}
				} else {
					request.setAttribute("error","Login id or password do not match.");
					rd = request.getRequestDispatcher("Login.jsp");
					rd.forward(request, response);
				}
			}
			
			else if (button.equalsIgnoreCase("No")) { // On redirection from ConfirmLogin.jsp
				response.sendRedirect("Login.jsp");
			} 
			else {
				response.sendRedirect("Dashboard.jsp");
			}
		} 
		catch (Exception e) {
			System.out.println(e);
			//response.sendRedirect("Login.jsp");
		}
	}
}
