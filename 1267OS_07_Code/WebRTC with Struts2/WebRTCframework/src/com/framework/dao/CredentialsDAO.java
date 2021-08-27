package com.framework.dao;

import java.util.List;

import com.framework.domain.Credentials;
import com.framework.domain.User;

public interface CredentialsDAO {
	
	public void saveUser(Credentials credentials);
	public List<Credentials> listCredentials();
	
	public Credentials searchlogin(String sipuri, String password);

}
