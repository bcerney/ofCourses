package com.techelevator.models;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.DAOIntegrationTest;
import com.techelevator.daos.UserDAO;
import com.techelevator.jdbc.JDBCUserDAO;

public class UserDAOIntegrationTest extends DAOIntegrationTest{

	private static UserDAO dao;
	private static User newUser;
	
	@Before
	public void setup() {
		dao = new JDBCUserDAO(getDataSource());
		
	}
	
	@Test
	public void confirm_new_user_can_be_found_by_id_after_being_created() {
		User newUser = new User();
		newUser.setFirstName("Anakin");
		newUser.setLastName("Skywalker");
		newUser.setEmail("dvader@deathstar.com");
		newUser.setPassword("iamyourfather");
		newUser.setTeacher(true);
		User savedUser = dao.createNewUser(newUser);
		
		assert_users_are_equal(savedUser, dao.getUserById(savedUser.getUserId()));
	}
	
	@Test
	public void confirm_user_is_returned_on_login(){
		//TODO: create new user 
	}
	
	private void assert_users_are_equal(User createdUser, User returnedUser) {
		Assert.assertEquals(createdUser.getUserId(), returnedUser.getUserId());
		Assert.assertEquals(createdUser.getFirstName(), returnedUser.getFirstName());
		Assert.assertEquals(createdUser.getLastName(), returnedUser.getLastName());
		Assert.assertEquals(createdUser.getEmail(), returnedUser.getEmail());
		Assert.assertEquals(createdUser.getPassword(), returnedUser.getPassword());
		Assert.assertEquals(createdUser.isTeacher(), returnedUser.isTeacher());
	}
}
