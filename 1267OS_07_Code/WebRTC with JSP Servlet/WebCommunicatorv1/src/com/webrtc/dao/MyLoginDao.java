
package com.webrtc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.commons.codec.digest.DigestUtils;
import com.webrtc.bean.Login;
import com.webrtc.util.DbConnection;

public class MyLoginDao {

	public Login readUserDetails(Login bean) {

		Login myDetails= new Login();
		Connection conn=null;			
		conn = DbConnection.getConnection();			
		PreparedStatement ps=null;
		try {				
			String query= "Select * from userdetails where sipuri=? and password=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, bean.getSipuri());
			ps.setString(2, bean.getPassword());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				myDetails.setDisplayName(rs.getString(1));
				myDetails.setPrivateIdentity(rs.getString(2));
				myDetails.setSipuri(rs.getString(3));
				myDetails.setPassword(rs.getString(4));
				myDetails.setRealm(rs.getString(5));		
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		finally
		{
			DbConnection.closeConnection(conn);
			DbConnection.closeStatement(ps);
		}
		return myDetails;
	}
	

	public boolean register(Login login)
	{
		boolean p=false;
		Connection con=null;
		con = DbConnection.getConnection();			
		PreparedStatement pstmt=null;
		PreparedStatement pstmt1=null;
		int rows=0;int count=0;int x=0;
		try
		{	
			pstmt1=con.prepareStatement("select * from userdetails where sipuri='"+login.getSipuri()+"'");
			ResultSet rs=pstmt1.executeQuery();
			while(rs.next()){
				count++;	
			}
			if(count==0){
				pstmt=con.prepareStatement("insert into userdetails(displayName,sipuri,privateIdentity,password,realm,secretQuestion,secretAnswer) values(?,?,?,?,?,?,?)");

				pstmt.setString(1,login.getDisplayName());
				pstmt.setString(2,login.getSipuri());
				pstmt.setString(3, login.getPrivateIdentity());
				pstmt.setString(4, login.getPassword());
				pstmt.setString(5, login.getRealm());
				rows=pstmt.executeUpdate();
				if(rows>0)
				{
					try {	
						String userName="kamailio";
						String passWord="kamailiorw";
						String domain  ="domain.com";
						String hash1=login.getPrivateIdentity()+":"+"domain.com"+":"+login.getPassword();
						String hash2=login.getPrivateIdentity()+"@domain.com:"+"domain.com"+":"+login.getPassword();
						String md1=DigestUtils.md5Hex(hash1);
						//String hashValue=DigestUtils.mdhHex(user)
						String md2=DigestUtils.md5Hex(hash2);
						PreparedStatement ps = null;
					
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager
								.getConnection(
										"jdbc:mysql://localhost:3306/kamailio",
										userName, passWord);
						ps = con.prepareStatement("insert into subscriber(username,domain,password,ha1,ha1b) values (?,?,?,?,?)");
						ps.setString(1,login.getPrivateIdentity());
						ps.setString(2,domain);
						ps.setString(3, login.getPassword());
						ps.setString(4,md1);
						ps.setString(5, md2);
						 x=ps.executeUpdate();
						 if(x>0){
							 p=true;
						 }
						
					}
					catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}			
			}
		}
		catch(SQLException sq)
		{
			sq.getMessage();
		}
		finally
		{
			DbConnection.closeConnection(con);
			DbConnection.closeStatement(pstmt);
		}
		return p;
	}	
	
	//SET LOGGEDIN STATUS FOR USERS TRYING TO LOG IN
		public int setLoggedIn(Login bean) {
			Connection conn=null;
			int count=0;
			conn = DbConnection.getConnection();		
			PreparedStatement ps=null;
			try {				
				String query= "update presence set loggedin='yes' where sipuri=?";
				ps = conn.prepareStatement(query);
				ps.setString(1, bean.getPrivateIdentity());
				count = ps.executeUpdate();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally
			{
				DbConnection.closeConnection(conn);
				DbConnection.closeStatement(ps);
			}
			return count;
		}

	//VERIFY  PASSWORD AND REDIRECT DETAILS INTO DASHBOARD.JSP OF LOGIN USER
	public boolean verification(Login bean) {
		boolean p=false;
		Connection conn=null;
		conn = DbConnection.getConnection();		
		PreparedStatement ps=null;
		try {				
			String query= "Select count(*) from userdetails where password=? and sipuri=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, bean.getPassword());
			ps.setString(2, bean.getSipuri());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				if(rs.getInt(1)>0){
				p=true;	
				}
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			DbConnection.closeConnection(conn);
			DbConnection.closeStatement(ps);
		}
		return p;
	}
	
	public String getPresentity(Login bean){
		String result="";
		Connection con;
		String userName="kamailio";
		String passWord="kamailiorw";
			
		PreparedStatement ps=null;
		try {	
			System.out.println("inside Return value");
			//PreparedStatement ps = null;
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager
					.getConnection(
							"jdbc:mysql://localhost:3306/kamailio",
							userName, passWord);
			String query= "select  username from presentity where username=?";
			//String query= "select  username from presentity";
			System.out.println("query is"+query);
			ps = con.prepareStatement(query);
			ps.setString(1, bean.getPrivateIdentity());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				result=rs.getString(1).toString();
				System.out.println("Kamailio user is"+result+"after result");
				
			}
			con.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			DbConnection.closeStatement(ps);
		}
		return result;
	}
	
	
	//GET PRESENCE FOR MULTIPLE LOGIN OF THE SAME USER
	public String getPresence(Login bean) {
		String result="";
		Connection conn=null;
		conn = DbConnection.getConnection();		
		PreparedStatement ps=null;
		try {				
			String query= "Select status from presence where sipuri=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, bean.getPrivateIdentity());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				result=rs.getString(1).toString();
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			DbConnection.closeConnection(conn);
			DbConnection.closeStatement(ps);
		}
		return result;
	}
	
	//GET LOGGEIN STATUS FOR MULTIPLE LOGIN OF THE SAME USER
		public String getLoggedIn(Login bean) {
			String result="";
			Connection conn=null;
			conn = DbConnection.getConnection();		
			PreparedStatement ps=null;
			try {				
				String query= "Select loggedin from presence where sipuri=?";
				ps = conn.prepareStatement(query);
				ps.setString(1, bean.getPrivateIdentity());
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					result=rs.getString(1).toString();
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally
			{
				DbConnection.closeConnection(conn);
				DbConnection.closeStatement(ps);
			}
			return result;
		}
	
	public Login getData(Login bean) {
		ArrayList<String> temp=new ArrayList<String>();
		ArrayList<String> temp1=new ArrayList<String>();
		ArrayList<String> statusOfFriends=new ArrayList<String>();
		Login loginBean= new Login();
		Connection conn=null;
		conn = DbConnection.getConnection();		
		PreparedStatement ps=null;
		try {				
			String query1="Select sipuri,privateIdentity,realm,displayName,password from userdetails where sipuri=? and password=?";
			ps = conn.prepareStatement(query1);
			ps.setString(1, bean.getSipuri());
			ps.setString(2, bean.getPassword());
			ResultSet rs1=ps.executeQuery();
			while (rs1.next())
			{
				loginBean.setDisplayName(rs1.getString("displayName"));
				loginBean.setSipuri(rs1.getString("sipuri"));
				loginBean.setPrivateIdentity(rs1.getString("privateIdentity"));
				loginBean.setPassword(rs1.getString("password"));
				loginBean.setRealm(rs1.getString("realm"));

				String query2="select sipuri,status from presence where sipuri IN(select sipuriFrd from friendsdetails where sipuri=?)";
				ps = conn.prepareStatement(query2);
				ps.setString(1, loginBean.getPrivateIdentity());
				ResultSet rs2=ps.executeQuery();
				while(rs2.next())
				{
					temp.add(rs2.getString(1));
					statusOfFriends.add(rs2.getString(2));
				}

				loginBean.setSipuriFrd(temp);
				loginBean.setPresenceStatus(statusOfFriends);

			}
		}

		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			DbConnection.closeConnection(conn);
			DbConnection.closeStatement(ps);
		}
		return loginBean;
	}

	
	
	public Login getDetails(Login myLoginBean) {
		Login bean=new Login();
		Connection con=null;
		con = DbConnection.getConnection();			
		PreparedStatement pstmt=null;
		try   
		{				
			pstmt=con.prepareStatement("select * from userdetails where sipuri=?");
			pstmt.setString(1, myLoginBean.getPrivateIdentity());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) 
			{
				bean.setDisplayName(rs.getString("displayName"));
				bean.setSipuri(rs.getString("sipuri"));
				bean.setPrivateIdentity(rs.getString("privateIdentity"));
				bean.setRealm(rs.getString("realm"));
			}				
		}
		catch(SQLException sq)
		{
			sq.getMessage();
		}
		finally
		{
			DbConnection.closeConnection(con);
			DbConnection.closeStatement(pstmt);
		}
		return bean;	
	}	

