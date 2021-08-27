package com.webrtc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webrtc.bean.Login;
import com.webrtc.dao.MyLoginDao;

/**
 * Servlet implementation class PresenceServlet
 */
@WebServlet("/PresenceServlet")
public class PresenceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PresenceServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String values[][] = new String[20][2];
		int i = 0;
		//userdetails u=new userdetails();
		Login l=new Login();
		l=(Login)session.getAttribute("data");
		System.out.println("SUBSCRIBER IS "+l.getPrivateIdentity()+" friend is "+request.getParameter("friend1")+" and status is "+request.getParameter("friend1status"));
		values[i][0] = request.getParameter("friend1");
		values[i][1] = request.getParameter("friend1status");
		MyLoginDao pd = new MyLoginDao();
		pd.writepresence(values[i][0], values[i][1]);
		i++;

	}

}