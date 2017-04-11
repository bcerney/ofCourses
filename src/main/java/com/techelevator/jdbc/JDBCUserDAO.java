package com.techelevator.jdbc;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.daos.UserDAO;
import com.techelevator.models.User;

@Component
public class JDBCUserDAO extends JDBCDAO implements UserDAO {

	@Autowired
	public JDBCUserDAO(DataSource dataSource) {
		super(dataSource);
	}
	
	@Override
	public User createNewUser(User user) {
		long id = getNextUserId();
		String sqlCreateUser = "INSERT INTO users (userId, firstName, lastName, email, password, isTeacher) VALUES (?,?,?,?,?,?)";
		int rowsAffected = jdbcTemplate.update(sqlCreateUser, id, user.getFirstName(), user.getLastName(), user.getEmail().toLowerCase(), user.getPassword(), user.isTeacher());
		
		if(rowsAffected == 1) {
			user.setUserId(id);
			return user;
		} else {
			return null;
		}
	}

	@Override
	public User getUserById(long id) {
		User user = null;
		String sqlGetUserById = "SELECT * FROM users WHERE userId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetUserById, id);
		if(results.next()) {
			user = mapRowToUser(results);
		}
		return user;
	}
	
	@Override
	public User getUserOnLogin(String email, String password) {
		User verifiedUser = null;
		String sqlGetUserOnLogin = "SELECT * FROM users WHERE email = ? AND password = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetUserOnLogin, email.toLowerCase(), password);
		
		if (results.next()) {
			return mapRowToUser(results);
		} else {
			return null;
		}
	}	

	private User mapRowToUser(SqlRowSet results) {
		User aUser = new User();
		aUser.setUserId(results.getLong("userId"));
		aUser.setFirstName(results.getString("firstName"));
		aUser.setLastName(results.getString("lastName"));
		aUser.setEmail(results.getString("email"));
		aUser.setPassword(results.getString("password"));
		aUser.setTeacher(results.getString("isTeacher"));
		return aUser;
	}
	
	private long getNextUserId() {
		return super.getNextId("seq_userId");
	}

}
