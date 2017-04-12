package com.techelevator.models;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.techelevator.DAOIntegrationTest;
import com.techelevator.daos.UserDAO;
import com.techelevator.jdbc.JDBCUserDAO;

public class UserDAOIntegrationTest extends DAOIntegrationTest{

	private static UserDAO dao;
	private static User newUser;
	
	@Before
	public void setup() {
		dao = new JDBCUserDAO(getDataSource());
		newUser = new User();
		newUser.setFirstName("Anakin");
		newUser.setLastName("Skywalker");
		newUser.setEmail("dvader@deathstar.com");
		newUser.setUserType("teacher");
	}
	
	@Test
	public void confirm_new_user_can_be_found_by_id_after_being_created() {
		User savedUser = dao.createNewUser(newUser, "generic-password");	
		assert_users_are_equal(savedUser, dao.getUserById(savedUser.getUserId()));
	}
	
	@Test
	public void confirm_user_is_returned_on_login(){
		dao.createNewUser(newUser, "generic-password");
		User verifiedUser = dao.getUserOnLogin("dvader@deathstar.com", "iamyourfather");
		assert_users_are_equal(newUser, verifiedUser);
	}
	
	@Test
	public void confirm_incorrect_email_password_combination_returns_null(){
		dao.createNewUser(newUser, "generic-password");
		User verifiedUser = dao.getUserOnLogin("emporer@deathstar.com", "iamyourfather");
		Assert.assertNull(verifiedUser);
	}
	
	private void assert_users_are_equal(User createdUser, User returnedUser) {
		Assert.assertEquals(createdUser.getUserId(), returnedUser.getUserId());
		Assert.assertEquals(createdUser.getFirstName(), returnedUser.getFirstName());
		Assert.assertEquals(createdUser.getLastName(), returnedUser.getLastName());
		Assert.assertEquals(createdUser.getEmail(), returnedUser.getEmail());
		Assert.assertEquals(createdUser.getUserType(), returnedUser.getUserType());
	}
}