	public boolean updateProfile(Login login) {
		boolean p=false;
		Connection con=null;
		con = DbConnection.getConnection();			
		PreparedStatement pstmt=null;
		int rows=0;
		try
		{				
			pstmt=con.prepareStatement("update userdetails set displayName=?,privateIdentity=?,realm=? where sipuri=?");

			pstmt.setString(1,login.getDisplayName());
			pstmt.setString(2,login.getPrivateIdentity());
			pstmt.setString(3, login.getRealm());
			pstmt.setString(4, login.getPrivateIdentity());
			rows=pstmt.executeUpdate();
			if(rows>0)
			{
				p=true;
			}				
		}
		catch(SQLException sq)
		{
			sq.getMessage();
		}
		finally
		{
			DbConnection.closeConnection(con);
			DbConnection.closeStatement(pstmt);
		}
		return p;
	}

	public boolean addFriend(Login login) {

		boolean p=true;
		Connection con=null;
		con = DbConnection.getConnection();	
		int rows=0;
		PreparedStatement pstmt=null;
		try   
		{				
			pstmt=con.prepareStatement("insert into friendsdetails(sipuri,sipuriFrd) values(?,?)");

			pstmt.setString(1,login.getSipuri());
			for( String frd: login.getSipuriFrd())
			{
				pstmt.setString(2, frd);

				rows=pstmt.executeUpdate();
				if(rows>0)
				{
					p=true;
				}				
			}
		}
		catch(SQLException sq)
		{
			sq.getMessage();
		}
		finally
		{
			DbConnection.closeConnection(con);
			DbConnection.closeStatement(pstmt);
		}
		return p;


	}
	public void writepresence(String status, String sipUri) {
		Connection con=null;
		con = DbConnection.getConnection();			
		PreparedStatement pstmt=null;
		int rows=0;
		try
		{				
			pstmt=con.prepareStatement("update presence set status=? where sipuri=? and loggedin='yes'");
			pstmt.setString(2, status);
			pstmt.setString(1, sipUri);
			rows=pstmt.executeUpdate();
		}
		catch(SQLException sq)
		{
			sq.getMessage();
		}
		finally
		{
			DbConnection.closeConnection(con);
			DbConnection.closeStatement(pstmt);
		}
	}

