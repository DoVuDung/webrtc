/**
 * 
 */
package com.framework.web;

import java.util.ArrayList;
import java.util.List;

import com.framework.dao.FriendDAO;
import com.framework.dao.FriendDAOImpl;
import com.framework.domain.Friend;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


/**
 * @author altanai
 *
 */
public class FriendAction extends ActionSupport implements ModelDriven<Friend> {

	private static final long serialVersionUID = 1L;
	private Friend friend = new Friend();
	private List<Friend> friendList = new ArrayList<Friend>();
	private FriendDAO friendDAO = new FriendDAOImpl();
	
	@Override
	public Friend getModel() {
		// TODO Auto-generated method stub
		return friend;
	}

	public String add()
	{
		System.out.println(" friend - add");
		friendDAO.saveFriend(friend);
		return SUCCESS;
	}
	
	public String list()
	{
		System.out.println(" friend - list");
		friendList = friendDAO.listFriend();
		return SUCCESS;
	}
		
	public Friend getFriend() {
		System.out.println(" friend - get friend");
		return friend;
	}

	public void setFriend(Friend friend) {
		System.out.println(" friend - set friend");
		this.friend = friend;
	}

	public List<Friend> getFriendList() {
		System.out.println(" friend - get friend list");
		return friendList;
	}

	public void setFriendList(List<Friend> friendList) {
		System.out.println(" friend - set friend list");
		this.friendList = friendList;
	}

	
}
