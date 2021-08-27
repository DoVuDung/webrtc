package com.framework.dao;
import java.util.List;

import com.framework.domain.Friend;


public interface FriendDAO {
	public void saveFriend(Friend friend);
	public List<Friend> listFriend();
}
