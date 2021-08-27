package com.webrtc.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.webrtc.bean.Login;
import com.webrtc.dao.MyLoginDao;


public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = null;	//Creating an object of Request Dispatcher. 
		HttpSession session=request.getSession(false);

		Login myLoginBean= new Login();
		MyLoginDao myLoginDao=new MyLoginDao();
		String act=request.getParameter("action").toString();
		System.out.println("Action"+act);

		if("registration".equalsIgnoreCase(act))
		{
			myLoginBean.setSipuri(request.getParameter("sipuri"));
			myLoginBean.setPrivateIdentity(request.getParameter("privateIdentity"));
			myLoginBean.setPassword(request.getParameter("password"));
			myLoginBean.setDisplayName(request.getParameter("displayName"));
			myLoginBean.setRealm(request.getParameter("realm"));
			if(myLoginDao.register(myLoginBean))
			{
				rd = request.getRequestDispatcher("Last.jsp");
				rd.forward(request, response);	  
			}
		}
	     else if("updateProfile".equalsIgnoreCase(act))
	     {
	    	  	Login login=new Login();
	    	 	myLoginBean=new Login();
	    	 	myLoginBean.setSipuri(request.getParameter("sipuri"));
			    myLoginBean.setDisplayName(request.getParameter("displayName"));
			    myLoginBean.setRealm(request.getParameter("realm"));
			    myLoginBean.setPrivateIdentity(request.getParameter("privateIdentity"));
			    if(myLoginDao.updateProfile(myLoginBean))
				  {
				    login=myLoginDao.getDetails(myLoginBean);
				  
				    JSONObject jsonResponse1=new JSONObject();
					  try{
						  jsonResponse1.put("Result","OK");
						  JSONObject updatePro= new JSONObject();
						  
						  Login bean=new Login();
						  bean=(Login)session.getAttribute("data");
						  bean.setDisplayName(login.getDisplayName());
						  bean.setSipuri(login.getSipuri());
						  bean.setRealm(login.getRealm());
						  session.setAttribute("data", bean);
						  
						  updatePro.put("DisplayNameUpdated", login.getDisplayName());
						  updatePro.put("PrivateIdentityUpdated",login.getPrivateIdentity());	  
						  updatePro.put("RealmUpdated", login.getRealm());
						  jsonResponse1.put("recordUpdated", updatePro);
						  response.setHeader("content-application", "text/json");
						  response.getWriter().println(jsonResponse1.toString());
						  
					  }
					  catch(JSONException e){
						  e.printStackTrace();
					  }
				    
				    
				  }
	     }
	   
		else if("viewFriend".equalsIgnoreCase(act))
		{
		      Login login=new Login();
			  myLoginBean.setPrivateIdentity(request.getParameter("friend"));
			  login =myLoginDao.getDetails(myLoginBean);
			  JSONObject jsonResponse=new JSONObject();
			  try{
				  jsonResponse.put("Result","OK");
				  JSONObject friend= new JSONObject();
				  friend.put("DisplayName", login.getDisplayName());
				  friend.put("PrivateIdentity", login.getPrivateIdentity());
				  friend.put("Sipuri",login.getSipuri());
				  friend.put("Realm", login.getRealm());
				  jsonResponse.put("record", friend);
				  response.setHeader("content-application", "text/json");
				  response.getWriter().println(jsonResponse.toString());
			  }
			  catch(JSONException e){
				  e.printStackTrace();
			  }
		}
		 else if("addFriend".equalsIgnoreCase(act))
			{	
				Login login=new Login();
				ArrayList<String> friend=new ArrayList<String>();
				ArrayList<String> temp1=new ArrayList<String>();
				ArrayList<String> temp2=new ArrayList<String>();
				ArrayList<String> tempPresence=new ArrayList<String>();
				friend.add(request.getParameter("friendPrivateIdentity"));
				myLoginBean.setSipuriFrd(friend);
				
				myLoginBean.setPrivateIdentity(request.getParameter("privateIdentity"));
				myLoginBean.setPassword(request.getParameter("password"));
				 if(myLoginDao.addFriend(myLoginBean))
				 {
					 login=myLoginDao.getData(myLoginBean);
					 for(String frd:login.getSipuriFrd())
					 {
						 temp1.add(frd);
					 }
					 
					 for(String presence: login.getPresenceStatus())
					 {
						 tempPresence.add(presence);
					 }
					 JSONObject jsonResponseFrd=new JSONObject();
					 ArrayList<JSONObject> frd=new ArrayList<JSONObject>();
					 ArrayList<JSONObject> notFrd=new ArrayList<JSONObject>();
					 
					 try{
						  jsonResponseFrd.put("Result","OK");
						  for(int i=0;i<temp1.size();i++)
						  {
							  JSONObject obj=new JSONObject();
							  obj.put("NAME", temp1.get(i));
							  obj.put("STATUS", tempPresence.get(i));
							  frd.add(obj);
						  }
						  for(String frnd:temp2)
						  {
							  JSONObject obj=new JSONObject();
							  obj.put("Name", frnd);
							  notFrd.add(obj);
						  }
						  jsonResponseFrd.accumulate("Friends", frd);
						  jsonResponseFrd.accumulate("NotFriends", notFrd);
						  response.setContentType("text/json");
						  response.getWriter().println(jsonResponseFrd.toString());
					  }
					  catch(JSONException e){
						  e.printStackTrace();
					  }
				 }
			}

		
		 else if("delete".equalsIgnoreCase(act))
			{
				Login login=new Login();
				ArrayList<String> temp1=new ArrayList<String>();
				ArrayList<String> temp2=new ArrayList<String>();
				ArrayList<String> tempPresence=new ArrayList<String>();
				String friend1=request.getParameter("friend");
				String userLogedIn= request.getParameter("sipuri");
				myLoginBean.setPrivateIdentity(request.getParameter("sipuri"));
				myLoginBean.setPassword(request.getParameter("password"));
			     if(myLoginDao.deleteFrnd(userLogedIn,friend1))
			     {
			    	 login=myLoginDao.getData(myLoginBean);
							 for(String frd:login.getSipuriFrd())
							 {
								 temp1.add(frd);
							 }
							 
							 for(String presence: login.getPresenceStatus())
							 {
								 tempPresence.add(presence);
							 }
							 JSONObject jsonResponseFrd1=new JSONObject();
							 ArrayList<JSONObject> frd=new ArrayList<JSONObject>();
							 try{
								  jsonResponseFrd1.put("Result","OK");
								  for(int i=0;i<temp1.size();i++)
								  {
									  JSONObject obj=new JSONObject();
									  obj.put("NAME", temp1.get(i));
									  obj.put("STATUS", tempPresence.get(i));
									  frd.add(obj);
								  }
								  jsonResponseFrd1.accumulate("Friends", frd);
								  response.setContentType("text/json");
								  response.getWriter().println(jsonResponseFrd1.toString());
							  }
							  catch(JSONException e){
								  e.printStackTrace();
							  }
						 }
			}
	     	
		else if (act.equalsIgnoreCase("logout")) 
		{	
			try{
			if(session.getAttribute("data")!=null){
			System.out.println("session is not null-----> go to last.jsp");
			myLoginDao.logoutUser(((Login)session.getAttribute("data")).getPrivateIdentity());
			session.setAttribute("data",null);
			System.out.println("Logging out with data= "+session.getAttribute("data"));
			session.setAttribute("ID",null);
			System.out.println("I am logging out");
			response.sendRedirect("Last.jsp");
			}
			else{
				response.sendRedirect("Login.jsp");
			}
		}
		catch(Exception e){
			response.sendRedirect("Login.jsp");
		}		
		}
		else if("addfbfriend".equalsIgnoreCase(act))
		{
			MyLoginDao myDao=new MyLoginDao();
			Login data= (Login)session.getAttribute("data");
			boolean flag=myDao.addFriend(data.getPrivateIdentity(),request.getParameter("friendName").toString());
			
		}
		else if(act.equalsIgnoreCase("getFreshData"))
		{
			Login login=new Login();
			
			ArrayList<String> temp1=new ArrayList<String>();
			ArrayList<String> temp2=new ArrayList<String>();
			ArrayList<String> tempPresence=new ArrayList<String>();
			
			myLoginBean.setSipuri(request.getParameter("sipuri"));
			myLoginBean.setPassword(request.getParameter("password"));

			login=myLoginDao.getData(myLoginBean);
			for(String frd:login.getSipuriFrd())
			{
				temp1.add(frd);
			}
			for(String presence: login.getPresenceStatus())
			{
				tempPresence.add(presence);
			}
			JSONObject jsonResponseFrd=new JSONObject();
			ArrayList<JSONObject> frd=new ArrayList<JSONObject>();
			try{
				jsonResponseFrd.put("Result","OK");
				for(int i=0;i<temp1.size();i++)
				{
					JSONObject obj=new JSONObject();
					obj.put("NAME", temp1.get(i));
					obj.put("STATUS", tempPresence.get(i));
					frd.add(obj);
				}
				jsonResponseFrd.accumulate("Friends", frd);
				response.setContentType("text/json");
				response.getWriter().println(jsonResponseFrd.toString());
			}
			catch(JSONException e){
				e.printStackTrace();
			}
		}	

	   else if(act.equalsIgnoreCase("passCheck")){
			boolean flag=myLoginDao.resetPassword(request.getParameter("privateIdentity"),request.getParameter("password"));
			if(flag){
				request.setAttribute("message","Password has been changed successfully. Login to continue.");
				request.getRequestDispatcher("Login.jsp").forward(request,response);
			}
			else{
				request.setAttribute("message","Password could not be changed. Please try again.");
				request.getRequestDispatcher("Login.jsp").forward(request,response);
			}
		}
		
		else{
			System.out.println(" No result matched with request type ");
		}
	
	}
}
	




	







	







	






	