	public boolean addFriend(String mySipuri, String friendSipUri) {
		boolean flag=false;
		Connection con=null;
		con = DbConnection.getConnection();
		PreparedStatement pstmt=null;
		String query="insert into friendsdetails values('"+mySipuri+"','"+friendSipUri+"')";
		try   
		{				
			pstmt=con.prepareStatement(query);
			if(pstmt.executeUpdate()>0)
			{
				flag=true;
			}
		}
		catch(SQLException sq)
		{
			sq.getMessage();
		}
		finally
		{
			DbConnection.closeConnection(con);
			DbConnection.closeStatement(pstmt);
		}
		return flag;
	}

	public void logoutUser(String userId) {
		Connection con=null;
		con = DbConnection.getConnection();
		PreparedStatement pstmt=null;
		PreparedStatement pstmt1=null;
		String query="update presence set status='offline',loggedin='no' where sipuri='"+userId+"'";
		String query1="update notification set status='OLD' where type='CONFERENCE'	 and receiver='"+userId+"'";
		boolean flag=false;
		try   
		{				
			pstmt=con.prepareStatement(query);
			pstmt1=con.prepareStatement(query1);
			int row=pstmt.executeUpdate();
			
			if(row>0){
				row=pstmt1.executeUpdate();
				if(row>0)
				System.out.println("LOGGED OUT SUCCESSFULLY IN DAO "+userId);
			}
		}
		catch(SQLException sq)
		{
			sq.getMessage();
		}
		finally
		{
			DbConnection.closeConnection(con);
			DbConnection.closeStatement(pstmt);
		}
	}
	
	public boolean deleteFrnd(String userId, String friendId) {
		boolean p=false;
		System.out.println(userId+""+friendId);
		Connection con=null;
		con = DbConnection.getConnection();	
		int rows=0;
		PreparedStatement pstmt=null;
		try   
		{				
			pstmt=con.prepareStatement("delete from friendsdetails where sipuri=? and sipuriFrd=? ");

			pstmt.setString(1,userId);
			pstmt.setString(2, friendId);
			rows=pstmt.executeUpdate();
			if(rows>0)
			{
				p=true;
			}	

		}
		catch(SQLException sq)
		{
			sq.getMessage();
		}
		finally
		{
			DbConnection.closeConnection(con);
			DbConnection.closeStatement(pstmt);
		}
		System.out.println(p);
		return p;
		
	}

	


	public boolean resetPassword(String sipUri, String password){
	boolean flag=false;
	Connection conn=null;			
	conn = DbConnection.getConnection();
	PreparedStatement ps=null;
	int pos1=0,pos2=0;
	for(int i=0;i<sipUri.length();i++){
		if(sipUri.charAt(i)==':'){
			pos1=i+1;
			break;
		}			
	}
	for(int i=sipUri.length()-1;i>0;i--){
		if(sipUri.charAt(i)=='@'){
			pos2=i;
			break;
		}			
	}
	String pubIdentity=sipUri.substring(pos1, pos2).trim();	
	try {	
		Class.forName("com.mysql.jdbc.Driver");
		String query="update userdetails set password='"+password+"' where privateIdentity='"+sipUri+"'";
		ps = conn.prepareStatement(query);
		if(ps.executeUpdate()>0){
			Connection conKam=DriverManager.getConnection("jdbc:mysql://localhost:3306/kamailio","kamailio", "kamailiorw");
			String queryKam="update kamailio.subscriber set password='"+password+"' where username='"+pubIdentity+"'";
			ps = conKam.prepareStatement(queryKam);
			if(ps.executeUpdate()>0){
				flag=true;
			}
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	finally
	{
		DbConnection.closeConnection(conn);
		DbConnection.closeStatement(ps);		
	}
	return flag;
	}

	
}






