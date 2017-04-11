package com.techelevator.daos;

import com.techelevator.models.User;

public interface UserDAO {
	
	public User createNewUser(User user);
	public User getUserById(long id);
}
