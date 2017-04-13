package com.techelevator.daos;

import java.util.ArrayList;

import com.techelevator.models.User;

public interface UserDAO {
	
	public boolean emailAlreadyExists(String email);
	// TODO: check if user already exists
	public User createNewUser(User user, String password);
	
	public boolean userIsAuthenticated(String email, String password);
	public User getUserOnLogin(String email, String password);
	public ArrayList getStudentsByCourseId(long courseId);
	public User getUserById(long id);

}
