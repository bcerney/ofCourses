package com.techelevator.models;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.DAOIntegrationTest;
import com.techelevator.daos.UserDAO;
import com.techelevator.jdbc.JDBCUserDAO;

public class UserDAOIntegrationTest extends DAOIntegrationTest{

	private static UserDAO dao;
	
	@Before
	public void setup() {
		dao = new JDBCUserDAO(getDataSource());
	}
	
	@Test
	public void confirm_new_user_created() {
		UserDAO userDAO = new JDBCUserDAO(getDataSource());
		User user = new User();
//		user.setUserId
	}
}
