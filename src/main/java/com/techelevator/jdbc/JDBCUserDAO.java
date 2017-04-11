package com.techelevator.jdbc;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.daos.UserDAO;
import com.techelevator.models.User;

@Component
public class JDBCUserDAO implements UserDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void createNewUser(User user) {
		String sqlCreateUser = "INSERT INTO users (userId, firstName, lastName, email, password, isTeacher) VALUES (?,?,?,?,?,?)";
		jdbcTemplate.update(sqlCreateUser, user.getUserId(), user.getFirstName(), user.getLastName(), user.getEmail(), user.getPassword(), user.isTeacher());
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

	private User mapRowToUser(SqlRowSet results) {
		User aUser = new User();
		aUser.setUserId(results.getLong("userId"));
		aUser.setFirstName(results.getString("firstName"));
		aUser.setLastName(results.getString("lastName"));
		aUser.setEmail(results.getString("email"));
		aUser.setPassword(results.getString("password"));
		aUser.setTeacher(results.getBoolean("isTeacher"));
		return aUser;
	}
	
}
